# ⚛️ Aprender a Programar em React — Caderno Temático

> Repositório de estudo estruturado com curadoria de fontes, engenharia de prompts e miniguia de revisão.
> **Ferramenta utilizada:** NotebookLM (Google)

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

---

### 🔬 Prompt 1 — Mapeamento Inicial do Ecossistema React

#### 📝 Versão do Prompt Testada (v1.0)
```text
Resuma como aprender React do zero.
```

#### 🤖 Resposta Obtida (v1.0)
Resposta genérica demais: citou "instalar Node.js", "usar create-react-app" e listou conceitos sem priorização. Não aproveitou as fontes carregadas de forma específica.

#### ⚠️ Dificuldade / "Cicatriz" 1
| Problema | Causa Provável | Solução Testada | Resultado |
|----------|---------------|-----------------|-----------|
| Resposta genérica e desatualizada (citou CRA) | Prompt sem contexto de fontes nem restrição temporal | Adicionei: "Com base nas fontes carregadas, priorizando a documentação oficial react.dev" | Resposta passou a citar seções específicas do react.dev e mencionou que CRA foi removido das recomendações oficiais |

#### 📝 Versão do Prompt Testada (v2.0 — Final)
```text
Com base nas fontes carregadas no NotebookLM (especialmente react.dev e freeCodeCamp), estruture um roteiro de aprendizado de React para iniciantes. 
O roteiro deve:
1. Seguir a ordem recomendada pela documentação oficial atual (react.dev)
2. Diferenciar o que é essencial (must-know) do que é avançado (nice-to-have)
3. Indicar, para cada tópico, qual fonte é a melhor para aprofundamento
4. Alertar sobre práticas desatualizadas (ex: Create React App) que aparecem em tutoriais antigos
```

#### 🤖 Resposta Obtida (v2.0)
Roteiro estruturado em 4 fases: (1) Quick Start / JSX, (2) Interatividade / State, (3) Gerenciamento de Estado, (4) Hooks Avançados. Citou corretamente a remoção do CRA e a recomendação de Vite/Next.js. Referenciou seções específicas do react.dev como "Thinking in React" e "Managing State".

#### 🔍 Referências citadas pela IA
- react.dev — Quick Start, Thinking in React, Managing State
- freeCodeCamp — The React Handbook (seções de JSX e Props)

---

### 🔬 Prompt 2 — Comparação useEffect vs. useLayoutEffect

#### 📝 Versão do Prompt Testada (v1.0)
```text
Qual a diferença entre useEffect e useLayoutEffect?
```

#### 🤖 Resposta Obtida (v1.0)
Resposta técnica correta, mas abstrata: "useLayoutEffect dispara antes do paint". Difícil de visualizar quando isso importa na prática.

#### ⚠️ Dificuldade / "Cicatriz" 2
| Problema | Causa Provável | Solução Testada | Resultado |
|----------|---------------|-----------------|-----------|
| Explicação abstrata, sem cenário de aplicação | Prompt pediu definição, não aplicação prática | Adicionei: "...com exemplos de código de quando usar um vs. outro, e um caso onde usar o errado causa flicker visual" | Resposta trouxe exemplo de medição de DOM e animação, com código comparativo e explicação do flicker |

#### 📝 Versão do Prompt Testada (v2.0 — Final)
```text
Com base nas fontes carregadas (especialmente LogRocket e react.dev), explique a diferença entre useEffect e useLayoutEffect.
Inclua:
1. A ordem de execução no ciclo de renderização (timeline visual)
2. Um exemplo de código de useLayoutEffect para evitar flicker em animação de layout
3. Uma tabela de "quando usar qual" com critérios práticos
4. A recomendação oficial do React team sobre qual usar por padrão
```

#### 🤖 Resposta Obtida (v2.0)
Timeline clara: render → useLayoutEffect (síncrono, antes do paint) → paint → useEffect (assíncrono, depois do paint). Exemplo de código com medição de ref e ajuste de posicionamento. Tabela comparativa. Recomendação: "use useEffect por padrão; useLayoutEffect apenas para medições/ajustes síncronos do DOM".

#### 🔍 Referências citadas pela IA
- react.dev — Referência de API (useLayoutEffect)
- LogRocket — React Hooks Cheat Sheet (seção useLayoutEffect)
- Smashing Magazine — Best Practices (seção de Hooks)

---

### 🔬 Prompt 3 — Custom Hooks: Quando e Como Criar

#### 📝 Versão do Prompt Testada (v1.0)
```text
Como criar um custom hook em React?
```

#### 🤖 Resposta Obtida (v1.0)
Resposta técnica correta (prefixar com "use", chamar outros hooks), mas sem orientação sobre **quando** abstrair vs. deixar no componente. Risco de incentivar abstração prematura.

#### ⚠️ Dificuldade / "Cicatriz" 3
| Problema | Causa Provável | Solução Testada | Resultado |
|----------|---------------|-----------------|-----------|
| Resposta incentivou abstração prematura | Prompt não questionou critérios de extração | Adicionei: "...e liste 3 critérios para decidir SE vale a pena extrair um custom hook, além de 2 anti-padrões comuns" | Resposta trouxe checklist de decisão (reuso? lógica de lifecycle? melhora testabilidade?) e anti-padrões (hook usado só uma vez; hook sem lógica de lifecycle) |

#### 📝 Versão do Prompt Testada (v2.0 — Final)
```text
Com base nas fontes carregadas (especialmente Dev.to e react.dev), explique:
1. A estrutura mínima de um custom hook válido (regras de nomenclatura e hooks internos)
2. Um exemplo completo de useLocalStorage<T> com TypeScript
3. Uma checklist de 3 perguntas para decidir SE extrair um custom hook
4. Dois anti-padrões comuns e como evitá-los
5. A convenção de organização por domínio (features/) vs. por tipo (hooks/)
```

#### 🤖 Resposta Obtida (v2.0)
Estrutura mínima validada: prefixo "use", chamada de hooks no topo, retorno de valores/ funções. Exemplo `useLocalStorage<T>` completo com generics. Checklist: (1) lógica repetida? (2) envolve hooks do React? (3) melhora legibilidade/testabilidade? Anti-padrões: extração prematura e hooks sem lifecycle. Organização: preferir `features/auth/useAuth.ts` a `hooks/useAuth.ts`.

#### 🔍 Referências citadas pela IA
- Dev.to — Mastering Custom React Hooks (seções de naming, file structure, when NOT to use)
- react.dev — Building Your Own Hooks
- Smashing Magazine — Regras de Hooks

---

### 🏆 Prompts Ouro (Top Performers)

| Ranking | Prompt | Contexto de Uso |
|---------|--------|-----------------|
| 🥇 | `Com base nas fontes carregadas no NotebookLM (especialmente react.dev e freeCodeCamp), estruture um roteiro de aprendizado de React para iniciantes...` | Planejamento de estudo e onboarding de colegas |
| 🥈 | `Com base nas fontes carregadas (especialmente LogRocket e react.dev), explique a diferença entre useEffect e useLayoutEffect...` | Revisão técnica antes de code review ou entrevista |
| 🥉 | `Com base nas fontes carregadas (especialmente Dev.to e react.dev), explique a estrutura mínima de um custom hook...` | Refatoração de componentes grandes |

---

## 📖 4. Miniguia de Estudo (Entrega Final)

---

### 4.1 Resumos Estruturados do Assunto

#### 🗂️ Tópico 1: JSX e Componentes Funcionais
**Resumo:**
JSX é uma extensão de sintaxe para JavaScript que permite escrever markup dentro do código. Não é HTML nem string — é transformado em chamadas de função React. Componentes funcionais são funções JavaScript que retornam JSX e, desde o React 16.8, podem gerenciar estado e efeitos colaterais via Hooks, tornando as classes obsoletas para a maioria dos casos. A documentação oficial (react.dev) adota componentes funcionais como padrão desde 2023.

**Pontos-chave:**
- ✅ JSX usa `{}` para interpolar expressões JavaScript
- ✅ `className` em vez de `class` (reservado em JS)
- ✅ Componentes devem começar com letra maiúscula
- ✅ Um componente = uma responsabilidade (Single Responsibility)

**Relação com outros tópicos:**
Componentes funcionais são a base para o uso de Hooks (Tópico 2) e para a composição de interfaces complexas (Tópico 3).

---

#### 🗂️ Tópico 2: Hooks Fundamentais (useState, useEffect, useContext)
**Resumo:**
Hooks são funções que permitem "conectar" lógica de estado e ciclo de vida a componentes funcionais. `useState` gerencia estado local; `useEffect` lida com efeitos colaterais (fetch, subscriptions, manipulação manual do DOM); `useContext` evita prop drilling ao compartilhar dados entre componentes sem passar props manualmente em cada nível. A Regra dos Hooks (top-level apenas, nunca em loops/condições) é inegociável para garantir a ordem de execução.

**Pontos-chave:**
- ✅ `useState` substitui `this.state` e `this.setState` de classes
- ✅ `useEffect` combina `componentDidMount`, `componentDidUpdate` e `componentWillUnmount`
- ✅ Array de dependências controla quando o efeito executa: `[]` = mount apenas; omitido = toda render; `[dep]` = quando dep muda
- ✅ `useContext` elimina prop drilling, mas não substitui Redux/Zustand em estados globais complexos

**Relação com outros tópicos:**
Hooks fundamentais são pré-requisito para Custom Hooks (Tópico 4) e para otimização com useMemo/useCallback.

---

#### 🗂️ Tópico 3: Fluxo de Dados e Gerenciamento de Estado
**Resumo:**
React adota fluxo de dados unidirecional: dados descem via props e sobem via callbacks. Estado deve ser elevado ao ancestral comum mais próximo (Lifting State Up). Evite estados redundantes ou duplicados — derive valores sempre que possível. Para estados globais, Context API resolve casos simples; bibliotecas externas (Zustand, Redux Toolkit) são recomendadas para aplicações complexas.

**Pontos-chave:**
- ✅ Dados descem, eventos sobem
- ✅ Estado elevado ao ancestral comum mais próximo
- ✅ Não duplique estado que possa ser derivado de props ou de outro estado
- ✅ Context API para temas, autenticação, preferências de usuário

**Relação com outros tópicos:**
O entendimento do fluxo de dados é essencial para decidir quando criar Custom Hooks (Tópico 4) e para evitar re-renders desnecessários.

---

#### 🗂️ Tópico 4: Custom Hooks e Boas Práticas
**Resumo:**
Custom Hooks permitem extrair lógica reutilizável de componentes. Devem sempre começar com "use" e chamar outros hooks no topo. A decisão de extrair um hook deve passar por três filtros: a lógica é reutilizada? envolve hooks do React? melhora testabilidade ou legibilidade? Anti-padrões incluem abstração prematura (hook usado uma única vez) e hooks que não envolvem lifecycle do React (nesse caso, use uma função utilitária comum).

**Pontos-chave:**
- ✅ Prefixo obrigatório: `use` (ex: `useAuth`, `useLocalStorage`)
- ✅ Um hook por arquivo, organizado por domínio (`features/cart/useCart.ts`)
- ✅ TypeScript com generics para tipagem flexível (`useLocalStorage<T>`)
- ✅ Composição: hooks podem chamar outros hooks (`useAuth` → `useLocalStorage`)

**Relação com outros tópicos:**
Custom Hooks consolidam o conhecimento dos Hooks fundamentais (Tópico 2) e do fluxo de dados (Tópico 3) em abstrações reutilizáveis.

---

### 4.2 Glossário de Conceitos

| Termo | Definição | Contexto de Uso | Fonte de Origem |
|-------|-----------|------------------|-----------------|
| **JSX** | Extensão de sintaxe que permite escrever elementos HTML-like dentro de JavaScript. É compilado para `React.createElement()`. | Toda a construção de UI em React | react.dev — Quick Start |
| **Componente Funcional** | Função JavaScript que recebe props e retorna JSX. Desde React 16.8, pode usar Hooks para estado e efeitos. | Padrão moderno de desenvolvimento React | react.dev — Thinking in React |
| **Props** | Objeto de entrada de um componente, imutável, passado de pai para filho. | Comunicação entre componentes | freeCodeCamp — React Handbook |
| **State** | Dados mutáveis de um componente que, ao mudar, disparam re-renderização. | Interatividade e dados dinâmicos | react.dev — Adding Interactivity |
| **Hook** | Função especial que permite "conectar" recursos do React (estado, efeitos, contexto) a componentes funcionais. | Substituem classes e lifecycle methods | react.dev — Hooks API Reference |
| **useEffect** | Hook para efeitos colaterais. Executa após o paint (renderização na tela). | Fetch de dados, subscriptions, manipulação manual do DOM | LogRocket — Hooks Cheat Sheet |
| **useLayoutEffect** | Hook similar ao useEffect, mas executa síncrono, antes do paint. | Medição de DOM, animações que evitam flicker | react.dev — useLayoutEffect API |
| **Regra dos Hooks** | Hooks devem ser chamados apenas no topo do componente, nunca em loops, condições ou funções aninhadas. | Garante ordem consistente de execução | Smashing Magazine — Best Practices |
| **Lifting State Up** | Elevar estado ao componente ancestral comum mais próximo quando múltiplos filhos precisam compartilhá-lo. | Evita inconsistência de dados | react.dev — Managing State |
| **Prop Drilling** | Passar props através de múltiplos níveis de componentes intermediários que não usam os dados. | Problema que useContext resolve | freeCodeCamp — React Handbook |
| **Custom Hook** | Função que extrai lógica reutilizável de componentes, seguindo as Regras dos Hooks. | Reuso de lógica de estado/efeitos | Dev.to — Mastering Custom Hooks |
| **Virtual DOM** | Representação leve em memória da árvore de elementos do DOM real. React compara (diff) e aplica apenas as mudanças necessárias. | Otimização de performance | Wikipedia — React (software) |

---

### 4.3 Prompts Reutilizáveis para Revisão

> Coleção de prompts prontos para uso futuro. Basta copiar, colar no NotebookLM (ou outra IA) e ajustar o tema.

#### 📋 Prompt de Revisão Rápida — Roteiro Estruturado
```text
Com base nas fontes carregadas no NotebookLM (especialmente react.dev e freeCodeCamp), estruture um roteiro de aprendizado de [TEMA] para [NÍVEL].
O roteiro deve:
1. Seguir a ordem recomendada pela documentação oficial
2. Diferenciar o que é essencial (must-know) do que é avançado (nice-to-have)
3. Indicar, para cada tópico, qual fonte é a melhor para aprofundamento
4. Alertar sobre práticas desatualizadas que aparecem em tutoriais antigos
```

#### 📋 Prompt de Comparação Técnica com Timeline
```text
Com base nas fontes carregadas (especialmente [FONTE_A] e [FONTE_B]), explique a diferença entre [CONCEITO_A] e [CONCEITO_B].
Inclua:
1. A ordem de execução no ciclo de renderização (timeline visual)
2. Um exemplo de código de quando usar um vs. outro
3. Uma tabela de "quando usar qual" com critérios práticos
4. A recomendação oficial da documentação sobre qual usar por padrão
```

#### 📋 Prompt de Extração de Padrão / Custom Hook
```text
Com base nas fontes carregadas (especialmente [FONTE_C] e react.dev), explique:
1. A estrutura mínima de um [PADRÃO] válido
2. Um exemplo completo com TypeScript
3. Uma checklist de [N] perguntas para decidir SE extrair/abstrair
4. [N] anti-padrões comuns e como evitá-los
5. A convenção de organização por domínio vs. por tipo
```

#### 📋 Prompt de Troubleshooting / Erros Comuns
```text
Quais são os 5 erros mais comuns ao implementar [TEMA] segundo as fontes carregadas?
Para cada erro, forneça:
- Sintoma (como identificar no código ou no console)
- Causa raiz (por que ocorre)
- Solução recomendada (com snippet de código)
- Referência da fonte (qual documento e seção)
```

#### 📋 Prompt de Mapa Conceitual / Diagrama
```text
Analise as fontes e construa um mapa conceitual de [TEMA] mostrando:
- Nós principais (conceitos)
- Conexões (relações de causa, dependência, hierarquia)
- Anti-padrões ou armadilhas comuns
Apresente o resultado em formato de lista aninhada (Markdown).
```

---

## 🛠️ Estrutura de Arquivos do Repositório

```
📁 aprender-react-caderno-tematico/
├── 📄 README.md                    ← Este arquivo (visão geral)
├── 📁 fontes/
│   ├── links_fontes_online.md      ← Links das 5 fontes curadas
│   └── [PDFs baixados, se houver]
├── 📁 prompts/
│   ├── prompt_01_roteiro.md
│   ├── prompt_02_useEffect_vs_useLayoutEffect.md
│   └── prompt_03_custom_hooks.md
├── 📁 entregas/
│   ├── resumos_estruturados.md
│   ├── glossario.md
│   └── miniguia_revisao.md
├── 📁 cicatrizes/
│   ├── cicatriz_01_resposta_generica.md
│   ├── cicatriz_02_explicacao_abstrata.md
│   └── cicatriz_03_abstracao_prematura.md
└── 📄 .gitignore
```

---

## ✅ Checklist de Maturidade Técnica

- [x] README com contexto claro e objetivos mensuráveis
- [x] 5 fontes curadas, com justificativa de seleção
- [x] Todos os uploads no NotebookLM documentados
- [x] 3 prompts documentados com evolução de versões
- [x] "Cicatrizes" registradas com troubleshooting real
- [x] Resumos estruturados com pontos-chave e relações entre tópicos
- [x] Glossário com 12 termos técnicos definidos
- [x] Prompts reutilizáveis testados e validados
- [x] Repositório com estrutura de pastas organizada

---

## 📜 Licença

Este caderno temático é disponibilizado sob licença **CC BY-SA 4.0**.
Você pode compartilhar e adaptar, desde que atribua a autoria e mantenha a mesma licença.

---

> ✍️ **Autor:** [Seu nome]
> 📅 **Última atualização:** 05/06/2026
> 🔄 **Versão:** 1.0
> 🛠️ **Stack:** React 19.x | TypeScript | NotebookLM
