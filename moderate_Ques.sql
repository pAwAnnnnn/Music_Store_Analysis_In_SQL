Q1: Write query to return the email, first name , last name & Genre of all Rock listeners.
	Return your list ordered alphabetically by email starting with A

SELECT DISTINCT email, first_name, last_name
FROM customer
JOIN invoice ON customer.customer_id = invoice.customer_id
JOIN invoice_line ON invoice.invoice_id = invoice_line.invoice_id
WHERE track_id IN(
	SELECT track_id FROM track
	JOIN genre ON track.genre_id = genre.genre_id
	WHERE genre.name LIKE 'Rock'
)
ORDER BY email;



Q2: Lets invite the artist who have written the most rock music in our dataset.
	Write a query that returns the Artist name and Total track count of the top 10 rock bands

SELECT artist.artist_id, artist.name,COUNT(artist.artist_id) as NO_OF_SONGS
FROM track
JOIN album ON album.album_id = track.album_id
JOIN artist ON artist.artist_id = album.artist_id 
JOIN genre ON genre.genre_id = track.genre_id
WHERE genre.name LIKE 'Rock'
GROUP BY artist.artist_id
ORDER BY NO_OF_SONGS DESC
LIMIT 10;


Q3: Return all the track names that have a length longer than the average song length.
	Return the Name, milliseconds for each track. Order By the song lngth with the longest songs listed first.

SELECT name,milliseconds
FROM track
WHERE milliseconds > (
	SELECT AVG(milliseconds) AS avg_track_length
	FROM track)
ORDER BY milliseconds DESC;


OR 

SELECT name,milliseconds
FROM track
WHERE milliseconds > 393599
ORDER BY milliseconds DESC;

