/* Домашнее задание к уроку 3
Практическое задание по теме “Введение в проектирование БД”
Написать крипт, добавляющий в БД vk, которую создали на занятии, 3 новые таблицы (с перечнем полей, указанием индексов и внешних ключей)
*/

-- Таблица дружбы (связь пользователя я пользователем)
DROP TABLE IF EXISTS friends;
CREATE TABLE friends(
	requesting_user_id BIGINT UNSIGNED NOT NULL,
	agreed_user_id BIGINT UNSIGNED NOT NULL,

	PRIMARY KEY (requesting_user_id, agreed_user_id), -- чтобы не было 2 записей о дружбе двух пользователей
    FOREIGN KEY (requesting_user_id) REFERENCES users(id),
    FOREIGN KEY (agreed_user_id) REFERENCES users(id)
);

-- Таблица для хранения групп, созданных пользователем, чтобы категоризировать своих друзей
DROP TABLE IF EXISTS user_groups;
CREATE TABLE user_groups(
	id SERIAL PRIMARY KEY,
	name VARCHAR(150),
	creator_user_id BIGINT UNSIGNED NOT NULL,
	FOREIGN KEY (creator_user_id) REFERENCES users(id),

	INDEX groups_name_idx(name)
);

-- Таблица для хранения категоризации друзей пользователя по группам пользователя
DROP TABLE IF EXISTS user_friends_grouped;
CREATE TABLE user_friends_grouped(
-- id SERIAL PRIMARY KEY,
	friend_id BIGINT UNSIGNED NOT NULL,
	group_id BIGINT UNSIGNED NOT NULL,

	FOREIGN KEY (friend_id) REFERENCES users(id),
	FOREIGN KEY (group_id) REFERENCES user_groups(id)
);
