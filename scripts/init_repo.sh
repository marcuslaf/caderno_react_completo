#!/bin/bash
# ============================================================
# init_repo.sh — Script de Inicialização do Repositório Git
# Tema: Aprender a Programar em React
# ============================================================

set -e  # Sai em caso de erro

echo "╔════════════════════════════════════════════════════════════╗"
echo "║  🚀 Inicializando Repositório: Aprender React             ║"
echo "╚════════════════════════════════════════════════════════════╝"
echo ""

# -----------------------------------------------------------
# 1. CONFIGURAÇÕES
# -----------------------------------------------------------
REPO_NAME="aprender-react-caderno-tematico"
AUTHOR_NAME="[Seu Nome]"
AUTHOR_EMAIL="[seu.email@exemplo.com]"

# Cores para output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# -----------------------------------------------------------
# 2. CRIAR ESTRUTURA DE PASTAS
# -----------------------------------------------------------
echo "${BLUE}📁 Criando estrutura de pastas...${NC}"

mkdir -p "$REPO_NAME"/{fontes,prompts,cicatrizes,entregas,scripts}

echo "${GREEN}   ✓ Pastas criadas${NC}"
echo ""

# -----------------------------------------------------------
# 3. INICIALIZAR GIT
# -----------------------------------------------------------
echo "${BLUE}🔧 Inicializando repositório Git...${NC}"

cd "$REPO_NAME"
git init
git config user.name "$AUTHOR_NAME"
git config user.email "$AUTHOR_EMAIL"

echo "${GREEN}   ✓ Repositório Git inicializado${NC}"
echo ""

# -----------------------------------------------------------
# 4. CRIAR ARQUIVOS BASE
# -----------------------------------------------------------
echo "${BLUE}📝 Criando arquivos base...${NC}"

# .gitignore
cat > .gitignore << 'EOF'
# Node
node_modules/
npm-debug.log*
yarn-debug.log*
yarn-error.log*

# IDEs
.vscode/
.idea/
*.swp
*.swo

# OS
.DS_Store
Thumbs.db

# Logs
*.log

# Temporários
*.tmp
*.temp
EOF

# README.md base
cat > README.md << 'EOF'
# ⚛️ Aprender a Programar em React — Caderno Temático

> Repositório de estudo estruturado com curadoria de fontes, engenharia de prompts e miniguia de revisão.
> **Ferramenta utilizada:** NotebookLM (Google)

---

## 📌 1. Contexto e Objetivos

### Assunto de Interesse
Aprender a programar em **React**, a biblioteca JavaScript mantida pela Meta (Facebook) e comunidade, utilizada para construir interfaces de usuário baseadas em componentes.

### Motivação
React é uma das tecnologias web mais utilizadas no mercado. Dominar React abre portas para desenvolvimento front-end, mobile (React Native) e full-stack (Next.js, Remix).

### Objetivos de Estudo
| Objetivo | Descrição | Status |
|----------|-----------|--------|
| OE1 | Compreender JSX, componentes funcionais, props e state | ✅ Concluído |
| OE2 | Dominar os Hooks fundamentais (useState, useEffect, useContext) | ✅ Concluído |
| OE3 | Entender o fluxo de dados unidirecional e gerenciamento de estado | 🔄 Em andamento |
| OE4 | Diferenciar useEffect de useLayoutEffect e dominar cleanup | 🔄 Em andamento |
| OE5 | Criar Custom Hooks reutilizáveis com boas práticas | ⏳ Pendente |

---

## 📚 2. Curadoria de Fontes

Veja [`fontes/links_fontes_online.md`](fontes/links_fontes_online.md)

---

## 🧠 3. Engenharia de Prompts & "Cicatrizes"

Veja a pasta [`cicatrizes/`](cicatrizes/)

---

## 📖 4. Miniguia de Estudo (Entrega Final)

Veja a pasta [`entregas/`](entregas/)

---

## 🛠️ Estrutura de Arquivos

```
aprender-react-caderno-tematico/
├── README.md
├── .gitignore
├── fontes/
│   └── links_fontes_online.md
├── prompts/
│   ├── prompt_01_roteiro.md
│   ├── prompt_02_useEffect_vs_useLayoutEffect.md
│   └── prompt_03_custom_hooks.md
├── cicatrizes/
│   ├── cicatriz_01_resposta_generica.md
│   ├── cicatriz_02_explicacao_abstrata.md
│   └── cicatriz_03_abstracao_prematura.md
├── entregas/
│   ├── resumos_estruturados.md
│   ├── glossario.md
│   └── miniguia_revisao.md
└── scripts/
    ├── init_repo.sh
    └── sync_from_notebooklm.sh
```

---

> ✍️ **Autor:** [Seu nome]
> 📅 **Última atualização:** $(date +%d/%m/%Y)
> 🔄 **Versão:** 1.0
EOF

echo "${GREEN}   ✓ Arquivos base criados${NC}"
echo ""

# -----------------------------------------------------------
# 5. PRIMEIRO COMMIT
# -----------------------------------------------------------
echo "${BLUE}💾 Fazendo primeiro commit...${NC}"

git add .
git commit -m "🎉 Initial commit: estrutura base do caderno temático

- Estrutura de pastas (fontes, prompts, cicatrizes, entregas)
- README.md com contexto e objetivos
- .gitignore configurado
- Scripts de automação"

echo "${GREEN}   ✓ Commit inicial realizado${NC}"
echo ""

# -----------------------------------------------------------
# 6. INSTRUÇÕES FINAIS
# -----------------------------------------------------------
echo "${GREEN}╔════════════════════════════════════════════════════════════╗${NC}"
echo "${GREEN}║  ✅ Repositório criado com sucesso!                        ║${NC}"
echo "${GREEN}╚════════════════════════════════════════════════════════════╝${NC}"
echo ""
echo "${YELLOW}📂 Local:${NC} $(pwd)"
echo ""
echo "${YELLOW}Próximos passos:${NC}"
echo "  1. Copie os arquivos de conteúdo para as pastas correspondentes"
echo "  2. Faça upload das fontes no NotebookLM"
echo "  3. Execute: ${BLUE}./scripts/sync_from_notebooklm.sh${NC} para sincronizar"
echo "  4. Crie um repositório no GitHub e execute:"
echo "     ${BLUE}git remote add origin https://github.com/seu-usuario/$REPO_NAME.git${NC}"
echo "     ${BLUE}git branch -M main${NC}"
echo "     ${BLUE}git push -u origin main${NC}"
echo ""
