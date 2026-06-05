#!/bin/bash
# ============================================================
# sync_from_notebooklm.sh — Sincroniza Conteúdo do NotebookLM
# ============================================================
# Uso: ./scripts/sync_from_notebooklm.sh
#
# Este script guia o processo de transferir conteúdo gerado
# no NotebookLM para os arquivos do repositório local.
# ============================================================

set -e

GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m'

echo "╔════════════════════════════════════════════════════════════╗"
echo "║  🔄 Sincronização: NotebookLM → Repositório Local         ║"
echo "╚════════════════════════════════════════════════════════════╝"
echo ""

# -----------------------------------------------------------
# FUNÇÕES AUXILIARES
# -----------------------------------------------------------

ask_yes_no() {
    while true; do
        read -p "$1 (s/n): " yn
        case $yn in
            [Ss]* ) return 0;;
            [Nn]* ) return 1;;
            * ) echo "Por favor, responda s ou n.";;
        esac
    done
}

append_to_file() {
    local file="$1"
    local content="$2"
    local header="$3"

    if [ -f "$file" ]; then
        echo "" >> "$file"
        echo "---" >> "$file"
        echo "" >> "$file"
        echo "$header" >> "$file"
        echo "" >> "$file"
        echo "$content" >> "$file"
        echo "${GREEN}   ✓ Conteúdo adicionado a $file${NC}"
    else
        echo "${RED}   ✗ Arquivo $file não encontrado${NC}"
    fi
}

# -----------------------------------------------------------
# 1. VERIFICAR ESTRUTURA
# -----------------------------------------------------------
echo "${BLUE}🔍 Verificando estrutura do repositório...${NC}"

required_dirs=("fontes" "prompts" "cicatrizes" "entregas")
missing=0

for dir in "${required_dirs[@]}"; do
    if [ ! -d "$dir" ]; then
        echo "${RED}   ✗ Pasta $dir/ não encontrada${NC}"
        missing=1
    fi
done

if [ $missing -eq 1 ]; then
    echo ""
    echo "${RED}❌ Estrutura incompleta. Execute init_repo.sh primeiro.${NC}"
    exit 1
fi

echo "${GREEN}   ✓ Estrutura OK${NC}"
echo ""

# -----------------------------------------------------------
# 2. SINCRONIZAR FONTES
# -----------------------------------------------------------
echo "${BLUE}📚 [1/4] Sincronizando Fontes...${NC}"

if ask_yes_no "Você já fez upload das fontes no NotebookLM?"; then
    echo "${YELLOW}   ℹ️  Certifique-se de que os links estão em fontes/links_fontes_online.md${NC}"

    if ask_yes_no "Deseja adicionar uma nova fonte agora?"; then
        read -p "   Nome da fonte: " fonte_nome
        read -p "   Tipo (PDF/Artigo/Livro): " fonte_tipo
        read -p "   Link: " fonte_link
        read -p "   Justificativa da escolha: " fonte_just

        echo "| $(date +%Y) | $fonte_nome | $fonte_tipo | $fonte_link | ✅ Sim | $fonte_just |" >> fontes/links_fontes_online.md
        echo "${GREEN}   ✓ Fonte adicionada${NC}"
    fi
else
    echo "${YELLOW}   ⚠️  Faça o upload das fontes no NotebookLM antes de continuar${NC}"
fi
echo ""

# -----------------------------------------------------------
# 3. SINCRONIZAR PROMPTS
# -----------------------------------------------------------
echo "${BLUE}🧠 [2/4] Sincronizando Prompts...${NC}"

if ask_yes_no "Deseja adicionar um novo prompt documentado?"; then
    read -p "   Número do prompt (ex: 04): " prompt_num
    read -p "   Título/objetivo do prompt: " prompt_titulo

    filename="prompts/prompt_${prompt_num}_$(echo $prompt_titulo | tr ' ' '_' | tr '[:upper:]' '[:lower:]' | tr -cd '[:alnum:]_').md"

    cat > "$filename" << EOF
# Prompt $prompt_num — $prompt_titulo

## 📝 Versão do Prompt Testada
\`\`\`text
[Insira aqui o prompt exatamente como foi digitado no NotebookLM]
\`\`\`

## 🤖 Resposta Obtida (Resumida)
\`\`\`text
[Resumo da resposta gerada pela IA]
\`\`\`

## 🔍 Referências citadas pela IA
- [Fonte, página/seção]

## ⚠️ Dificuldades / "Cicatrizes"
| Problema | Causa Provável | Solução Testada | Resultado |
|----------|---------------|-----------------|-----------|
| | | | |

## 🔄 Evolução do Prompt
- **v1.0:** [Prompt inicial]
- **v2.0:** [Prompt refinado]

---
> 🏆 **Classificação:** [Ouro/Prata/Bronze]
> 💡 **Quando usar:** [Contexto de uso]
EOF

    echo "${GREEN}   ✓ Template de prompt criado: $filename${NC}"
    echo "${YELLOW}   ℹ️  Edite o arquivo e preencha com o conteúdo do NotebookLM${NC}"
fi
echo ""

# -----------------------------------------------------------
# 4. SINCRONIZAR CICATRIZES
# -----------------------------------------------------------
echo "${BLUE}🩹 [3/4] Sincronizando Cicatrizes...${NC}"

if ask_yes_no "Deseja documentar uma nova dificuldade (cicatriz)?"; then
    read -p "   Número da cicatriz (ex: 04): " cic_num
    read -p   "   Título do problema: " cic_titulo
    read -p   "   Prompt afetado: " cic_prompt

    filename="cicatrizes/cicatriz_${cic_num}_$(echo $cic_titulo | tr ' ' '_' | tr '[:upper:]' '[:lower:]' | tr -cd '[:alnum:]_').md"

    cat > "$filename" << EOF
# Cicatriz $cic_num — $cic_titulo

## 🔬 Prompt Afetado
$cic_prompt

## 📝 Versão do Prompt que Causou o Problema
\`\`\`text
[Insira o prompt problemático]
\`\`\`

## ⚠️ Problema Encontrado

### Resposta Obtida
[Descreva o que deu errado]

### Por que isso é grave?
[Explique as consequências]

## 🔍 Diagnóstico da Causa

| Aspecto | Análise |
|---------|---------|
| | |

## 🛠️ Solução Testada

### Ajuste no Prompt
[Descreva o que mudou]

### Resultado Após Ajuste
[Descreva a melhoria]

## 📚 Aprendizado

> **Lição:** [Síntese do aprendizado]

### Checklist para evitar esse problema no futuro
- [ ] 

---
> 🏷️ **Tags:** #[tag1] #[tag2]
> 📅 **Data:** $(date +%d/%m/%Y)
EOF

    echo "${GREEN}   ✓ Template de cicatriz criado: $filename${NC}"
fi
echo ""

# -----------------------------------------------------------
# 5. SINCRONIZAR ENTREGAS
# -----------------------------------------------------------
echo "${BLUE}📖 [4/4] Sincronizando Entregas...${NC}"

echo "${YELLOW}   ℹ️  Arquivos de entrega (resumos, glossário, miniguia) devem ser${NC}"
echo "${YELLOW}      editados manualmente com base nas respostas do NotebookLM${NC}"
echo ""

if ask_yes_no "Deseja verificar se os arquivos de entrega existem?"; then
    for file in "entregas/resumos_estruturados.md" "entregas/glossario.md" "entregas/miniguia_revisao.md"; do
        if [ -f "$file" ]; then
            echo "${GREEN}   ✓ $file existe${NC}"
        else
            echo "${RED}   ✗ $file não encontrado${NC}"
        fi
    done
fi
echo ""

# -----------------------------------------------------------
# 6. GIT STATUS E COMMIT
# -----------------------------------------------------------
echo "${BLUE}💾 Verificando mudanças no Git...${NC}"

git add -A

if git diff --cached --quiet; then
    echo "${YELLOW}   ℹ️  Nenhuma mudança para commitar${NC}"
else
    echo "${GREEN}   ✓ Mudanças detectadas${NC}"
    git status --short
    echo ""

    if ask_yes_no "Deseja fazer commit das mudanças?"; then
        read -p "   Mensagem do commit: " commit_msg
        git commit -m "📝 $commit_msg"
        echo "${GREEN}   ✓ Commit realizado: $commit_msg${NC}"
    fi
fi
echo ""

# -----------------------------------------------------------
# 7. RESUMO
# -----------------------------------------------------------
echo "${GREEN}╔════════════════════════════════════════════════════════════╗${NC}"
echo "${GREEN}║  ✅ Sincronização concluída!                               ║${NC}"
echo "${GREEN}╚════════════════════════════════════════════════════════════╝${NC}"
echo ""
echo "${YELLOW}Lembre-se de:${NC}"
echo "  • Copiar respostas do NotebookLM para os arquivos de prompts"
echo "  • Atualizar resumos e glossário com novos aprendizados"
echo "  • Documentar novas cicatrizes sempre que encontrar dificuldades"
echo "  • Fazer commits frequentes com mensagens descritivas"
echo ""
