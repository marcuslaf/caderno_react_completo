#!/bin/bash
# ============================================================
# install.sh — Instalador Completo do Caderno Temático
# ============================================================
# Uso: ./scripts/install.sh
#
# Script único que executa toda a configuração inicial:
# 1. Verifica dependências
# 2. Inicializa o repositório
# 3. Configura o GitHub (opcional)
# 4. Valida a instalação
# ============================================================

set -e

GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m'

echo "╔════════════════════════════════════════════════════════════╗"
echo "║  🚀 Instalador do Caderno Temático — React                 ║"
echo "╚════════════════════════════════════════════════════════════╝"
echo ""

# -----------------------------------------------------------
# 1. VERIFICAR DEPENDÊNCIAS
# -----------------------------------------------------------
echo "${BLUE}🔍 Verificando dependências...${NC}"
echo ""

dependencies=("git" "bash")
missing=()

for dep in "${dependencies[@]}"; do
    if command -v "$dep" &> /dev/null; then
        echo "${GREEN}  ✓ $dep instalado${NC}"
    else
        echo "${RED}  ✗ $dep não encontrado${NC}"
        missing+=("$dep")
    fi
done

if [ ${#missing[@]} -gt 0 ]; then
    echo ""
    echo "${RED}❌ Dependências faltando: ${missing[*]}${NC}"
    echo "   Instale-as antes de continuar."
    exit 1
fi

# Verificar dependências opcionais
echo ""
echo "${BLUE}🔍 Verificando dependências opcionais...${NC}"

optional=("pandoc" "wkhtmltopdf" "gh")
for dep in "${optional[@]}"; do
    if command -v "$dep" &> /dev/null; then
        echo "${GREEN}  ✓ $dep instalado${NC}"
    else
        echo "${YELLOW}  ⚠️  $dep não encontrado (opcional)${NC}"
    fi
done

# -----------------------------------------------------------
# 2. EXECUTAR INIT
# -----------------------------------------------------------
echo ""
echo "${BLUE}📁 Etapa 1/4: Inicializando repositório...${NC}"
echo ""

if [ -f "scripts/init_repo.sh" ]; then
    bash scripts/init_repo.sh
else
    echo "${RED}  ✗ init_repo.sh não encontrado${NC}"
    exit 1
fi

# -----------------------------------------------------------
# 3. CONFIGURAR GITHUB (OPCIONAL)
# -----------------------------------------------------------
echo ""
echo "${BLUE}🐙 Etapa 2/4: Configurar GitHub?${NC}"
read -p "Deseja configurar o remote do GitHub agora? (s/n): " setup_gh

if [ "$setup_gh" = "s" ] && [ -f "scripts/setup_github.sh" ]; then
    bash scripts/setup_github.sh
else
    echo "${YELLOW}  ℹ️  Pulando configuração do GitHub${NC}"
    echo "     Execute depois: ./scripts/setup_github.sh"
fi

# -----------------------------------------------------------
# 4. VALIDAR INSTALAÇÃO
# -----------------------------------------------------------
echo ""
echo "${BLUE}✅ Etapa 3/4: Validando instalação...${NC}"
echo ""

if [ -f "scripts/validate_repo.sh" ]; then
    bash scripts/validate_repo.sh
else
    echo "${YELLOW}  ⚠️  validate_repo.sh não encontrado${NC}"
fi

# -----------------------------------------------------------
# 5. RESUMO FINAL
# -----------------------------------------------------------
echo ""
echo "${BLUE}📋 Etapa 4/4: Resumo da Instalação${NC}"
echo ""

echo "${GREEN}╔════════════════════════════════════════════════════════════╗${NC}"
echo "${GREEN}║  ✅ Instalação concluída!                                  ║${NC}"
echo "${GREEN}╚════════════════════════════════════════════════════════════╝${NC}"
echo ""
echo "${YELLOW}Próximos passos:${NC}"
echo "  1. Acesse o diretório do repositório"
echo "  2. Faça upload das fontes no NotebookLM"
echo "  3. Inicie sua sessão de estudo: ./scripts/daily_study.sh"
echo "  4. Sincronize com o NotebookLM: ./scripts/sync_from_notebooklm.sh"
echo "  5. Valide antes de publicar: ./scripts/validate_repo.sh"
echo ""
echo "${YELLOW}Scripts disponíveis:${NC}"
echo "  📁 scripts/init_repo.sh              — Inicializar repositório"
echo "  📁 scripts/sync_from_notebooklm.sh   — Sincronizar com NotebookLM"
echo "  📁 scripts/validate_repo.sh          — Validar maturidade técnica"
echo "  📁 scripts/setup_github.sh           — Configurar GitHub"
echo "  📁 scripts/update_react19.sh         — Atualizar com React 19"
echo "  📁 scripts/export_to_pdf.sh          — Exportar para PDF"
echo "  📁 scripts/daily_study.sh            — Rotina diária de estudo"
echo "  📁 scripts/backup.sh                 — Fazer backup"
echo ""
