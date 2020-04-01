/*
 * 3.(по желанию) Подсчитайте произведение чисел в столбце таблицы
 */

# Подготовка

DROP TABLE IF EXISTS numbers;
CREATE TABLE numbers (
  id SERIAL PRIMARY KEY
);

INSERT INTO numbers (id) VALUES
(NULL),
(NULL),
(NULL),
(NULL),
(NULL);
  
# Выполнение

SELECT round(exp(SUM(log(id)))) from numbers