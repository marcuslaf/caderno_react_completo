# sync_from_notebooklm.ps1 — Sincroniza Conteúdo do NotebookLM (Windows)
# ============================================================
# Uso: .\scripts\sync_from_notebooklm.ps1
#
# Equivalente ao sync_from_notebooklm.sh para usuários Windows
# ============================================================

$ErrorActionPreference = "Stop"

function Read-YesNo($prompt) {
    do {
        $response = Read-Host "$prompt (s/n)"
    } while ($response -notmatch '^[sn]$')
    return $response -eq 's'
}

Write-Host "╔════════════════════════════════════════════════════════════╗" -ForegroundColor Green
Write-Host "║  🔄 Sincronização: NotebookLM → Repositório Local           ║" -ForegroundColor Green
Write-Host "╚════════════════════════════════════════════════════════════╝" -ForegroundColor Green
Write-Host ""

# -----------------------------------------------------------
# 1. VERIFICAR ESTRUTURA
# -----------------------------------------------------------
Write-Host "🔍 Verificando estrutura do repositório..." -ForegroundColor Blue

$required_dirs = @("fontes", "prompts", "cicatrizes", "entregas")
$missing = $false
foreach ($dir in $required_dirs) {
    if (-not (Test-Path $dir -PathType Container)) {
        Write-Host "  ✗ Pasta $dir/ não encontrada" -ForegroundColor Red
        $missing = $true
    }
}

if ($missing) {
    Write-Host ""
    Write-Host "❌ Estrutura incompleta. Execute init_repo.ps1 primeiro." -ForegroundColor Red
    exit 1
}
Write-Host "  ✓ Estrutura OK" -ForegroundColor Green
Write-Host ""

# -----------------------------------------------------------
# 2. SINCRONIZAR FONTES
# -----------------------------------------------------------
Write-Host "📚 [1/4] Sincronizando Fontes..." -ForegroundColor Blue

if (Read-YesNo "Você já fez upload das fontes no NotebookLM?") {
    Write-Host "  ℹ️ Certifique-se de que os links estão em fontes\links_fontes_online.md" -ForegroundColor Yellow

    if (Read-YesNo "Deseja adicionar uma nova fonte agora?") {
        $fonte_nome = Read-Host "   Nome da fonte"
        $fonte_tipo = Read-Host "   Tipo (PDF/Artigo/Livro)"
        $fonte_link = Read-Host "   Link"
        $fonte_just = Read-Host "   Justificativa da escolha"

        $year = Get-Date -Format "yyyy"
        "| $year | $fonte_nome | $fonte_tipo | $fonte_link | ✅ Sim | $fonte_just |" | Add-Content "fontes\links_fontes_online.md"
        Write-Host "  ✓ Fonte adicionada" -ForegroundColor Green
    }
} else {
    Write-Host "  ⚠️ Faça o upload das fontes no NotebookLM antes de continuar" -ForegroundColor Yellow
}
Write-Host ""

# -----------------------------------------------------------
# 3. SINCRONIZAR PROMPTS
# -----------------------------------------------------------
Write-Host "🧠 [2/4] Sincronizando Prompts..." -ForegroundColor Blue

if (Read-YesNo "Deseja adicionar um novo prompt documentado?") {
    $prompt_num = Read-Host "   Número do prompt (ex: 04)"
    $prompt_titulo = Read-Host "   Título/objetivo do prompt"

    $safe_title = $prompt_titulo -replace '\s+', '_' -replace '[^\w]', '' -replace '_+', '_' -replace '^_|_$', ''
    $filename = "prompts\prompt_$($prompt_num)_$safe_title.md"

    @"
# Prompt $prompt_num — $prompt_titulo

## 📝 Versão do Prompt Testada
```text
[Insira aqui o prompt exatamente como foi digitado no NotebookLM]
```

## 🤖 Resposta Obtida (Resumida)
```text
[Resumo da resposta gerada pela IA]
```

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
"@ | Out-File -FilePath $filename -Encoding utf8

    Write-Host "  ✓ Template de prompt criado: $filename" -ForegroundColor Green
    Write-Host "  ℹ️ Edite o arquivo e preencha com o conteúdo do NotebookLM" -ForegroundColor Yellow
}
Write-Host ""

# -----------------------------------------------------------
# 4. SINCRONIZAR CICATRIZES
# -----------------------------------------------------------
Write-Host "🩹 [3/4] Sincronizando Cicatrizes..." -ForegroundColor Blue

if (Read-YesNo "Deseja documentar uma nova dificuldade (cicatriz)?") {
    $cic_num = Read-Host "   Número da cicatriz (ex: 04)"
    $cic_titulo = Read-Host "   Título do problema"
    $cic_prompt = Read-Host "   Prompt afetado"

    $safe_title = $cic_titulo -replace '\s+', '_' -replace '[^\w]', '' -replace '_+', '_' -replace '^_|_$', ''
    $filename = "cicatrizes\cicatriz_$($cic_num)_$safe_title.md"

    $date = Get-Date -Format "dd/MM/yyyy"
    @"
# Cicatriz $cic_num — $cic_titulo

## 🔬 Prompt Afetado
$cic_prompt

## 📝 Versão do Prompt que Causou o Problema
```text
[Insira o prompt problemático]
```

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
> 📅 **Data:** $date
"@ | Out-File -FilePath $filename -Encoding utf8

    Write-Host "  ✓ Template de cicatriz criado: $filename" -ForegroundColor Green
}
Write-Host ""

# -----------------------------------------------------------
# 5. SINCRONIZAR ENTREGAS
# -----------------------------------------------------------
Write-Host "📖 [4/4] Sincronizando Entregas..." -ForegroundColor Blue

Write-Host "  ℹ️ Arquivos de entrega (resumos, glossário, miniguia) devem ser" -ForegroundColor Yellow
Write-Host "     editados manualmente com base nas respostas do NotebookLM" -ForegroundColor Yellow
Write-Host ""

if (Read-YesNo "Deseja verificar se os arquivos de entrega existem?") {
    $files = @("entregas\resumos_estruturados.md", "entregas\glossario.md", "entregas\miniguia_revisao.md")
    foreach ($file in $files) {
        if (Test-Path $file -PathType Leaf) {
            Write-Host "  ✓ $file existe" -ForegroundColor Green
        } else {
            Write-Host "  ✗ $file não encontrado" -ForegroundColor Red
        }
    }
}
Write-Host ""

# -----------------------------------------------------------
# 6. GIT STATUS E COMMIT
# -----------------------------------------------------------
Write-Host "💾 Verificando mudanças no Git..." -ForegroundColor Blue

git add -A

$diff = git diff --cached --quiet
if ($LASTEXITCODE -eq 0) {
    Write-Host "  ℹ️ Nenhuma mudança para commitar" -ForegroundColor Yellow
} else {
    Write-Host "  ✓ Mudanças detectadas" -ForegroundColor Green
    git status --short
    Write-Host ""

    if (Read-YesNo "Deseja fazer commit das mudanças?") {
        $commit_msg = Read-Host "   Mensagem do commit"
        git commit -m "📝 $commit_msg"
        Write-Host "  ✓ Commit realizado: $commit_msg" -ForegroundColor Green
    }
}
Write-Host ""

# -----------------------------------------------------------
# 7. RESUMO
# -----------------------------------------------------------
Write-Host "╔════════════════════════════════════════════════════════════╗" -ForegroundColor Green
Write-Host "║  ✅ Sincronização concluída!                               ║" -ForegroundColor Green
Write-Host "╚════════════════════════════════════════════════════════════╝" -ForegroundColor Green
Write-Host ""
Write-Host "Lembre-se de:" -ForegroundColor Yellow
Write-Host "  • Copiar respostas do NotebookLM para os arquivos de prompts"
Write-Host "  • Atualizar resumos e glossário com novos aprendizados"
Write-Host "  • Documentar novas cicatrizes sempre que encontrar dificuldades"
Write-Host "  • Fazer commits frequentes com mensagens descritivas"
Write-Host ""
