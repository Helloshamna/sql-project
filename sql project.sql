

## 1 Retrieve all books in the "Fiction" genre


SELECT * from books 
where genre='Fiction';
 
 ##  2 Find books published after the year 1950
 
 select * from books
 WHERE Published_Year>1950;
 
 ## 3 List all customers from the Canada
 
 SELECT * from customers
  WHERE Country ='canada';
 
  ## 4 Show orders placed in November 2023
  
  
   select * FROM orders
   WHERE Order_Date BETWEEN '2023-11-01' and  '2023-11-30';
   
   
   ## 5 Retrieve the total stock of books available
    
    
    SELECT SUM(stock) as total_stock
    FROM books;
    
   ## 6 Find the details of the most expensive book
   
   SELECT * from books 
   ORDER BY Price DESC 
   LIMIT 1;
   
   ### 7 Show all customers who ordered more than 1 quantity of a book
   
   SELECT * FROM orders
   WHERE Quantity>1;
   
  ## 8 Retrieve all orders where the total amount exceeds $20
  
  SELECT * FROM orders
  WHERE Total_Amount>20;
  
## 9 List all genres available in the Books table

SELECT DISTINCT genre from books ;

## 10 Find the book with the lowest stock
 SELECT * from books 
  ORDER BY Stock  LIMIT 1;
  
  ### 11 Calculate the total revenue generated from all orders
  
  SELECT sum( total_amount) as revenue from orders;
   
-- -   ##  Advance Queries :
  
-- ## 1  Retrieve the total number of books sold for each genre

SELECT * from  orders;

SELECT b.Genre, sum( o.Quantity)as total_books_sold
FROM orders o
join books b on o.Book_ID=b.Book_ID
GROUP BY b.Genre; 

  ## 2 Find the average price of books in the "Fantasy" genre
  
  
  SELECT AVG(price) as average_price
  from books
  where Genre ='fantasy';
  
##  3 List customers who have placed at least 2 orders

SELECT o. customer_id,c. name, count(order_id)as order_count
from orders o
join customers c on o.Customer_ID= c.Customer_ID
GROUP BY Customer_ID, c.name
HAVING count(Order_ID)>=2;

## 4  Find the most frequently ordered book
SELECT o.book_id, b.title,count(o.order_id) as order_count
from orders o 
join books b on o. Book_ID= b.Book_ID
GROUP BY o.Book_ID,b.Title
ORDER BY order_count DESC LIMIT 1;

## 5 Show the top 3 most expensive books of 'Fantasy' Genre
  
  
  select * FROM books
  WHERE Genre = 'fantasy' 
  ORDER BY Price DESC LIMIT 3;
 
 # 6 Retrieve the total quantity of books sold by each author
 
 SELECT b.author,sum(o.Quantity)as total_book_sold
 from  orders o
 join books b on o.book_id=b.book_id
 group by b.author;
 
 
##  7 List the cities where customers who spent over $30 are located

SELECT  DISTINCT c.City, Total_Amount
from orders o
join customers c on o.customer_id= c.customer_id
 where o. Total_Amount>30;
 
 ##  8 Find the customer who spent the most on orders
 
 SELECT c.customer_id, c.name, sum(o.total_amount)as total_spent
 from orders o 
 JOIN customers c on o.Customer_ID = c. Customer_ID
 GROUP BY c. Customer_ID,  c.name
 ORDER BY total_spent DESC LIMIT 5;
 
 
##  9  Calculate the stock remaining after fulfilling all orders

  SELECT b. book_id, b.title, b.stock, coalesce(sum(quantity),0)as order_quantity
  from books b
  left JOIN orders o on b.Book_ID=o.Book_ID
  GROUP BY b.book_ID
  ORDER BY b. Book_ID;