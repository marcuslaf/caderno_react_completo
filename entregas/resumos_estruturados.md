# Resumos Estruturados — Aprender a Programar em React

---

## 🗂️ Tópico 1: JSX e Componentes Funcionais

### Resumo
JSX é uma extensão de sintaxe para JavaScript que permite escrever markup dentro do código. Não é HTML nem string — é transformado em chamadas de função React (`React.createElement()`). Componentes funcionais são funções JavaScript que retornam JSX e, desde o React 16.8, podem gerenciar estado e efeitos colaterais via Hooks, tornando as classes obsoletas para a maioria dos casos. A documentação oficial (react.dev) adota componentes funcionais como padrão desde 2023.

### Pontos-chave
- ✅ JSX usa `{}` para interpolar expressões JavaScript
- ✅ `className` em vez de `class` (reservado em JS)
- ✅ Componentes devem começar com letra maiúscula
- ✅ Um componente = uma responsabilidade (Single Responsibility)
- ✅ `key` é obrigatória em listas para ajudar o React a identificar mudanças

### Relação com outros tópicos
Componentes funcionais são a base para o uso de Hooks (Tópico 2) e para a composição de interfaces complexas (Tópico 3).

---

## 🗂️ Tópico 2: Hooks Fundamentais (useState, useEffect, useContext)

### Resumo
Hooks são funções que permitem "conectar" lógica de estado e ciclo de vida a componentes funcionais. `useState` gerencia estado local; `useEffect` lida com efeitos colaterais (fetch de dados, subscriptions, manipulação manual do DOM); `useContext` evita prop drilling ao compartilhar dados entre componentes sem passar props manualmente em cada nível. A Regra dos Hooks (top-level apenas, nunca em loops/condições) é inegociável para garantir a ordem de execução.

### Pontos-chave
- ✅ `useState` substitui `this.state` e `this.setState` de classes
- ✅ `useEffect` combina `componentDidMount`, `componentDidUpdate` e `componentWillUnmount`
- ✅ Array de dependências controla quando o efeito executa:
  - `[]` = executa apenas no mount
  - omitido = executa em toda renderização
  - `[dep]` = executa quando `dep` muda
- ✅ `useContext` elimina prop drilling, mas não substitui Redux/Zustand em estados globais complexos
- ✅ Cleanup em `useEffect` é essencial para evitar memory leaks (ex: remover event listeners)

### Relação com outros tópicos
Hooks fundamentais são pré-requisito para Custom Hooks (Tópico 4) e para otimização com useMemo/useCallback.

---

## 🗂️ Tópico 3: Fluxo de Dados e Gerenciamento de Estado

### Resumo
React adota fluxo de dados unidirecional: dados descem via props e sobem via callbacks. Estado deve ser elevado ao ancestral comum mais próximo (Lifting State Up). Evite estados redundantes ou duplicados — derive valores sempre que possível. Para estados globais, Context API resolve casos simples; bibliotecas externas (Zustand, Redux Toolkit) são recomendadas para aplicações complexas.

### Pontos-chave
- ✅ Dados descem, eventos sobem
- ✅ Estado elevado ao ancestral comum mais próximo
- ✅ Não duplique estado que possa ser derivado de props ou de outro estado
- ✅ Context API para temas, autenticação, preferências de usuário
- ✅ Para estado global complexo: Zustand (simples) ou Redux Toolkit (robusto)

### Relação com outros tópicos
O entendimento do fluxo de dados é essencial para decidir quando criar Custom Hooks (Tópico 4) e para evitar re-renders desnecessários.

---

## 🗂️ Tópico 4: Custom Hooks e Boas Práticas

### Resumo
Custom Hooks permitem extrair lógica reutilizável de componentes. Devem sempre começar com "use" e chamar outros hooks no topo. A decisão de extrair um hook deve passar por três filtros: a lógica é reutilizada? envolve hooks do React? melhora testabilidade ou legibilidade? Anti-padrões incluem abstração prematura (hook usado uma única vez) e hooks que não envolvem lifecycle do React (nesse caso, use uma função utilitária comum).

### Pontos-chave
- ✅ Prefixo obrigatório: `use` (ex: `useAuth`, `useLocalStorage`)
- ✅ Um hook por arquivo, organizado por domínio (`features/cart/useCart.ts`)
- ✅ TypeScript com generics para tipagem flexível (`useLocalStorage<T>`)
- ✅ Composição: hooks podem chamar outros hooks (`useAuth` → `useLocalStorage`)
- ✅ Checklist de extração: reutilizado? envolve hooks? melhora legibilidade?

### Relação com outros tópicos
Custom Hooks consolidam o conhecimento dos Hooks fundamentais (Tópico 2) e do fluxo de dados (Tópico 3) em abstrações reutilizáveis.

---

## 🗂️ Tópico 5: Renderização e Performance (Conceitos Iniciais)

### Resumo
React usa o Virtual DOM para otimizar atualizações: compara a árvore atual com a nova (diffing) e aplica apenas as mudanças necessárias ao DOM real. Re-renders ocorrem quando state ou props mudam. Nem todo re-render é um problema, mas re-renders desnecessários de componentes pesados podem ser otimizados com `React.memo`, `useMemo` e `useCallback`. O princípio fundamental é: **otimize apenas o que foi medido como lento**.

### Pontos-chave
- ✅ Virtual DOM = representação leve em memória do DOM real
- ✅ Re-render ≠ re-render do DOM real (React otimiza via diffing)
- ✅ `React.memo` evita re-render de componente se props não mudaram
- ✅ `useMemo` memoiza valores computados caros
- ✅ `useCallback` memoiza funções para passar como props estáveis
- ✅ ⚠️ Não otimize prematuramente — meça primeiro!

### Relação com outros tópicos
Performance é consequência direta de como Hooks (Tópico 2) e estado (Tópico 3) são gerenciados. Custom Hooks bem projetados (Tópico 4) já previnem muitos re-renders desnecessários.

---
> 📅 **Última atualização:** 05/06/2026
> 🔄 **Versão:** 1.0
