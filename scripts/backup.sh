#!/bin/bash
# ============================================================
# backup.sh — Backup do Caderno Temático
# ============================================================
# Uso: ./scripts/backup.sh
#
# Cria um backup compactado do repositório completo,
# excluindo arquivos desnecessários (.git, node_modules, etc.)
# ============================================================

set -e

GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m'

echo "╔════════════════════════════════════════════════════════════╗"
echo "║  💾 Backup do Caderno Temático                             ║"
echo "╚════════════════════════════════════════════════════════════╝"
echo ""

# -----------------------------------------------------------
# 1. CONFIGURAÇÕES
# -----------------------------------------------------------
BACKUP_DIR="backups"
TIMESTAMP=$(date +%Y%m%d_%H%M%S)
BACKUP_NAME="caderno_react_${TIMESTAMP}"
REPO_NAME=$(basename "$(pwd)")

mkdir -p "$BACKUP_DIR"

# -----------------------------------------------------------
# 2. CRIAR BACKUP
# -----------------------------------------------------------
echo "${BLUE}📦 Criando backup...${NC}"

# Usar tar para criar arquivo compactado
tar -czf "${BACKUP_DIR}/${BACKUP_NAME}.tar.gz" \
    --exclude='.git' \
    --exclude='node_modules' \
    --exclude='backups' \
    --exclude='*.log' \
    --exclude='.DS_Store' \
    --exclude='exports' \
    --exclude='estudos' \
    .

echo "${GREEN}  ✓ Backup criado: ${BACKUP_DIR}/${BACKUP_NAME}.tar.gz${NC}"

# -----------------------------------------------------------
# 3. INFORMAÇÕES DO BACKUP
# -----------------------------------------------------------
echo ""
echo "${BLUE}📊 Informações do Backup${NC}"
echo ""

BACKUP_SIZE=$(du -h "${BACKUP_DIR}/${BACKUP_NAME}.tar.gz" | cut -f1)
echo "  📁 Arquivo: ${BACKUP_DIR}/${BACKUP_NAME}.tar.gz"
echo "  📦 Tamanho: $BACKUP_SIZE"
echo "  📅 Data: $(date)"
echo "  📝 Commits no backup: $(git rev-list --count HEAD 2>/dev/null || echo 'N/A')"

# -----------------------------------------------------------
# 4. LISTAR BACKUPS EXISTENTES
# -----------------------------------------------------------
echo ""
echo "${BLUE}📚 Backups Existentes${NC}"
echo ""

if [ -d "$BACKUP_DIR" ] && [ "$(ls -A $BACKUP_DIR)" ]; then
    ls -lh "$BACKUP_DIR"/*.tar.gz 2>/dev/null | awk '{print "  📄", $9, "(" $5 ")"}'
else
    echo "  ${YELLOW}Nenhum backup anterior encontrado${NC}"
fi

# -----------------------------------------------------------
# 5. LIMPAR BACKUPS ANTIGOS (OPCIONAL)
# -----------------------------------------------------------
echo ""
read -p "Deseja remover backups com mais de 30 dias? (s/n): " cleanup
if [ "$cleanup" = "s" ]; then
    find "$BACKUP_DIR" -name "*.tar.gz" -mtime +30 -delete
    echo "${GREEN}  ✓ Backups antigos removidos${NC}"
fi

# -----------------------------------------------------------
# 6. RESUMO
# -----------------------------------------------------------
echo ""
echo "${GREEN}╔════════════════════════════════════════════════════════════╗${NC}"
echo "${GREEN}║  ✅ Backup concluído!                                      ║${NC}"
echo "${GREEN}╚════════════════════════════════════════════════════════════╝${NC}"
echo ""
