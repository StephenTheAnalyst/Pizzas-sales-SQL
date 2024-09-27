# Exploratory Data Analysis On Pizzas Sales

## Project Overview

This data analysis project aims at providing insights into the sales performance of a pizzas place in the year 2015. While at this project i used joins, window functions, and subquery.

## Data Overview

### I worked with four different tables. Which are:

 1. [pizzas](https://github.com/StephenTheAnalyst/Pizzas-sales-SQL/blob/main/pizzas.csv) : This table contains the **'pizza_id', 'pizza_type_id', 'size', 'price'**  columns.
 2. [pizza_types](https://github.com/StephenTheAnalyst/Pizzas-sales-SQL/blob/main/pizza_types.csv) : This table contains the **'pizza_type_id', 'name', 'category', 'ingredients'**  columns.
 3. [orders](https://github.com/StephenTheAnalyst/Pizzas-sales-SQL/blob/main/orders.csv) : This table contains the **'order_id', 'date', 'time'**  columns.
 4. [order_details](https://github.com/StephenTheAnalyst/Pizzas-sales-SQL/blob/main/order_details.csv) : This table contains the **'order_details_id', 'order_id', 'pizza_id', 'quantity'** columns.

## Data Source

The data used for this data analysis project was downloaded from [kaggle](https://www.kaggle.com/datasets/mysarahmadbhat/pizza-place-sales?select=pizza_types.csv). Kaggle allows users to find datasets they want to use in building AI models, publish datasets, work with other data scientists and machine learning engineers, and enter competitions to solve data science challenges.

## Tools
- SQL server (BigQuery)
  
## Exploratory Data Analysis

### I answered some questions with the 'Pizzas_Sales' tables i uploaded. I started by answering simple questions then gradually moved to complex questions where i had to use windows functions and sub-query. Stay with me 😁

 1. Retrieve the total number of orders placed.
 2. Calculate the total revenue generated from pizza sales.
 3. Identify the highest-priced pizza.
 4. Identify the most common pizza size ordered.
 5. List the top 5 most ordered pizza types along with their quantities.
 6. Join the necessary tables to find the total quantity of each pizza category ordered.
 7. Determine the distribution of orders by hour of the day.
 8. Join relevant tables to find the category-wise distribution of pizzas.
 9. Group the orders by date and calculate the average number of pizzas ordered per day.
 10. Determine the top 3 most ordered pizza types based on revenue.
 11. Calculate the percentage contribution of each pizza type to total revenue.
 12. Analyze the cumulative revenue generated over time.
 13. Determine the top 3 most ordered pizza types based on revenue for each pizza category.

## Results/Finding 

Click 👉[Here](https://github.com/StephenTheAnalyst/Pizzas-sales-SQL/blob/main/Exploratory%20Date%20Analysis%20On%20Pizzas%20Sales.sql)👈 to view the solutions and results to the above Exploratory Data Analysis questions.






### THANKS FOR STAYING THROUGH ✌😊











