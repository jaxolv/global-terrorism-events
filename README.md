# 🌍 Atentados Terroristas ao Redor do Mundo

Este projeto utiliza o [Global Terrorism Dataset (GTD)](https://www.kaggle.com/datasets/START-UMD/gtd) para fins de **estudo**, **documentação** e **demonstração de habilidades técnicas** em **SQL, Python e Power BI**. Trata-se de um projeto pessoal, mas estruturado para servir de portfólio público.

---

## 🎯 Objetivos do Projeto

- Realizar **50 desafios de SQL**, divididos em níveis de dificuldade, a partir da base GTD.
- Criar um pipeline de **ETL em Python** para manipulação e exportação dos dados.
- Construir **dashboards em Power BI** para visualização interativa.
- Utilizar boas práticas de versionamento com **Git e GitHub**.

---

## 🚀 Estrutura de Branches

Este projeto segue um fluxo de trabalho organizado por funcionalidades:

| Branch        | Função                                                        |
|---------------|---------------------------------------------------------------|
| `scripts`     | Scripts Python de ETL, conexão com banco, exportações, etc.   |
| `sql_csv`     | Consultas SQL e arquivos CSV resultantes                      |
| `dashboards`  | Imagens, arquivos `.pbix` e outras saídas visuais             |
| `stage`       | Integração intermediária de todos os recursos antes da `main` |
| `main`        | Versão final e estável, pronta para apresentação no GitHub    |

---

## 📁 Estrutura de Diretórios
```
global-terrorism-events
│
├── sql/                # Consultas SQL (desafios enumerados)
├── scripts/            # Scripts em Python (ETL, conexões, helpers)
├── dashboards/         # Arquivos .pbix do Power BI
├── images/             # Imagens auxiliares
├── docs/               # Documentos usados para criar o dataset ou informações relacionadas
├── csv/                # CSVs extraídos via script
├── README.md           # Você está aqui! 
├── env.example         # Tratativa de dados sensíveis para versionamento
├── .gitignore          # Arquivos/pastas ocultas no GitHub
├── requirements.txt    # Requisitos para execução desse projeto em máquina local
```

## 🧠 Conteúdo dos Desafios SQL
Os desafios foram organizados em níveis de dificuldade:

| Nível            | Questões enumeradas  |
|------------------|----------------------|
| Básico           | 1 - 10               |
| Simples          | 11 - 20              |
| Intermediário I  | 21 - 30              |
| Intermediário II | 31 - 40              |
| Avançado I       | 41 - 45              |
| Avançado II      | 46 - 50              |

As questões podem ser visualizadas no diretório [sql](sql) (nos comentários de cada questão) ou no PDF presente no arquivo `.rar` em [docs](docs).

## 📊 Dashboards
Abaixo serão adicionadas imagens de dashboards criados no Power BI como exemplo.

### Questão 30: Índice de Periculosidade
Para cada país, foi calculado o "Índice de Periculosidade", onde foi dividido o número total de ataques registrados desde 1970 pelo produto entre variedade de armas usadas e variedade de ataques. Essa métrica mediria quão "perigoso" é um país em termos de atentados terroristas, independente seus alvos, quem planejou/executou ou métodos usados. Na imagem, têm-se os 10 países com maiores Índices de Periculosidade.

![10 países com os maiores índices de periculosidade](images/questao_30_grafico_barras.png)

## 📌 Avisos
1) Este projeto é educacional e não possui fins comerciais. As análises foram produzidas com base em dados públicos do Kaggle, e servem como demonstração de habilidades técnicas.
2) Caso queira, você pode baixar os documentos que usei para este projeto, incluindo os desafios em PDF. Todos estão no arquivo `.rar` em [docs](docs), incluindo os CSVs das tabelas adaptadas para esse projeto.

## 📬 Contato
Você encontrará meus contatos no `README` do meu perfil aqui no Github: [github.com/jaxolv](https://github.com/jaxolv)

## Se leu até aqui:
Desde já, agradeço pela atenção.

Sigo à disposição para contato.