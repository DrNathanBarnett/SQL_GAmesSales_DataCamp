-- !preview conn=DBI::dbConnect(RSQLite::SQLite())

-- best_selling_games


SELECT games_sold, name, platform, publisher, developer, year
FROM game_sales
ORDER BY games_sold DESC
LIMIT 10;

-- critics_top_ten_years
--SELECT *
--FROM reviews

SELECT g.year, COUNT(g.name) AS num_games, ROUND(AVG(r.critic_score), 2) AS avg_critic_score
FROM game_sales AS g
INNER JOIN reviews AS r
ON g.name = r.name
GROUP BY g.year
HAVING COUNT(g.year) >= 4
ORDER BY avg_critic_score DESC
LIMIT 10;

--

-- golden_years

--SELECT *
--FROM users_avg_year_rating

SELECT u.year, u.num_games, u.avg_user_score, c.avg_critic_score, c.avg_critic_score - u.avg_user_score AS diff
FROM critics_avg_year_rating AS c
INNER JOIN users_avg_year_rating as u
ON u.year = c.year 
WHERE u.avg_user_score > 9 OR c.avg_critic_score > 9
ORDER BY year ASC;

--SELECT g.year, g.name, avg_critic_score, avg_user_score,
--critic_score - user_score AS diff
--FROM game)sales AS g
--INNER JOIN reviews AS r

