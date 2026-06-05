#!/bin/bash
# ============================================================
# daily_study.sh — Rotina Diária de Estudo com NotebookLM
# ============================================================
# Uso: ./scripts/daily_study.sh
#
# Este script guia uma sessão de estudo diária estruturada,
# ajudando a manter consistência e rastrear progresso.
# ============================================================

set -e

GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m'

echo "╔════════════════════════════════════════════════════════════╗"
echo "║  📅 Sessão de Estudo Diária — React                       ║"
echo "╚════════════════════════════════════════════════════════════╝"
echo ""

# -----------------------------------------------------------
# 1. REGISTRAR DATA E HORA
# -----------------------------------------------------------
SESSION_DATE=$(date +%Y-%m-%d)
SESSION_TIME=$(date +%H:%M)
STUDY_LOG="estudos/log_${SESSION_DATE}.md"

mkdir -p estudos

cat > "$STUDY_LOG" << EOF
# Sessão de Estudo — $SESSION_DATE

**Início:** $SESSION_TIME
**Tema:** React
**Fonte principal:** NotebookLM

---

## 🎯 Objetivo do Dia
[Descreva o que você pretende aprender hoje]

## 📚 Fontes Consultadas
- [ ] react.dev — [seção]
- [ ] freeCodeCamp — [seção]
- [ ] LogRocket — [seção]
- [ ] Outro: [especifique]

## 🧠 Prompts Utilizados

### Prompt 1
\`\`\`text
[Cole o prompt aqui]
\`\`\`

**Resposta resumida:**
[Resuma a resposta em 3-5 linhas]

**Dificuldades encontradas:**
- 

---

### Prompt 2
\`\`\`text
[Cole o prompt aqui]
\`\`\`

**Resposta resumida:**

**Dificuldades encontradas:**
- 

---

## ✅ Conceitos Aprendidos
- [ ] 
- [ ] 
- [ ] 

## ❌ Dúvidas Pendentes
- 

## 🔗 Relações com Estudos Anteriores
[Como o que você aprendeu hoje se conecta a tópicos anteriores?]

## 📝 Notas Livres
[Qualquer observação, insight ou ideia]

---

**Fim:** [preencher ao terminar]
**Tempo total:** [preencher]
**Nível de confiança (1-5):** ⭐
EOF

echo "${GREEN}  ✓ Log de estudo criado: $STUDY_LOG${NC}"

# -----------------------------------------------------------
# 2. CHECKLIST DE PREPARAÇÃO
# -----------------------------------------------------------
echo ""
echo "${BLUE}📋 Checklist de Preparação${NC}"
echo ""

checklist_items=(
    "Fontes carregadas no NotebookLM"
    "Ambiente de código aberto (VS Code, CodePen, StackBlitz)"
    "Caderno/anotações físico ou digital"
    "Timer configurado (Técnica Pomodoro: 25min foco + 5min pausa)"
    "Sem distrações (modo avião, notificações desligadas)"
)

for item in "${checklist_items[@]}"; do
    echo "  ☐ $item"
done

echo ""
read -p "Pressione ENTER quando estiver pronto para começar..."

# -----------------------------------------------------------
# 3. TIMER POMODORO
# -----------------------------------------------------------
echo ""
echo "${BLUE}⏱️  Pomodoro iniciado — 25 minutos de foco${NC}"
echo "   💡 Dica: Use o NotebookLM para fazer perguntas sobre o tema do dia"
echo "   💡 Dica: Documente dificuldades no log de estudo"
echo ""

# Contador simples (pode ser substituído por um timer real)
for i in {1..5}; do
    echo -n "   ${YELLOW}⏳ Foco: $((25 - (i-1)*5)) minutos restantes...${NC}\r"
    sleep 1  # Em produção, seria sleep 300 (5 minutos)
done

echo ""
echo "${GREEN}  ✓ Sessão de foco concluída!${NC}"

# -----------------------------------------------------------
# 4. PAUSA
# -----------------------------------------------------------
echo ""
echo "${BLUE}☕ Pausa de 5 minutos${NC}"
echo "   💡 Dica: Anote no log o que você aprendeu"
echo "   💡 Dica: Se encontrou dificuldades, documente como uma 'cicatriz'"
echo ""

for i in {1..5}; do
    echo -n "   ${YELLOW}⏳ Pausa: $((5 - (i-1))) minutos restantes...${NC}\r"
    sleep 1  # Em produção, seria sleep 60
done

echo ""
echo "${GREEN}  ✓ Pausa concluída!${NC}"

# -----------------------------------------------------------
# 5. PRÓXIMOS PASSOS
# -----------------------------------------------------------
echo ""
echo "${BLUE}📋 Próximos Passos${NC}"
echo ""
echo "  1. Complete o log de estudo: $STUDY_LOG"
echo "  2. Se encontrou dificuldades, crie uma cicatriz:"
echo "     ${YELLOW}./scripts/sync_from_notebooklm.sh${NC}"
echo "  3. Atualize os resumos e glossário com novos conceitos"
echo "  4. Faça commit das mudanças:"
echo "     ${YELLOW}git add . && git commit -m '📚 estudo: [tema do dia]'${NC}"
echo ""

# -----------------------------------------------------------
# 6. ESTATÍSTICAS
# -----------------------------------------------------------
echo "${BLUE}📊 Estatísticas de Estudo${NC}"
echo ""

study_count=$(find estudos -name "log_*.md" -type f 2>/dev/null | wc -l)
echo "  📚 Total de sessões de estudo: $study_count"

if [ -d ".git" ]; then
    commit_count=$(git rev-list --count HEAD 2>/dev/null || echo "0")
    echo "  💾 Total de commits: $commit_count"
fi

echo ""
echo "${GREEN}╔════════════════════════════════════════════════════════════╗${NC}"
echo "${GREEN}║  ✅ Sessão de estudo finalizada!                           ║${NC}"
echo "${GREEN}╚════════════════════════════════════════════════════════════╝${NC}"
echo ""
