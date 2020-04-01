/*
 * 2. Таблица users была неудачно спроектирована. 
 * Записи created_at и updated_at были заданы типом VARCHAR 
 * и в них долгое время помещались значения в формате "20.10.2017 8:10". 
 * Необходимо преобразовать поля к типу DATETIME, сохранив введеные ранее значения.
 */

# Подготовка

DROP TABLE IF EXISTS users;
CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) COMMENT 'Имя покупателя',
  birthday_at DATE COMMENT 'Дата рождения',
  created_at VARCHAR(30),
  updated_at VARCHAR(30)
) COMMENT = 'Покупатели';

INSERT INTO users (name, birthday_at, created_at, updated_at) VALUES
  ('Геннадий', '1990-10-05', '20.10.2017 8:10', '20.10.2017 8:11'),
  ('Наталья', '1984-11-12', '20.10.2017 8:12', '20.10.2017 8:13'),
  ('Александр', '1985-05-20', '20.10.2017 8:14', '20.10.2017 8:15'),
  ('Сергей', '1988-02-14', '20.10.2017 8:16', '20.10.2017 8:17'),
  ('Иван', '1998-01-12', '20.10.2017 8:18', '20.10.2017 8:19'),
  ('Мария', '1992-08-29', '20.10.2017 8:20', '20.10.2017 8:21');
  
# Выполнение

 UPDATE users
 set 
 	created_at = STR_TO_DATE(created_at,'%d.%m.%Y %h:%i'),
 	updated_at = STR_TO_DATE(updated_at,'%d.%m.%Y %h:%i');
