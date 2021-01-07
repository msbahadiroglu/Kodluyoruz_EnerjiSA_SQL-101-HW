--1. SORU 1 Nisan 2007 tarihten sonra ödeme yapan müşterileri listeleyen bir sorgu 
SELECT customer.first_name,customer.last_name FROM customer 
inner join payment ON customer.customer_id=payment.customer_id 
WHERE payment.payment_date > '2004-04-01'

--2. SORU Aksiyon ve Animasyon kategorisindeki filmlerin çıkış tarihlerini, başlığını ve kategorisini listeleyen sorgu

SELECT film.release_year, film.title, category.name FROM film_category
INNER JOIN film ON film.film_id=film_category.film_id 
INNER JOIN category ON category.category_id=film_category.category_id
WHERE category.name='Action' OR category.name='Animation'

--3. SORU Film kiralama ödemesini en yakın tarihte yapan müşterilerin adı, soyadını ve ödeme tarihini listeleyen sorgu

SELECT customer.first_name,customer.last_name, payment.payment_date FROM customer
INNER JOIN payment ON customer.customer_id=payment.customer_id 
ORDER BY payment.payment_date DESC

--4.SORU P ve P'den sonraki harflerle başlayan ve stokta bulunmayan filmleri listeleyen bir sorgu 
SELECT film.release_year, film.title FROM film
INNER JOIN inventory ON film.film_id!=inventory.film_id
WHERE film.title SIMILAR TO '[P-Z]%'

--5. SORU B harfi ile başlayan müşterileri, film kiralamak için ödedikleri toplam miktarları ile birlikte listeleyen sorgu
SELECT customer.first_name,customer.last_name, SUM(payment.amount) FROM customer
INNER JOIN payment ON customer.customer_id=customer.customer_id
WHERE customer.first_name LIKE 'B%'
GROUP BY customer.last_name, customer.first_name

