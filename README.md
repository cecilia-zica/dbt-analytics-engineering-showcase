# dbt — analytics engineering

Estudos de dbt (data build tool), a parte de transformação de dados no fluxo de
analytics engineering. O conjunto de dados é o `jaffle_shop`, usado nos
materiais oficiais da dbt.

## Objetivo

Aprender a modelar dados com dbt na prática: separar camadas (staging e marts),
definir a estratégia de materialização certa para cada modelo, e escrever
testes para garantir a qualidade dos dados.

## O que tem aqui

O repositório junta dois projetos dbt:

- **`dbt_fundamentals/`** — acompanha o curso dbt Fundamentals. Modelos
  organizados em:
  - `staging/` — limpeza e renomeação a partir das fontes (`jaffle_shop`,
    `stripe`).
  - `marts/` — modelos de negócio: `dim_customers` (com lifetime value),
    `fct_orders`.
- **`dbt_testes/jaffle_shop/`** — o projeto `jaffle_shop` completo, com seeds,
  macros e uma camada de modelos mais extensa para praticar.

## Conceitos praticados

- Camadas staging → marts
- Fontes (`source`) e referências (`ref`)
- Estratégia de materialização (view, table)
- Testes de dados e macros
