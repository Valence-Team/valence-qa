import argparse
import re
import sys
from pathlib import Path

from playwright.sync_api import TimeoutError as PwTimeout
from playwright.sync_api import sync_playwright

ORG = "valence-gs2026"
PROJETO = "Valence-QA"
URL = f"https://dev.azure.com/{ORG}/{PROJETO}/_workitems/edit/{{id}}"


def abrir_aba(page, nome):
    aba = page.get_by_role("tab", name=nome, exact=True)
    if aba.count() == 0:
        aba = page.get_by_text(nome, exact=True)
    aba.first.click()
    page.wait_for_timeout(1200)


def main():
    p = argparse.ArgumentParser()
    p.add_argument("--de", type=int, default=139)
    p.add_argument("--ate", type=int, required=True)
    p.add_argument("--pasta", default="prints-tc")
    p.add_argument("--perfil", default="perfil-edge")
    a = p.parse_args()

    saida = Path(a.pasta)
    saida.mkdir(exist_ok=True)
    feitos, pulados = 0, []

    with sync_playwright() as pw:
        ctx = pw.chromium.launch_persistent_context(
            a.perfil, channel="msedge", headless=False,
            viewport={"width": 1600, "height": 1200}, device_scale_factor=1)
        page = ctx.pages[0] if ctx.pages else ctx.new_page()

        page.goto(f"https://dev.azure.com/{ORG}/{PROJETO}")
        input("Entre na sua conta no navegador aberto, espere o projeto carregar e aperte Enter aqui...")

        for wid in range(a.de, a.ate + 1):
            try:
                page.goto(URL.format(id=wid))
                page.wait_for_load_state("networkidle", timeout=30000)
                page.get_by_text(f"TEST CASE {wid}", exact=True).first.wait_for(timeout=8000)
            except PwTimeout:
                pulados.append(wid)
                print(f"#{wid} ignorado (não é Test Case ou não existe)")
                continue

            abrir_aba(page, "Summary")
            texto = page.inner_text("body")
            m = re.search(r"Identificador:\s*CT-([\d.]+-\d+)", texto)
            if not m:
                pulados.append(wid)
                print(f"#{wid} sem Identificador no Summary")
                continue
            codigo = m.group(1)
            page.screenshot(path=str(saida / f"15-tc-{codigo}-summary.png"))

            abrir_aba(page, "Steps")
            page.screenshot(path=str(saida / f"15-tc-{codigo}-steps.png"))
            feitos += 1
            print(f"OK #{wid} CT-{codigo}")

        ctx.close()

    print(f"\nConcluido: {feitos} Test Cases com 2 prints cada. Ignorados: {len(pulados)}")
    if pulados:
        print("IDs ignorados:", ", ".join(map(str, pulados)))


if __name__ == "__main__":
    sys.exit(main())
