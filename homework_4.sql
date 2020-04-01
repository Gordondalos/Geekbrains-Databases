/**
ii. Написать скрипт, возвращающий список имен (только firstname) пользователей без повторений в алфавитном порядке
**/

SELECT DISTINCT firstname 
FROM vk.users 
ORDER BY firstname

/**
iii. Написать скрипт, отмечающий несовершеннолетних пользователей как неактивных (поле is_active = false). 
Предварительно добавить такое поле в таблицу profiles со значением по умолчанию = true (или 1)
**/

ALTER TABLE profiles ADD COLUMN is_active BOOL DEFAULT TRUE

UPDATE profiles
set is_active = FALSE
WHERE birthday < '2002-03-30'

/**
iv. Написать скрипт, удаляющий сообщения «из будущего» (дата позже сегодняшней)
**/

INSERT INTO `messages` (`from_user_id`, `to_user_id`, `body`, `created_at`)
VALUES ('1', '2', 'Hello', '2021-03-30 00:00:00');

DELETE 
FROM messages
WHERE created_at > Now()