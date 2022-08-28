# Analise-de-Banco-de-Dados-Mobile

Este projeto tem como propósito o desenvolvimento de um aplicativo que irá realizar testes de desempenho de bancos de dados, por meio de consultas, inserções, exclusões e alterações. O tempo de execução será medido nestas operações. Será utilizado o framework Flutter para o desenvolvimento da aplicação mobile para Android e também serão escolhidos cinco gerenciadores de banco de dados distintos, dentre eles SQL e NoSQL, para a realização dos testes. A finalidade é comparar os resultados nos experimentos e visualizar o de melhor desempenho na realização de cada tipo de operação. Desta forma, auxiliará aos desenvolvedores na tomada de decisão de qual banco de dados melhor atende sua necessidade.

Como é uma tecnologia utilizada em praticamente todos os aplicativos, tal informação ajudará na tomada de decisão da tecnologia que melhor atenda ao usuário e ao propósito do projeto, com isso, evitará modificações e gastos desnecessários.



# Banco de dados

Bancos de dados utilizados:
- Couchbase Lite
- Sembast
- Hive
- Object Box
- SQLite


# Preview da Aplicação
## Telas iniciais
Na primeira tela é possível escolher quais bancos deseja-se realizar o experimento.
Para a realização dos experimento é necessário inserir a quantidade de operações que devem ser realizadas no campo (N). E inserir a quantidade de repetições dessas operações (R).
<div>
  <img src="https://user-images.githubusercontent.com/39534805/187055466-f221741f-41aa-4112-a13c-0876d088473e.jpeg" width="230">
  <img src="https://user-images.githubusercontent.com/39534805/187055484-5e9f0758-badc-4481-8db8-3c1e3f4ebe8e.jpeg" width="230">
</div>

## Resultados

As telas de resultados estão divididas em 4 partes conforme imagens abaixo.

<div>
  <img src="https://user-images.githubusercontent.com/39534805/187055580-ee1ba4ae-b2a3-43d6-912c-db757e2c7778.jpeg" width="230">
  <img src="https://user-images.githubusercontent.com/39534805/187055579-6c6e6903-aaf8-4815-aea9-840fd5c99aa2.jpeg" width="230">
  <img src="https://user-images.githubusercontent.com/39534805/187055587-eced7372-acb3-49f2-98d5-d2b8d91fa447.jpeg" width="230">
  <img src="https://user-images.githubusercontent.com/39534805/187055592-3e039acc-2416-412e-8dba-9f64c2ea7352.jpeg" width="230">
  <img src="https://user-images.githubusercontent.com/39534805/187055611-07ed16b1-54b4-4aee-b5c8-89635e52d889.jpeg" width="230">
  <img src="https://user-images.githubusercontent.com/39534805/187055619-257d96a4-7c23-449f-bd65-283b1e16dcd9.jpeg" width="230">
  <img src="https://user-images.githubusercontent.com/39534805/187055627-90fc7e48-61cf-4908-8314-e52dc1ea7eda.jpeg" width="230">
  <img src="https://user-images.githubusercontent.com/39534805/187055633-87ee3468-db24-42a2-a7b1-38780b1ee444.jpeg" width="230">
  <img src="https://user-images.githubusercontent.com/39534805/187055627-90fc7e48-61cf-4908-8314-e52dc1ea7eda.jpeg" width="230">
  <img src="https://user-images.githubusercontent.com/39534805/187055649-2554636e-5fb6-48ab-82d3-489af9844e25.jpeg" width="230">
 
</div>

### Gráficos por operação

<div>
  <img src="https://user-images.githubusercontent.com/39534805/187055668-5db7864b-4e1c-47f1-baab-1bb5fbc72e85.jpeg" width="230">
  <img src="https://user-images.githubusercontent.com/39534805/187055669-9fcf6c91-5577-46d2-8366-5c0dea0be07b.jpeg" width="230">
  <img src="https://user-images.githubusercontent.com/39534805/187055671-ac56b28b-0708-4ff4-9d09-79699f8b5eb9.jpeg" width="230">
  <img src="https://user-images.githubusercontent.com/39534805/187055683-564cf3e9-03e2-4f3d-8bae-a7ffaa3215b6.jpeg" width="230">
</div>

# Conclusão

Nos experimentos apresentados neste trabalho, é possível verificar que o banco de dados Hive (noSQL), teve o melhor desempenho para todos os tipos de operações, e em cálculos de valores de variância, mostrou-se com valores próximos a zero, mostrando assim, que mantém um comportamento bastante aproximado nas operações realizadas. Além de apresentar uma baixa diferença entre o limite inferior e limite superior, desta forma, tendo dois indicativos de que terá uma grande probabilidade de os resultados trabalharem nessa faixa de valores. O Objectbox foi o segundo banco de dados com melhor desempenho, seus resultados se mantiveram próximos aos resultados do banco de dados Hive. Os demais tiveram desempenhos razoáveis conforme pode ser visto nas imagens acima.


