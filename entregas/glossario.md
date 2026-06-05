# Glossário de Conceitos — Aprender a Programar em React

> Definições no "estilo Wikipedia técnica": objetivas, com contexto de aplicação.

---

| # | Termo | Definição | Contexto de Uso | Fonte de Origem |
|---|-------|-----------|------------------|-----------------|
| 1 | **JSX** | Extensão de sintaxe que permite escrever elementos HTML-like dentro de JavaScript. É compilado para `React.createElement()`. | Toda a construção de UI em React | react.dev — Quick Start |
| 2 | **Componente Funcional** | Função JavaScript que recebe props e retorna JSX. Desde React 16.8, pode usar Hooks para estado e efeitos. | Padrão moderno de desenvolvimento React | react.dev — Thinking in React |
| 3 | **Props** | Objeto de entrada de um componente, imutável, passado de pai para filho. | Comunicação entre componentes | freeCodeCamp — React Handbook |
| 4 | **State** | Dados mutáveis de um componente que, ao mudar, disparam re-renderização. | Interatividade e dados dinâmicos | react.dev — Adding Interactivity |
| 5 | **Hook** | Função especial que permite "conectar" recursos do React (estado, efeitos, contexto) a componentes funcionais. | Substituem classes e lifecycle methods | react.dev — Hooks API Reference |
| 6 | **useState** | Hook que retorna um par `[valor, setValor]` para gerenciar estado local em componentes funcionais. | Formulários, contadores, toggles, listas | react.dev — State: A Component's Memory |
| 7 | **useEffect** | Hook para efeitos colaterais. Executa após o paint (renderização na tela). | Fetch de dados, subscriptions, manipulação manual do DOM | LogRocket — Hooks Cheat Sheet |
| 8 | **useLayoutEffect** | Hook similar ao useEffect, mas executa síncrono, antes do paint. | Medição de DOM, animações que evitam flicker | react.dev — useLayoutEffect API |
| 9 | **useContext** | Hook que permite consumir um Contexto React, eliminando prop drilling. | Temas, autenticação, preferências de usuário | react.dev — Passing Data Deeply with Context |
| 10 | **Regra dos Hooks** | Hooks devem ser chamados apenas no topo do componente, nunca em loops, condições ou funções aninhadas. | Garante ordem consistente de execução | Smashing Magazine — Best Practices |
| 11 | **Lifting State Up** | Elevar estado ao componente ancestral comum mais próximo quando múltiplos filhos precisam compartilhá-lo. | Evita inconsistência de dados entre irmãos | react.dev — Managing State |
| 12 | **Prop Drilling** | Passar props através de múltiplos níveis de componentes intermediários que não usam os dados. | Problema que useContext resolve | freeCodeCamp — React Handbook |
| 13 | **Custom Hook** | Função que extrai lógica reutilizável de componentes, seguindo as Regras dos Hooks. | Reuso de lógica de estado/efeitos | Dev.to — Mastering Custom Hooks |
| 14 | **Virtual DOM** | Representação leve em memória da árvore de elementos do DOM real. React compara (diff) e aplica apenas as mudanças necessárias. | Otimização de performance | react.dev — Render and Commit |
| 15 | **Re-render** | Processo de React chamar novamente a função do componente para gerar nova UI. Nem todo re-render atualiza o DOM real. | Entender quando otimizar e quando não | react.dev — State: A Component's Memory |
| 16 | **React.memo** | Higher-Order Component que memoiza um componente funcional, evitando re-render se props não mudaram. | Otimização de componentes que recebem props estáveis | react.dev — Keeping Components Pure |
| 17 | **useMemo** | Hook que memoiza o resultado de uma computação cara, recalculando apenas quando dependências mudam. | Cálculos pesados, transformação de dados | LogRocket — Hooks Cheat Sheet |
| 18 | **useCallback** | Hook que memoiza uma função, mantendo a mesma referência entre renders se dependências não mudarem. | Passar callbacks como props sem quebrar memoização de filhos | Smashing Magazine — Best Practices |
| 19 | **Cleanup (useEffect)** | Função de retorno opcional em useEffect que executa antes do próximo efeito ou na desmontagem do componente. | Remover event listeners, cancelar subscriptions, limpar timers | react.dev — Synchronizing with Effects |
| 20 | **Array de Dependências** | Segundo argumento de useEffect/useMemo/useCallback que define quando o hook deve reexecutar. | Controlar frequência de execução de efeitos | react.dev — Synchronizing with Effects |

---

## 🔤 Índice por Categoria

### Fundamentos
- JSX
- Componente Funcional
- Props
- State

### Hooks Nativos
- useState
- useEffect
- useLayoutEffect
- useContext
- useMemo
- useCallback

### Padrões e Arquitetura
- Regra dos Hooks
- Lifting State Up
- Prop Drilling
- Custom Hook
- Cleanup (useEffect)
- Array de Dependências

### Performance
- Virtual DOM
- Re-render
- React.memo

---
> 📅 **Última atualização:** 05/06/2026
> 🔄 **Versão:** 1.0
> 📊 **Total de termos:** 20
