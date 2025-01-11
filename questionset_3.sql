Q2. Find how much amount spent by each customer on artists? Write a query to return
customer name, artist name and total spent

WITH best_salling_artist AS (
                   SELECT artist.artist_id AS artist_id , artist.name AS artist_name,
				   SUM(invoice_line.unit_price*invoice_line.quantity) AS total_sales
				   FROM invoice_line
				   JOIN track ON track.track_id = invoice_line.track_id
				   JOIN album ON album.album_id = track.album_id
				   JOIN artist ON artist.artist_id = album.artist_id
				   GROUP BY 1
				   ORDER BY 3 DESC
				   LIMIT 1
)
SELECT customer.customer_id ,customer.first_name,customer.last_name,best_salling_artist.artist_name,
SUM(invoice_line.unit_price*invoice_line.quantity) AS amount_spend
FROM customer
JOIN invoice ON invoice.customer_id = customer.customer_id
JOIN invoice_line ON invoice_line.invoice_id = invoice.invoice_id
JOIN track ON track.track_id = invoice_line.track_id
JOIN album ON album.album_id = track.album_id
JOIN best_salling_artist ON best_salling_artist.artist_id =  album.artist_id
GROUP BY 1,2,3,4
ORDER BY 5 DESC

Q2. We want to find out the most popular music Genre for each country. We determine the
most popular genre as the genre with the highest amount of purchases. Write a query
that returns each country along with the top Genre. For countries where the maximum
number of purchases is shared return all Genres

WITH popular_genre AS(
   SELECT COUNT(il.quantity) AS purchases, customer.country,genre.name,genre.genre_id,
   ROW_NUMBER() OVER (PARTITION BY customer.country ORDER BY COUNT(il.quantity) DESC) AS Rowno
   FROM invoice_line il
   JOIN invoice i ON i.invoice_id = il.invoice_id
   JOIN customer ON customer.customer_id = i.customer_id
   JOIN track ON track.track_id = il.track_id
   JOIN genre ON genre.genre_id = track.genre_id
   GROUP BY 2,3,4
   ORDER BY 2 ASC, 1 DESC
)	
SELECT * FROM popular_genre WHERE Rowno = 1

Another mehtod is there called recursive 






