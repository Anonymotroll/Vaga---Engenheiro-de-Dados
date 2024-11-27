# Desafio 1

>1. Descreva o esquema JSON correspondente ao exemplo acima.

O arquivo Json está descrito em **[ERP-Descrito](./assets/ERP-Descrito.txt)**

>2.Transcreva o JSON para tabelas SQL. A implementação deve fazer sentido para operações de restaurante.

A query SQL está em **[JsonToSQL](./assets/ERP.sql)**

>3. Descreva a abordagem escolhida em detalhes. Justifique a escolha.

- Para criar cada tabela, usei os relacionamentos que existem no Json. Cada pedido na tabela 'guestCheck' está relacionado com sua respectiva linha de detalhe, na tabela 'detailLines'. Já os itens de menu específicos, estão sendo tratados na tabela 'menuItems', obtendo se maior flexibilidade.

Minha abordagem foi a seguinte:

Usei a Racionalidade do Modelo Relacional - trazendo otimização para consultas analíticas e operacionais e suporte para análise de tendências de itens e desempenho de funcionários. Trazendo consigo, benefícios como reduzir a duplicidade de dados e o acesso eficiente às informações via chaves estrangeiras.

# Desafio 2

> Por que armazenar as respostas das APIs?
Pois, armazendando as respostas, podemos fazer o rastreamento histórico dos dados, permitindo análises retroativas, fazer backups e recuperações, além da análise de dados em forma de BI.

> Como você armazenaria os dados? Crie uma estrutura de pastas capaz de armazenar as respostas da API. Ela deve permitir manipulaçõe, verificações, buscas e pesquisas rápidas.
```
/data_lake/restaurants/
   /store_id=123/
        /bus_dt=2024-01-01/
            /getFiscalInvoice/
            /getGuestChecks/
            /getChargeBack/
            /getTransactions/
            /getCashManagementDetails/
```
Aqui eu usei uma hierarquia por loja e data, pois facilita buscas e indexação, e as subpastas por endpoint.

> Considere que a resposta do endpoint getGuestChecks foi alterada, por exemplo, guestChecks.taxes foi renomeado para guestChecks.taxation. O que isso implicaria?

Seria necessário atualizar todo o esquema ETL para trocar 'taxes' por 'taxation' e fazer ajustes nas queries SQL. Além do que foi dito, seria necessário implementar versionamentos do esquema para lidar com as alterações futuras.

