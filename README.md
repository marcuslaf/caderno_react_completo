# ⚛️ Aprender a Programar em React — Caderno Temático

> Repositório de estudo estruturado com curadoria de fontes, engenharia de prompts e miniguia de revisão.
> **Ferramenta utilizada:** NotebookLM (Google)

---

## 📌 Índice

1. [Contexto e Objetivos](#-1-contexto-e-objetivos)
2. [Curadoria de Fontes](#-2-curadoria-de-fontes)
3. [Engenharia de Prompts & Cicatrizes](#-3-engenharia-de-prompts--cicatrizes)
4. [Miniguia de Estudo (Entrega Final)](#-4-miniguia-de-estudo-entrega-final)
5. [Scripts de Automação](#-5-scripts-de-automação)
6. [Instalação Rápida](#-6-instalação-rápida)
7. [Estrutura de Arquivos](#-7-estrutura-de-arquivos)
8. [Checklist de Maturidade Técnica](#-8-checklist-de-maturidade-técnica)

---

## 📌 1. Contexto e Objetivos

### Assunto de Interesse
Aprender a programar em **React**, a biblioteca JavaScript mantida pela Meta (Facebook) e comunidade, utilizada para construir interfaces de usuário baseadas em componentes. O foco é o aprendizado do zero ao nível intermediário, priorizando componentes funcionais e Hooks (abordagem moderna recomendada pela documentação oficial desde 2023).

### Motivação
React é uma das tecnologias web mais utilizadas no mercado segundo a Stack Overflow Developer Survey 2025. Dominar React abre portas para desenvolvimento front-end, mobile (React Native) e full-stack (Next.js, Remix). Como desenvolvedor em formação, preciso consolidar uma base sólida antes de avançar para frameworks e arquiteturas mais complexas.

### Objetivos de Estudo
| Objetivo | Descrição | Status |
|----------|-----------|--------|
| OE1 | Compreender JSX, componentes funcionais, props e state | ✅ Concluído |
| OE2 | Dominar os Hooks fundamentais (useState, useEffect, useContext) | ✅ Concluído |
| OE3 | Entender o fluxo de dados unidirecional e gerenciamento de estado | 🔄 Em andamento |
| OE4 | Diferenciar useEffect de useLayoutEffect e dominar cleanup | 🔄 Em andamento |
| OE5 | Criar Custom Hooks reutilizáveis com boas práticas | ⏳ Pendente |

### Público-alvo deste caderno
- Eu mesmo em revisões futuras antes de entrevistas técnicas
- Colegas iniciantes em desenvolvimento front-end
- Qualquer pessoa migrando de componentes de classe para Hooks

---

## 📚 2. Curadoria de Fontes

> **Critérios de seleção:**
> 1. **Autoridade:** Preferência pela documentação oficial (react.dev) e fontes da comunidade com alta reputação (freeCodeCamp, Smashing Magazine, LogRocket).
> 2. **Atualidade:** Foco em conteúdo que reflita a mudança da documentação oficial para react.dev (2023) e a adoção de Hooks como padrão.
> 3. **Acessibilidade:** Fontes 100% gratuitas e de acesso aberto.
> 4. **Complementaridade:** Cobertura de teoria (docs), prática (tutoriais interativos) e padrões avançados (best practices).

| # | Fonte | Tipo | Link | Upload no NotebookLM | Resumo da Escolha |
|---|-------|------|------|----------------------|-------------------|
| 1 | **React Official Documentation (react.dev)** | Site / Docs Oficiais | https://react.dev/learn | ✅ Sim | Fonte primária e definitiva. Reescrita em 2023 para focar em componentes funcionais e Hooks. Contém 600+ exemplos interativos. |
| 2 | **freeCodeCamp — The React Handbook** | Artigo / E-book (PDF disponível) | https://www.freecodecamp.org/news/the-react-handbook-b71c27b0a795/ | ✅ Sim | Guia completo para iniciantes com linguagem acessível. Disponível em PDF, ePub e Mobi. Cobre JSX, props, state, lifecycle e hooks. |
| 3 | **LogRocket — React Hooks Cheat Sheet** | Artigo Técnico | https://blog.logrocket.com/react-hooks-cheat-sheet-solutions-common-problems/ | ✅ Sim | Referência prática com exemplos de código para cada Hook nativo. Excelente para troubleshooting e revisão rápida. |
| 4 | **Smashing Magazine — Best Practices With React Hooks** | Artigo Técnico | https://www.smashingmagazine.com/2020/04/react-hooks-best-practices/ | ✅ Sim | Artigo de referência sobre as Regras dos Hooks, otimização de useEffect e organização de código. Autoridade consolidada em front-end. |
| 5 | **Dev.to — Mastering Custom React Hooks** | Artigo Técnico | https://dev.to/austinwdigital/mastering-custom-react-hooks-best-practices-for-clean-scalable-code-40b1 | ✅ Sim | Guia prático sobre criação de Custom Hooks com convenções de nomenclatura, estrutura de arquivos e casos de uso reais. |

### Notas sobre acessibilidade das fontes
- [x] Todas as fontes são de acesso aberto (open access)
- [ ] freeCodeCamp oferece PDF via reacthandbook.com — link externo verificado
- [ ] LogRocket e Smashing Magazine são gratuitos com possíveis paywalls leves (não identificados nos testes)

---

## 🧠 3. Engenharia de Prompts & "Cicatrizes" (Troubleshooting)

> **Metodologia:** Cada prompt foi testado iterativamente no NotebookLM com as 5 fontes carregadas. Documentamos o raciocínio por trás dos ajustes.

### Prompts Documentados

| # | Prompt | Objetivo | Classificação |
|---|--------|----------|---------------|
| 01 | [Roteiro de Aprendizado](prompts/prompt_01_roteiro.md) | Mapeamento inicial do ecossistema React | 🥇 Ouro |
| 02 | [useEffect vs. useLayoutEffect](prompts/prompt_02_useEffect_vs_useLayoutEffect.md) | Comparação técnica com timeline visual | 🥈 Ouro |
| 03 | [Custom Hooks](prompts/prompt_03_custom_hooks.md) | Quando e como criar hooks reutilizáveis | 🥉 Ouro |

### Cicatrizes (Troubleshooting)

| # | Cicatriz | Prompt Afetado | Lição Principal |
|---|----------|----------------|-----------------|
| 01 | [Resposta Genérica e Desatualizada](cicatrizes/cicatriz_01_resposta_generica.md) | Prompt 01 | Prompts genéricos sobre tecnologias em evolução geram respostas desatualizadas |
| 02 | [Explicação Abstrata sem Cenário Prático](cicatrizes/cicatriz_02_explicacao_abstrata.md) | Prompt 02 | Diferenças técnicas sutis precisam de cenários práticos e consequências visuais |
| 03 | [Abstração Prematura de Custom Hooks](cicatrizes/cicatriz_03_abstracao_prematura.md) | Prompt 03 | Sempre pergunte "quando NÃO fazer" além de "como fazer" |

---

## 📖 4. Miniguia de Estudo (Entrega Final)

### 4.1 Resumos Estruturados

Veja [`entregas/resumos_estruturados.md`](entregas/resumos_estruturados.md)

**Tópicos cobertos:**
1. JSX e Componentes Funcionais
2. Hooks Fundamentais (useState, useEffect, useContext)
3. Fluxo de Dados e Gerenciamento de Estado
4. Custom Hooks e Boas Práticas
5. Renderização e Performance (Conceitos Iniciais)

### 4.2 Glossário de Conceitos

Veja [`entregas/glossario.md`](entregas/glossario.md)

**20 termos técnicos definidos**, organizados por categoria:
- Fundamentos (JSX, Componente Funcional, Props, State)
- Hooks Nativos (useState, useEffect, useLayoutEffect, useContext, useMemo, useCallback)
- Padrões e Arquitetura (Regra dos Hooks, Lifting State Up, Prop Drilling, Custom Hook)
- Performance (Virtual DOM, Re-render, React.memo)

### 4.3 Prompts Reutilizáveis para Revisão

Veja [`entregas/miniguia_revisao.md`](entregas/miniguia_revisao.md)

**10 prompts prontos** para uso futuro, com placeholders ajustáveis:
1. Revisão Rápida — Roteiro Estruturado
2. Comparação Técnica com Timeline
3. Extração de Padrão / Custom Hook
4. Troubleshooting / Erros Comuns
5. Mapa Conceitual / Diagrama
6. Atualização / Tendências
7. Code Review Simulado
8. Criação de Exercício Prático
9. Glossário Automático
10. Preparação para Entrevista Técnica

---

## 🛠️ 5. Scripts de Automação

> Suite completa de scripts Bash e PowerShell para gerenciar o ciclo de vida do caderno.

| Script | Plataforma | Descrição |
|--------|------------|-----------|
| [`install.sh`](scripts/install.sh) / [`install.ps1`](scripts/install.ps1) | Bash / PowerShell | Instalador único — executa toda a configuração inicial |
| [`init_repo.sh`](scripts/init_repo.sh) / [`init_repo.ps1`](scripts/init_repo.ps1) | Bash / PowerShell | Cria estrutura de pastas e inicializa o Git |
| [`sync_from_notebooklm.sh`](scripts/sync_from_notebooklm.sh) / [`sync_from_notebooklm.ps1`](scripts/sync_from_notebooklm.ps1) | Bash / PowerShell | Guia interativo para transferir conteúdo do NotebookLM |
| [`validate_repo.sh`](scripts/validate_repo.sh) / [`validate_repo.ps1`](scripts/validate_repo.ps1) | Bash / PowerShell | Valida critérios de maturidade técnica (pontuação automática) |
| [`setup_github.sh`](scripts/setup_github.sh) | Bash | Configura remote do GitHub e faz push inicial |
| [`update_react19.sh`](scripts/update_react19.sh) | Bash | Atualiza o caderno com novidades do React 19 |
| [`export_to_pdf.sh`](scripts/export_to_pdf.sh) | Bash | Exporta todo o caderno para PDF e HTML |
| [`daily_study.sh`](scripts/daily_study.sh) | Bash | Rotina diária de estudo com Pomodoro e log |
| [`backup.sh`](scripts/backup.sh) | Bash | Cria backup compactado do repositório |

### Fluxo de Uso Recomendado

```
┌─────────────────┐     ┌─────────────────┐     ┌─────────────────┐
│  1. install     │────▶│ 2. sync_from_   │────▶│ 3. validate_repo│
│     .sh/.ps1    │     │   notebooklm    │     │     .sh/.ps1    │
└─────────────────┘     └─────────────────┘     └─────────────────┘
                                                        │
                                                        ▼
                                               ┌─────────────────┐
                                               │ 4. setup_github │
                                               │     .sh         │
                                               └─────────────────┘
```

---

## 🚀 6. Instalação Rápida

### Linux / macOS (Git Bash)

```bash
# 1. Extraia o ZIP e entre na pasta
cd aprender-react-caderno-tematico

# 2. Torne os scripts executáveis
chmod +x scripts/*.sh

# 3. Execute o instalador
./scripts/install.sh
```

### Windows (PowerShell)

```powershell
# 1. Extraia o ZIP e entre na pasta
cd C:\Users\SeuNome\Projetos\aprender-react-caderno-tematico

# 2. Execute via Git Bash (incluído no Git for Windows)
bash ./scripts/install.sh

# Ou use os scripts PowerShell nativos
.\scripts\init_repo.ps1
.\scripts\validate_repo.ps1
```

> 📖 Veja o [Guia Completo para Windows](GUIA_WINDOWS.md) para instruções detalhadas.

---

## 📂 7. Estrutura de Arquivos

```
aprender-react-caderno-tematico/
├── 📄 README.md                              ← Este arquivo
├── 📄 .gitignore
├── 📄 GUIA_WINDOWS.md                        ← Guia de instalação Windows
│
├── 📁 fontes/
│   └── links_fontes_online.md                ← Links das 5 fontes curadas
│
├── 📁 prompts/
│   ├── prompt_01_roteiro.md                ← Mapeamento do ecossistema
│   ├── prompt_02_useEffect_vs_useLayoutEffect.md  ← Comparação com timeline
│   └── prompt_03_custom_hooks.md           ← Quando e como criar hooks
│
├── 📁 cicatrizes/
│   ├── cicatriz_01_resposta_generica.md      ← CRA desatualizado
│   ├── cicatriz_02_explicacao_abstrata.md    ← "antes do paint" sem contexto
│   └── cicatriz_03_abstracao_prematura.md    ← Hook sem critérios de decisão
│
├── 📁 entregas/
│   ├── resumos_estruturados.md              ← 5 tópicos com pontos-chave
│   ├── glossario.md                         ← 20 termos técnicos definidos
│   └── miniguia_revisao.md                  ← 10 prompts reutilizáveis
│
├── 📁 scripts/
│   ├── install.sh / install.ps1             ← Instalador único
│   ├── init_repo.sh / init_repo.ps1       ← Inicialização
│   ├── sync_from_notebooklm.sh / .ps1     ← Sincronização
│   ├── validate_repo.sh / validate_repo.ps1  ← Validação
│   ├── setup_github.sh                    ← Publicação GitHub
│   ├── update_react19.sh                  ← Atualização React 19
│   ├── export_to_pdf.sh                   ← Exportação PDF/HTML
│   ├── daily_study.sh                     ← Rotina diária
│   ├── backup.sh                          ← Backup
│   └── README.md                          ← Documentação dos scripts
│
├── 📁 estudos/              ← Criado por daily_study.sh
├── 📁 exports/              ← Criado por export_to_pdf.sh
└── 📁 backups/              ← Criado por backup.sh
```

---

## ✅ 8. Checklist de Maturidade Técnica

Antes de considerar este repositório "pronto para exibição", verifique:

- [x] README com contexto claro e objetivos mensuráveis
- [x] 5 fontes curadas, com justificativa de seleção
- [x] Todos os uploads no NotebookLM documentados
- [x] Mínimo 3 prompts documentados com evolução de versões
- [x] "Cicatrizes" registradas com troubleshooting real (problema → causa → solução → resultado)
- [x] Resumos estruturados com pontos-chave e relações entre tópicos
- [x] Glossário com 20 termos técnicos definidos
- [x] Prompts reutilizáveis testados e validados
- [x] Repositório com estrutura de pastas organizada
- [x] Scripts de automação para Linux/macOS e Windows
- [x] Guia de instalação para Windows
- [ ] Commits com mensagens descritivas (se usar Git)
- [ ] Publicado no GitHub (opcional, mas recomendado)

> 💡 Execute `./scripts/validate_repo.sh` (ou `.\scripts\validate_repo.ps1` no Windows) para validação automática.

---

## 📜 Licença

Este caderno temático é disponibilizado sob licença **CC BY-SA 4.0**.
Você pode compartilhar e adaptar, desde que atribua a autoria e mantenha a mesma licença.

---

> ✍️ **Autor:** [Seu nome]
> 📅 **Última atualização:** 05/06/2026
> 🔄 **Versão:** 1.0
> 🛠️ **Stack:** React 19.x | TypeScript | NotebookLM
> 🪟 **Compatível com:** Linux, macOS, Windows (Git Bash / PowerShell)
