# Cicatriz 3 — Abstração Prematura de Custom Hooks

## 🔬 Prompt Afetado
**Prompt 3 — Custom Hooks: Quando e Como Criar**

## 📝 Versão do Prompt que Causou o Problema (v1.0)
```text
Como criar um custom hook em React?
```

## ⚠️ Problema Encontrado

### Resposta Obtida (v1.0)
A IA explicou corretamente a estrutura técnica:

> "Um custom hook é uma função JavaScript cujo nome começa com 'use' e que pode chamar outros hooks."

**Mas os problemas foram:**

1. **Incentivou abstração prematura:** A resposta dava a impressão de que "sempre que houver lógica, extraia um hook"
2. **Não questionou SE extrair:** Não apresentou critérios para decidir entre hook, função utilitária ou código inline
3. **Sem alerta sobre over-engineering:** Não mencionou que hooks desnecessários aumentam complexidade cognitiva
4. **Sem contexto de escala:** Não diferenciou projeto pequeno (1-2 devs) vs. projeto grande (equipe)

### Por que isso é grave?
- Um desenvolvedor iniciante pode criar `useFormatDate` para uma função que não usa nenhum hook do React
- Pode extrair lógica usada em apenas 1 componente, aumentando indireção sem benefício
- Pode organizar tudo em `src/hooks/` ao invés de `src/features/`, dificultando manutenção em projetos grandes

## 🔍 Diagnóstico da Causa

| Aspecto | Análise |
|---------|---------|
| **Prompt focou no COMO, não no QUANDO** | "Como criar" gera tutorial técnico, não decisão arquitetural |
| **Sem questionamento de necessidade** | Não houve solicitação de critérios de extração |
| **Sem alerta sobre anti-padrões** | Não pedimos para listar quando NÃO criar um hook |
| **Sem contexto de organização** | Não solicitamos convenções de estrutura de projeto |

## 🛠️ Solução Testada

### Ajuste no Prompt (v1.0 → v2.0)

**O que foi adicionado:**
1. **Restrição de fontes:** `"Com base nas fontes carregadas (especialmente Dev.to e react.dev)..."`
2. **Checklist de decisão:** `"Uma checklist de 3 perguntas para decidir SE extrair um custom hook"`
3. **Anti-padrões:** `"Dois anti-padrões comuns e como evitá-los"`
4. **Organização:** `"A convenção de organização por domínio (features/) vs. por tipo (hooks/)"`
5. **Exemplo real:** `"Um exemplo completo de useLocalStorage<T> com TypeScript"`

### Resultado Após Ajuste
- ✅ Checklist de 3 perguntas: reutilização? envolve hooks? melhora testabilidade?
- ✅ Dois anti-padrões documentados: abstração prematura e hook sem hooks internos
- ✅ Convenção de organização por domínio (features/) explicada com comparação visual
- ✅ Exemplo real de `useLocalStorage<T>` com generics e tratamento de erro

## 📚 Aprendizado

> **Lição:** Sempre que perguntar "como fazer X", também pergunte "quando NÃO fazer X" e "como decidir se X é a solução certa". Abstração é uma faca de dois gumes — a pergunta certa evita over-engineering.

### Checklist para evitar esse problema no futuro
- [ ] Sempre solicitar critérios de decisão (checklist ou fluxograma)
- [ ] Pedir anti-padrões e quando NÃO usar a técnica
- [ ] Solicitar convenções de organização de código
- [ ] Incluir contexto de escala (projeto pequeno vs. grande)
- [ ] Pedir exemplo que ilustre tanto o acerto quanto o erro

---
> 🏷️ **Tags:** #abstração-prematura #custom-hooks #over-engineering #organização #features
> 📅 **Data:** 05/06/2026
