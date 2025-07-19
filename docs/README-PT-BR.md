Esse projeto também tem uma versão em Inglês: :us: [Read In English](/README.md)

# Atentados Terroristas ao Redor do Mundo

Este projeto utiliza o dataset [Global Terrorism (GTD)](https://www.kaggle.com/datasets/START-UMD/gtd) para fins de **estudo**, **documentação** e **demonstração de habilidades técnicas** em **SQL, Python e Power BI**. Trata-se de um projeto pessoal, mas estruturado para servir de portfólio público.

---

## Sumário
1. [Objetivos do Projeto](#-objetivos-do-projeto)
2. [Estruturas](#estruturas)

    2.1 [Branches](#-branches)

    2.2 [Diretórios](#-diretórios)
3. [Conteúdo dos Desafios SQL](#-conteúdo-dos-desafios-sql)
   
    3.1 [Desafios](sql/DESAFIOS.md)
4. [Importação de dados](#-importando-o-dataset-para-sua-máquina-local)
5. [Dashboards](#-dashboards)
6. [Avisos](#-avisos) e [contatos](#-contato)
7. [Agradecimentos](#se-leu-até-aqui)

---

## Objetivos do Projeto

- Realizar **50 desafios de SQL**, divididos em níveis de dificuldade, a partir de uma adaptação que fiz da base GTD;
- Criar um pipeline de **ETL em Python** para manipulação e exportação dos dados;
- Construir **dashboards em Power BI** para visualização interativa;
- Utilizar boas práticas de versionamento com **Git e GitHub**.

---

## Estruturas

### Branches

Este projeto segue um fluxo de trabalho organizado por funcionalidades:

| Branch | Função |
|-|-|
| `scripts` | Scripts Python de ETL, conexão com banco, exportações, etc. |
| `sql` | Consultas SQL |
| `dashboards` | Imagens, arquivos `.pbix` e outras saídas visuais |
| `stage` | Integração intermediária de todos os recursos antes da `main` |
| `main` | Versão final e estável, pronta para apresentação no GitHub |

---

### Diretórios
```
/csv                # CSVs extraídos via script
/dashboards         # Arquivos .pbix do Power BI
/docs               # Documentos usados para criar o dataset ou informações relacionadas
/images             # Imagens auxiliares
/scripts            # Scripts em Python (ETL, conexões, helpers)
/sql                # Consultas SQL (desafios enumerados)
/tools              # Documentos e scripts técnicos para gerenciamento interno do projeto e versionamento
.env.example        # Tratativa de dados sensíveis para versionamento
.gitignore          # Arquivos/pastas ocultas no GitHub
README.md           # Você está aqui! 
.requirements.txt   # Requisitos para execução desse projeto em máquina local
```

---

## Conteúdo dos Desafios SQL
Os desafios foram organizados em níveis de dificuldade, indo do mais básico ao mais avançado. Caso queira ver com mais detalhes, clique [aqui](sql/DESAFIOS.md) para ir diretamente à página contendo todas as questões.

---

## Importando o Dataset para Sua Máquina Local
Caso queira praticar ou apenas executar as queries aqui postadas em sua máquina local, siga este passo-a-passo clicando [aqui](https://github.com/jaxolv/brazilian-e-commerce/blob/main/docs/IMPORT_DATA_PT-BR.md). Esse é o exemplo do repositório [Brazilian E-Commerce Dataset](https://github.com/jaxolv/brazilian-e-commerce), mas também se aplica a esse projeto.

---

## Dashboards
Abaixo serão adicionadas imagens de dashboards criados no Power BI como exemplo.

### Questão 30: Índice de Periculosidade
Para cada país, foi calculado o "Índice de Periculosidade", onde foi dividido o número total de ataques registrados desde 1970 pelo produto entre variedade de armas usadas e variedade de ataques. Essa métrica mediria quão "perigoso" é um país em termos de atentados terroristas, independente dos seus alvos, quem planejou/executou ou métodos usados. Na imagem, têm-se as regiões ao redor do mundo dos 8 países com maiores Índices de Periculosidade.

![Regiões dos 8 países com maiores índices de periculosidade](/images/questao_30_grafico_de_donut.png)

### Questão 41: Índice de Instabilidade
Para cada região do mundo foi encontrado o "Índice de Instabilidade", baseado no produto do número total de diferentes ataques por país pelo percentual fracionário médio de ataques bem-sucedidos na região. Esse número vai de encontro à tabela exibida anteriormente, já que nele podemos identificar que os primeiros lugares são as mesmas regiões, porém nota-se que agora outras regiões da Europa surgem entre os 5 primeiros, mostrando que não são métricas espelhadas entre si e que há indícios de que a taxa de sucessos dos ataques pode ser determinante para este novo ranking.

![Índice de instabilidade por região em ordem decrescente](/images/questao_41_grafico_de_barras.png)

Quando agrupamos por continentes, vemos que regiões da África continuam à frente, mas a Europa assume o segundo lugar, seguido pelas Américas, Ásia e por último a Região da Oceania.

![Continentes divididos por índice de instabilidade](/images/questao_41_grafico_cascata.png)

---

## Avisos
1) Este projeto é educacional e não possui fins comerciais. As análises foram produzidas com base em dados públicos do Kaggle, e servem como demonstração de habilidades técnicas.
2) Caso queira, você pode baixar os documentos que usei para este projeto, incluindo os desafios em PDF. Todos estão no arquivo `.rar` em [docs](docs), incluindo os CSVs das tabelas adaptadas para esse projeto.

## Contato
Você encontrará meus contatos no `README` do meu perfil aqui no Github: [github.com/jaxolv](https://github.com/jaxolv)

---

## Se leu até aqui:
Desde já, agradeço pela tempo e atenção. Estou à disposição caso queira entrar em contato.

Logo abaixo estão outros projetos em que trabalhei. Fique à vontade para consultar:

| Tipo de projeto | Nome | Repositório |
| - | - | - |
| Dataset do site Kaggle | Ataques Terroristas no Mundo | global-terrorism-events |
| Dataset do site Kaggle | Comércio Digital Brasileiro | [brazilian-e-commerce](https://github.com/jaxolv/brazilian-e-commerce) |
