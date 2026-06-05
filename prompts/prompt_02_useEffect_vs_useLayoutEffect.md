# Prompt 2 — Comparação useEffect vs. useLayoutEffect

## 📝 Versão Final do Prompt (v2.0)

```text
Com base nas fontes carregadas (especialmente LogRocket e react.dev), explique a diferença entre useEffect e useLayoutEffect.
Inclua:
1. A ordem de execução no ciclo de renderização (timeline visual)
2. Um exemplo de código de useLayoutEffect para evitar flicker em animação de layout
3. Uma tabela de "quando usar qual" com critérios práticos
4. A recomendação oficial do React team sobre qual usar por padrão
```

## 🤖 Resposta Obtida (Resumida)

### Timeline de Execução no Ciclo de Renderização

```
Componente renderiza (JSX → Virtual DOM)
    ↓
React compara com DOM anterior (Reconciliation)
    ↓
React calcula mudanças (Diffing)
    ↓
useLayoutEffect executa (SÍNCRONO, antes do paint)
    ↓
Browser pinta a tela (Paint / Commit)
    ↓
useEffect executa (ASSÍNCRONO, depois do paint)
```

### Exemplo de Código — useLayoutEffect evitando flicker

```tsx
import { useLayoutEffect, useRef } from 'react';

function Tooltip({ children, position }) {
  const tooltipRef = useRef(null);

  useLayoutEffect(() => {
    // Mede o tooltip ANTES do paint
    const { width, height } = tooltipRef.current.getBoundingClientRect();

    // Ajusta posição para não sair da viewport
    if (position.x + width > window.innerWidth) {
      tooltipRef.current.style.left = `${position.x - width}px`;
    }
    if (position.y + height > window.innerHeight) {
      tooltipRef.current.style.top = `${position.y - height}px`;
    }
  }, [position]);

  return <div ref={tooltipRef} className="tooltip">{children}</div>;
}
```

> ⚠️ Se usássemos `useEffect` aqui, o tooltip apareceria na posição errada por um frame (flicker) antes de ser reposicionado.

### Tabela: Quando Usar Qual

| Critério | useEffect | useLayoutEffect |
|----------|-----------|-----------------|
| **Momento de execução** | Depois do paint | Antes do paint |
| **Bloqueia renderização?** | Não | Sim (síncrono) |
| **Cenários ideais** | Fetch de dados, subscriptions, logging | Medição de DOM, animações de layout, reposicionamento |
| **Performance** | Não bloqueia — preferido | Pode causar layout thrashing se mal usado |
| **Recomendação padrão** | ✅ **Use por padrão** | ⚠️ Use apenas quando necessário |

### Recomendação Oficial do React Team
> "Use `useEffect` por padrão. Use `useLayoutEffect` apenas quando precisar medir ou modificar o layout síncronamente antes do paint." — react.dev

## 🔍 Referências Citadas pela IA
- react.dev — Referência de API (useLayoutEffect)
- LogRocket — React Hooks Cheat Sheet (seção useLayoutEffect)
- Smashing Magazine — Best Practices (seção de Hooks)

## 🔄 Evolução do Prompt

| Versão | Prompt | Problema | Ajuste |
|--------|--------|----------|--------|
| v1.0 | `Qual a diferença entre useEffect e useLayoutEffect?` | Resposta técnica correta, mas abstrata ("antes do paint") | Solicitei timeline visual + exemplo de flicker + tabela comparativa |
| v2.0 | Prompt atual | ✅ Resposta com timeline, código real, tabela e recomendação oficial | — |

---
> 🏆 **Classificação:** Prompt Ouro 🥈
> 💡 **Quando usar:** Revisão técnica antes de code review, preparação para entrevistas, decisão de arquitetura
