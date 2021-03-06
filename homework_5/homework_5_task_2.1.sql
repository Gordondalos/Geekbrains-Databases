/*
 * 1. Подсчитайте средний возраст пользователей в таблице users
 */

# Подготовка

DROP TABLE IF EXISTS users;
CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) COMMENT 'Имя покупателя',
  birthday_at DATE COMMENT 'Дата рождения',
  created_at DATETIME, # DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME # DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) COMMENT = 'Покупатели';

INSERT INTO users (name, birthday_at) VALUES
  ('Геннадий', '1990-10-05'),
  ('Наталья', '1984-11-12'),
  ('Александр', '1985-05-20'),
  ('Сергей', '1988-02-14'),
  ('Иван', '1998-01-12'),
  ('Мария', '1992-08-29');
  
# Выполнение
 
ALTER TABLE users ADD COLUMN age INT(2);

UPDATE users
set age = TIMESTAMPDIFF(YEAR, birthday_at, Now());

SELECT AVG(age) from users
