# validate_repo.ps1 — Validação de Maturidade Técnica (Windows)
# ============================================================
# Uso: .\scripts\validate_repo.ps1
#
# Equivalente ao validate_repo.sh para usuários Windows
# ============================================================

$ErrorActionPreference = "Stop"

$PASS = 0
$FAIL = 0
$WARN = 0

function Write-Success($msg) { Write-Host "  ✓ $msg" -ForegroundColor Green; $script:PASS++ }
function Write-Fail($msg) { Write-Host "  ✗ $msg" -ForegroundColor Red; $script:FAIL++ }
function Write-Warn($msg) { Write-Host "  ⚠ $msg" -ForegroundColor Yellow; $script:WARN++ }

Write-Host "╔════════════════════════════════════════════════════════════╗" -ForegroundColor Green
Write-Host "║  ✅ Validação de Maturidade Técnica                        ║" -ForegroundColor Green
Write-Host "║  Tema: Aprender a Programar em React                       ║" -ForegroundColor Green
Write-Host "╚════════════════════════════════════════════════════════════╝" -ForegroundColor Green
Write-Host ""

# -----------------------------------------------------------
# 1. ESTRUTURA DE PASTAS
# -----------------------------------------------------------
Write-Host "📁 1. Estrutura de Pastas" -ForegroundColor Blue

$required_dirs = @("fontes", "prompts", "cicatrizes", "entregas")
foreach ($dir in $required_dirs) {
    if (Test-Path $dir -PathType Container) {
        $count = (Get-ChildItem $dir -File -Recurse).Count
        Write-Success "$dir/ ($count arquivos)"
    } else {
        Write-Fail "$dir/ (não encontrada)"
    }
}
Write-Host ""

# -----------------------------------------------------------
# 2. ARQUIVOS OBRIGATÓRIOS
# -----------------------------------------------------------
Write-Host "📄 2. Arquivos Obrigatórios" -ForegroundColor Blue

$required_files = @{
    "README.md" = "README principal"
    ".gitignore" = "Arquivo .gitignore"
    "fontes/links_fontes_online.md" = "Links das fontes curadas"
    "entregas/resumos_estruturados.md" = "Resumos estruturados"
    "entregas/glossario.md" = "Glossário de conceitos"
    "entregas/miniguia_revisao.md" = "Miniguia de revisão"
}

foreach ($file in $required_files.Keys) {
    if (Test-Path $file -PathType Leaf) {
        $size = (Get-Item $file).Length
        Write-Success "$($required_files[$file]) ($size bytes)"
    } else {
        Write-Fail "$($required_files[$file]) (não encontrado)"
    }
}
Write-Host ""

# -----------------------------------------------------------
# 3. PROMPTS DOCUMENTADOS
# -----------------------------------------------------------
Write-Host "🧠 3. Prompts Documentados" -ForegroundColor Blue

$prompts = Get-ChildItem "prompts" -Filter "prompt_*.md" -File -ErrorAction SilentlyContinue
$prompt_count = $prompts.Count

if ($prompt_count -ge 3) {
    Write-Success "Mínimo de 3 prompts documentados ($prompt_count encontrados)"
} else {
    Write-Fail "Mínimo de 3 prompts documentados ($prompt_count encontrados, mínimo: 3)"
}

foreach ($prompt in $prompts) {
    $content = Get-Content $prompt.FullName -Raw
    if ($content -match "v1\.0" -and $content -match "v2\.0") {
        Write-Success "$($prompt.Name) — evolução de versões detectada"
    } else {
        Write-Warn "$($prompt.Name) — evolução de versões não detectada"
    }
}
Write-Host ""

# -----------------------------------------------------------
# 4. CICATRIZES DOCUMENTADAS
# -----------------------------------------------------------
Write-Host "🩹 4. Cicatrizes (Troubleshooting)" -ForegroundColor Blue

$cicatrizes = Get-ChildItem "cicatrizes" -Filter "cicatriz_*.md" -File -ErrorAction SilentlyContinue
$cicatriz_count = $cicatrizes.Count

if ($cicatriz_count -ge 3) {
    Write-Success "Mínimo de 3 cicatrizes documentadas ($cicatriz_count encontradas)"
} else {
    Write-Fail "Mínimo de 3 cicatrizes documentadas ($cicatriz_count encontradas, mínimo: 3)"
}

foreach ($cicatriz in $cicatrizes) {
    $content = Get-Content $cicatriz.FullName -Raw
    $has_problema = $content -match "Problema"
    $has_solucao = $content -match "Solução"
    $has_aprendizado = $content -match "Aprendizado"

    if ($has_problema -and $has_solucao -and $has_aprendizado) {
        Write-Success "$($cicatriz.Name) — estrutura completa"
    } else {
        Write-Warn "$($cicatriz.Name) — estrutura incompleta"
    }
}
Write-Host ""

# -----------------------------------------------------------
# 5. CONTEÚDO DOS ARQUIVOS
# -----------------------------------------------------------
Write-Host "📖 5. Conteúdo dos Arquivos" -ForegroundColor Blue

$content_checks = @(
    @{ File = "README.md"; Pattern = "Contexto e Objetivos"; Desc = "Seção de contexto no README" },
    @{ File = "README.md"; Pattern = "Curadoria de Fontes"; Desc = "Seção de fontes no README" },
    @{ File = "README.md"; Pattern = "Engenharia de Prompts"; Desc = "Seção de prompts no README" },
    @{ File = "README.md"; Pattern = "Miniguia de Estudo"; Desc = "Seção de entregas no README" },
    @{ File = "entregas/glossario.md"; Pattern = "\|"; Desc = "Tabela de glossário" },
    @{ File = "entregas/miniguia_revisao.md"; Pattern = "Prompt"; Desc = "Prompts reutilizáveis no miniguia" },
    @{ File = "entregas/resumos_estruturados.md"; Pattern = "Pontos-chave"; Desc = "Pontos-chave nos resumos" }
)

foreach ($check in $content_checks) {
    if (Test-Path $check.File -PathType Leaf) {
        $content = Get-Content $check.File -Raw
        if ($content -match $check.Pattern) {
            Write-Success $check.Desc
        } else {
            Write-Warn "$($check.Desc) (não detectado)"
        }
    } else {
        Write-Warn "$($check.Desc) (arquivo não encontrado)"
    }
}
Write-Host ""

# -----------------------------------------------------------
# 6. GIT
# -----------------------------------------------------------
Write-Host "🔧 6. Controle de Versão (Git)" -ForegroundColor Blue

if (Test-Path ".git" -PathType Container) {
    Write-Success "Repositório Git inicializado"

    $commit_count = (git rev-list --count HEAD 2>$null) -as [int]
    if ($commit_count -gt 0) {
        Write-Success "Commits realizados: $commit_count"
    } else {
        Write-Warn "Nenhum commit encontrado"
    }

    $remotes = git remote -v 2>$null
    if ($remotes) {
        Write-Success "Remote configurado"
    } else {
        Write-Warn "Nenhum remote configurado (adicione no GitHub)"
    }
} else {
    Write-Fail "Repositório Git não inicializado"
    Write-Host "     Execute: git init" -ForegroundColor Yellow
}
Write-Host ""

# -----------------------------------------------------------
# 7. RESUMO
# -----------------------------------------------------------
Write-Host "════════════════════════════════════════════════════════════" -ForegroundColor Blue
Write-Host "  RESULTADO DA VALIDAÇÃO" -ForegroundColor Blue
Write-Host "════════════════════════════════════════════════════════════" -ForegroundColor Blue
Write-Host ""
Write-Host "  ✅ Aprovados: $PASS" -ForegroundColor Green
Write-Host "  ⚠️  Alertas:  $WARN" -ForegroundColor Yellow
Write-Host "  ❌ Falhas:   $FAIL" -ForegroundColor Red
Write-Host ""

$TOTAL = $PASS + $WARN + $FAIL
if ($TOTAL -gt 0) {
    $SCORE = [math]::Round(($PASS / $TOTAL) * 100)
    Write-Host "  📊 Pontuação: $SCORE%" -ForegroundColor White
}
Write-Host ""

if ($FAIL -eq 0 -and $SCORE -ge 80) {
    Write-Host "╔════════════════════════════════════════════════════════════╗" -ForegroundColor Green
    Write-Host "║  🎉 REPOSITÓRIO APROVADO!                                   ║" -ForegroundColor Green
    Write-Host "║  Maturidade técnica demonstrada. Pronto para exibição.    ║" -ForegroundColor Green
    Write-Host "╚════════════════════════════════════════════════════════════╝" -ForegroundColor Green
} elseif ($FAIL -eq 0) {
    Write-Host "╔════════════════════════════════════════════════════════════╗" -ForegroundColor Yellow
    Write-Host "║  ✅ REPOSITÓRIO APROVADO COM ALERTAS                      ║" -ForegroundColor Yellow
    Write-Host "║  Revise os alertas para melhorar ainda mais.              ║" -ForegroundColor Yellow
    Write-Host "╚════════════════════════════════════════════════════════════╝" -ForegroundColor Yellow
} else {
    Write-Host "╔════════════════════════════════════════════════════════════╗" -ForegroundColor Red
    Write-Host "║  ❌ REPOSITÓRIO NÃO APROVADO                              ║" -ForegroundColor Red
    Write-Host "║  Corrija as falhas obrigatórias antes de exibir.          ║" -ForegroundColor Red
    Write-Host "╚════════════════════════════════════════════════════════════╝" -ForegroundColor Red
}
Write-Host ""
