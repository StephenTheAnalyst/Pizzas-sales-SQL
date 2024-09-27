## I answered some question with the 'Pizzas_Sales' table i uploaded. I started by answering simple question then gradually moved to complex questions where i had to use windows functions and sub-query.

## Q1: Retrieve the total number of orders placed. Ans:  The total number of orders placed was 48620
SELECT COUNT(*)
FROM heroic-icon-411512.Pizzas_Sales.order_details;

# Q2: Calculate the total revenue generated from pizza sales. Ans: The total revenue generated was 817860.0
SELECT ROUND(SUM(p.price * od.quantity))
FROM heroic-icon-411512.Pizzas_Sales.Pizzas p
JOIN heroic-icon-411512.Pizzas_Sales.order_details od
 ON p.pizza_id = od.pizza_id;

# Q3: Identify the highest-priced pizza. Ans: The highest-priced pizza was 35.95
SELECT MAX(price)
FROM heroic-icon-411512.Pizzas_Sales.Pizzas;

# Q4: Identify the most common pizza size ordered. Ans: The most common pizza size was the size 'S' at 32
SELECT size,COUNT(*)
FROM heroic-icon-411512.Pizzas_Sales.Pizzas
GROUP BY 1
ORDER BY 2 DESC
LIMIT 1;

/* Q5: List the top 5 most ordered pizza types along with their quantities. Ans: The top 5 most ordered pizza types are 'The Classic Deluxe Pizza
', 'The Barbecue Chicken Pizza','The Hawaiian Pizza','The Pepperoni Pizza','The Thai Chicken Pizza' */
SELECT pt.name,SUM(od.quantity) quantity
FROM heroic-icon-411512.Pizzas_Sales.pizzas_types as pt
JOIN heroic-icon-411512.Pizzas_Sales.Pizzas as p
 ON pt.pizza_type_id = p.pizza_type_id 
JOIN heroic-icon-411512.Pizzas_Sales.order_details as od
 ON p.pizza_id = od.pizza_id
GROUP BY 1
ORDER BY 2 DESC
LIMIT 5;

/* Q6: Join the necessary tables to find the total quantity of each pizza category ordered.Ans: These are the total quantity for each catergory: 'Classic' got 14888,'Supreme' got 11987, 'Veggie' got 11649, 'Chicken' got 11050. */
SELECT pt.category,SUM(od.quantity) quantity
FROM heroic-icon-411512.Pizzas_Sales.pizzas_types as pt
JOIN heroic-icon-411512.Pizzas_Sales.Pizzas as p
 ON pt.pizza_type_id = p.pizza_type_id 
JOIN heroic-icon-411512.Pizzas_Sales.order_details as od
 ON p.pizza_id = od.pizza_id
GROUP BY 1
ORDER BY 2 DESC;

/* Q7: Determine the distribution of orders by hour of the day.Ans: I was feeling too lazy to type out all the hours, so i just listed the top 5 which are the hours of 12,13,18,17,19. The least 2 were hours of 9 and 10. I also figured from this that the pizzas place open by 9 because it is the earliest of all hours. */
SELECT EXTRACT(HOUR from time) hour_of_day,COUNT(*) no_order
FROM heroic-icon-411512.Pizzas_Sales.orders
GROUP BY 1
ORDER BY 1;

# Q8: Join relevant tables to find the category-wise distribution of pizzas. Ans: 'Classic' got 14579,'Supreme' got 11777,'Veggie' got 11449,'Chicken' got 10815
SELECT pt.category,COUNT(*) count
FROM heroic-icon-411512.Pizzas_Sales.pizzas_types as pt
JOIN heroic-icon-411512.Pizzas_Sales.Pizzas as p
 ON pt.pizza_type_id = p.pizza_type_id 
JOIN heroic-icon-411512.Pizzas_Sales.order_details as od
 ON p.pizza_id = od.pizza_id
GROUP BY 1
ORDER BY 2 DESC;

# Q9: Group the orders by date and calculate the average number of pizzas ordered per day. Ans: Here the average for everyday happens to be 1, so i didn't see the need to list them out.
SELECT o.date date,ROUND(AVG(quantity)) avg_quantity
FROM heroic-icon-411512.Pizzas_Sales.orders as o
JOIN heroic-icon-411512.Pizzas_Sales.order_details as od
 ON o.order_id = od.order_id
GROUP BY 1
ORDER BY 2 DESC;

# Q10: Determine the top 3 most ordered pizza types based on revenue. Ans: The top 3 pizzas types based on revenue are 'The Thai Chicken Pizza' with revenue of 43434,'The Barbecue Chicken Pizza' with revenue of 42768,'The California Chicken Pizza' with revenue of 50. 
SELECT pt.name type,ROUND(SUM(p.price * od.quantity)) revenue
FROM heroic-icon-411512.Pizzas_Sales.pizzas_types as pt
JOIN heroic-icon-411512.Pizzas_Sales.Pizzas as p
 ON pt.pizza_type_id = p.pizza_type_id 
JOIN heroic-icon-411512.Pizzas_Sales.order_details od
 ON p.pizza_id = od.pizza_id
GROUP BY 1
ORDER BY 2 DESC
LIMIT 3;

/* Q11: Calculate the percentage contribution of each pizza type to total revenue.  Ans: The output is alittle to much for me to write out, so i will just give the top three, which are 'The Thai Chicken Pizza' contributed 32%, 'The Barbecue Chicken Pizza' contributed 31, 'The California Chicken Pizza' contributed 30. And this all makes sense because these are the top three types based on revenue. */
SELECT type,revenue, NTILE(100) OVER (ORDER BY revenue) percentage
FROM (SELECT pt.name type,ROUND(SUM(p.price * od.quantity)) revenue
      FROM heroic-icon-411512.Pizzas_Sales.pizzas_types as pt
      JOIN heroic-icon-411512.Pizzas_Sales.Pizzas as p
      ON pt.pizza_type_id = p.pizza_type_id 
      JOIN heroic-icon-411512.Pizzas_Sales.order_details od
      ON p.pizza_id = od.pizza_id
      GROUP BY 1)
GROUP BY 1,2
ORDER BY percentage DESC;

# Q12: Analyze the cumulative revenue generated over time.
SELECT date,revenue, SUM(revenue) OVER (ORDER BY date)
FROM (SELECT o.date date,ROUND(SUM(p.price * od.quantity)) revenue
      FROM heroic-icon-411512.Pizzas_Sales.pizzas_types as pt
      JOIN heroic-icon-411512.Pizzas_Sales.Pizzas as p
      ON pt.pizza_type_id = p.pizza_type_id 
      JOIN heroic-icon-411512.Pizzas_Sales.order_details od
      ON p.pizza_id = od.pizza_id
      JOIN heroic-icon-411512.Pizzas_Sales.orders as o
      ON od.order_id = o.order_id
      GROUP BY 1)
GROUP BY 1,2;

# Q13: Determine the top 3 most ordered pizza types based on revenue for each pizza category.
SELECT category,type,revenue,rank
FROM (SELECT category,type,revenue, RANK() OVER (PARTITION BY category ORDER BY revenue DESC) rank
      FROM (SELECT pt.category category,pt.name type,ROUND(SUM(p.price * od.quantity)) revenue
            FROM heroic-icon-411512.Pizzas_Sales.pizzas_types as pt
            JOIN heroic-icon-411512.Pizzas_Sales.Pizzas as p
            ON pt.pizza_type_id = p.pizza_type_id 
            JOIN heroic-icon-411512.Pizzas_Sales.order_details od
            ON p.pizza_id = od.pizza_id
            JOIN heroic-icon-411512.Pizzas_Sales.orders as o
            ON od.order_id = o.order_id
            GROUP BY 1,2)
      GROUP BY 1,2,3)
WHERE rank < 4;