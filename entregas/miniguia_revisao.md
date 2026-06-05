# Miniguia de Revisão — Prompts Reutilizáveis

> Coleção de prompts prontos para uso futuro. Basta copiar, colar no NotebookLM (ou outra IA) e ajustar os placeholders entre colchetes `[...]`.

---

## 📋 Prompt 1 — Revisão Rápida: Roteiro Estruturado

```text
Com base nas fontes carregadas no NotebookLM (especialmente react.dev e freeCodeCamp), estruture um roteiro de aprendizado de [TEMA] para [NÍVEL].
O roteiro deve:
1. Seguir a ordem recomendada pela documentação oficial
2. Diferenciar o que é essencial (must-know) do que é avançado (nice-to-have)
3. Indicar, para cada tópico, qual fonte é a melhor para aprofundamento
4. Alertar sobre práticas desatualizadas que aparecem em tutoriais antigos
```

**Exemplos de preenchimento:**
- `[TEMA]` = "React", "Next.js", "TypeScript com React", "Testes em React"
- `[NÍVEL]` = "iniciantes", "intermediários", "desenvolvedores migrando de Vue"

**Quando usar:** Planejamento de estudo, onboarding de colegas, estruturação de curso

---

## 📋 Prompt 2 — Comparação Técnica com Timeline Visual

```text
Com base nas fontes carregadas (especialmente [FONTE_A] e [FONTE_B]), explique a diferença entre [CONCEITO_A] e [CONCEITO_B].
Inclua:
1. A ordem de execução no ciclo de renderização (timeline visual)
2. Um exemplo de código de quando usar um vs. outro
3. Uma tabela de "quando usar qual" com critérios práticos
4. A recomendação oficial da documentação sobre qual usar por padrão
```

**Exemplos de preenchimento:**
- `[CONCEITO_A]` + `[CONCEITO_B]` = "useEffect" + "useLayoutEffect", "useState" + "useReducer", "Context API" + "Redux"
- `[FONTE_A]` + `[FONTE_B]` = "LogRocket" + "react.dev", "freeCodeCamp" + "react.dev"

**Quando usar:** Revisão técnica antes de code review, preparação para entrevistas, decisão de arquitetura

---

## 📋 Prompt 3 — Extração de Padrão / Custom Hook

```text
Com base nas fontes carregadas (especialmente [FONTE_C] e react.dev), explique:
1. A estrutura mínima de um [PADRÃO] válido
2. Um exemplo completo com TypeScript
3. Uma checklist de [N] perguntas para decidir SE extrair/abstrair
4. [N] anti-padrões comuns e como evitá-los
5. A convenção de organização por domínio vs. por tipo
```

**Exemplos de preenchimento:**
- `[PADRÃO]` = "custom hook", "Higher-Order Component", "Render Prop", "Compound Component"
- `[N]` = "3", "5"
- `[FONTE_C]` = "Dev.to", "Smashing Magazine", "LogRocket"

**Quando usar:** Refatoração de componentes grandes, code review, decisão de arquitetura de projeto

---

## 📋 Prompt 4 — Troubleshooting / Erros Comuns

```text
Quais são os 5 erros mais comuns ao implementar [TEMA] segundo as fontes carregadas?
Para cada erro, forneça:
- Sintoma (como identificar no código ou no console)
- Causa raiz (por que ocorre)
- Solução recomendada (com snippet de código)
- Referência da fonte (qual documento e seção)
```

**Exemplos de preenchimento:**
- `[TEMA]` = "useEffect", "Custom Hooks", "Context API", "React Router", "Formulários controlados"

**Quando usar:** Debug de código, revisão de código legado, preparação para entrevistas técnicas

---

## 📋 Prompt 5 — Mapa Conceitual / Diagrama

```text
Analise as fontes e construa um mapa conceitual de [TEMA] mostrando:
- Nós principais (conceitos)
- Conexões (relações de causa, dependência, hierarquia)
- Anti-padrões ou armadilhas comuns
Apresente o resultado em formato de lista aninhada (Markdown).
```

**Exemplos de preenchimento:**
- `[TEMA]` = "Gerenciamento de Estado em React", "Ciclo de Renderização", "Ecossistema React"

**Quando usar:** Consolidação de conhecimento antes de prova/entrevista, onboarding de novos devs, documentação de projeto

---

## 📋 Prompt 6 — Atualização / Tendências

```text
Considerando as fontes disponíveis e seu contexto de publicação, identifique:
- Tendências emergentes relacionadas a [TEMA]
- Tecnologias ou abordagens que estão sendo substituídas
- Lacunas de conhecimento que as fontes indicam como áreas de pesquisa futura
```

**Exemplos de preenchimento:**
- `[TEMA]` = "React", "Front-end Development", "JavaScript Frameworks"

**Quando usar:** Planejamento de carreira, decisão de stack para novo projeto, identificação de skills a desenvolver

---

## 📋 Prompt 7 — Code Review Simulado

```text
Analise o seguinte código React segundo as fontes carregadas (especialmente react.dev e [FONTE_D]):

```tsx
[INSERIR CÓDIGO AQUI]
```

Identifique:
1. Problemas de performance (re-renders desnecessários, falta de memoização)
2. Violações das Regras dos Hooks
3. Anti-padrões de gerenciamento de estado
4. Sugestões de refatoração com snippets de código
```

**Exemplos de preenchimento:**
- `[FONTE_D]` = "Smashing Magazine", "LogRocket", "Kent C. Dodds"

**Quando usar:** Preparação para code review, revisão de próprio código, aprendizado de boas práticas

---

## 📋 Prompt 8 — Criação de Exercício Prático

```text
Com base nas fontes carregadas, crie um exercício prático de [TEMA] com:
1. Descrição do problema a resolver
2. Requisitos funcionais e não-funcionais
3. Restrições técnicas (quais hooks/padrões devem ser usados)
4. Critérios de aceitação
5. Dicas de implementação (sem dar a resposta completa)
```

**Exemplos de preenchimento:**
- `[TEMA]` = "useEffect com cleanup", "Custom Hook para formulários", "Context API com useReducer"

**Quando usar:** Criação de desafios para estudo, preparação de testes técnicos, prática de coding

---

## 📋 Prompt 9 — Glossário Automático

```text
Com base nas fontes carregadas, gere um glossário de [N] termos técnicos sobre [TEMA].
Para cada termo, forneça:
- Definição objetiva (máximo 2 frases)
- Contexto de uso prático (onde aparece no código)
- Referência da fonte (qual documento e seção)
Organize por categoria (Fundamentos, Hooks, Padrões, Performance, etc.)
```

**Exemplos de preenchimento:**
- `[TEMA]` = "React Hooks", "Gerenciamento de Estado", "React Performance"
- `[N]` = "10", "15", "20"

**Quando usar:** Criação de material de estudo, documentação de projeto, onboarding

---

## 📋 Prompt 10 — Preparação para Entrevista Técnica

```text
Com base nas fontes carregadas, simule uma entrevista técnica de [NÍVEL] sobre [TEMA].
Inclua:
1. [N] perguntas teóricas (conceitos, diferenças, trade-offs)
2. [N] perguntas práticas (análise de código, debugging)
3. [N] perguntas de arquitetura (decisões de design, escalabilidade)
4. Respostas modelo para cada pergunta, com referências às fontes
```

**Exemplos de preenchimento:**
- `[TEMA]` = "React", "React Hooks", "Front-end Architecture"
- `[NÍVEL]` = "júnior", "pleno", "sênior"
- `[N]` = "3", "5"

**Quando usar:** Preparação para entrevistas, autoavaliação de conhecimento, identificação de gaps

---

## 🎯 Como Usar Este Miniguia

1. **Copie** o prompt desejado
2. **Substitua** os placeholders `[...]` pelos valores específicos do seu estudo
3. **Cole** no NotebookLM (ou ChatGPT, Claude, etc.)
4. **Ajuste** conforme o resultado — documente novas "cicatrizes" se surgirem!

---
> 📅 **Última atualização:** 05/06/2026
> 🔄 **Versão:** 1.0
> 📊 **Total de prompts reutilizáveis:** 10
