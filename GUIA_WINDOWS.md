# 🪟 Guia de Instalação para Windows

> Instruções detalhadas para configurar o Caderno Temático de React no Windows usando PowerShell e Git Bash.

---

## 📋 Pré-requisitos

### 1. Git para Windows

**Download:** https://git-scm.com/download/win

Durante a instalação, **marque estas opções**:
- ✅ "Git from the command line and also from 3rd-party software"
- ✅ "Use Git and optional Unix tools from the Command Prompt" (recomendado)
- ✅ "Use Windows' default console window"

Isso instala o **Git Bash**, que permite executar scripts `.sh` nativamente no Windows.

### 2. PowerShell (já vem no Windows 10/11)

Verifique se está atualizado:
```powershell
$PSVersionTable.PSVersion
```

Recomendado: PowerShell 7+ (https://github.com/PowerShell/PowerShell/releases)

### 3. Editor de Texto

Recomendados:
- **VS Code:** https://code.visualstudio.com/ (com extensão Markdown All in One)
- **Notepad++:** https://notepad-plus-plus.org/

---

## 🚀 Instalação Rápida (Git Bash)

### Passo 1: Baixe o ZIP

Baixe o arquivo `caderno_react_completo.zip` e extraia para uma pasta, ex:
```
C:\Users\SeuNome\Projetos\aprender-react-caderno\
```

### Passo 2: Abra o Git Bash

Clique com o botão direito na pasta extraída → **"Git Bash Here"**

### Passo 3: Torne os scripts executáveis

```bash
chmod +x scripts/*.sh
```

### Passo 4: Execute o instalador

```bash
./scripts/install.sh
```

> 💡 **Dica:** No Git Bash, use `./` antes do nome do script. No PowerShell puro, use `bash ./scripts/install.sh`.

---

## 🚀 Instalação Rápida (PowerShell)

Se preferir usar PowerShell em vez de Git Bash:

### Passo 1: Abra o PowerShell na pasta

```powershell
cd C:\Users\SeuNome\Projetos\aprender-react-caderno
```

### Passo 2: Execute via bash

```powershell
bash ./scripts/install.sh
```

Ou execute cada script individualmente:
```powershell
bash ./scripts/init_repo.sh
bash ./scripts/validate_repo.sh
```

---

## 📝 Scripts Individuais no Windows

### init_repo.sh
```bash
# Git Bash
./scripts/init_repo.sh

# PowerShell
bash ./scripts/init_repo.sh
```

### sync_from_notebooklm.sh
```bash
# Git Bash
./scripts/sync_from_notebooklm.sh

# PowerShell
bash ./scripts/sync_from_notebooklm.sh
```

### validate_repo.sh
```bash
# Git Bash
./scripts/validate_repo.sh

# PowerShell
bash ./scripts/validate_repo.sh
```

### setup_github.sh
```bash
# Git Bash
./scripts/setup_github.sh

# PowerShell
bash ./scripts/setup_github.sh
```

### export_to_pdf.sh

**Requer instalação extra no Windows:**

1. **Instale pandoc:** https://github.com/jgm/pandoc/releases
   - Baixe o `.msi` e instale

2. **Instale wkhtmltopdf:** https://wkhtmltopdf.org/downloads.html
   - Baixe o instalador Windows

3. **Adicione ao PATH:**
   ```powershell
   [Environment]::SetEnvironmentVariable("Path", $env:Path + ";C:\Program Files\wkhtmltopdf\bin", "User")
   ```

4. **Reinicie o Git Bash/PowerShell**

5. **Execute:**
   ```bash
   ./scripts/export_to_pdf.sh
   ```

---

## 🔧 Alternativa: Scripts PowerShell Nativos

Se preferir não usar Git Bash, aqui está o equivalente em PowerShell:

### init_repo.ps1
```powershell
# init_repo.ps1 — Inicialização do Repositório (Windows)

$REPO_NAME = "aprender-react-caderno-tematico"
$AUTHOR_NAME = Read-Host "Seu nome"
$AUTHOR_EMAIL = Read-Host "Seu email"

Write-Host "📁 Criando estrutura de pastas..." -ForegroundColor Blue
New-Item -ItemType Directory -Force -Path @("fontes", "prompts", "cicatrizes", "entregas", "scripts", "estudos", "exports", "backups")

Write-Host "🔧 Inicializando Git..." -ForegroundColor Blue
git init
git config user.name "$AUTHOR_NAME"
git config user.email "$AUTHOR_EMAIL"

Write-Host "📝 Criando arquivos base..." -ForegroundColor Blue
@"
# .gitignore
node_modules/
*.log
.DS_Store
Thumbs.db
.vscode/
.idea/
*.tmp
"@ | Out-File -FilePath ".gitignore" -Encoding utf8

Write-Host "💾 Commit inicial..." -ForegroundColor Blue
git add .
git commit -m "🎉 Initial commit: estrutura base do caderno temático"

Write-Host "✅ Repositório criado!" -ForegroundColor Green
```

Salve como `scripts/init_repo.ps1` e execute:
```powershell
.\scripts\init_repo.ps1
```

---

## 🛠️ Solução de Problemas

### Erro: "bash: ./scripts/install.sh: Permission denied"

**Solução:**
```bash
chmod +x scripts/*.sh
```

Ou no PowerShell:
```powershell
Get-ChildItem scripts/*.sh | ForEach-Object { bash $_.FullName }
```

### Erro: "'git' não é reconhecido como comando"

**Solução:** Reinstale o Git para Windows marcando a opção "Git from the command line and also from 3rd-party software".

### Erro: "pandoc não encontrado" (export_to_pdf.sh)

**Solução:**
1. Baixe o `.msi` de https://github.com/jgm/pandoc/releases
2. Instale e reinicie o terminal
3. Verifique: `pandoc --version`

### Erro: "wkhtmltopdf não encontrado" (export_to_pdf.sh)

**Solução:**
1. Baixe de https://wkhtmltopdf.org/downloads.html
2. Instale em `C:\Program Files\wkhtmltopdf\`
3. Adicione ao PATH do sistema

### Caracteres estranhos no terminal (emojis não aparecem)

**Solução:** Use o Windows Terminal (https://aka.ms/terminal) em vez do cmd.exe ou PowerShell padrão. Ele suporta emojis e cores corretamente.

---

## 📂 Estrutura Final no Windows

```
C:\Users\SeuNome\Projetos\aprender-react-caderno\
├── 📄 README.md
├── 📄 .gitignore
├── 📁 fontes\
│   └── links_fontes_online.md
├── 📁 prompts\
│   ├── prompt_01_roteiro.md
│   ├── prompt_02_useEffect_vs_useLayoutEffect.md
│   └── prompt_03_custom_hooks.md
├── 📁 cicatrizes\
│   ├── cicatriz_01_resposta_generica.md
│   ├── cicatriz_02_explicacao_abstrata.md
│   └── cicatriz_03_abstracao_prematura.md
├── 📁 entregas\
│   ├── resumos_estruturados.md
│   ├── glossario.md
│   └── miniguia_revisao.md
├── 📁 scripts\
│   ├── init_repo.sh
│   ├── sync_from_notebooklm.sh
│   ├── validate_repo.sh
│   ├── setup_github.sh
│   ├── update_react19.sh
│   ├── export_to_pdf.sh
│   ├── daily_study.sh
│   ├── backup.sh
│   ├── install.sh
│   └── README.md
├── 📁 estudos\          (criado pelo daily_study.sh)
├── 📁 exports\           (criado pelo export_to_pdf.sh)
└── 📁 backups\           (criado pelo backup.sh)
```

---

## 🎯 Comando Único (PowerShell)

Copie e cole no PowerShell (como administrador):

```powershell
# 1. Criar pasta
$path = "$env:USERPROFILE\Projetos\aprender-react-caderno"
New-Item -ItemType Directory -Force -Path $path
Set-Location $path

# 2. Extrair ZIP (ajuste o caminho do ZIP)
# Expand-Archive -Path "C:\Downloads\caderno_react_completo.zip" -DestinationPath $path

# 3. Inicializar
bash ./scripts/init_repo.sh

# 4. Validar
bash ./scripts/validate_repo.sh

Write-Host "✅ Caderno instalado em: $path" -ForegroundColor Green
```

---

## 📚 Recursos Adicionais

- **Git para Windows:** https://git-scm.com/download/win
- **Windows Terminal:** https://aka.ms/terminal
- **PowerShell 7:** https://github.com/PowerShell/PowerShell/releases
- **VS Code:** https://code.visualstudio.com/

---

> 📅 **Última atualização:** 05/06/2026
> 🪟 **Compatível com:** Windows 10, Windows 11
