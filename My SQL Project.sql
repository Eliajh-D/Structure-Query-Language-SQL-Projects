USE sampledb;
%Write a query to display all the agents name with their phone number from agents table.%
SELECT agent_name,phone_number
FROM agents;

% Write a query to display the names of all the customers with working area is Leeds from customer
table.%
 SELECT cust_name,working_area
 FROM customer
 WHERE working_area = "leeds";
 
 % Write a query to display the order number and order amount with order description is shoe from orders table%
 
 SELECT order_num,order_amount,order_description
 FROM orders
 WHERE order_description ="shoe";
 
 %Write a query to display the agent code, order amount and order description where order 
amount= 3000 and order description is clothes %.

SELECT agent_code,order_amount,order_description
FROM orders
WHERE order_amount =3000 and 
order_description ="clothes";

% Write a query to display all the details from the table order where the order amount is more than 
2000.%

SELECT *
FROM orders
WHERE order_amount >2000

%  Write a query to display customer name and customer phone number that have alphabet ‘e’ in 
their name.%

SELECT cust_name,phone_number
FROM customer
WHERE cust_name LIKE "%e%"
ORDER BY cust_name DESC;

%  Write a query to display all the details from orders table with minimum order amount.%
SELECT *
FROM orders
WHERE order_amount= (SELECT MIN(order_amount) FROM orders);

% Write a query to display the total order amount from orders table.% 
SELECT SUM(order_amount)
FROM orders;

% Write a query to find the number of agents currently listing for all of their customers from orders 
table.% 
 SELECT COUNT(DISTINCT agent_code)
 FROM orders;
 
% Write a query to find the highest purchase amount ordered by the each customer code and 
highest order amount.% 
SELECT cust_code,MAX(order_amount)
FROM orders
GROUP BY cust_code

%Write a query to find the highest order amount on a date '2022-07-13' with agent code.% 
SELECT agent_code,MAX(order_amount)
FROM orders
WHERE order_date ='2022-07-13'
GROUP BY agent_code;

% Write a query to find the name and customer city of those customers and agents who work in 
the same city.% 
SELECT customer.cust_name,agents.agent_name,agents.working_area
FROM agents,customer
WHERE agents.working_area = customer.working_area;

% Write a query to find the name of all the customer names along with the agent names who 
works for them.% 
SELECT customer.cust_name,agent.agent_name
FROM customer,agents
where agents.agent_code = customer.agent_code

% Write a query to display all those orders by the customers not located in the same cities where 
their agents working area.% 

SELECT order_num,cust_name,orders.agent_code,orders.agent_code
FROM agents,customer,orders
WHERE customer.working_area<>agents.working_area
AND orders.cust_code =customer.cust_code
AND orders.agent_code =agents.agent_code;

%Write a query to display all the orders issued by the agent 'Rickey' from the orders table.%

SELECT *
FROM orders
WHERE agent_code = (SELECT agent_code FROM agents WHERE agent_name = "Rickey");
