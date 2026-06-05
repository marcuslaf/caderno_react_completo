# Cicatriz 1 — Resposta Genérica e Desatualizada

## 🔬 Prompt Afetado
**Prompt 1 — Mapeamento Inicial do Ecossistema React**

## 📝 Versão do Prompt que Causou o Problema (v1.0)
```text
Resuma como aprender React do zero.
```

## ⚠️ Problema Encontrado

### Resposta Obtida (v1.0)
A IA gerou um roteiro genérico com os seguintes problemas:

1. **Citou Create React App (CRA)** como ferramenta de inicialização recomendada
2. **Mencionou componentes de classe** como abordagem padrão
3. **Não priorizou** a documentação oficial (react.dev)
4. **Não diferenciou** conteúdo essencial de avançado
5. **Não alertou** sobre práticas obsoletas

### Por que isso é grave?
- CRA foi **removido das recomendações oficiais** do React (substituído por Vite/Next.js)
- Componentes de classe são **obsoletos** para novos projetos desde 2023
- Um iniciante seguindo essa resposta aprenderia tecnologias defasadas

## 🔍 Diagnóstico da Causa

| Aspecto | Análise |
|---------|---------|
| **Prompt muito amplo** | "do zero" não restringe temporalidade nem fontes |
| **Sem contexto de fontes** | IA usou conhecimento geral (possivelmente desatualizado) em vez das fontes carregadas |
| **Sem instrução de priorização** | Não houve diretriz sobre o que é must-know vs. nice-to-have |
| **Sem alerta temporal** | Não solicitou identificação de práticas desatualizadas |

## 🛠️ Solução Testada

### Ajuste no Prompt (v1.0 → v2.0)

**O que foi adicionado:**
1. **Restrição de fontes:** `"Com base nas fontes carregadas no NotebookLM (especialmente react.dev e freeCodeCamp)..."`
2. **Priorização explícita:** `"Diferenciar o que é essencial (must-know) do que é avançado (nice-to-have)"`
3. **Alerta temporal:** `"Alertar sobre práticas desatualizadas (ex: Create React App)"`
4. **Referência oficial:** `"Seguir a ordem recomendada pela documentação oficial atual (react.dev)"`

### Resultado Após Ajuste
- ✅ Resposta estruturou o roteiro em 4 fases com priorização clara
- ✅ Citou corretamente a remoção do CRA e recomendação de Vite/Next.js
- ✅ Referenciou seções específicas do react.dev ("Thinking in React", "Managing State")
- ✅ Diferenciou must-know de nice-to-have em cada fase

## 📚 Aprendizado

> **Lição:** Prompts genéricos sobre tecnologias em rápida evolução (como React) tendem a gerar respostas desatualizadas. Sempre restrinja ao contexto das fontes carregadas e adicione filtros temporais.

### Checklist para evitar esse problema no futuro
- [ ] Sempre mencionar as fontes carregadas no NotebookLM
- [ ] Solicitar alerta sobre práticas desatualizadas
- [ ] Pedir priorização (must-know vs. nice-to-have)
- [ ] Verificar se a resposta cita a documentação oficial atual

---
> 🏷️ **Tags:** #desatualização #contexto #priorização #react #cra
> 📅 **Data:** 05/06/2026
