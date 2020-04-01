/*
 * 4. (по желанию) Из таблицы users необходимо извлечь пользователей, родившихся в августе и мае. 
 * Месяцы заданы в виде списка английских названий ('may', 'august')
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

 SELECT * from users
 where MONTHNAME(birthday_at) = 'August' OR MONTHNAME(birthday_at) = 'May'
