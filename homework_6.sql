/**
1. Пусть задан некоторый пользователь. 
Из всех друзей этого пользователя найдите человека, который больше всех общался с нашим пользователем.
**/

SELECT 
	count(*), 
	from_user_id
FROM messages
WHERE to_user_id = 1
GROUP BY from_user_id

/**
2. Подсчитать общее количество лайков, которые получили пользователи младше 10 лет.
**/

select count(*) as likes_count 
from likes
where user_id IN (
	SELECT user_id 
	from profiles
	where TIMESTAMPDIFF(YEAR, birthday, Now()) < 10
	)

/*
3. Определить кто больше поставил лайков (всего): мужчины или женщины.
*/

select (
	select count(*)
	from likes
	where user_id IN (
		SELECT user_id 
		from profiles
		where gender = 'm'
	)
) > (
	select count(*)
	from likes
	where user_id IN (
		SELECT user_id 
		from profiles
		where gender = 'f'
	)
) as does_male_win

