#!/bin/bash
# ============================================================
# setup_github.sh — Configuração do Repositório no GitHub
# ============================================================
# Uso: ./scripts/setup_github.sh
#
# Este script configura o remote do GitHub e faz o push inicial.
# Requer que você já tenha:
#   1. Uma conta no GitHub
#   2. Um repositório criado no GitHub (vazio, sem README)
#   3. SSH key configurada ou GitHub CLI instalado
# ============================================================

set -e

GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m'

echo "╔════════════════════════════════════════════════════════════╗"
echo "║  🐙 Configuração do GitHub Remote                         ║"
echo "╚════════════════════════════════════════════════════════════╝"
echo ""

# -----------------------------------------------------------
# 1. VERIFICAR PRÉ-REQUISITOS
# -----------------------------------------------------------
echo "${BLUE}🔍 Verificando pré-requisitos...${NC}"

if ! command -v git &> /dev/null; then
    echo "${RED}  ✗ Git não está instalado${NC}"
    exit 1
fi
echo "${GREEN}  ✓ Git instalado${NC}"

if [ ! -d ".git" ]; then
    echo "${RED}  ✗ Repositório Git não inicializado${NC}"
    echo "     Execute primeiro: ./scripts/init_repo.sh"
    exit 1
fi
echo "${GREEN}  ✓ Repositório Git detectado${NC}"

# -----------------------------------------------------------
# 2. COLETAR INFORMAÇÕES DO GITHUB
# -----------------------------------------------------------
echo ""
echo "${BLUE}📝 Configuração do Remote${NC}"
echo ""

read -p "  Seu usuário no GitHub: " github_user
read -p "  Nome do repositório (ex: aprender-react): " repo_name
read -p "  Usar HTTPS ou SSH? [https/ssh] (padrão: ssh): " protocol
protocol=${protocol:-ssh}

if [ "$protocol" = "ssh" ]; then
    remote_url="git@github.com:${github_user}/${repo_name}.git"
else
    remote_url="https://github.com/${github_user}/${repo_name}.git"
fi

echo ""
echo "  ${YELLOW}URL do remote:${NC} $remote_url"
echo ""

# -----------------------------------------------------------
# 3. CONFIGURAR REMOTE
# -----------------------------------------------------------
if git remote -v &> /dev/null; then
    echo "${YELLOW}  ⚠️  Remote já existe. Deseja sobrescrever?${NC}"
    read -p "  (s/n): " overwrite
    if [ "$overwrite" = "s" ]; then
        git remote remove origin 2>/dev/null || true
        git remote add origin "$remote_url"
        echo "${GREEN}  ✓ Remote atualizado${NC}"
    fi
else
    git remote add origin "$remote_url"
    echo "${GREEN}  ✓ Remote adicionado${NC}"
fi

# -----------------------------------------------------------
# 4. CONFIGURAR BRANCH PRINCIPAL
# -----------------------------------------------------------
echo ""
echo "${BLUE}🌿 Configurando branch principal...${NC}"

git branch -M main
echo "${GREEN}  ✓ Branch renomeada para 'main'${NC}"

# -----------------------------------------------------------
# 5. PUSH INICIAL
# -----------------------------------------------------------
echo ""
echo "${BLUE}🚀 Fazendo push inicial...${NC}"

if git push -u origin main; then
    echo "${GREEN}  ✓ Push realizado com sucesso!${NC}"
else
    echo "${RED}  ✗ Falha no push${NC}"
    echo ""
    echo "${YELLOW}Possíveis causas:${NC}"
    echo "  • Repositório não existe no GitHub — crie em https://github.com/new"
    echo "  • SSH key não configurada — execute: ssh-keygen -t ed25519"
    echo "  • Autenticação necessária — use GitHub CLI: gh auth login"
    exit 1
fi

# -----------------------------------------------------------
# 6. RESUMO
# -----------------------------------------------------------
echo ""
echo "${GREEN}╔════════════════════════════════════════════════════════════╗${NC}"
echo "${GREEN}║  ✅ Repositório publicado no GitHub!                       ║${NC}"
echo "${GREEN}╚════════════════════════════════════════════════════════════╝${NC}"
echo ""
echo "  ${YELLOW}URL:${NC} https://github.com/${github_user}/${repo_name}"
echo "  ${YELLOW}Branch:${NC} main"
echo "  ${YELLOW}Remote:${NC} origin"
echo ""
echo "${BLUE}Próximos passos:${NC}"
echo "  1. Acesse o repositório no GitHub e verifique os arquivos"
echo "  2. Adicione uma descrição e tags (topics) no GitHub"
echo "  3. Ative o GitHub Pages se quiser publicar como site estático"
echo "  4. Compartilhe o link no LinkedIn/portfólio"
echo ""
