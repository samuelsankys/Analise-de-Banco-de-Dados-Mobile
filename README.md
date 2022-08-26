# Analise-de-Banco-de-Dados-Mobile

Este projeto tem como propósito o desenvolvimento de um aplicativo que irá realizar testes de desempenho de bancos de dados, por meio de consultas, inserções, exclusões e alterações. O tempo de execução será medido nestas operações. Será utilizado o framework Flutter para o desenvolvimento da aplicação mobile para Android e também serão escolhidos cinco gerenciadores de banco de dados distintos, dentre eles SQL e NoSQL, para a realização dos testes. A finalidade é comparar os resultados nos experimentos e visualizar o de melhor desempenho na realização de cada tipo de operação. Desta forma, auxiliará aos desenvolvedores na tomada de decisão de qual banco de dados melhor atende sua necessidade.

Como é uma tecnologia utilizada em praticamente todos os aplicativos, tal informação ajudará na tomada de decisão da tecnologia que melhor atenda ao usuário e ao propósito do projeto, com isso, evitará modificações e gastos desnecessários.



# Banco de dados

Foram usados 4 bancos de dados NoSQL, sendo eles Couchbase Lite, Sembast, Hive e ObjectBox db. Também foi trabalhado com o SQLite, que se trata de um banco de dados SQL muito utilizado em aplicações móveis.


# Conclusão

Nos experimentos apresentados neste trabalho, é possível verificar que o banco de dados Hive (noSQL), teve o melhor desempenho para todos os tipos de operações, e em cálculos de valores de variância, mostrou-se com valores próximos a zero, mostrando assim, que mantém um comportamento bastante aproximado nas operações realizadas. Além de apresentar uma baixa diferença entre o limite inferior e limite superior, desta forma, tendo dois indicativos de que terá uma grande probabilidade de os resultados trabalharem nessa faixa de valores. O Objectbox foi o segundo banco de dados com melhor desempenho, seus resultados se mantiveram próximos aos resultados do banco de dados Hive. O banco de dados SQLite teve um comportamento mediano, quanto ao desempenho. Em operações de inserção e consulta, ele teve melhor desempenho somente em relação ao Couchbase, já em relação à atualização e exclusão, apresentou o terceiro melhor desempenho atrás do Hive e do ObjectBox. O Sembast somente teve um bom desempenho em operações de inserção, já nas outras operações, ou teve o pior desempenho ou estava com comportamento próximo ao de pior desempenho. O banco de dados Couchbase apresentou o pior desempenho em casos de inserção, com bastante diferença dos demais, e em consultas.
