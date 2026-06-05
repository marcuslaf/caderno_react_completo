# init_repo.ps1 — Inicialização do Repositório (Windows PowerShell)
# ============================================================
# Uso: .\scripts\init_repo.ps1
#
# Equivalente ao init_repo.sh para usuários Windows
# ============================================================

$ErrorActionPreference = "Stop"

Write-Host "╔════════════════════════════════════════════════════════════╗" -ForegroundColor Green
Write-Host "║  🚀 Inicializando Repositório: Aprender React             ║" -ForegroundColor Green
Write-Host "╚════════════════════════════════════════════════════════════╝" -ForegroundColor Green
Write-Host ""

# -----------------------------------------------------------
# 1. CONFIGURAÇÕES
# -----------------------------------------------------------
$REPO_NAME = "aprender-react-caderno-tematico"
$AUTHOR_NAME = Read-Host "  Seu nome"
$AUTHOR_EMAIL = Read-Host "  Seu email"

# -----------------------------------------------------------
# 2. CRIAR ESTRUTURA DE PASTAS
# -----------------------------------------------------------
Write-Host "📁 Criando estrutura de pastas..." -ForegroundColor Blue

$dirs = @("fontes", "prompts", "cicatrizes", "entregas", "scripts", "estudos", "exports", "backups")
foreach ($dir in $dirs) {
    New-Item -ItemType Directory -Force -Path $dir | Out-Null
}
Write-Host "   ✓ Pastas criadas" -ForegroundColor Green

# -----------------------------------------------------------
# 3. INICIALIZAR GIT
# -----------------------------------------------------------
Write-Host "🔧 Inicializando repositório Git..." -ForegroundColor Blue

git init
git config user.name "$AUTHOR_NAME"
git config user.email "$AUTHOR_EMAIL"

Write-Host "   ✓ Repositório Git inicializado" -ForegroundColor Green

# -----------------------------------------------------------
# 4. CRIAR ARQUIVOS BASE
# -----------------------------------------------------------
Write-Host "📝 Criando arquivos base..." -ForegroundColor Blue

# .gitignore
@"
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

# Exports
exports/

# Backups
backups/

# Estudos
estudos/
"@ | Out-File -FilePath ".gitignore" -Encoding utf8

# README.md base
$date = Get-Date -Format "dd/MM/yyyy"
@"
# ⚛️ Aprender a Programar em React — Caderno Temático

> Repositório de estudo estruturado com curadoria de fontes, engenharia de prompts e miniguia de revisão.
> **Ferramenta utilizada:** NotebookLM (Google)

---

## 📌 1. Contexto e Objetivos

### Assunto de Interesse
Aprender a programar em **React**, a biblioteca JavaScript mantida pela Meta (Facebook) e comunidade.

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
├── scripts/
│   ├── init_repo.ps1
│   ├── sync_from_notebooklm.ps1
│   ├── validate_repo.ps1
│   └── ...
├── estudos/
├── exports/
└── backups/
```

---

> ✍️ **Autor:** $AUTHOR_NAME
> 📅 **Última atualização:** $date
> 🔄 **Versão:** 1.0
"@ | Out-File -FilePath "README.md" -Encoding utf8

Write-Host "   ✓ Arquivos base criados" -ForegroundColor Green

# -----------------------------------------------------------
# 5. PRIMEIRO COMMIT
# -----------------------------------------------------------
Write-Host "💾 Fazendo primeiro commit..." -ForegroundColor Blue

git add .
git commit -m "🎉 Initial commit: estrutura base do caderno tematico

- Estrutura de pastas (fontes, prompts, cicatrizes, entregas)
- README.md com contexto e objetivos
- .gitignore configurado
- Scripts de automacao"

Write-Host "   ✓ Commit inicial realizado" -ForegroundColor Green

# -----------------------------------------------------------
# 6. INSTRUÇÕES FINAIS
# -----------------------------------------------------------
Write-Host ""
Write-Host "╔════════════════════════════════════════════════════════════╗" -ForegroundColor Green
Write-Host "║  ✅ Repositório criado com sucesso!                        ║" -ForegroundColor Green
Write-Host "╚════════════════════════════════════════════════════════════╝" -ForegroundColor Green
Write-Host ""
Write-Host "📂 Local: $(Get-Location)" -ForegroundColor Yellow
Write-Host ""
Write-Host "Próximos passos:" -ForegroundColor Yellow
Write-Host "  1. Copie os arquivos de conteúdo para as pastas correspondentes"
Write-Host "  2. Faça upload das fontes no NotebookLM"
Write-Host "  3. Execute: .\scripts\sync_from_notebooklm.ps1"
Write-Host "  4. Crie um repositório no GitHub e execute:"
Write-Host "     git remote add origin https://github.com/seu-usuario/$REPO_NAME.git"
Write-Host "     git branch -M main"
Write-Host "     git push -u origin main"
Write-Host ""
