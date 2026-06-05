# Prompt 3 — Custom Hooks: Quando e Como Criar

## 📝 Versão Final do Prompt (v2.0)

```text
Com base nas fontes carregadas (especialmente Dev.to e react.dev), explique:
1. A estrutura mínima de um custom hook válido (regras de nomenclatura e hooks internos)
2. Um exemplo completo de useLocalStorage<T> com TypeScript
3. Uma checklist de 3 perguntas para decidir SE extrair um custom hook
4. Dois anti-padrões comuns e como evitá-los
5. A convenção de organização por domínio (features/) vs. por tipo (hooks/)
```

## 🤖 Resposta Obtida (Resumida)

### 1. Estrutura Mínima de um Custom Hook Válido

```tsx
// ✅ Correto: prefixo "use", hooks no topo, retorno de valores/funções
function useLocalStorage<T>(key: string, initialValue: T) {
  const [storedValue, setStoredValue] = useState<T>(() => {
    try {
      const item = window.localStorage.getItem(key);
      return item ? JSON.parse(item) : initialValue;
    } catch {
      return initialValue;
    }
  });

  const setValue = (value: T | ((val: T) => T)) => {
    try {
      const valueToStore = value instanceof Function ? value(storedValue) : value;
      setStoredValue(valueToStore);
      window.localStorage.setItem(key, JSON.stringify(valueToStore));
    } catch (error) {
      console.error(`Error setting localStorage key "${key}":`, error);
    }
  };

  return [storedValue, setValue] as const;
}
```

**Regras inegociáveis:**
- Prefixo obrigatório: `use` (ex: `useAuth`, `useLocalStorage`)
- Hooks internos chamados apenas no topo (Regra dos Hooks)
- Retorno de valores e/ou funções para o componente consumidor

### 2. Exemplo Completo: useLocalStorage<T> com TypeScript

```tsx
// features/auth/useAuth.ts
import { useState, useEffect, useCallback } from 'react';

interface User {
  id: string;
  email: string;
  name: string;
}

export function useAuth() {
  const [user, setUser] = useState<User | null>(null);
  const [isLoading, setIsLoading] = useState(true);

  const login = useCallback(async (email: string, password: string) => {
    const response = await fetch('/api/login', {
      method: 'POST',
      body: JSON.stringify({ email, password }),
    });
    const data = await response.json();
    setUser(data.user);
    localStorage.setItem('token', data.token);
  }, []);

  const logout = useCallback(() => {
    setUser(null);
    localStorage.removeItem('token');
  }, []);

  useEffect(() => {
    const token = localStorage.getItem('token');
    if (token) {
      // Validar token e restaurar sessão
      validateToken(token).then(setUser).finally(() => setIsLoading(false));
    } else {
      setIsLoading(false);
    }
  }, []);

  return { user, isLoading, login, logout };
}
```

### 3. Checklist: Decidir SE Extrair um Custom Hook

| Pergunta | Se SIM → Extraia | Se NÃO → Mantenha no componente |
|----------|------------------|--------------------------------|
| **A lógica é reutilizada em múltiplos componentes?** | Crie `useXxx` | Deixe inline |
| **A lógica envolve hooks do React (useState, useEffect, etc.)?** | Crie `useXxx` | Use função utilitária comum |
| **Extrair melhora testabilidade ou legibilidade do componente?** | Crie `useXxx` | Deixe inline |

> **Regra de ouro:** Se 2 das 3 forem SIM, extraia. Se apenas 1 for SIM, avalie caso a caso.

### 4. Dois Anti-Padrões Comuns

#### Anti-padrão 1: Abstração Prematura
```tsx
// ❌ Ruim: hook usado em apenas 1 componente, sem lógica de lifecycle
function useFormatDate(date: Date) {
  return date.toLocaleDateString('pt-BR');
}
// → Use uma função utilitária comum: formatDate(date)
```

#### Anti-padrão 2: Hook sem Hooks Internos
```tsx
// ❌ Ruim: função com prefixo "use" mas sem chamar nenhum hook do React
function useCalculateTotal(items: Item[]) {
  return items.reduce((sum, item) => sum + item.price, 0);
}
// → Use uma função utilitária comum: calculateTotal(items)
```

### 5. Organização: features/ vs. hooks/

```
# ❌ Organização por tipo (anti-padrão em projetos grandes)
src/
  hooks/
    useAuth.ts
    useCart.ts
    useLocalStorage.ts
  components/
    AuthForm.tsx
    CartList.tsx

# ✅ Organização por domínio (recomendado)
src/
  features/
    auth/
      useAuth.ts          # hook específico do domínio
      AuthForm.tsx        # componente do domínio
      auth.types.ts       # tipos compartilhados
    cart/
      useCart.ts
      CartList.tsx
      cart.types.ts
  shared/
    hooks/
      useLocalStorage.ts  # hook genérico, usado por múltiplos domínios
```

> **Princípio:** Hooks específicos de domínio ficam junto com seus componentes. Hooks genéricos (useLocalStorage, useDebounce) ficam em `shared/hooks/`.

## 🔍 Referências Citadas pela IA
- Dev.to — Mastering Custom React Hooks (seções de naming, file structure, when NOT to use)
- react.dev — Building Your Own Hooks
- Smashing Magazine — Regras de Hooks

## 🔄 Evolução do Prompt

| Versão | Prompt | Problema | Ajuste |
|--------|--------|----------|--------|
| v1.0 | `Como criar um custom hook em React?` | Resposta técnica correta, mas sem orientação sobre QUANDO abstrair vs. deixar no componente | Adicionei checklist de decisão + anti-padrões + convenção de organização |
| v2.0 | Prompt atual | ✅ Resposta com estrutura, exemplo real, critérios de decisão e anti-padrões | — |

---
> 🏆 **Classificação:** Prompt Ouro 🥉
> 💡 **Quando usar:** Refatoração de componentes grandes, code review, decisão de arquitetura de projeto
