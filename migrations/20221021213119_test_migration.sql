-- migrate:up
CREATE TABLE IF NOT EXISTS test_table (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL
);

INSERT INTO test_table (name) VALUES ('test');

-- migrate:down

DROP TABLE test_table;
