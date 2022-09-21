## Exemplo Integração com Kafka-connect

Este projeto serve como exemplo para integração de dois bancos mysqls sem a necessidade do uso de nenhum código para implementação da replicação de dados.

Apenas com o uso de conectores foi possível implementar está atualização de dados em uma tabela de um banco, para outra tabela em um novo banco.

### Para executar em sua maquina local

- Suba os containers

```
docker-compose up
```

Apos os containers estarem rodando, execute o sql

```sql
use example_kafka_connect;
CREATE TABLE example_kafka_connect (id int, description varchar(255), created_at timestamp);

CREATE DATABASE tests_connect;
USE tests_connect;
CREATE TABLE new_products (id int, description varchar(255), created_at timestamp);
```

Adicione os conectores no painel da confluent por meio do host **http://localhost:9021/clusters/** na aba **connect** do menu

Após isso verifique se todos os connectores estão com status **running**

Se sim execute o **INSERT** e **SELECT** abaixo em `docker-compose exec mysql bash` com usuário e senha disponivel no `docker-compose.yml` e veja a magica acontecer.

```sql
INSERT INTO example_kafka_connect.products (id, description, created_at) VALUES (1, 'Test', '2022-05-09 00:00:01');
SELECT * FROM tests_connect.new_products;

INSERT INTO example_kafka_connect.products (id, description, created_at) VALUES (2, 'Test novo', '2022-05-10 00:00:01');
SELECT * FROM tests_connect.new_products;

INSERT INTO example_kafka_connect.products (id, description, created_at) VALUES (3, 'Test wwwww', '2022-05-11 00:00:02');
SELECT * FROM tests_connect.new_products;
```
