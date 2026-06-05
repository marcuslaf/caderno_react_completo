#!/bin/bash
# ============================================================
# validate_repo.sh — Validação de Maturidade Técnica
# ============================================================
# Uso: ./scripts/validate_repo.sh
#
# Verifica se o repositório atende aos critérios de maturidade
# exigidos para o caderno temático.
# ============================================================

set -e

GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m'

PASS=0
FAIL=0
WARN=0

echo "╔════════════════════════════════════════════════════════════╗"
echo "║  ✅ Validação de Maturidade Técnica                        ║"
echo "║  Tema: Aprender a Programar em React                       ║"
echo "╚════════════════════════════════════════════════════════════╝"
echo ""

# Função para verificar existência
 check_file() {
    local file="$1"
    local desc="$2"
    local required="$3"

    if [ -f "$file" ]; then
        local size=$(stat -f%z "$file" 2>/dev/null || stat -c%s "$file" 2>/dev/null || echo "?")
        echo "${GREEN}  ✓${NC} $desc"
        echo "     📄 $file (${size} bytes)"
        ((PASS++))
        return 0
    else
        if [ "$required" = "required" ]; then
            echo "${RED}  ✗${NC} $desc (OBRIGATÓRIO)"
            echo "     📄 $file (não encontrado)"
            ((FAIL++))
        else
            echo "${YELLOW}  ⚠${NC} $desc (opcional)"
            echo "     📄 $file (não encontrado)"
            ((WARN++))
        fi
        return 1
    fi
}

check_dir() {
    local dir="$1"
    local desc="$2"

    if [ -d "$dir" ]; then
        local count=$(find "$dir" -type f | wc -l)
        echo "${GREEN}  ✓${NC} $desc"
        echo "     📁 $dir/ ($count arquivos)"
        ((PASS++))
    else
        echo "${RED}  ✗${NC} $desc"
        echo "     📁 $dir/ (não encontrada)"
        ((FAIL++))
    fi
}

check_content() {
    local file="$1"
    local pattern="$2"
    local desc="$3"

    if [ -f "$file" ] && grep -q "$pattern" "$file" 2>/dev/null; then
        echo "${GREEN}  ✓${NC} $desc"
        ((PASS++))
    else
        echo "${YELLOW}  ⚠${NC} $desc (não detectado)"
        ((WARN++))
    fi
}

# -----------------------------------------------------------
# 1. ESTRUTURA DE PASTAS
# -----------------------------------------------------------
echo "${BLUE}📁 1. Estrutura de Pastas${NC}"
check_dir "fontes" "Pasta de fontes"
check_dir "prompts" "Pasta de prompts"
check_dir "cicatrizes" "Pasta de cicatrizes"
check_dir "entregas" "Pasta de entregas"
echo ""

# -----------------------------------------------------------
# 2. ARQUIVOS OBRIGATÓRIOS
# -----------------------------------------------------------
echo "${BLUE}📄 2. Arquivos Obrigatórios${NC}"
check_file "README.md" "README principal" "required"
check_file ".gitignore" "Arquivo .gitignore" "required"
check_file "fontes/links_fontes_online.md" "Links das fontes curadas" "required"
check_file "entregas/resumos_estruturados.md" "Resumos estruturados" "required"
check_file "entregas/glossario.md" "Glossário de conceitos" "required"
check_file "entregas/miniguia_revisao.md" "Miniguia de revisão (prompts reutilizáveis)" "required"
echo ""

# -----------------------------------------------------------
# 3. PROMPTS DOCUMENTADOS (mínimo 3)
# -----------------------------------------------------------
echo "${BLUE}🧠 3. Prompts Documentados${NC}"
prompt_count=$(find prompts -name "prompt_*.md" -type f 2>/dev/null | wc -l)
if [ "$prompt_count" -ge 3 ]; then
    echo "${GREEN}  ✓${NC} Mínimo de 3 prompts documentados"
    echo "     📊 $prompt_count prompts encontrados"
    ((PASS++))
else
    echo "${RED}  ✗${NC} Mínimo de 3 prompts documentados"
    echo "     📊 $prompt_count prompts encontrados (mínimo: 3)"
    ((FAIL++))
fi

# Verificar se prompts têm evolução de versões
for f in prompts/prompt_*.md; do
    if [ -f "$f" ]; then
        if grep -q "v1.0" "$f" && grep -q "v2.0" "$f"; then
            echo "${GREEN}  ✓${NC} $(basename $f) — evolução de versões detectada"
            ((PASS++))
        else
            echo "${YELLOW}  ⚠${NC} $(basename $f) — evolução de versões não detectada"
            ((WARN++))
        fi
    fi
done
echo ""

# -----------------------------------------------------------
# 4. CICATRIZES DOCUMENTADAS (mínimo 3)
# -----------------------------------------------------------
echo "${BLUE}🩹 4. Cicatrizes (Troubleshooting)${NC}"
cicatriz_count=$(find cicatrizes -name "cicatriz_*.md" -type f 2>/dev/null | wc -l)
if [ "$cicatriz_count" -ge 3 ]; then
    echo "${GREEN}  ✓${NC} Mínimo de 3 cicatrizes documentadas"
    echo "     📊 $cicatriz_count cicatrizes encontradas"
    ((PASS++))
else
    echo "${RED}  ✗${NC} Mínimo de 3 cicatrizes documentadas"
    echo "     📊 $cicatriz_count cicatrizes encontradas (mínimo: 3)"
    ((FAIL++))
fi

# Verificar estrutura das cicatrizes
for f in cicatrizes/cicatriz_*.md; do
    if [ -f "$f" ]; then
        has_problema=0
        has_solucao=0
        has_aprendizado=0

        grep -q "Problema" "$f" && has_problema=1
        grep -q "Solução" "$f" && has_solucao=1
        grep -q "Aprendizado" "$f" && has_aprendizado=1

        if [ $has_problema -eq 1 ] && [ $has_solucao -eq 1 ] && [ $has_aprendizado -eq 1 ]; then
            echo "${GREEN}  ✓${NC} $(basename $f) — estrutura completa (problema + solução + aprendizado)"
            ((PASS++))
        else
            echo "${YELLOW}  ⚠${NC} $(basename $f) — estrutura incompleta"
            ((WARN++))
        fi
    fi
done
echo ""

# -----------------------------------------------------------
# 5. CONTEÚDO DOS ARQUIVOS
# -----------------------------------------------------------
echo "${BLUE}📖 5. Conteúdo dos Arquivos${NC}"

check_content "README.md" "Contexto e Objetivos" "Seção de contexto no README"
check_content "README.md" "Curadoria de Fontes" "Seção de fontes no README"
check_content "README.md" "Engenharia de Prompts" "Seção de prompts no README"
check_content "README.md" "Miniguia de Estudo" "Seção de entregas no README"
check_content "entregas/glossario.md" "|" "Tabela de glossário"
check_content "entregas/miniguia_revisao.md" "Prompt" "Prompts reutilizáveis no miniguia"
check_content "entregas/resumos_estruturados.md" "Pontos-chave" "Pontos-chave nos resumos"
echo ""

# -----------------------------------------------------------
# 6. GIT
# -----------------------------------------------------------
echo "${BLUE}🔧 6. Controle de Versão (Git)${NC}"

if [ -d ".git" ]; then
    echo "${GREEN}  ✓${NC} Repositório Git inicializado"
    ((PASS++))

    commit_count=$(git rev-list --count HEAD 2>/dev/null || echo "0")
    if [ "$commit_count" -gt 0 ]; then
        echo "${GREEN}  ✓${NC} Commits realizados: $commit_count"
        ((PASS++))
    else
        echo "${YELLOW}  ⚠${NC} Nenhum commit encontrado"
        ((WARN++))
    fi

    if git remote -v >/dev/null 2>&1; then
        echo "${GREEN}  ✓${NC} Remote configurado"
        ((PASS++))
    else
        echo "${YELLOW}  ⚠${NC} Nenhum remote configurado (adicione no GitHub)"
        ((WARN++))
    fi
else
    echo "${RED}  ✗${NC} Repositório Git não inicializado"
    echo "     Execute: git init"
    ((FAIL++))
fi
echo ""

# -----------------------------------------------------------
# 7. RESUMO
# -----------------------------------------------------------
echo "${BLUE}════════════════════════════════════════════════════════════${NC}"
echo "${BLUE}  RESULTADO DA VALIDAÇÃO${NC}"
echo "${BLUE}════════════════════════════════════════════════════════════${NC}"
echo ""
echo "  ${GREEN}✅ Aprovados:${NC}  $PASS"
echo "  ${YELLOW}⚠️  Alertas:${NC}   $WARN"
echo "  ${RED}❌ Falhas:${NC}    $FAIL"
echo ""

TOTAL=$((PASS + WARN + FAIL))
SCORE=$((PASS * 100 / TOTAL))

echo "  📊 Pontuação: $SCORE%"
echo ""

if [ "$FAIL" -eq 0 ] && [ "$SCORE" -ge 80 ]; then
    echo "${GREEN}╔════════════════════════════════════════════════════════════╗${NC}"
    echo "${GREEN}║  🎉 REPOSITÓRIO APROVADO!                                   ║${NC}"
    echo "${GREEN}║  Maturidade técnica demonstrada. Pronto para exibição.    ║${NC}"
    echo "${GREEN}╚════════════════════════════════════════════════════════════╝${NC}"
elif [ "$FAIL" -eq 0 ]; then
    echo "${YELLOW}╔════════════════════════════════════════════════════════════╗${NC}"
    echo "${YELLOW}║  ✅ REPOSITÓRIO APROVADO COM ALERTAS                      ║${NC}"
    echo "${YELLOW}║  Revise os alertas para melhorar ainda mais.              ║${NC}"
    echo "${YELLOW}╚════════════════════════════════════════════════════════════╝${NC}"
else
    echo "${RED}╔════════════════════════════════════════════════════════════╗${NC}"
    echo "${RED}║  ❌ REPOSITÓRIO NÃO APROVADO                              ║${NC}"
    echo "${RED}║  Corrija as falhas obrigatórias antes de exibir.          ║${NC}"
    echo "${RED}╚════════════════════════════════════════════════════════════╝${NC}"
fi
echo ""
