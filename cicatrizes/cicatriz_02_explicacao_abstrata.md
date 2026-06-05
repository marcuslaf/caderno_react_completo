# Cicatriz 2 — Explicação Abstrata sem Cenário Prático

## 🔬 Prompt Afetado
**Prompt 2 — Comparação useEffect vs. useLayoutEffect**

## 📝 Versão do Prompt que Causou o Problema (v1.0)
```text
Qual a diferença entre useEffect e useLayoutEffect?
```

## ⚠️ Problema Encontrado

### Resposta Obtida (v1.0)
A IA respondeu corretamente do ponto de vista técnico:

> "`useLayoutEffect` dispara antes do paint do browser, enquanto `useEffect` dispara depois."

**Mas os problemas foram:**

1. **Definição abstrata:** "antes do paint" é um conceito de browser rendering pipeline que não é intuitivo para quem está aprendendo
2. **Sem exemplo concreto:** Não mostrou QUANDO essa diferença importa na prática
3. **Sem consequência visual:** Não explicou o que acontece se usar o hook errado (flicker)
4. **Sem recomendação de uso:** Não deixou claro qual usar por padrão

### Por que isso é grave?
- Um desenvolvedor iniciante pode entender a diferença teórica, mas **não saber quando aplicar**
- Pode usar `useLayoutEffect` por padrão (pensando que é "mais seguro"), causando **bloqueio de renderização** desnecessário
- Pode usar `useEffect` para medições de DOM, causando **flicker visual** perceptível ao usuário

## 🔍 Diagnóstico da Causa

| Aspecto | Análise |
|---------|---------|
| **Prompt pediu definição, não aplicação** | "Qual a diferença" gera resposta conceitual, não prática |
| **Sem solicitação de exemplo** | IA não tem obrigação de inventar cenários |
| **Sem solicitação de consequência** | Não pedimos para mostrar o que acontece se usar errado |
| **Sem solicitação de recomendação** | Não pedimos a posição oficial do React team |

## 🛠️ Solução Testada

### Ajuste no Prompt (v1.0 → v2.0)

**O que foi adicionado:**
1. **Restrição de fontes:** `"Com base nas fontes carregadas (especialmente LogRocket e react.dev)..."`
2. **Timeline visual:** `"A ordem de execução no ciclo de renderização (timeline visual)"`
3. **Exemplo prático:** `"Um exemplo de código de useLayoutEffect para evitar flicker em animação de layout"`
4. **Tabela comparativa:** `"Uma tabela de 'quando usar qual' com critérios práticos"`
5. **Recomendação oficial:** `"A recomendação oficial do React team sobre qual usar por padrão"`

### Resultado Após Ajuste
- ✅ Timeline visual clara mostrando a sequência completa do ciclo de renderização
- ✅ Exemplo de código real de tooltip com medição de DOM e reposicionamento
- ✅ Tabela comparativa com critérios práticos (bloqueia render? cenários ideais?)
- ✅ Recomendação oficial: "use useEffect por padrão"

## 📚 Aprendizado

> **Lição:** Diferenças técnicas sutis (especialmente em lifecycle/rendering) precisam de **cenários práticos** e **consequências visuais** para serem internalizadas. Sempre solicite: exemplo de código + caso de uso real + o que acontece se usar errado.

### Checklist para evitar esse problema no futuro
- [ ] Sempre solicitar um exemplo de código concreto
- [ ] Pedir para mostrar a consequência de usar o conceito/errado
- [ ] Solicitar timeline ou diagrama para conceitos sequenciais
- [ ] Pedir a recomendação oficial/best practice da documentação
- [ ] Usar verbos de ação: "explique COM", "mostre QUANDO", "ilustre COMO"

---
> 🏷️ **Tags:** #abstração #cenário-prático #useEffect #useLayoutEffect #rendering
> 📅 **Data:** 05/06/2026
