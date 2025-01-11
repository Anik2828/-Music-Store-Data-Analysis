Q1.write query ti resturn the email,firstname,lastname,& Genre of all rock music listeners.
retuen your list at order alphabitically with email starting with A.

SELECT email,first_name,last_name
FROM customer
JOIN invoice ON customer.customer_id = invoice.customer_id
JOIN invoice_line ON invoice.invoice_id = invoice_line.invoice_id
WHERE track_id IN(
      SELECT track_id FROM track
	  JOIN genre ON track.genre_id = genre.genre_id
	  WHERE genre.name = 'Rock'
)
ORDER BY email;

Q2. Let's invite the artists who have written the most rock music in our dataset. Write a
 query that returns the Artist name and total track count of the top 10 rock bands. 

SELECT artist.artist_id,artist.name,COUNT(artist.artist_id) AS number_of_songs
FROM track
JOIN album ON album.album_id = track.album_id
JOIN artist ON artist.artist_id = album.artist_id
JOIN genre ON track.genre_id = genre.genre_id
WHERE genre.name = 'Rock'
GROUP BY artist.artist_id 
ORDER BY number_of_songs DESC
LIMIT 10;


Q3. Return all the track names that have a song length longer than the average song length.
Return the Name and Milliseconds for each track. Order by the song length with the
longest songs listed first.


SELECT name,milliseconds 
FROM track
WHERE milliseconds > (
           SELECT AVG(milliseconds) AS song_length
           FROM track )
ORDER BY milliseconds DESC









