## Challenges
Here's listed the last 20 challenges made in SQL.

| Level | Enumerated challenges |
|-|-|
| [Intermediate II](#intermediate-ii) | 31 a 40 |
| [Advanced I](#advanced-i) | 41 a 45 |
| [Advanced II](#advanced-ii) | 46 a 50 |

### Intermediate II
31. [x] Show how many countries have a percentage of successful attacks above the overall table average and the percentage difference for each. ([Answear](/sql/eng/questao_31.sql))

32. [x] List the 10 countries with the highest proportion of attacks against private properties relative to the total number of attacks in those countries. Include the percentage and order from highest to lowest. ([Answear](/sql/eng/questao_32.sql))

33. [x] For each weapon type, show the average number of successful attacks per region. ([Answear](/sql/eng/questao_33.sql))

34. [x] For each year, calculate the proportion of attacks targeting diplomatic entities with explosive weapons relative to the total number of attacks that year. List the top 5 years with the highest proportion and show the percentage. ([Answear](/sql/eng/questao_34.sql))

35. [x] Find the countries where more than 50% of attacks use the same attack type (e.g., `Bombing/Explosion`). Show the country, the attack type, and the proportion. ([Answear](/sql/eng/questao_35.sql))

36. [x] For each region, report the country with the highest number of attacks in years that are multiples of 5 (e.g., 1970, 1975, etc.).
    1. [x] For each year that is a multiple of 5 (e.g. 1970, 1975, 1980, etc.) and for each region, identify the country with the highest number of attacks in that year. ([Answear](/sql/eng/questao_36.1.sql))

    2. [x] Considering only years that are multiples of 5 (e.g. 1970, 1975, 1980, etc.), identify for each region the country that accumulated the highest total number of attacks over these years. ([Answear](/sql/eng/questao_36.2.sql))

37. [x] Calculate the percentage of successful attacks for each attack type. Order from highest to lowest and show only those with at least 100 records. ([Answear](/sql/eng/questao_37.sql))

38. [x] List the five countries with the highest number of attacks in areas with unidentified cities. Show the quantity and the percentage relative to the country’s total. ([Answear](/sql/eng/questao_38.sql))

39. [x] For each target type, show the country with the highest number of attacks. Include the total number of attacks and sort the results by target type in alphabetical order. ([Answear](/sql/eng/questao_39.sql))

40. [x] List the three years with the highest percentage growth in attacks compared to the previous year. Ignore years with fewer than 100 attacks. ([Answear](/sql/eng/questao_40.sql))

### Advanced I
41. [x] For each region, calculate an "instability index" defined as:
    ```
    (total number of different attack types per country) x (average fractional percentage of successful attacks in the region)
    ```
    List the regions with their indexes, ordered from highest to lowest. ([Answear](/sql/eng/questao_41.sql))

42. [x] List the five country pairs with the highest number of attacks using chemical, biological, or radiological weapons. Include the year for each pair, the number of attacks, and the most common weapon type used by both. ([Answear](/sql/eng/questao_42.sql))

43. [x] Show, for each country, the percentage difference between the total number of attacks and the total number of successful attacks. List only countries with at least 100 attacks. ([Answear](/sql/eng/questao_43.sql))

44. [x] List the five countries with the highest average number of different attack types per year (annual variety).  
    Example: If a country had 3 types in 2001, 2 in 2002, and 5 in 2003, calculate the average of these values. ([Answear](/sql/eng/questao_44.sql))

45. [x] For each decade, show the most lethal country (with the highest total number of deaths attributed to attacks) and the most commonly used attack type by that country in the decade. ([Answear](/sql/eng/questao_45.sql))

### Advanced II
46. [ ] For each country that had attacks in 3 or more consecutive years, identify the countries where the number of attacks increased year over year during those periods. List the country, the years when this occurred, and the number of attacks per year.

47. [ ] For each region, identify the attack type that resulted in the highest average number of deaths per event, considering only events between 2000 and 2010. List the region, the attack type, and the average fatalities.

48. [ ] Identify groups of coordinated attacks, meaning events in the same country, on the same day, using the same attack type. List the countries with the most occurrences of this kind, the number of times it happened, and the most common years for these attacks.

49. [ ] For each target type, calculate the attack effectiveness defined as:
    ```
    (number of successful attacks) / (total number of attacks on that target)
    ```
    List the targets with effectiveness above 75%, ordered from most to least effective.

50. [ ] Create a relative attack risk metric for each country, defined as:
    ```
    (attacks per million inhabitants)
    ```
    Consider only countries with known population data in a fictional auxiliary table called population(country_id, population_millions) and order the countries from most to least "dangerous".
