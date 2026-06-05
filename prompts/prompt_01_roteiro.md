# Prompt 1 — Mapeamento Inicial do Ecossistema React

## 📝 Versão Final do Prompt (v2.0)

```text
Com base nas fontes carregadas no NotebookLM (especialmente react.dev e freeCodeCamp), estruture um roteiro de aprendizado de React para iniciantes. 
O roteiro deve:
1. Seguir a ordem recomendada pela documentação oficial atual (react.dev)
2. Diferenciar o que é essencial (must-know) do que é avançado (nice-to-have)
3. Indicar, para cada tópico, qual fonte é a melhor para aprofundamento
4. Alertar sobre práticas desatualizadas (ex: Create React App) que aparecem em tutoriais antigos
```

## 🤖 Resposta Obtida (Resumida)

Roteiro estruturado em 4 fases:

### Fase 1 — Fundamentos (Must-Know)
- **Quick Start / JSX**: Sintaxe, expressões em `{}`, `className` vs `class`
- **Componentes Funcionais**: Funções que retornam JSX, composição
- **Props**: Passagem de dados de pai para filho, desestruturação
- **Melhor fonte:** react.dev — Quick Start

### Fase 2 — Interatividade (Must-Know)
- **State com useState**: Imutabilidade, atualizações funcionais
- **Eventos**: `onClick`, `onChange`, handlers nomeados
- **Renderização Condicional**: Operador ternário, `&&`, listas com `key`
- **Melhor fonte:** react.dev — Adding Interactivity + freeCodeCamp — React Handbook

### Fase 3 — Gerenciamento de Estado (Must-Know)
- **Lifting State Up**: Elevar estado ao ancestral comum
- **Fluxo Unidirecional**: Dados descem, eventos sobem
- **Context API**: `useContext` para evitar prop drilling
- **Melhor fonte:** react.dev — Managing State

### Fase 4 — Hooks Avançados (Nice-to-Have)
- **useEffect**: Efeitos colaterais, array de dependências, cleanup
- **useRef**: Referências ao DOM, valores persistentes entre renders
- **useReducer**: Alternativa ao useState para lógica complexa
- **Melhor fonte:** LogRocket — React Hooks Cheat Sheet

### ⚠️ Alerta sobre práticas desatualizadas
- **Create React App (CRA)**: Removido das recomendações oficiais. Use Vite ou Next.js.
- **Componentes de Classe**: Obsoletos para novos projetos. Foco em Hooks.
- **ReactDOM.render**: Substituído por `createRoot` no React 18+.

## 🔍 Referências Citadas pela IA
- react.dev — Quick Start, Thinking in React, Managing State
- freeCodeCamp — The React Handbook (seções de JSX e Props)

## 🔄 Evolução do Prompt

| Versão | Prompt | Problema | Ajuste |
|--------|--------|----------|--------|
| v1.0 | `Resuma como aprender React do zero.` | Resposta genérica, citou CRA (desatualizado) | Adicionado contexto de fontes e restrição temporal |
| v2.0 | Prompt atual | ✅ Resposta estruturada, priorizou react.dev, alertou sobre práticas obsoletas | — |

---
> 🏆 **Classificação:** Prompt Ouro 🥇
> 💡 **Quando usar:** Planejamento de estudo, onboarding de colegas, estruturação de curso
