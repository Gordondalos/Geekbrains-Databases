/*
 * 2. Подсчитайте количество дней рождения, которые приходятся на каждый из дней недели. 
 * Следует учесть, что необходимы дни недели текущего года, а не года рождения.
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

ALTER TABLE users ADD COLUMN bd_month INT(2);
ALTER TABLE users ADD COLUMN bd_day INT(2);
ALTER TABLE users ADD COLUMN bd_this_year VARCHAR(30);

UPDATE users 
set 
bd_month = MONTH(birthday_at),
bd_day = DAYOFMONTH(birthday_at);

UPDATE users 
set bd_this_year = STR_TO_DATE(CONCAT_WS('-', 2020, bd_month, bd_day),'%Y-%m-%d');

ALTER TABLE users ADD COLUMN week_day INT(1);

UPDATE users 
set week_day = WEEKDAY(bd_this_year);

SELECT week_day, count(*) from users GROUP BY week_day