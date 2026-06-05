#!/bin/bash
# ============================================================
# export_to_pdf.sh — Exporta o Caderno Temático para PDF
# ============================================================
# Uso: ./scripts/export_to_pdf.sh
#
# Requer: pandoc e wkhtmltopdf (ou similar)
# Instalação: 
#   Ubuntu/Debian: sudo apt-get install pandoc wkhtmltopdf
#   macOS: brew install pandoc wkhtmltopdf
#   Windows: choco install pandoc wkhtmltopdf
# ============================================================

set -e

GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m'

echo "╔════════════════════════════════════════════════════════════╗"
echo "║  📄 Exportando Caderno Temático para PDF                  ║"
echo "╚════════════════════════════════════════════════════════════╝"
echo ""

# -----------------------------------------------------------
# 1. VERIFICAR DEPENDÊNCIAS
# -----------------------------------------------------------
echo "${BLUE}🔍 Verificando dependências...${NC}"

if ! command -v pandoc &> /dev/null; then
    echo "${RED}  ✗ pandoc não encontrado${NC}"
    echo "     Instale: https://pandoc.org/installing.html"
    exit 1
fi
echo "${GREEN}  ✓ pandoc instalado${NC}"

if ! command -v wkhtmltopdf &> /dev/null; then
    echo "${YELLOW}  ⚠️  wkhtmltopdf não encontrado${NC}"
    echo "     Tentando usar weasyprint como alternativa..."
    if ! command -v weasyprint &> /dev/null; then
        echo "${RED}  ✗ Nenhum conversor PDF encontrado${NC}"
        echo "     Instale wkhtmltopdf: https://wkhtmltopdf.org/downloads.html"
        exit 1
    fi
    PDF_ENGINE="weasyprint"
else
    PDF_ENGINE="wkhtmltopdf"
fi
echo "${GREEN}  ✓ Conversor PDF: $PDF_ENGINE${NC}"

# -----------------------------------------------------------
# 2. CRIAR DIRETÓRIO DE SAÍDA
# -----------------------------------------------------------
mkdir -p exports
echo "${GREEN}  ✓ Diretório exports/ criado${NC}"

# -----------------------------------------------------------
# 3. COMPILAR ARQUIVOS MARKDOWN
# -----------------------------------------------------------
echo ""
echo "${BLUE}📚 Compilando arquivos Markdown...${NC}"

# Criar arquivo combinado
cat \
    README.md \
    fontes/links_fontes_online.md \
    prompts/prompt_01_roteiro.md \
    prompts/prompt_02_useEffect_vs_useLayoutEffect.md \
    prompts/prompt_03_custom_hooks.md \
    cicatrizes/cicatriz_01_resposta_generica.md \
    cicatrizes/cicatriz_02_explicacao_abstrata.md \
    cicatrizes/cicatriz_03_abstracao_prematura.md \
    entregas/resumos_estruturados.md \
    entregas/glossario.md \
    entregas/miniguia_revisao.md \
    > exports/caderno_completo.md

echo "${GREEN}  ✓ Arquivo combinado criado: exports/caderno_completo.md${NC}"

# -----------------------------------------------------------
# 4. GERAR PDF
# -----------------------------------------------------------
echo ""
echo "${BLUE}📄 Gerando PDF...${NC}"

if [ "$PDF_ENGINE" = "wkhtmltopdf" ]; then
    # Usar pandoc com wkhtmltopdf
    pandoc exports/caderno_completo.md \
        -o exports/caderno_tematico_react.pdf \
        --pdf-engine=wkhtmltopdf \
        --metadata title="Aprender a Programar em React - Caderno Temático" \
        --metadata author="[Seu Nome]" \
        --metadata date="$(date +%d/%m/%Y)" \
        --toc \
        --toc-depth=3 \
        -V margin-top=2cm \
        -V margin-bottom=2cm \
        -V margin-left=2.5cm \
        -V margin-right=2.5cm \
        -V fontsize=11pt \
        --highlight-style=tango
else
    # Usar pandoc com weasyprint
    pandoc exports/caderno_completo.md \
        -o exports/caderno_tematico_react.pdf \
        --pdf-engine=weasyprint \
        --metadata title="Aprender a Programar em React - Caderno Temático" \
        --metadata author="[Seu Nome]" \
        --metadata date="$(date +%d/%m/%Y)" \
        --toc \
        --toc-depth=3
fi

if [ -f "exports/caderno_tematico_react.pdf" ]; then
    echo "${GREEN}  ✓ PDF gerado com sucesso!${NC}"
    ls -lh exports/caderno_tematico_react.pdf
else
    echo "${RED}  ✗ Falha ao gerar PDF${NC}"
    exit 1
fi

# -----------------------------------------------------------
# 5. GERAR VERSÃO HTML (OPCIONAL)
# -----------------------------------------------------------
echo ""
echo "${BLUE}🌐 Gerando versão HTML...${NC}"

pandoc exports/caderno_completo.md \
    -o exports/caderno_tematico_react.html \
    --standalone \
    --metadata title="Aprender a Programar em React - Caderno Temático" \
    --toc \
    --toc-depth=3 \
    --highlight-style=tango \
    --css=https://cdn.jsdelivr.net/npm/water.css@2/out/water.css

echo "${GREEN}  ✓ HTML gerado: exports/caderno_tematico_react.html${NC}"

# -----------------------------------------------------------
# 6. RESUMO
# -----------------------------------------------------------
echo ""
echo "${GREEN}╔════════════════════════════════════════════════════════════╗${NC}"
echo "${GREEN}║  ✅ Exportação concluída!                                  ║${NC}"
echo "${GREEN}╚════════════════════════════════════════════════════════════╝${NC}"
echo ""
echo "${YELLOW}Arquivos gerados:${NC}"
echo "  📄 exports/caderno_tematico_react.pdf"
echo "  🌐 exports/caderno_tematico_react.html"
echo "  📝 exports/caderno_completo.md"
echo ""
