## Desafios
Aqui estão listadas todos os enunciados de todos os desafios em português. A resolução dos 30 primeiros está na pasta `sql/pt-br` e dos últimos 20 na pasta `sql/eng`, onde também estará listado os últimos 20 desafios porém em inglês.

| Nível | Questões enumeradas |
|-|-|
| [Básico](#nível-básico) | 1 a 10 |
| [Simples](#nível-simples) | 11 a 20 |
| [Intermediário I](#nível-intermediário-i) | 21 a 30 |
| [Intermediário II](#nível-intermediário-ii) | 31 a 40 |
| [Avançado I](#nível-avançado-i) | 41 a 45 |
| [Avançado II](#nível-avançado-ii) | 46 a 50 |

### Nível Básico
1. [x] Liste todos os registros da tabela `terrorism_act` ocorridos no ano de 2010. ([Resolução](/sql/pt-br/questao_01.sql))

2. [x] Liste o `eventid`, `iyear`, `imonth` e `iday` dos ataques que ocorreram no mês de janeiro. ([Resolução](/sql/pt-br/questao_02.sql))

3. [x] Quantos ataques ocorreram no país com `country_id = 217`? ([Resolução](/sql/pt-br/questao_03.sql))

4. [x] Liste os tipos de ataque únicos registrados na base. ([Resolução](/sql/pt-br/questao_04.sql))

5. [x] Liste o nome dos países onde houve pelo menos um ataque em 2015. ([Resolução](/sql/pt-br/questao_05.sql))

6. [x] Conte quantos ataques utilizaram armas do tipo `Explosives`. ([Resolução](/sql/pt-br/questao_06.sql))

7. [x] Mostre os ataques realizados no continente `South America`. ([Resolução](/sql/pt-br/questao_07.sql))

8. [x] Liste os ataques que foram feitos contra o alvo `Private Citizens & Property`. ([Resolução](/sql/pt-br/questao_08.sql))

9. [x] Quantos ataques foram feitos utilizando armas do tipo `Firearms` no ano de 2001? ([Resolução](/sql/pt-br/questao_09.sql))

10. [x] Liste os países com ataques registrados no mês de dezembro. ([Resolução](/sql/pt-br/questao_10.sql))

### Nível Simples
11. [x] Liste os 10 países com maior número de ataques, em ordem decrescente. ([Resolução](/sql/pt-br/questao_11.sql))

12. [x] Para cada ano, mostre quantos ataques aconteceram. ([Resolução](/sql/pt-br/questao_12.sql))

13. [x] Liste os 5 tipos de armas mais utilizadas em ataques. ([Resolução](/sql/pt-br/questao_13.sql))

14. [x] Para cada continente, exiba a quantidade total de ataques. ([Resolução](/sql/pt-br/questao_14.sql))

15. [x] Liste os países da região `Middle East & North Africa` com ataques e quantos ocorreram em cada. ([Resolução](/sql/pt-br/questao_15.sql))

16. [x] Liste os 5 anos com mais ataques utilizando o tipo de ataque `Bombing/Explosion`. ([Resolução](/sql/pt-br/questao_16.sql))

17. [x] Mostre a média de ataques por país ao longo de todos os anos. ([Resolução](/sql/pt-br/questao_17.sql))

18. [x] Liste os países que sofreram ataques com mais de um tipo diferente de arma. ([Resolução](/sql/pt-br/questao_18.sql))

19. [x] Para cada tipo de alvo, mostre a soma de ataques registrados com armas incendiárias. ([Resolução](/sql/pt-br/questao_19.sql))

20. [x] Liste os ataques que envolveram alvos diplomáticos e armas do tipo `Fake Weapons`. ([Resolução](/sql/pt-br/questao_20.sql))

### Nível Intermediário I
21. [x] Liste os países com aumento de número de ataques do ano 2000 para 2001. ([Resolução](/sql/pt-br/questao_21.sql))

22. [x] Encontre o país que teve o maior número de ataques com o tipo `Hostage Taking (Kidnapping)`. ([Resolução](/sql/pt-br/questao_22.sql))

23. [x] Para cada país, mostre o tipo de ataque mais comum. ([Resolução](/sql/pt-br/questao_23.sql))

24. [x] Liste os 3 países com maior diversidade de tipos de armas utilizadas. ([Resolução](/sql/pt-br/questao_24.sql))

25. [x] Encontre a região com a maior média de ataques por ano. ([Resolução](/sql/pt-br/questao_25.sql))

26. [x] Liste todos os países onde foram registrados ataques com armas biológicas, químicas ou radiológicas. ([Resolução](/sql/pt-br/questao_26.sql))

27. [x] Utilize uma CTE para listar os países com ataques em todos os anos entre 2005 e 2010. ([Resolução](/sql/pt-br/questao_27.sql))

28. [x] Liste os pares de países que ocorreram no mesmo ano, na mesma região e com o mesmo tipo de ataque. ([Resolução](/sql/pt-br/questao_28.sql))

29. [x] Encontre o país com maior número de ataques contra alvos civis (`Private Citizens & Property`) usando `Firearms`. ([Resolução](/sql/pt-br/questao_29.sql))

30. [x] Crie uma consulta que classifique os países por um `índice de periculosidade`, definido como:
    ```
    soma total de ataques / (variedade de armas utilizadas * variedade de tipos de ataque)
    ```  
    ([Resolução](/sql/pt-br/questao_30.sql))

### Nível Intermediário II (ENG)
31. [x] Mostrar quantos países tem o percentual de atentados bem sucedidos que estão acima da média total da tabela e a diferença percentual de cada. ([Resolução](/sql/eng/questao_31.sql))

32. [x] Liste os 10 países com maior proporção de ataques contra propriedades privadas em relação ao total de ataques nesses países. Inclua o percentual e ordene do maior para o menor. ([Resolução](/sql/eng/questao_32.sql))

33. [x] Para cada tipo de arma, mostre o número médio de ataques bem-sucedidos por região. ([Resolução](/sql/eng/questao_33.sql))

34. [x] Para cada ano, calcule a proporção de atentados com alvo diplomático e arma explosiva em relação ao total de atentados naquele ano. Liste os 5 anos com maior proporção e mostre o percentual. ([Resolução](/sql/eng/questao_34.sql))

35. [x] Encontre os países onde mais de 50% dos ataques utilizam o mesmo tipo de ataque (ex: `Bombing/Explosion`). Mostre o país, o tipo de ataque e a proporção. ([Resolução](/sql/eng/questao_35.sql))

36. [x] Para cada região, informe o país com maior quantidade de ataques em anos múltiplos de 5 (ex: 1970, 1975, etc.).
    1. [x] Para cada ano múltiplo de 5 (ex: 1970, 1975, 1980, etc.) e para cada região, identifique o país com maior número de atentados naquele ano. ([Resolução](/sql/eng/questao_36.1.sql))

    2. [x] Considerando apenas os anos múltiplos de 5 (ex: 1970, 1975, 1980, etc.), identifique para cada região o país que acumulou o maior número total de ataques ao longo desses anos. ([Resolução](/sql/eng/questao_36.2.sql))

37. [x] Calcule o percentual de ataques bem-sucedidos para cada tipo de ataque. Ordene do maior para o menor e mostre apenas aqueles com pelo menos 100 registros. ([Resolução](/sql/eng/questao_37.sql))

38. [x] Liste os cinco países com maior número de ataques em áreas sem identificação de cidade. Mostre a quantidade e o percentual em relação ao total do país. ([Resolução](/sql/eng/questao_38.sql))

39. [x] Para cada tipo de alvo, mostre o país com maior número de ataques. Inclua o total de ataques e ordene os resultados pelo tipo de alvo em ordem alfabética. ([Resolução](/sql/eng/questao_39.sql))

40. [x] Liste os três anos com o maior crescimento percentual de ataques em relação ao ano anterior. Ignore os anos com menos de 100 ataques. ([Resolução](/sql/eng/questao_40.sql))

### Nível Avançado I (ENG)
41. [x] Para cada região, calcule um “índice de instabilidade” definido como:
    ```
    (número total de tipos diferentes de ataques por país) x (percentual fracionário médio de ataques bem-sucedidos na região)
    ```
    Liste as regiões com seus índices, ordenadas do maior para o menor.  ([Resolução](/sql/eng/questao_41.sql))

42. [x] Liste os cinco pares de países com maior número de ataques usando armas químicas, biológicas ou radiológicas. Inclua o ano do par, a quantidade de ataques e o tipo de arma mais comum usado por ambos. ([Resolução](/sql/eng/questao_42.sql))

43. [x] Mostre, para cada país, a diferença percentual entre o total de ataques e o total de ataques bem-sucedidos. Liste apenas os países com pelo menos 100 ataques. ([Resolução](/sql/eng/questao_43.sql))
s
44. [x] Liste os cinco países com a maior média de tipos diferentes de ataque por ano (variedade anual).
    Ex: se um país teve 3 tipos em 2001, 2 em 2002, 5 em 2003, calcule a média dessas quantidades. ([Resolução](/sql/eng/questao_44.sql))

45. [x] Para cada década, mostre o país mais letal (com maior número total de mortes atribuídas a ataques) e o tipo de ataque mais utilizado por esse país na década. ([Resolução](/sql/eng/questao_45.sql))

### Nível Avançado II (ENG)
46. [x] Para cada país que teve ataques em 3 anos consecutivos ou mais, identifique os países cuja quantidade de ataques cresceu ano a ano nesses períodos. Liste o país, os anos em que isso ocorreu, e o número de ataques em cada ano.

47. [x] Para cada região, identifique o tipo de ataque que resultou no maior número médio de mortos por evento, considerando apenas eventos entre 2000 e 2010. Liste a região, o tipo de ataque, e a média de fatalidades.

48. [x] Identifique grupos de ataques coordenados, ou seja, eventos no mesmo país, no mesmo dia, com o mesmo tipo de ataque. Liste os países com mais ocorrências desse tipo, o número de vezes que isso aconteceu, e os anos mais comuns desses ataques.

49. [x] Para cada tipo de alvo, calcule a eficácia dos atentados definida como:
    ```
    (número de ataques bem-sucedidos) / (número total de ataques ao alvo)
    ```
    Liste os alvos com eficácia acima de 75%, ordenados do mais eficaz ao menos.

50. [ ] Crie uma métrica de risco relativo de atentado para cada país, definida como:
    ```
    (ataques por milhão de habitantes)
    ```
    Considere apenas países com população conhecida em uma tabela auxiliar fictícia chamada population(country_id, population_millions) e ordene os países do mais ao menos "perigosos".