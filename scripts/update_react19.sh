#!/bin/bash
# ============================================================
# update_react19.sh — Atualização do Caderno com React 19
# ============================================================
# Uso: ./scripts/update_react19.sh
#
# Este script atualiza o caderno temático com as novidades do React 19,
# adicionando novos prompts, resumos e glossário atualizado.
# ============================================================

set -e

GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m'

echo "╔════════════════════════════════════════════════════════════╗"
echo "║  ⚛️  Atualizando Caderno: React 19 Features               ║"
echo "╚════════════════════════════════════════════════════════════╝"
echo ""

# -----------------------------------------------------------
# 1. VERIFICAR ESTRUTURA
# -----------------------------------------------------------
if [ ! -d "prompts" ] || [ ! -d "entregas" ] || [ ! -d "cicatrizes" ]; then
    echo "${YELLOW}⚠️  Estrutura do repositório não encontrada.${NC}"
    echo "   Execute primeiro: ./scripts/init_repo.sh"
    exit 1
fi

# -----------------------------------------------------------
# 2. ADICIONAR NOVO PROMPT — React 19 Server Components
# -----------------------------------------------------------
echo "${BLUE}🧠 Criando Prompt 04 — React 19 Server Components...${NC}"

cat > prompts/prompt_04_react19_server_components.md << 'EOF'
# Prompt 4 — React 19: Server Components e Server Actions

## 📝 Versão do Prompt Testada

```text
Com base nas fontes carregadas (especialmente react.dev e artigos sobre React 19), explique:
1. O que são React Server Components (RSC) e como diferem de SSR tradicional
2. As diretivas 'use client' e 'use server': quando usar cada uma
3. Server Actions: como funcionam e quando substituem API routes
4. Novos Hooks do React 19: useActionState, useFormStatus, useOptimistic
5. O React Compiler (experimental): o que muda na otimização de performance
6. Práticas desatualizadas que o React 19 torna obsoletas
```

## 🤖 Resposta Obtida (Resumida)

### React Server Components (RSC)
- Componentes que executam **apenas no servidor**, nunca no cliente
- Reduzem o bundle JavaScript enviado ao browser
- Permitem acesso direto a bancos de dados e APIs do servidor
- Diferente de SSR: RSC não hidrata, envia apenas HTML estático + JSON

### Diretivas 'use client' e 'use server'
- `'use client'` — marca componentes que precisam de interatividade (hooks, eventos)
- `'use server'` — marca funções que executam no servidor (Server Actions)
- **Padrão no React 19:** todos os componentes são Server Components por default

### Server Actions
- Funções assíncronas que executam no servidor, chamadas diretamente do cliente
- Eliminam a necessidade de criar endpoints API separados
- Integração nativa com formulários HTML via atributo `action`

### Novos Hooks do React 19
| Hook | Função |
|------|--------|
| `useActionState` | Gerencia estado de pending/erro em ações |
| `useFormStatus` | Acessa status do formulário pai em componentes filhos |
| `useOptimistic` | Implementa UI otimista (atualização imediata antes da resposta) |

### React Compiler (Experimental)
- Compila componentes React em JavaScript otimizado automaticamente
- **Elimina a necessidade manual** de `useMemo`, `useCallback`, `React.memo`
- Já usado em produção no Instagram
- Ainda experimental — não recomendado para produção em larga escala

### Práticas Obsoletas no React 19
- ❌ `forwardRef` → refs podem ser passadas como props diretamente
- ❌ `ReactDOM.render` → substituído por `createRoot` (React 18+)
- ❌ Create React App → removido das recomendações oficiais
- ❌ Componentes de classe → obsoletos para novos projetos

## 🔍 Referências Citadas pela IA
- react.dev — React 19 Blog Posts
- GeeksforGeeks — React 19 New Features and Updates
- mimacom.com — What React 19 Changes for Real-World Applications

## 🔄 Evolução do Prompt
- **v1.0:** `Quais são as novidades do React 19?` → Resposta superficial, sem contexto de aplicação
- **v2.0:** Prompt atual → Resposta estruturada com exemplos de código e comparações

---
> 🏆 **Classificação:** Prompt Ouro
> 💡 **Quando usar:** Atualização de conhecimento, migração de projetos legados, preparação para entrevistas
EOF

echo "${GREEN}   ✓ Prompt 04 criado${NC}"

# -----------------------------------------------------------
# 3. ADICIONAR NOVA CICATRIZ — React 19
# -----------------------------------------------------------
echo "${BLUE}🩹 Criando Cicatriz 04 — React 19...${NC}"

cat > cicatrizes/cicatriz_04_react19_confusao_rsc.md << 'EOF'
# Cicatriz 4 — Confusão entre Server Components e SSR

## 🔬 Prompt Afetado
**Prompt 4 — React 19: Server Components e Server Actions**

## 📝 Versão do Prompt que Causou o Problema (v1.0)
```text
Quais são as novidades do React 19?
```

## ⚠️ Problema Encontrado

### Resposta Obtida (v1.0)
A IA listou "Server Components" como novidade, mas:
1. **Confundiu RSC com SSR tradicional** — não explicou a diferença fundamental
2. **Não mencionou as diretivas** `'use client'` e `'use server'`
3. **Resposta superficial** sobre Server Actions — sem exemplo de código
4. **Não alertou** sobre o React Compiler ainda ser experimental

### Por que isso é grave?
- Um desenvolvedor pode pensar que RSC é "SSR com outro nome"
- Pode usar Server Components para componentes interativos (erro fatal)
- Pode adotar o React Compiler em produção sem saber que é experimental

## 🔍 Diagnóstico da Causa

| Aspecto | Análise |
|---------|---------|
| **Prompt muito amplo** | "novidades" não direciona para análise comparativa |
| **Sem solicitação de diferenciação** | Não pediu para comparar RSC vs. SSR vs. CSR |
| **Sem alerta de risco** | Não solicitou identificação de features experimentais |

## 🛠️ Solução Testada

### Ajuste no Prompt (v1.0 → v2.0)
- Adicionado pedido de **comparação explícita** (RSC vs. SSR tradicional)
- Solicitado **exemplos de código** para diretivas e Server Actions
- Incluído **alerta sobre experimentalidade** do React Compiler
- Pedido lista de **práticas obsoletas** para contexto de migração

### Resultado Após Ajuste
- ✅ Diferença RSC vs. SSR claramente explicada
- ✅ Exemplos de código para `'use client'` e `'use server'`
- ✅ React Compiler marcado como experimental com ressalvas
- ✅ Lista de práticas obsoletas para orientar migração

## 📚 Aprendizado

> **Lição:** Novas versões de frameworks exigem prompts que forcem **diferenciação conceitual** e **alertas de risco**. Não basta listar features — é preciso contextualizar impacto e estabilidade.

---
> 🏷️ **Tags:** #react19 #server-components #ssr #experimental #migração
> 📅 **Data:** 05/06/2026
EOF

echo "${GREEN}   ✓ Cicatriz 04 criada${NC}"

# -----------------------------------------------------------
# 4. ATUALIZAR GLOSSÁRIO
# -----------------------------------------------------------
echo "${BLUE}📖 Atualizando Glossário com termos do React 19...${NC}"

# Adicionar novos termos ao final do glossário
if [ -f "entregas/glossario.md" ]; then
    cat >> entregas/glossario.md << 'EOF'

| 21 | **Server Component** | Componente React que executa apenas no servidor, reduzindo o bundle enviado ao cliente. Não tem interatividade. | Aplicações full-stack com Next.js, Remix | react.dev — React 19 Blog |
| 22 | **'use client'** | Diretiva que marca um componente para execução no cliente (necessário para hooks e eventos). | Componentes interativos em apps com RSC | react.dev — React 19 Blog |
| 23 | **'use server'** | Diretiva que marca uma função como Server Action, executando no servidor. | Formulários, mutations, acesso a DB | react.dev — React 19 Blog |
| 24 | **Server Action** | Função assíncrona que executa no servidor e pode ser chamada diretamente do cliente. | Substitui API routes para operações simples | GeeksforGeeks — React 19 Features |
| 25 | **useActionState** | Hook do React 19 que gerencia estado de pending/erro em ações assíncronas. | Formulários com feedback de estado | react.dev — React 19 API |
| 26 | **useOptimistic** | Hook do React 19 para UI otimista — atualiza interface antes da resposta do servidor. | Curtidas, comentários, ações instantâneas | react.dev — React 19 API |
| 27 | **React Compiler** | Compilador experimental do React 19 que otimiza componentes automaticamente, eliminando necessidade manual de memoização. | Otimização de performance (experimental) | react.dev — React Compiler v1.0 |
EOF
    echo "${GREEN}   ✓ Glossário atualizado (+7 termos do React 19)${NC}"
else
    echo "${YELLOW}   ⚠️  glossario.md não encontrado — pulando atualização${NC}"
fi

# -----------------------------------------------------------
# 5. ATUALIZAR RESUMOS
# -----------------------------------------------------------
echo "${BLUE}📚 Atualizando Resumos com React 19...${NC}"

if [ -f "entregas/resumos_estruturados.md" ]; then
    cat >> entregas/resumos_estruturados.md << 'EOF'

---

## 🗂️ Tópico 6: React 19 — Server Components e Novidades

### Resumo
React 19 representa uma mudança arquitetural significativa com a consolidação dos Server Components (RSC) como padrão. Componentes agora executam no servidor por default, e apenas aqueles que precisam de interatividade (hooks, eventos, estado) são marcados com `'use client'`. Server Actions eliminam a necessidade de criar endpoints API para operações simples. Novos hooks como `useActionState`, `useFormStatus` e `useOptimistic` simplificam o gerenciamento de estado em formulários e ações assíncronas. O React Compiler (experimental) promete otimização automática de performance, eliminando a necessidade manual de `useMemo` e `useCallback`.

### Pontos-chave
- ✅ Server Components = padrão; Client Components = exceção (marcar com `'use client'`)
- ✅ Server Actions substituem API routes para mutations simples
- ✅ `useActionState` gerencia pending/erro automaticamente
- ✅ `useOptimistic` implementa UI otimista sem complexidade
- ✅ React Compiler é experimental — não usar em produção ainda
- ✅ `forwardRef` não é mais necessário (refs como props)

### Relação com outros tópicos
Server Components e Server Actions consolidam o modelo de fluxo de dados (Tópico 3) em uma arquitetura full-stack. Os novos hooks (Tópico 2) complementam a experiência do desenvolvedor, enquanto o React Compiler pode tornar otimizações manuais (Tópico 5) obsoletas no futuro.
EOF
    echo "${GREEN}   ✓ Resumos atualizados (+ Tópico 6: React 19)${NC}"
else
    echo "${YELLOW}   ⚠️  resumos_estruturados.md não encontrado — pulando atualização${NC}"
fi

# -----------------------------------------------------------
# 6. COMMIT
# -----------------------------------------------------------
echo ""
echo "${BLUE}💾 Fazendo commit das atualizações...${NC}"

git add -A
git commit -m "⚛️ feat: atualização com React 19 features

- Novo prompt: Server Components e Server Actions
- Nova cicatriz: confusão RSC vs SSR
- Glossário atualizado: +7 termos do React 19
- Resumos atualizados: Tópico 6 sobre React 19
- Referências: react.dev, GeeksforGeeks, mimacom.com"

echo "${GREEN}   ✓ Commit realizado${NC}"

# -----------------------------------------------------------
# 7. RESUMO
# -----------------------------------------------------------
echo ""
echo "${GREEN}╔════════════════════════════════════════════════════════════╗${NC}"
echo "${GREEN}║  ✅ Caderno atualizado com React 19!                       ║${NC}"
echo "${GREEN}╚════════════════════════════════════════════════════════════╝${NC}"
echo ""
echo "${YELLOW}Novidades adicionadas:${NC}"
echo "  • Prompt 04: Server Components e Server Actions"
echo "  • Cicatriz 04: Confusão RSC vs SSR"
echo "  • Glossário: +7 termos do React 19"
echo "  • Resumos: Tópico 6 sobre React 19"
echo ""
