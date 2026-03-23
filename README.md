# Indicium Academy Lighthouse — Desafio de Dados

Este repositório contém a resolução completa do desafio Lighthouse para a vaga de Trainee de Dados da Indicium Academy. O desafio simula um cenário real de uma empresa náutica com dados desorganizados, cobrindo desde a limpeza e modelagem até previsão de demanda e sistemas de recomendação.

---

## Contexto do Desafio

A LH Nautics está prestes a lançar uma campanha e os dados estão em estado bruto. Gabriel Santos, Tech Lead da empresa, enviou as bases e definiu a missão: *"Eu valorizo mais a organização e a explicação do que o código rodando sem eu entender nada."*

O trabalho foi dividido em 8 frentes:

| # | Frente | Descrição |
|---|---|---|
| 1 | EDA | Análise exploratória do dataset de vendas |
| 2 | Tratamento de Dados | Limpeza do catálogo de produtos |
| 3 | Engenharia de Dados | Normalização do JSON de custos de importação |
| 4 | Dados Públicos | Cruzamento com câmbio do Banco Central para identificar prejuízo |
| 5 | Análise de Clientes | Ranking de clientes fiéis por ticket médio |
| 6 | Dimensão de Calendário | Cálculo correto de médias por dia da semana |
| 7 | Previsão de Demanda | Modelo baseline com média móvel (MA7) |
| 8 | Recomendação | Sistema de recomendação por similaridade de cosseno |

---

## Estrutura do Projeto

```
lighthouse_project/
│
├── data/
│   ├── raw/                        # Dados brutos (nunca modificados)
│   │   ├── vendas_2023_2024.csv
│   │   ├── produtos_raw.csv
│   │   ├── custos_importacao.json
│   │   └── clientes_crm.json
│   └── processed/                  # Dados tratados e outputs
│       ├── produtos_clean.csv
│       ├── custos_importacao_normalizado.csv
│       ├── clientes_elite.csv
│       ├── prejuizo_por_produto.csv
│       └── vendas_com_custo.csv
│
├── notebooks/
│   ├── 01_eda.ipynb                # Análise exploratória
│   ├── 02_produtos.ipynb           # Limpeza de produtos
│   ├── 03_custos.ipynb             # Normalização de custos
│   ├── 04_custos_prejuizo.ipynb    # Análise de prejuízo + SQL
│   ├── 05_cliente_analise.ipynb    # Ranking de clientes
│   ├── 06_calendario.ipynb         # Dimensão de datas
│   ├── 07_previsao_demanda.ipynb   # Modelo de previsão MA7
│   └── 08_recomendacao.ipynb       # Sistema de recomendação
│
│
├── sql/
│   ├── query_calculo.sql           # Cálculo total de linhas
│   ├── query_prejuizo.sql          # Prejuízo por produto
│   └── query_calendario.sql        # Médias por dia da semana
│
├── database/
│   └── lighthouse.db               # Banco SQLite gerado pelos notebooks
│
└── README.md
```

---

## Bases de Dados

| Arquivo | Descrição | Problemas encontrados |
|---|---|---|
| `vendas_2023_2024.csv` | 9.895 transações de 2023 e 2024 | Datas em dois formatos (`YYYY-MM-DD` e `DD-MM-YYYY`) |
| `produtos_raw.csv` | Catálogo com 150 produtos únicos | 39 variações de categoria, 7 linhas duplicadas, preço como string |
| `custos_importacao.json` | Histórico de custo em USD por produto | Estrutura aninhada (`historic_data`), precisava ser normalizada |
| `clientes_crm.json` | 49 clientes cadastrados | 30/49 e-mails com `#` no lugar de `@`, campo `location` desestruturado |

---

## Tecnologias utilizadas

| Tecnologia | Uso |
|---|---|
| Python 3.12 | Processamento, análise e modelagem |
| pandas | Manipulação de dados |
| numpy | Cálculos numéricos |
| scikit-learn | Similaridade de cosseno |
| matplotlib | Visualizações |
| SQLite | Banco de dados relacional |
| Jupyter Notebook | Desenvolvimento e documentação |
| Git | Versionamento |

---

## Como executar

**1. Clone o repositório e crie o ambiente virtual:**
```bash
git clone https://github.com/renanmoreiraa/lighthouse-project.git
cd lighthouse_project
python -m venv .venv
source .venv/bin/activate      # Linux/Mac
.venv\Scripts\activate         # Windows
```

**2. Instale as dependências:**
```bash
pip install pandas numpy scikit-learn matplotlib requests jupyter
```

**3. Execute os notebooks em ordem:**
```bash
jupyter notebook
```

Os notebooks devem ser executados na sequência numérica. Os notebooks 04 e 06 dependem do banco `lighthouse.db` gerado pelos passos anteriores.
