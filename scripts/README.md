# 🛠️ Scripts de Automação

> Scripts Bash para inicializar, sincronizar e validar o repositório do Caderno Temático.

---

## 📋 Scripts Disponíveis

| Script | Descrição | Quando usar |
|--------|-----------|-------------|
| `init_repo.sh` | Cria a estrutura de pastas e inicializa o Git | **Primeira vez** — ao criar o repositório do zero |
| `sync_from_notebooklm.sh` | Guia a transferência de conteúdo do NotebookLM para os arquivos locais | **Durante o estudo** — após gerar respostas no NotebookLM |
| `validate_repo.sh` | Valida se o repositório atende aos critérios de maturidade técnica | **Antes de publicar** — verificação final de qualidade |
| `setup_github.sh` | Configura o remote do GitHub e faz o push inicial | **Ao publicar** — quando estiver pronto para subir ao GitHub |

---

## 🚀 Fluxo de Uso Recomendado

```
┌─────────────────┐     ┌─────────────────┐     ┌─────────────────┐
│  1. init_repo   │────▶│ 2. sync_from_   │────▶│ 3. validate_repo│
│     .sh         │     │   notebooklm.sh │     │     .sh         │
└─────────────────┘     └─────────────────┘     └─────────────────┘
                                                        │
                                                        ▼
                                               ┌─────────────────┐
                                               │ 4. setup_github │
                                               │     .sh         │
                                               └─────────────────┘
```

### Passo a passo

#### 1. Inicializar o repositório
```bash
chmod +x scripts/*.sh
./scripts/init_repo.sh
```
Isso cria a estrutura de pastas, o `.gitignore`, o `README.md` base e faz o commit inicial.

#### 2. Sincronizar com o NotebookLM
```bash
./scripts/sync_from_notebooklm.sh
```
Este script interativo guia você a:
- Adicionar novas fontes
- Criar templates para novos prompts
- Documentar novas cicatrizes (dificuldades)
- Verificar arquivos de entrega

#### 3. Validar maturidade técnica
```bash
./scripts/validate_repo.sh
```
Verifica:
- ✅ Estrutura de pastas completa
- ✅ Mínimo de 3 prompts documentados
- ✅ Mínimo de 3 cicatrizes com troubleshooting
- ✅ Resumos, glossário e miniguia presentes
- ✅ Commits no Git
- ✅ Pontuação mínima de 80%

#### 4. Publicar no GitHub
```bash
./scripts/setup_github.sh
```
Configura o remote e faz o push para o GitHub.

---

## ⚙️ Requisitos

- **Git** instalado (`git --version`)
- **Bash** (Linux/macOS nativo, Windows via WSL ou Git Bash)
- Conta no **GitHub** (para `setup_github.sh`)
- **SSH key** configurada no GitHub (recomendado) ou GitHub CLI

---

## 📝 Convenções de Commit

Os scripts sugerem mensagens de commit no formato:

```
🎉 Initial commit: estrutura base do caderno temático
📝 [descrição da mudança]
✅ Validação de maturidade técnica: [X]% aprovado
```

Para commits manuais, recomendamos:
```
[emoji] [tipo]: [descrição curta]

[corpo opcional com detalhes]
```

**Tipos de commit:**
- 📝 `docs:` — atualização de conteúdo (resumos, glossário)
- 🧠 `prompt:` — novo prompt documentado
- 🩹 `cicatriz:` — nova dificuldade documentada
- 📚 `fonte:` — nova fonte adicionada
- ✨ `feat:` — nova funcionalidade no repositório
- 🐛 `fix:` — correção de erro

---

## 🔧 Personalização

Edite as variáveis no topo de cada script para ajustar:
- `AUTHOR_NAME` e `AUTHOR_EMAIL` (em `init_repo.sh`)
- Nome do repositório
- Estrutura de pastas (adicione/remova conforme necessário)

---

> 📅 **Última atualização:** 05/06/2026
