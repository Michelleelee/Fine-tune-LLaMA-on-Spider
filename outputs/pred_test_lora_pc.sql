SELECT count(*) FROM club
SELECT count(*) FROM club
SELECT Name FROM club ORDER BY Name ASC
SELECT Name FROM club ORDER BY Name ASC
SELECT Manager,  Captain FROM club
SELECT Manager,  Captain FROM club
SELECT Name FROM club WHERE Manufacturer!= "Nike"
SELECT Name FROM club WHERE Manufacturer!= 'Nike'
SELECT Name FROM player ORDER BY Wins_count ASC
SELECT Name FROM player ORDER BY Wins_count ASC
SELECT Name FROM player ORDER BY Earnings DESC LIMIT 1
SELECT Name FROM player ORDER BY Earnings DESC LIMIT 1
SELECT DISTINCT country FROM player WHERE earnings  >  1200000
SELECT Country FROM player WHERE Earnings  >  1200000
SELECT Country FROM player WHERE Earnings  =  (SELECT max(Earnings) FROM player WHERE Wins_count  >  2)
SELECT Country FROM player WHERE Wins_count  >  2 ORDER BY Earnings DESC LIMIT 1
SELECT T1.Name,  T2.Name FROM player AS T1 JOIN club AS T2 ON T1.Club_ID  =  T2.Club_ID
SELECT T1.Name,  T2.Name FROM player AS T1 JOIN club AS T2 ON T1.Club_ID  =  T2.Club_ID
SELECT T1.Name FROM club AS T1 JOIN player AS T2 ON T1.Club_ID  =  T2.Club_ID GROUP BY T2.Club_ID HAVING count(*)  >  2
SELECT T1.Name FROM club AS T1 JOIN player AS T2 ON T1.Club_ID  =  T2.Club_ID GROUP BY T2.Club_ID HAVING count(*)  >  2
SELECT T1.Name FROM player AS T1 JOIN club AS T2 ON T1.Club_ID  =  T2.Club_ID WHERE T2.Manager  =  "Sam Allardyce"
SELECT T1.Name FROM player AS T1 JOIN club AS T2 ON T1.club_id  =  T2.club_id WHERE T2.Manager  =  "Sam Allardyce"
SELECT T1.Name FROM club AS T1 JOIN player AS T2 ON T1.Club_ID  =  T2.Club_ID GROUP BY T1.Club_ID ORDER BY avg(T2.Earnings) DESC
SELECT T1.Name FROM club AS T1 JOIN player AS T2 ON T1.club_id  =  T2.club_id GROUP BY T1.club_id ORDER BY avg(T2.earnings) DESC
SELECT Manufacturer,  COUNT(*) FROM club GROUP BY Manufacturer
SELECT Manufacturer,  COUNT(*) FROM club GROUP BY Manufacturer
SELECT Manufacturer FROM club GROUP BY Manufacturer ORDER BY COUNT(*) DESC LIMIT 1
SELECT Manufacturer FROM club GROUP BY Manufacturer ORDER BY COUNT(*) DESC LIMIT 1
SELECT Manufacturer FROM club GROUP BY Manufacturer HAVING COUNT(*)  >  1
SELECT Manufacturer FROM club GROUP BY Manufacturer HAVING COUNT(*)  >  1
SELECT Country FROM player GROUP BY Country HAVING COUNT(*)  >  1
SELECT Country FROM player GROUP BY Country HAVING COUNT(*)  >  1
SELECT name FROM club WHERE club_id NOT IN (SELECT club_id FROM player)
SELECT Name FROM club WHERE Club_ID NOT IN (SELECT Club_ID FROM player)
SELECT Country FROM player WHERE Earnings  >  1400000 UNION SELECT Country FROM player WHERE Earnings  <  1100000
SELECT Country FROM player WHERE Earnings  >  1400000 INTERSECT SELECT Country FROM player WHERE Earnings  <  1100000
SELECT count(DISTINCT Country) FROM player
SELECT count(DISTINCT Country) FROM player
SELECT earnings FROM player WHERE country  =  "Australia" OR country  =  "Zimbabwe"
SELECT earnings FROM player WHERE country  =  'Australia' OR country  =  'Zimbabwe'
SELECT T1.customer_id,  T1.customer_first_name,  T1.customer_last_name FROM Customers AS T1 JOIN Orders AS T2 ON T1.customer_id  =  T2.customer_id JOIN Order_items AS T3 ON T2.order_id  =  T3.order_id GROUP BY T1.customer_id HAVING count(*)  >=  3 INTERSECT SELECT T1.customer_id,  T1.customer_first_name,  T1.customer_last_name FROM Customers AS T1 JOIN Orders AS T2 ON T1.customer_id  =  T2.customer_id GROUP BY T1.customer_id HAVING count(*)  >=  3
SELECT T1.customer_id,  T1.customer_first_name,  T1.customer_last_name FROM customers AS T1 JOIN orders AS T2 ON T1.customer_id  =  T2.customer_id JOIN order_items AS T3 ON T2.order_id  =  T3.order_id GROUP BY T1.customer_id HAVING count(*)  >  2 INTERSECT SELECT T1.customer_id,  T1.customer_first_name,  T1.customer_last_name FROM customers AS T1 JOIN orders AS T2 ON T1.customer_id  =  T2.customer_id JOIN order_items AS T3 ON T2.order_id  =  T3.order_id GROUP BY T1.customer_id HAVING count(*)  >=  3
SELECT order_id,  order_status_code,  count(*) FROM Order_items GROUP BY order_id
SELECT count(*),  order_status_code,  order_id FROM Order_items GROUP BY order_id
SELECT date_order_placed FROM orders WHERE order_id IN (SELECT order_id FROM order_items GROUP BY order_id HAVING count(*)  >  1) OR date_order_placed  =  (SELECT min(date_order_placed) FROM orders)
SELECT min(date_order_placed),  count(*) FROM orders GROUP BY date_order_placed HAVING count(*)  >  1
SELECT customer_first_name,  customer_middle_initial,  customer_last_name FROM customers WHERE customer_id NOT IN (SELECT customer_id FROM orders)
SELECT customer_first_name,  customer_middle_initial,  customer_last_name FROM customers WHERE customer_id NOT IN (SELECT customer_id FROM orders)
SELECT product_id,  product_name,  product_price,  product_color FROM products EXCEPT SELECT T1.product_id,  T1.product_name,  T1.product_price,  T1.product_color FROM products AS T1 JOIN order_items AS T2 ON T1.product_id  =  T2.product_id GROUP BY T1.product_id HAVING count(*)  >=  2
SELECT product_id,  product_name,  product_price,  product_color FROM products WHERE product_id NOT IN (SELECT product_id FROM order_items GROUP BY product_id HAVING count(*)  >=  2)
SELECT T1.order_id,  T1.date_order_placed FROM orders AS T1 JOIN order_items AS T2 ON T1.order_id  =  T2.order_id GROUP BY T1.order_id HAVING count(*)  >=  2
SELECT order_id,  date_order_placed FROM orders WHERE order_id IN (SELECT order_id FROM order_items GROUP BY order_id HAVING count(*)  >=  2)
SELECT T1.product_id,  T1.product_name,  T1.product_price FROM products AS T1 JOIN order_items AS T2 ON T1.product_id  =  T2.product_id GROUP BY T1.product_id ORDER BY count(*) DESC LIMIT 1
SELECT T1.product_id,  T1.product_name,  T1.product_price FROM products AS T1 JOIN order_items AS T2 ON T1.product_id  =  T2.product_id GROUP BY T1.product_id ORDER BY count(*) DESC LIMIT 1
SELECT order_id,  sum(T1.product_price) FROM order_items AS T1 JOIN products AS T2 ON T1.product_id  =  T2.product_id GROUP BY order_id ORDER BY sum(T1.product_price) ASC LIMIT 1
SELECT order_id,  sum(product_price) FROM order_items GROUP BY order_id ORDER BY sum(product_price) ASC LIMIT 1
SELECT payment_method_code FROM Customer_Payment_Methods GROUP BY payment_method_code ORDER BY count(*) DESC LIMIT 1
SELECT payment_method_code FROM Customer_Payment_Methods GROUP BY payment_method_code ORDER BY count(*) DESC LIMIT 1
SELECT T1.gender_code,  count(*) FROM customers AS T1 JOIN orders AS T2 ON T1.customer_id  =  T2.customer_id JOIN order_items AS T3 ON T2.order_id  =  T3.order_id GROUP BY T1.gender_code
SELECT T1.gender_code,  count(*) FROM customers AS T1 JOIN orders AS T2 ON T1.customer_id  =  T2.customer_id JOIN order_items AS T3 ON T2.order_id  =  T3.order_id JOIN products AS T4 ON T3.product_id  =  T4.product_id GROUP BY T1.gender_code
SELECT T1.gender_code,  count(*) FROM customers AS T1 JOIN orders AS T2 ON T1.customer_id  =  T2.customer_id GROUP BY T1.gender_code
SELECT T1.gender_code,  count(*) FROM customers AS T1 JOIN orders AS T2 ON T1.customer_id  =  T2.customer_id GROUP BY T1.gender_code
SELECT T1.customer_first_name,  T1.customer_middle_initial,  T1.customer_last_name,  T2.payment_method_code FROM Customers AS T1 JOIN Customer_Payment_Methods AS T2 ON T1.customer_id  =  T2.customer_id
SELECT customer_first_name,  customer_middle_initial,  customer_last_name,  payment_method_code FROM Customers AS T1 JOIN Customer_Payment_Methods AS T2 ON T1.customer_id  =  T2.customer_id
SELECT T1.invoice_status_code,  T1.invoice_date,  T2.shipment_date FROM Invoices AS T1 JOIN Shipments AS T2 ON T1.invoice_number  =  T2.invoice_number
SELECT invoice_status_code,  invoice_date,  shipment_date FROM Invoices AS T1 JOIN Shipments AS T2 ON T1.invoice_number  =  T2.invoice_number
SELECT T1.product_name,  T3.shipment_date FROM products AS T1 JOIN order_items AS T2 ON T1.product_id  =  T2.product_id JOIN shipments AS T3 ON T2.order_id  =  T3.order_id
SELECT T1.product_name,  T3.shipment_date FROM products AS T1 JOIN order_items AS T2 ON T1.product_id  =  T2.product_id JOIN shipments AS T3 ON T2.order_id  =  T3.order_id
SELECT T1.order_item_status_code,  T2.shipment_tracking_number FROM Order_items AS T1 JOIN Shipments AS T2 ON T1.order_id  =  T2.order_id
SELECT T1.order_item_status_code,  T2.shipment_tracking_number FROM Order_items AS T1 JOIN Shipments AS T2 ON T1.order_id  =  T2.order_id WHERE T1.order_item_status_code  =  'Shipped'
SELECT T1.product_name,  T1.product_color FROM products AS T1 JOIN order_items AS T2 ON T1.product_id  =  T2.product_id JOIN shipments AS T3 ON T2.order_id  =  T3.order_id
SELECT T1.product_name,  T1.product_color FROM products AS T1 JOIN shipment_items AS T2 ON T1.product_id  =  T2.order_item_id
SELECT DISTINCT T1.product_name,  T1.product_price,  T1.product_description FROM products AS T1 JOIN order_items AS T2 ON T1.product_id  =  T2.product_id JOIN orders AS T3 ON T2.order_id  =  T3.order_id JOIN customers AS T4 ON T3.customer_id  =  T4.customer_id WHERE T4.gender_code  =  'F'
SELECT DISTINCT T1.product_name,  T1.product_price,  T1.product_description FROM products AS T1 JOIN order_items AS T2 ON T1.product_id  =  T2.product_id JOIN orders AS T3 ON T2.order_id  =  T3.order_id JOIN customers AS T4 ON T3.customer_id  =  T4.customer_id WHERE T4.gender_code  =  'F'
SELECT T1.invoice_status_code FROM Invoices AS T1 JOIN Shipments AS T2 ON T1.invoice_number  =  T2.invoice_number WHERE T2.shipment_id IS NULL
SELECT T1.invoice_status_code FROM Invoices AS T1 JOIN Shipments AS T2 ON T1.invoice_number  =  T2.invoice_number WHERE T2.shipment_id IS NULL
SELECT T1.order_id,  T1.date_order_placed,  sum(T2.product_price) FROM orders AS T1 JOIN order_items AS T2 ON T1.order_id  =  T2.order_id GROUP BY T1.order_id
SELECT T1.order_id,  T1.date_order_placed,  T2.invoice_number,  T2.invoice_status_code,  T2.invoice_date,  T3.product_id,  T3.order_item_id,  T3.order_item_status_code,  T4.product_name,  T4.product_price FROM orders AS T1 JOIN order_items AS T2 ON T1.order_id  =  T2.order_id JOIN shipment_items AS T3 ON T1.order_id  =  T3.order_id JOIN products AS T4 ON T3.product_id  =  T4.product_id
SELECT count(*) FROM customers WHERE customer_id IN (SELECT customer_id FROM orders)
SELECT count(DISTINCT customer_id) FROM orders
SELECT count(DISTINCT order_item_status_code) FROM Order_Items
SELECT count(DISTINCT order_item_status_code) FROM order_items
SELECT count(DISTINCT payment_method_code) FROM Customer_Payment_Methods
SELECT count(DISTINCT payment_method_code) FROM Customer_Payment_Methods
SELECT login_name,  login_password FROM customers WHERE phone_number LIKE '+12%'
SELECT login_name,  login_password FROM customers WHERE phone_number LIKE '+12%'
SELECT product_size FROM products WHERE product_name LIKE '%Dell%'
SELECT product_size FROM products WHERE product_name LIKE "%Dell%"
SELECT product_price,  product_size FROM products WHERE product_price  >  (SELECT avg(product_price) FROM products)
SELECT product_price,  product_size FROM products WHERE product_price  >  (SELECT avg(product_price) FROM products)
SELECT count(*) FROM products EXCEPT SELECT count(*) FROM order_items
SELECT count(*) FROM products WHERE product_id NOT IN (SELECT product_id FROM order_items)
SELECT count(*) FROM customers WHERE customer_id NOT IN (SELECT customer_id FROM customer_payment_methods)
SELECT count(*) FROM customers WHERE customer_id NOT IN (SELECT customer_id FROM customer_payment_methods)
SELECT order_status_code,  date_order_placed FROM orders
SELECT order_status_code,  date_order_placed FROM orders
SELECT address_line_1,  town_city,  county FROM customers WHERE country  =  'USA'
SELECT address_line_1,  town_city,  county FROM customers WHERE country  =  'United States'
SELECT T1.customer_first_name,  T3.product_name FROM customers AS T1 JOIN orders AS T2 ON T1.customer_id  =  T2.customer_id JOIN order_items AS T3 ON T2.order_id  =  T3.order_id
SELECT T1.customer_first_name,  T3.product_name FROM customers AS T1 JOIN orders AS T2 ON T1.customer_id  =  T2.customer_id JOIN order_items AS T3 ON T2.order_id  =  T3.order_id
SELECT count(*) FROM shipments
SELECT count(*) FROM products AS t1 JOIN order_items AS t2 ON t1.product_id  =  t2.product_id JOIN shipments AS t3 ON t2.order_id  =  t3.order_id
SELECT avg(product_price) FROM products
SELECT avg(product_price) FROM products
SELECT avg(T1.product_price) FROM products AS T1 JOIN order_items AS T2 ON T1.product_id  =  T2.product_id
SELECT avg(T1.product_price) FROM products AS T1 JOIN order_items AS T2 ON T1.product_id  =  T2.product_id
SELECT email_address,  town_city,  county FROM customers GROUP BY gender_code ORDER BY count(*) ASC LIMIT 1
SELECT T1.email_address,  T1.town_city,  T1.county FROM customers AS T1 JOIN orders AS T2 ON T1.customer_id  =  T2.customer_id GROUP BY T1.customer_id ORDER BY count(*) ASC LIMIT 1
SELECT T1.date_order_placed FROM orders AS T1 JOIN customer_payment_methods AS T2 ON T1.customer_id  =  T2.customer_id GROUP BY T1.customer_id HAVING count(*)  >=  2
SELECT T1.date_order_placed FROM orders AS T1 JOIN customer_payment_methods AS T2 ON T1.customer_id  =  T2.customer_id GROUP BY T1.customer_id HAVING count(*)  >=  2
SELECT order_status_code FROM orders GROUP BY order_status_code ORDER BY count(*) ASC LIMIT 1
SELECT order_status_code FROM orders GROUP BY order_status_code ORDER BY count(*) ASC LIMIT 1
SELECT T1.product_id,  T1.product_description FROM products AS T1 JOIN order_items AS T2 ON T1.product_id  =  T2.product_id GROUP BY T1.product_id HAVING count(*)  >  3
SELECT product_id,  product_description FROM Order_items AS T1 JOIN Products AS T2 ON T1.product_id  =  T2.product_id GROUP BY T1.product_id HAVING count(*)  >  3
SELECT T1.invoice_date,  T1.invoice_number FROM Invoices AS T1 JOIN Shipments AS T2 ON T1.invoice_number  =  T2.invoice_number GROUP BY T1.invoice_number HAVING count(*)  >=  2
SELECT invoice_number,  invoice_date FROM Invoices WHERE invoice_number IN (SELECT invoice_number FROM Shipments GROUP BY invoice_number HAVING count(*)  >=  2)
SELECT shipment_tracking_number,  shipment_date FROM shipments
SELECT shipment_tracking_number,  shipment_date FROM shipments
SELECT product_color,  product_description,  product_size FROM products WHERE product_price  <  (SELECT max(product_price) FROM products)
SELECT product_color,  product_description,  product_size FROM products WHERE product_price  <  (SELECT max(product_price) FROM products)
SELECT name FROM director WHERE age  >  (SELECT avg(age) FROM director)
SELECT Name FROM director ORDER BY Age DESC LIMIT 1
SELECT count(*) FROM channel WHERE internet LIKE "%bbc%"
SELECT count(DISTINCT Digital_terrestrial_channel) FROM channel
SELECT title FROM program ORDER BY start_year DESC
SELECT T1.Name FROM director AS T1 JOIN program AS T2 ON T1.Director_ID  =  T2.Director_ID GROUP BY T1.Name ORDER BY count(*) DESC LIMIT 1
SELECT T1.Name,  T1.Age FROM director AS T1 JOIN program AS T2 ON T1.Director_ID  =  T2.Director_ID GROUP BY T1.Director_ID ORDER BY count(*) DESC LIMIT 1
SELECT title FROM program ORDER BY start_year DESC LIMIT 1
SELECT T1.Name,  T1.Internet FROM channel AS T1 JOIN program AS T2 ON T1.Channel_ID  =  T2.Channel_ID GROUP BY T1.Channel_ID HAVING COUNT(*)  >  1
SELECT T1.Name,  count(*) FROM channel AS T1 JOIN program AS T2 ON T1.Channel_ID  =  T2.Channel_ID GROUP BY T1.Name
SELECT count(*) FROM channel WHERE channel_id NOT IN (SELECT channel_id FROM program)
SELECT T1.Name FROM director AS T1 JOIN program AS T2 ON T1.Director_ID  =  T2.Director_ID WHERE T2.Title  =  "Dracula"
SELECT T1.Name,  T1.Internet FROM channel AS T1 JOIN director_admin AS T2 ON T1.Channel_ID  =  T2.Channel_ID GROUP BY T1.Channel_ID ORDER BY count(*) DESC LIMIT 1
SELECT name FROM director WHERE age BETWEEN 30 AND 60
SELECT T1.Name FROM channel AS T1 JOIN director AS T2 ON T1.Channel_ID  =  T2.Director_ID WHERE T2.Age  <  40 INTERSECT SELECT T1.Name FROM channel AS T1 JOIN director AS T2 ON T1.Channel_ID  =  T2.Director_ID WHERE T2.Age  >  60
SELECT channel_id,  name FROM channel EXCEPT SELECT T1.channel_id,  T1.name FROM channel AS T1 JOIN director_admin AS T2 ON T1.channel_id  =  T2.channel_id JOIN director AS T3 ON T2.director_id  =  T3.director_id WHERE T3.name  =  "Hank Baskett"
SELECT count(*) FROM radio
SELECT Transmitter FROM radio ORDER BY ERP_kW ASC
SELECT tv_show_name,  Original_Airdate FROM tv_show
SELECT station_name FROM city_channel WHERE affiliation!= "ABC"
SELECT transmitter FROM radio WHERE ERP_kW  >  150 OR ERP_kW  <  30
SELECT Transmitter FROM radio ORDER BY ERP_kW DESC LIMIT 1
SELECT avg(ERP_kW) FROM radio
SELECT affiliation,  count(*) FROM city_channel GROUP BY affiliation
SELECT affiliation FROM city_channel GROUP BY affiliation ORDER BY count(*) DESC LIMIT 1
SELECT affiliation FROM city_channel GROUP BY affiliation HAVING count(*)  >  3
SELECT city,  station_name FROM city_channel ORDER BY station_name ASC
SELECT T1.Transmitter,  T3.City FROM radio AS T1 JOIN city_channel_radio AS T2 ON T1.Radio_ID  =  T2.Radio_ID JOIN city_channel AS T3 ON T2.City_channel_ID  =  T3.ID
SELECT T1.Transmitter,  T2.Station_name FROM radio AS T1 JOIN city_channel_radio AS T3 ON T1.Radio_ID  =  T3.Radio_ID JOIN city_channel AS T2 ON T3.City_channel_ID  =  T2.ID ORDER BY T1.ERP_kW DESC
SELECT T1.Transmitter,  count(*) FROM radio AS T1 JOIN city_channel_radio AS T2 ON T1.Radio_ID  =  T2.Radio_ID GROUP BY T1.Transmitter
SELECT DISTINCT Transmitter FROM radio WHERE Radio_ID NOT IN (SELECT Radio_ID FROM city_channel_radio)
SELECT model FROM vehicle WHERE top_speed  =  (SELECT max(top_speed) FROM vehicle WHERE power  >  6000) AND power  >  6000
SELECT model FROM vehicle WHERE power  >  6000 ORDER BY top_speed DESC LIMIT 1
SELECT Name FROM driver WHERE Citizenship  =  'United States'
SELECT Name FROM driver WHERE Citizenship  =  "United States"
SELECT max(count(*)),  driver_id FROM vehicle_driver GROUP BY driver_id ORDER BY count(*) DESC LIMIT 1
SELECT Driver_ID,  count(*) FROM vehicle_driver GROUP BY Driver_ID ORDER BY count(*) DESC LIMIT 1
SELECT max(power),  avg(power) FROM vehicle WHERE builder  =  'Zhuzhou'
SELECT max(power),  avg(power) FROM vehicle WHERE builder  =  "Zhuzhou"
SELECT Vehicle_ID FROM vehicle_driver GROUP BY Vehicle_ID ORDER BY count(*) ASC LIMIT 1
SELECT Vehicle_ID FROM vehicle_driver GROUP BY Vehicle_ID ORDER BY count(*) ASC LIMIT 1
SELECT top_speed,  power FROM vehicle WHERE build_year  =  1996
SELECT top_speed,  power FROM vehicle WHERE build_year  =  1996
SELECT Build_Year,  Model,  Builder FROM vehicle
SELECT Build_Year,  Model,  Builder FROM vehicle
SELECT count(*) FROM driver AS T1 JOIN vehicle_driver AS T2 ON T1.driver_id  =  T2.driver_id JOIN vehicle AS T3 ON T2.vehicle_id  =  T3.vehicle_id WHERE T3.build_year  =  2012
SELECT count(DISTINCT Driver_ID) FROM vehicle_driver AS T1 JOIN vehicle AS T2 ON T1.Vehicle_ID  =  T2.Vehicle_ID WHERE T2.Build_Year  =  2012
SELECT count(*) FROM driver WHERE Racing_Series  =  'NASCAR'
SELECT count(*) FROM driver WHERE Racing_Series  =  "NASCAR"
SELECT avg(Top_Speed) FROM vehicle
SELECT avg(Top_Speed) FROM vehicle
SELECT DISTINCT T1.Name FROM driver AS T1 JOIN vehicle_driver AS T2 ON T1.Driver_ID  =  T2.Driver_ID JOIN vehicle AS T3 ON T2.Vehicle_ID  =  T3.Vehicle_ID WHERE T3.Power  >  5000
SELECT T1.Name FROM driver AS T1 JOIN vehicle_driver AS T2 ON T1.Driver_ID  =  T2.Driver_ID JOIN vehicle AS T3 ON T2.Vehicle_ID  =  T3.Vehicle_ID WHERE T3.Power  >  5000
SELECT model FROM vehicle WHERE Total_Production  >  100 OR Top_Speed  >  150
SELECT model FROM vehicle WHERE Total_Production  >  100 OR Top_Speed  >  150
SELECT Model,  Build_Year FROM vehicle WHERE Model LIKE "%DJ%"
SELECT model,  build_year FROM vehicle WHERE model LIKE "%DJ%"
SELECT model FROM vehicle EXCEPT SELECT T1.model FROM vehicle AS T1 JOIN vehicle_driver AS T2 ON T1.vehicle_id  =  T2.vehicle_id
SELECT model FROM vehicle EXCEPT SELECT T1.model FROM vehicle AS T1 JOIN vehicle_driver AS T2 ON T1.vehicle_id  =  T2.vehicle_id
SELECT Vehicle_ID,  Model FROM vehicle WHERE Vehicle_ID IN (SELECT Vehicle_ID FROM vehicle_driver GROUP BY Vehicle_ID HAVING COUNT(*)  >=  2) OR Builder  =  'Ziyang'
SELECT T1.Vehicle_ID,  T1.Model FROM vehicle AS T1 JOIN vehicle_driver AS T2 ON T1.Vehicle_ID  =  T2.Vehicle_ID GROUP BY T1.Vehicle_ID HAVING count(*)  =  2 UNION SELECT Vehicle_ID,  Model FROM vehicle WHERE Builder  =  "Ziyang"
SELECT Vehicle_ID,  Model FROM vehicle AS T1 JOIN vehicle_driver AS T2 ON T1.Vehicle_ID  =  T2.Vehicle_ID JOIN driver AS T3 ON T2.Driver_ID  =  T3.Driver_ID WHERE T3.Name  =  'Jeff Gordon' GROUP BY T1.Vehicle_ID,  T1.Model HAVING COUNT(*)  >  2 UNION SELECT Vehicle_ID,  Model FROM vehicle AS T1 JOIN vehicle_driver AS T2 ON T1.Vehicle_ID  =  T2.Vehicle_ID JOIN driver AS T3 ON T2.Driver_ID  =  T3.Driver_ID WHERE T3.Name  =  'Jeff Gordon'
SELECT T1.Vehicle_ID,  T1.Model FROM vehicle AS T1 JOIN vehicle_driver AS T2 ON T1.Vehicle_ID  =  T2.Vehicle_ID JOIN driver AS T3 ON T2.Driver_ID  =  T3.Driver_ID WHERE T3.Name  =  'Jeff Gordon' GROUP BY T1.Vehicle_ID HAVING count(*)  >  2 UNION SELECT T1.Vehicle_ID,  T1.Model FROM vehicle AS T1 JOIN vehicle_driver AS T2 ON T1.Vehicle_ID  =  T2.Vehicle_ID JOIN driver AS T3 ON T2.Driver_ID  =  T3.Driver_ID WHERE T3.Name  =  'Jeff Gordon'
SELECT count(*) FROM vehicle WHERE top_speed  =  (SELECT max(top_speed) FROM vehicle)
SELECT count(*) FROM vehicle WHERE top_speed  =  (SELECT max(top_speed) FROM vehicle)
SELECT Name FROM driver ORDER BY Name ASC
SELECT Name FROM driver ORDER BY Name ASC
SELECT Racing_Series,  count(*) FROM driver GROUP BY Racing_Series
SELECT Racing_Series,  COUNT(*) FROM driver GROUP BY Racing_Series
SELECT T1.Name,  T1.Citizenship FROM driver AS T1 JOIN vehicle_driver AS T2 ON T1.Driver_ID  =  T2.Driver_ID JOIN vehicle AS T3 ON T2.Vehicle_ID  =  T3.Vehicle_ID WHERE T3.Model  =  'DJ1'
SELECT T1.Name,  T1.Citizenship FROM driver AS T1 JOIN vehicle_driver AS T2 ON T1.Driver_ID  =  T2.Driver_ID JOIN vehicle AS T3 ON T2.Vehicle_ID  =  T3.Vehicle_ID WHERE T3.Model  =  'DJ1'
SELECT count(*) FROM driver WHERE Driver_ID NOT IN (SELECT Driver_ID FROM vehicle_driver)
SELECT count(*) FROM driver WHERE Driver_ID NOT IN (SELECT Driver_ID FROM vehicle_driver)
SELECT count(*) FROM Exams
SELECT count(*) FROM Exams
SELECT DISTINCT subject_code FROM exams ORDER BY subject_code ASC
SELECT DISTINCT subject_code FROM exams ORDER BY subject_code
SELECT Exam_Name,  Exam_Date FROM Exams WHERE Subject_Code!= "Database"
SELECT Exam_Date,  Exam_Name FROM Exams WHERE Subject_Code!= "Database"
SELECT Exam_Date FROM Exams WHERE Subject_Code LIKE "%data%" ORDER BY Exam_Date DESC
SELECT Exam_Date FROM Exams WHERE Subject_Code LIKE "%data%" ORDER BY Exam_Date DESC
SELECT TYPE_OF_QUESTION_CODE,  count(*) FROM Questions GROUP BY TYPE_OF_QUESTION_CODE
SELECT TYPE_OF_QUESTION_CODE,  count(*) FROM Questions GROUP BY TYPE_OF_QUESTION_CODE
SELECT DISTINCT Student_Answer_Text FROM Student_Answers WHERE Comments  =  "Normal"
SELECT DISTINCT T1.Student_Answer_Text FROM Student_Answers AS T1 JOIN Comments AS T2 ON T1.Student_Answer_ID  =  T2.Student_Answer_ID WHERE T2.Comments  =  "Normal"
SELECT count(DISTINCT Comments) FROM Student_Answers
SELECT count(DISTINCT Comments) FROM Student_Answers
SELECT Student_Answer_Text FROM Student_Answers GROUP BY Student_Answer_Text ORDER BY count(*) DESC
SELECT Student_Answer_Text FROM Student_Answers GROUP BY Student_Answer_Text ORDER BY count(*) DESC
SELECT T1.First_Name,  T1.Date_of_Answer FROM Students AS T1 JOIN Student_Answers AS T2 ON T1.Student_ID  =  T2.Student_ID
SELECT T1.First_Name,  T1.Date_of_Answer FROM Students AS T1 JOIN Student_Answers AS T2 ON T1.Student_ID  =  T2.Student_ID
SELECT T1.Email_Adress,  T2.Date_of_Answer FROM Students AS T1 JOIN Student_Answers AS T2 ON T1.Student_ID  =  T2.Student_ID ORDER BY T2.Date_of_Answer DESC
SELECT T1.Email_Adress,  T2.Date_of_Answer FROM Students AS T1 JOIN Student_Answers AS T2 ON T1.Student_ID  =  T2.Student_ID ORDER BY T2.Date_of_Answer DESC
SELECT Assessment FROM Student_Assessments GROUP BY Assessment ORDER BY count(*) ASC LIMIT 1
SELECT Assessment FROM Student_Assessments GROUP BY Assessment ORDER BY count(*) ASC LIMIT 1
SELECT T1.first_name FROM students AS T1 JOIN student_answers AS T2 ON T1.student_id  =  T2.student_id GROUP BY T1.student_id HAVING count(*)  >=  2
SELECT T1.first_name FROM students AS T1 JOIN student_answers AS T2 ON T1.student_id  =  T2.student_id GROUP BY T1.student_id HAVING count(*)  >=  2
SELECT Valid_Answer_Text FROM Valid_Answers GROUP BY Valid_Answer_Text ORDER BY count(*) DESC LIMIT 1
SELECT Valid_Answer_Text FROM Valid_Answers GROUP BY Valid_Answer_Text ORDER BY count(*) DESC LIMIT 1
SELECT last_name FROM students WHERE gender_mfu!= "M"
SELECT last_name FROM students WHERE gender_mfu!= "M"
SELECT Gender_MFU,  count(*) FROM Students GROUP BY Gender_MFU
SELECT Gender_MFU,  count(*) FROM Students GROUP BY Gender_MFU
SELECT last_name FROM students WHERE gender_mfu  =  "F" OR gender_mfu  =  "M"
SELECT last_name FROM students WHERE gender_mfu  =  "F" OR gender_mfu  =  "M"
SELECT T1.First_Name FROM Students AS T1 JOIN Student_Answers AS T2 ON T1.Student_ID  =  T2.Student_ID GROUP BY T1.First_Name HAVING count(*)  =  0
SELECT T1.first_name FROM students AS T1 JOIN student_answers AS T2 ON T1.student_id  =  T2.student_id WHERE T2.student_answer_text  =  'No Answer'
SELECT Student_Answer_Text FROM Student_Answers WHERE Comments  =  "Normal" INTERSECT SELECT Student_Answer_Text FROM Student_Answers WHERE Comments  =  "Absent"
SELECT Student_Answer_Text FROM Student_Answers WHERE Comments  =  "Normal" INTERSECT SELECT Student_Answer_Text FROM Student_Answers WHERE Comments  =  "Absent"
SELECT TYPE_OF_QUESTION_CODE FROM Questions GROUP BY TYPE_OF_QUESTION_CODE HAVING COUNT(*)  >=  3
SELECT TYPE_OF_QUESTION_CODE FROM Questions GROUP BY TYPE_OF_QUESTION_CODE HAVING COUNT(*)  >=  3
SELECT * FROM Students
SELECT * FROM Students
SELECT count(*) FROM addresses
SELECT count(*) FROM addresses
SELECT address_id,  address_details FROM addresses
SELECT address_id,  address_details FROM addresses
SELECT count(*) FROM products
SELECT count(*) FROM products
SELECT product_id,  product_type_code,  product_name FROM products
SELECT product_id,  product_type_code,  product_name FROM products
SELECT product_price FROM products WHERE product_name  =  "Monitor"
SELECT product_price FROM products WHERE product_name  =  "Monitor"
SELECT min(product_price),  avg(product_price),  max(product_price) FROM products
SELECT min(product_price),  avg(product_price),  max(product_price) FROM products
SELECT avg(product_price) FROM products WHERE product_type_code  =  'Clothes'
SELECT avg(product_price) FROM products WHERE product_type_code  =  'Clothes'
SELECT count(*) FROM products WHERE product_type_code  =  'Hardware'
SELECT count(*) FROM products WHERE product_type_code  =  'Hardware'
SELECT product_name FROM products WHERE product_price  >  (SELECT avg(product_price) FROM products)
SELECT product_name FROM products WHERE product_price  >  (SELECT avg(product_price) FROM products)
SELECT product_name FROM products WHERE product_price  >  (SELECT avg(product_price) FROM products WHERE product_type_code  =  'H')
SELECT product_name FROM products WHERE product_type_code  =  'Hardware' AND product_price  >  (SELECT avg(product_price) FROM products WHERE product_type_code  =  'Hardware')
SELECT product_name FROM products WHERE product_price  =  (SELECT max(product_price) FROM products WHERE product_type_code  =  'Clothes')
SELECT product_name FROM products WHERE product_price  =  (SELECT max(product_price) FROM products WHERE product_type_code  =  'Clothes')
SELECT product_id,  product_name FROM products WHERE product_price  =  (SELECT min(product_price) FROM products WHERE product_type_code  =  'Hardware') AND product_type_code  =  'Hardware'
SELECT product_id,  product_name FROM products WHERE product_type_code  =  'Hardware' ORDER BY product_price ASC LIMIT 1
SELECT product_name FROM products ORDER BY product_price DESC
SELECT product_name FROM products ORDER BY product_price DESC
SELECT product_name FROM products WHERE product_type_code  =  'Hardware' ORDER BY product_price ASC
SELECT product_name FROM products WHERE product_type_code  =  'Hardware' ORDER BY product_price ASC
SELECT product_type_code,  count(*) FROM products GROUP BY product_type_code
SELECT product_type_code,  count(*) FROM products GROUP BY product_type_code
SELECT product_type_code,  avg(product_price) FROM products GROUP BY product_type_code
SELECT product_type_code,  avg(product_price) FROM products GROUP BY product_type_code
SELECT product_type_code FROM products GROUP BY product_type_code HAVING count(*)  >=  2
SELECT product_type_code FROM products GROUP BY product_type_code HAVING count(*)  >=  2
SELECT product_type_code FROM products GROUP BY product_type_code ORDER BY count(*) DESC LIMIT 1
SELECT product_type_code FROM products GROUP BY product_type_code ORDER BY count(*) DESC LIMIT 1
SELECT count(*) FROM customers
SELECT count(*) FROM customers
SELECT customer_id,  customer_name FROM customers
SELECT customer_id,  customer_name FROM customers
SELECT customer_address,  customer_phone,  customer_email FROM customers WHERE customer_name  =  "Jeromy"
SELECT customer_address,  customer_phone,  customer_email FROM customers WHERE customer_name  =  "Jeromy"
SELECT payment_method_code,  count(*) FROM customers GROUP BY payment_method_code
SELECT payment_method_code,  count(*) FROM customers GROUP BY payment_method_code
SELECT payment_method_code FROM customers GROUP BY payment_method_code ORDER BY count(*) DESC LIMIT 1
SELECT payment_method_code FROM customers GROUP BY payment_method_code ORDER BY count(*) DESC LIMIT 1
SELECT customer_name FROM customers GROUP BY payment_method_code ORDER BY count(*) ASC LIMIT 1
SELECT customer_name FROM customers GROUP BY payment_method_code ORDER BY count(*) ASC LIMIT 1
SELECT payment_method_code,  customer_number FROM customers WHERE customer_name  =  "Jeromy"
SELECT payment_method_code,  customer_number FROM customers WHERE customer_name  =  "Jeromy"
SELECT DISTINCT payment_method_code FROM customers
SELECT DISTINCT payment_method_code FROM customers
SELECT product_id,  product_type_code FROM products ORDER BY product_name
SELECT product_id,  product_type_code FROM products ORDER BY product_name
SELECT product_type_code FROM products GROUP BY product_type_code ORDER BY count(*) ASC LIMIT 1
SELECT product_type_code FROM products GROUP BY product_type_code ORDER BY count(*) ASC LIMIT 1
SELECT count(*) FROM customer_orders
SELECT count(*) FROM customer_orders
SELECT order_id,  order_date,  order_status_code FROM customer_orders AS T1 JOIN customers AS T2 ON T1.customer_id  =  T2.customer_id WHERE T2.customer_name  =  "Jeromy"
SELECT order_id,  order_date,  order_status_code FROM customer_orders AS T1 JOIN customers AS T2 ON T1.customer_id  =  T2.customer_id WHERE T2.customer_name  =  "Jeromy"
SELECT customer_name,  customer_id,  count(*) FROM customers AS T1 JOIN customer_orders AS T2 ON T1.customer_id  =  T2.customer_id GROUP BY customer_id
SELECT customer_name,  customer_id,  count(*) FROM customers AS T1 JOIN customer_orders AS T2 ON T1.customer_id  =  T2.customer_id GROUP BY T1.customer_id
SELECT customer_id,  customer_name,  customer_phone,  customer_email FROM customers WHERE customer_id  =  (SELECT customer_id FROM customer_orders GROUP BY customer_id ORDER BY count(*) DESC LIMIT 1)
SELECT T1.customer_id,  T1.customer_name,  T1.customer_phone,  T1.customer_email FROM customers AS T1 JOIN customer_orders AS T2 ON T1.customer_id  =  T2.customer_id GROUP BY T1.customer_id ORDER BY count(*) DESC LIMIT 1
SELECT order_status_code,  count(*) FROM customer_orders GROUP BY order_status_code
SELECT order_status_code,  count(*) FROM customer_orders GROUP BY order_status_code
SELECT order_status_code FROM customer_orders GROUP BY order_status_code ORDER BY count(*) DESC LIMIT 1
SELECT order_status_code FROM customer_orders GROUP BY order_status_code ORDER BY count(*) DESC LIMIT 1
SELECT count(*) FROM customers WHERE customer_id NOT IN (SELECT customer_id FROM customer_orders)
SELECT count(*) FROM customers WHERE customer_id NOT IN (SELECT customer_id FROM customer_orders)
SELECT product_name FROM products EXCEPT SELECT T1.product_name FROM products AS T1 JOIN order_items AS T2 ON T1.product_id  =  T2.product_id
SELECT product_name FROM products EXCEPT SELECT T1.product_name FROM products AS T1 JOIN order_items AS T2 ON T1.product_id  =  T2.product_id
SELECT count(*) FROM order_items AS T1 JOIN products AS T2 ON T1.product_id  =  T2.product_id WHERE T2.product_name  =  "Monitor"
SELECT count(*) FROM order_items AS T1 JOIN products AS T2 ON T1.product_id  =  T2.product_id WHERE T2.product_name  =  "Monitor"
SELECT count(*) FROM customers AS t1 JOIN customer_orders AS t2 ON t1.customer_id  =  t2.customer_id JOIN order_items AS t3 ON t2.order_id  =  t3.order_id JOIN products AS t4 ON t3.product_id  =  t4.product_id WHERE t4.product_name  =  "Monitor"
SELECT count(DISTINCT customer_id) FROM customer_orders AS T1 JOIN order_items AS T2 ON T1.order_id  =  T2.order_id JOIN products AS T3 ON T2.product_id  =  T3.product_id WHERE T3.product_name  =  "Monitor"
SELECT count(*) FROM customers WHERE customer_id IN (SELECT customer_id FROM customer_orders)
SELECT count(DISTINCT customer_id) FROM customer_orders
SELECT customer_id FROM customers EXCEPT SELECT customer_id FROM customer_orders
SELECT customer_id FROM customers EXCEPT SELECT customer_id FROM customer_orders
SELECT order_date,  order_id FROM Order_items WHERE order_quantity  >  6 OR order_id IN (SELECT order_id FROM Order_items GROUP BY order_id HAVING count(*)  >  3)
SELECT T1.order_id,  T1.order_date FROM customer_orders AS T1 JOIN order_items AS T2 ON T1.order_id  =  T2.order_id GROUP BY T1.order_id HAVING count(*)  >  3 OR T2.order_quantity  >  6
SELECT count(*) FROM building
SELECT count(*) FROM building
SELECT Name FROM building ORDER BY Number_of_Stories ASC
SELECT Name FROM building ORDER BY Number_of_Stories ASC
SELECT Address FROM building ORDER BY Completed_Year DESC
SELECT Address FROM building ORDER BY Completed_Year DESC
SELECT max(Number_of_Stories) FROM building WHERE Completed_Year!= 1980
SELECT max(Number_of_Stories) FROM building WHERE Completed_Year!= 1980
SELECT avg(Population) FROM region
SELECT avg(Population) FROM region
SELECT Name FROM region ORDER BY Name ASC
SELECT Name FROM region ORDER BY Name ASC
SELECT Capital FROM region WHERE Area  >  10000
SELECT Capital FROM region WHERE Area  >  10000
SELECT Capital FROM region ORDER BY Population DESC LIMIT 1
SELECT Capital FROM region ORDER BY Population DESC LIMIT 1
SELECT Name FROM region ORDER BY Area DESC LIMIT 5
SELECT Name FROM region ORDER BY Area DESC LIMIT 5
SELECT T1.Name,  T2.Name FROM building AS T1 JOIN region AS T2 ON T1.Region_ID  =  T2.Region_ID
SELECT T1.Name,  T2.Name FROM building AS T1 JOIN region AS T2 ON T1.Region_ID  =  T2.Region_ID
SELECT T1.Name FROM region AS T1 JOIN building AS T2 ON T1.Region_ID  =  T2.Region_ID GROUP BY T1.Name HAVING COUNT(*)  >  1
SELECT T1.Name FROM region AS T1 JOIN building AS T2 ON T1.Region_ID  =  T2.Region_ID GROUP BY T1.Name HAVING COUNT(*)  >  1
SELECT T2.Capital FROM building AS T1 JOIN region AS T2 ON T1.Region_ID  =  T2.Region_ID GROUP BY T1.Region_ID ORDER BY count(*) DESC LIMIT 1
SELECT T2.Capital FROM building AS T1 JOIN region AS T2 ON T1.Region_ID  =  T2.Region_ID GROUP BY T1.Region_ID ORDER BY count(*) DESC LIMIT 1
SELECT T1.Address,  T2.Capital FROM building AS T1 JOIN region AS T2 ON T1.Region_ID  =  T2.Region_ID
SELECT T1.Address,  T2.Name FROM building AS T1 JOIN region AS T2 ON T1.Region_ID  =  T2.Region_ID
SELECT Number_of_Stories FROM building AS T1 JOIN region AS T2 ON T1.Region_ID  =  T2.Region_ID WHERE T2.Name  =  "Abruzzo"
SELECT T1.Number_of_Stories FROM building AS T1 JOIN region AS T2 ON T1.Region_ID  =  T2.Region_ID WHERE T2.Name  =  "Abruzzo"
SELECT Completed_Year,  count(*) FROM building GROUP BY Completed_Year
SELECT Completed_Year,  count(*) FROM building GROUP BY Completed_Year
SELECT Completed_Year FROM building GROUP BY Completed_Year ORDER BY count(*) DESC LIMIT 1
SELECT Completed_Year FROM building GROUP BY Completed_Year ORDER BY count(*) DESC LIMIT 1
SELECT name FROM region WHERE region_id NOT IN (SELECT region_id FROM building)
SELECT name FROM region WHERE region_id NOT IN (SELECT region_id FROM building)
SELECT Completed_Year FROM building WHERE Number_of_Stories  >  20 INTERSECT SELECT Completed_Year FROM building WHERE Number_of_Stories  <  15
SELECT DISTINCT Completed_Year FROM building WHERE Number_of_Stories  >  20 INTERSECT SELECT DISTINCT Completed_Year FROM building WHERE Number_of_Stories  <  15
SELECT DISTINCT Address FROM building
SELECT DISTINCT Address FROM building
SELECT Completed_Year FROM building ORDER BY Number_of_Stories DESC
SELECT Completed_Year FROM building ORDER BY Number_of_Stories DESC
SELECT Channel_Details FROM Channels ORDER BY Channel_Details ASC
SELECT Channel_Details FROM Channels ORDER BY Channel_Details ASC
SELECT count(*) FROM Services
SELECT count(*) FROM Services
SELECT Analytical_Layer_Type_Code FROM Analytical_Layer GROUP BY Analytical_Layer_Type_Code ORDER BY count(*) DESC LIMIT 1
SELECT Analytical_Layer_Type_Code FROM Analytical_Layer GROUP BY Analytical_Layer_Type_Code ORDER BY count(*) DESC LIMIT 1
SELECT T1.Service_ID FROM Customers AS T2 JOIN Customers_and_Services AS T1 ON T2.Customer_ID  =  T1.Customer_ID WHERE T2.Customer_Details  =  "Hardy Kutch"
SELECT T1.Service_Details FROM Services AS T1 JOIN Customers_and_Services AS T2 ON T1.Service_ID  =  T2.Service_ID JOIN Customers AS T3 ON T2.Customer_ID  =  T3.Customer_ID WHERE T3.Customer_Details  =  "Hardy Kutch"
SELECT T1.Service_Details FROM Services AS T1 JOIN Customers_and_Services AS T2 ON T1.Service_ID  =  T2.Service_ID GROUP BY T1.Service_ID HAVING count(*)  >  3
SELECT T1.Service_Details FROM Services AS T1 JOIN Customers_and_Services AS T2 ON T1.Service_ID  =  T2.Service_ID GROUP BY T1.Service_ID HAVING count(*)  >  3
SELECT T1.customer_details FROM customers AS T1 JOIN customers_and_services AS T2 ON T1.customer_id  =  T2.customer_id GROUP BY T1.customer_id ORDER BY count(*) DESC LIMIT 1
SELECT T1.customer_details FROM customers AS T1 JOIN customers_and_services AS T2 ON T1.customer_id  =  T2.customer_id GROUP BY T1.customer_id ORDER BY count(*) DESC LIMIT 1
SELECT T1.customer_details FROM customers AS T1 JOIN customers_and_services AS T2 ON T1.customer_id  =  T2.customer_id GROUP BY T1.customer_id ORDER BY count(*) DESC LIMIT 1
SELECT T1.customer_details FROM customers AS T1 JOIN customers_and_services AS T2 ON T1.customer_id  =  T2.customer_id GROUP BY T1.customer_id ORDER BY count(*) DESC LIMIT 1
SELECT customer_details FROM customers WHERE customer_id NOT IN (SELECT customer_id FROM customers_and_services)
SELECT customer_details FROM customers WHERE customer_id NOT IN (SELECT customer_id FROM customers_and_services)
SELECT T1.customer_details FROM customers AS T1 JOIN customers_and_services AS T2 ON T1.customer_id  =  T2.customer_id JOIN services AS T3 ON T2.service_id  =  T3.service_id GROUP BY T2.service_id ORDER BY count(*) ASC LIMIT 1
SELECT DISTINCT T1.customer_details FROM customers AS T1 JOIN customers_and_services AS T2 ON T1.customer_id  =  T2.customer_id JOIN services AS T3 ON T2.service_id  =  T3.service_id GROUP BY T2.service_id ORDER BY count(*) ASC LIMIT 1
SELECT count(DISTINCT customer_details),  count(DISTINCT service_details) FROM customers,  services
SELECT count(*),  count(*) FROM Customers,  Services
SELECT customer_details FROM customers WHERE customer_details LIKE "%Kutch%"
SELECT customer_details FROM customers WHERE customer_details LIKE "%Kutch%"
SELECT T1.Service_Details FROM Services AS T1 JOIN Customers_and_Services AS T2 ON T1.Service_ID  =  T2.Service_ID JOIN Customers AS T3 ON T2.Customer_ID  =  T3.Customer_ID WHERE T3.Customer_Details  =  "Hardy Kutch" UNION SELECT T1.Service_Details FROM Services AS T1 JOIN Customer_Interactions AS T2 ON T1.Service_ID  =  T2.Service_ID WHERE T2.Status_Code  =  "good"
SELECT T1.Service_Details FROM Services AS T1 JOIN Customers_and_Services AS T2 ON T1.Service_ID  =  T2.Service_ID JOIN Customers AS T3 ON T2.Customer_ID  =  T3.Customer_ID WHERE T3.Customer_Details  =  "Hardy Kutch" UNION SELECT T1.Service_Details FROM Services AS T1 JOIN Customer_Interactions AS T2 ON T1.Service_ID  =  T2.Service_ID WHERE T2.Status_Code  =  "good"
SELECT T1.Service_Details FROM Services AS T1 JOIN Customers_and_Services AS T2 ON T1.Service_ID  =  T2.Service_ID JOIN Customer_Interactions AS T3 ON T2.Customer_ID  =  T3.Customer_ID WHERE T3.Status_Code  =  "bad" AND T2.Customer_ID  =  (SELECT Customer_ID FROM Customers WHERE Customer_Details  =  "Hardy Kutch")
SELECT T1.Service_Details FROM Services AS T1 JOIN Customers_and_Services AS T2 ON T1.Service_ID  =  T2.Service_ID JOIN Customer_Interactions AS T3 ON T2.Customer_ID  =  T3.Customer_ID WHERE T3.Status_Code  =  "bad" AND T2.Customer_ID  =  (SELECT Customer_ID FROM Customers WHERE Customer_Details  =  "Hardy Kutch")
SELECT T1.Service_Details FROM Services AS T1 JOIN Customer_Interactions AS T2 ON T1.Service_ID  =  T2.Service_ID JOIN Channels AS T3 ON T2.Channel_ID  =  T3.Channel_ID WHERE T3.Channel_Details  =  "15 ij"
SELECT T1.Service_Details FROM Services AS T1 JOIN Customer_Interactions AS T2 ON T1.Service_ID  =  T2.Service_ID JOIN Channels AS T3 ON T2.Channel_ID  =  T3.Channel_ID WHERE T3.Channel_Details  =  "15 ij"
SELECT T1.customer_details FROM customers AS T1 JOIN customer_interactions AS T2 ON T1.customer_id  =  T2.customer_id WHERE T2.status_code  =  "Stuck" AND T2.services_and_channels_details  =  "bad"
SELECT T1.customer_details FROM customers AS T1 JOIN customer_interactions AS T2 ON T1.customer_id  =  T2.customer_id WHERE T2.status_code  =  "Stuck" AND T2.services_and_channels_details  =  "bad"
SELECT count(*) FROM Integration_Platform WHERE Integration_Platform_Details  =  "Successful"
SELECT count(*) FROM Integration_Platform WHERE Integration_Platform_Details LIKE "%Success%"
SELECT T1.customer_details FROM customers AS T1 JOIN customer_interactions AS T2 ON T1.customer_id  =  T2.customer_id JOIN integration_platform AS T3 ON T2.customer_interaction_id  =  T3.customer_interaction_id WHERE T3.integration_platform_details  =  'Failed'
SELECT T1.customer_details FROM customers AS T1 JOIN customer_interactions AS T2 ON T1.customer_id  =  T2.customer_id JOIN integration_platform AS T3 ON T2.customer_interaction_id  =  T3.customer_interaction_id WHERE T3.integration_platform_details  =  "Fail"
SELECT Service_ID,  Service_Details FROM Services EXCEPT SELECT Service_ID,  Service_Details FROM Customers_and_Services
SELECT Service_Details FROM Services EXCEPT SELECT T1.Service_Details FROM Services AS T1 JOIN Customers_and_Services AS T2 ON T1.Service_ID  =  T2.Service_ID
SELECT Analytical_Layer_Type_Code,  count(*) FROM Analytical_Layer GROUP BY Analytical_Layer_Type_Code
SELECT Analytical_Layer_Type_Code,  count(*) FROM Analytical_Layer GROUP BY Analytical_Layer_Type_Code
SELECT T1.Service_Details FROM Services AS T1 JOIN Customers_and_Services AS T2 ON T1.Service_ID  =  T2.Service_ID WHERE T2.Customers_and_Services_Details  =  "unsatisfied"
SELECT T1.Service_Details FROM Services AS T1 JOIN Customers_and_Services AS T2 ON T1.Service_ID  =  T2.Service_ID WHERE T2.Customers_and_Services_Details  =  "unsatisfied"
SELECT count(*) FROM Vehicles
SELECT count(*) FROM Vehicles
SELECT name FROM Vehicles ORDER BY Model_year DESC
SELECT name FROM Vehicles ORDER BY Model_year DESC
SELECT DISTINCT Type_of_powertrain FROM Vehicles
SELECT DISTINCT Type_of_powertrain FROM Vehicles
SELECT name,  TYPE_OF_POWERTRAIN,  Annual_fuel_cost FROM Vehicles WHERE Model_year  =  2013 OR Model_year  =  2014
SELECT name,  TYPE_OF_POWERTRAIN,  Annual_fuel_cost FROM Vehicles WHERE Model_year  =  2013 OR Model_year  =  2014
SELECT TYPE_OF_POWERTRAIN FROM Vehicles WHERE Model_year  =  2014 INTERSECT SELECT TYPE_OF_POWERTRAIN FROM Vehicles WHERE Model_year  =  2013
SELECT TYPE_OF_POWERTRAIN FROM Vehicles WHERE Model_year  =  2013 INTERSECT SELECT TYPE_OF_POWERTRAIN FROM Vehicles WHERE Model_year  =  2014
SELECT TYPE_OF_POWERTRAIN,  COUNT(*) FROM Vehicles GROUP BY TYPE_OF_POWERTRAIN
SELECT count(*),  TYPE_OF_POWERTRAIN FROM VEHICLES GROUP BY TYPE_OF_POWERTRAIN
SELECT TYPE_OF_POWERTRAIN FROM Vehicles GROUP BY TYPE_OF_POWERTRAIN ORDER BY count(*) DESC LIMIT 1
SELECT TYPE_OF_POWERTRAIN FROM Vehicles GROUP BY TYPE_OF_POWERTRAIN ORDER BY COUNT(*) DESC LIMIT 1
SELECT min(Annual_fuel_cost),  max(Annual_fuel_cost),  avg(Annual_fuel_cost) FROM Vehicles
SELECT min(Annual_fuel_cost),  max(Annual_fuel_cost),  avg(Annual_fuel_cost) FROM Vehicles
SELECT name,  model_year FROM vehicles WHERE city_fuel_economy_rate  <=  highway_fuel_economy_rate
SELECT name,  model_year FROM vehicles WHERE city_fuel_economy_rate  <=  highway_fuel_economy_rate
SELECT TYPE_OF_POWERTRAIN,  avg(Annual_fuel_cost) FROM Vehicles GROUP BY TYPE_OF_POWERTRAIN HAVING count(*)  >=  2
SELECT TYPE_OF_POWERTRAIN,  avg(Annual_fuel_cost) FROM Vehicles GROUP BY TYPE_OF_POWERTRAIN HAVING count(*)  >=  2
SELECT name,  age,  membership_credit FROM Customers
SELECT name,  age,  membership_credit FROM Customers
SELECT name,  age FROM customers ORDER BY membership_credit DESC LIMIT 1
SELECT name,  age FROM Customers ORDER BY membership_credit DESC LIMIT 1
SELECT avg(age) FROM customers WHERE membership_credit  >  (SELECT avg(membership_credit) FROM customers)
SELECT avg(age) FROM customers WHERE membership_credit  >  (SELECT avg(membership_credit) FROM customers)
SELECT * FROM Discount
SELECT * FROM Discount
SELECT T1.name,  T3.total_hours FROM Vehicles AS T1 JOIN Renting_history AS T2 ON T1.id  =  T2.vehicles_id JOIN Customers AS T3 ON T2.customer_id  =  T3.id
SELECT T1.name,  T2.total_hours FROM Vehicles AS T1 JOIN Renting_history AS T2 ON T1.id  =  T2.vehicles_id
SELECT name FROM Vehicles EXCEPT SELECT T1.name FROM Vehicles AS T1 JOIN Renting_history AS T2 ON T1.id  =  T2.vehicles_id
SELECT name FROM Vehicles EXCEPT SELECT T1.name FROM Vehicles AS T1 JOIN Renting_history AS T2 ON T1.id  =  T2.vehicles_id
SELECT T1.name FROM customers AS T1 JOIN renting_history AS T2 ON T1.id  =  T2.customer_id GROUP BY T1.id HAVING count(*)  >=  2
SELECT T1.name FROM customers AS T1 JOIN renting_history AS T2 ON T1.id  =  T2.customer_id GROUP BY T1.id HAVING count(*)  >=  2
SELECT T1.name,  T1.Model_year FROM Vehicles AS T1 JOIN Renting_history AS T2 ON T1.id  =  T2.vehicles_id GROUP BY T1.id ORDER BY count(*) DESC LIMIT 1
SELECT T1.name,  T1.Model_year FROM Vehicles AS T1 JOIN Renting_history AS T2 ON T1.id  =  T2.vehicles_id GROUP BY T1.id ORDER BY count(*) DESC LIMIT 1
SELECT T1.name FROM Vehicles AS T1 JOIN Renting_history AS T2 ON T1.id  =  T2.vehicles_id ORDER BY T2.total_hours DESC
SELECT T1.name FROM Vehicles AS T1 JOIN Renting_history AS T2 ON T1.id  =  T2.vehicles_id ORDER BY T2.total_hours DESC
SELECT T1.name FROM Discount AS T1 JOIN Renting_history AS T2 ON T1.id  =  T2.discount_id GROUP BY T1.id ORDER BY count(*) DESC LIMIT 1
SELECT T1.name FROM Discount AS T1 JOIN Renting_history AS T2 ON T1.id  =  T2.discount_id GROUP BY T2.discount_id ORDER BY count(*) DESC LIMIT 1
SELECT T1.name,  T1.Type_of_powertrain FROM Vehicles AS T1 JOIN Renting_history AS T2 ON T1.id  =  T2.vehicles_id WHERE T2.total_hours  >  30
SELECT T1.name,  T1.Type_of_powertrain FROM Vehicles AS T1 JOIN Renting_history AS T2 ON T1.id  =  T2.vehicles_id GROUP BY T1.id HAVING sum(T2.total_hours)  >  30
SELECT avg(City_fuel_economy_rate),  avg(Highway_fuel_economy_rate),  Type_of_powertrain FROM Vehicles WHERE Type_of_powertrain!= 'Gasoline' GROUP BY Type_of_powertrain
SELECT avg(City_fuel_economy_rate),  avg(Highway_fuel_economy_rate),  TYPE_OF_POWERTRAIN FROM VEHICLES GROUP BY TYPE_OF_POWERTRAIN
SELECT avg(amount_of_loan) FROM Student_Loans
SELECT avg(amount_of_loan) FROM Student_Loans
SELECT T1.bio_data,  T1.student_id FROM Students AS T1 JOIN Classes AS T2 ON T1.student_id  =  T2.student_id GROUP BY T1.student_id HAVING count(*)  >=  2 INTERSECT SELECT T1.bio_data,  T1.student_id FROM Students AS T1 JOIN Detention AS T2 ON T1.student_id  =  T2.student_id GROUP BY T1.student_id HAVING count(*)  <  2
SELECT T1.bio_data,  T1.student_id FROM Students AS T1 JOIN Classes AS T2 ON T1.student_id  =  T2.student_id GROUP BY T1.student_id HAVING count(*)  >=  2 INTERSECT SELECT T1.bio_data,  T1.student_id FROM Students AS T1 JOIN Detention AS T2 ON T1.student_id  =  T2.student_id GROUP BY T1.student_id HAVING count(*)  <  2
SELECT T1.teacher_details FROM Teachers AS T1 JOIN Classes AS T2 ON T1.teacher_id  =  T2.teacher_id WHERE T2.class_details LIKE '%data%' EXCEPT SELECT T1.teacher_details FROM Teachers AS T1 JOIN Classes AS T2 ON T1.teacher_id  =  T2.teacher_id WHERE T2.class_details LIKE 'net%'
SELECT teacher_details FROM Teachers WHERE teacher_id IN (SELECT teacher_id FROM Classes WHERE class_details LIKE '%data%' EXCEPT SELECT teacher_id FROM Classes WHERE class_details LIKE 'net%')
SELECT bio_data FROM Students WHERE student_id NOT IN (SELECT student_id FROM Detention UNION SELECT student_id FROM Student_Loans)
SELECT bio_data FROM Students WHERE student_id NOT IN (SELECT student_id FROM Detention UNION SELECT student_id FROM Student_Loans)
SELECT T1.amount_of_loan,  T1.date_of_loan FROM Student_Loans AS T1 JOIN Students AS T2 ON T1.student_id  =  T2.student_id JOIN Achievements AS T3 ON T2.student_id  =  T3.student_id GROUP BY T1.student_id HAVING count(*)  >=  2
SELECT T1.amount_of_loan,  T1.date_of_loan FROM Student_Loans AS T1 JOIN Achievements AS T2 ON T1.student_id  =  T2.student_id GROUP BY T1.student_id HAVING count(*)  >=  2
SELECT T1.teacher_id,  T1.teacher_details FROM Teachers AS T1 JOIN Classes AS T2 ON T1.teacher_id  =  T2.teacher_id GROUP BY T1.teacher_id ORDER BY count(*) DESC LIMIT 1
SELECT T1.teacher_id,  T1.teacher_details FROM Teachers AS T1 JOIN Classes AS T2 ON T1.teacher_id  =  T2.teacher_id GROUP BY T1.teacher_id ORDER BY count(*) DESC LIMIT 1
SELECT DISTINCT detention_summary FROM Detention
SELECT DISTINCT detention_summary FROM Detention
SELECT T1.student_details,  T3.address_type_description FROM Students AS T1 JOIN Students_Addresses AS T2 ON T1.student_id  =  T2.student_id JOIN Addresses AS T3 ON T2.address_id  =  T3.address_id
SELECT T1.student_details,  T3.address_type_description FROM Students AS T1 JOIN Students_Addresses AS T2 ON T1.student_id  =  T2.student_id JOIN Addresses AS T3 ON T2.address_id  =  T3.address_id
SELECT T1.address_details,  T2.bio_data FROM Addresses AS T1 JOIN Students AS T2 ON T1.address_id  =  T2.student_id
SELECT T1.address_details,  T2.bio_data FROM Addresses AS T1 JOIN Students AS T2 ON T1.address_id  =  T2.student_id
SELECT T1.bio_data,  T2.date_of_transcript FROM Students AS T1 JOIN Transcripts AS T2 ON T1.student_id  =  T2.student_id
SELECT T1.bio_data,  T2.date_of_transcript FROM Students AS T1 JOIN Transcripts AS T2 ON T1.student_id  =  T2.student_id
SELECT count(*),  behaviour_monitoring_details FROM Behaviour_Monitoring GROUP BY behaviour_monitoring_details ORDER BY count(*) DESC LIMIT 1
SELECT behaviour_monitoring_details,  count(*) FROM Behaviour_Monitoring GROUP BY behaviour_monitoring_details ORDER BY count(*) DESC LIMIT 1
SELECT T1.bio_data,  T1.student_details FROM Students AS T1 JOIN Behaviour_Monitoring AS T2 ON T1.student_id  =  T2.student_id WHERE T2.behaviour_monitoring_details  =  (SELECT behaviour_monitoring_details FROM Behaviour_Monitoring GROUP BY behaviour_monitoring_details ORDER BY count(*) DESC LIMIT 1) INTERSECT SELECT T1.bio_data,  T1.student_details FROM Students AS T1 JOIN Behaviour_Monitoring AS T2 ON T1.student_id  =  T2.student_id WHERE T2.behaviour_monitoring_details  =  (SELECT behaviour_monitoring_details FROM Behaviour_Monitoring GROUP BY behaviour_monitoring_details ORDER BY count(*) DESC LIMIT 2)
SELECT T1.bio_data,  T1.student_details FROM Students AS T1 JOIN Behaviour_Monitoring AS T2 ON T1.student_id  =  T2.student_id GROUP BY T2.behaviour_monitoring_details ORDER BY count(*) DESC LIMIT 1
SELECT T1.bio_data FROM Students AS T1 JOIN Behaviour_Monitoring AS T2 ON T1.student_id  =  T2.student_id GROUP BY T1.student_id ORDER BY count(*) DESC LIMIT 1
SELECT T1.bio_data FROM Students AS T1 JOIN Behaviour_Monitoring AS T2 ON T1.student_id  =  T2.student_id GROUP BY T2.behaviour_monitoring_details ORDER BY count(*) DESC LIMIT 1
SELECT T1.bio_data,  T2.event_date FROM Students AS T1 JOIN Student_Events AS T2 ON T1.student_id  =  T2.student_id
SELECT T1.bio_data,  T2.event_date FROM Students AS T1 JOIN Student_Events AS T2 ON T1.student_id  =  T2.student_id
SELECT count(*),  T1.event_type_description,  T1.event_type_code FROM Ref_Event_Types AS T1 JOIN Student_Events AS T2 ON T1.event_type_code  =  T2.event_type_code GROUP BY T1.event_type_code ORDER BY count(*) DESC LIMIT 1
SELECT T1.event_type_description,  T1.event_type_code,  count(*) FROM Ref_Event_Types AS T1 JOIN Student_Events AS T2 ON T1.event_type_code  =  T2.event_type_code GROUP BY T1.event_type_code ORDER BY count(*) DESC LIMIT 1
SELECT T1.achievement_details,  T2.achievement_type_description FROM Achievements AS T1 JOIN Ref_Achievement_Type AS T2 ON T1.achievement_type_code  =  T2.achievement_type_code
SELECT T1.achievement_details,  T2.achievement_type_description FROM Achievements AS T1 JOIN Ref_Achievement_Type AS T2 ON T1.achievement_type_code  =  T2.achievement_type_code
SELECT count(DISTINCT teacher_id) FROM Classes WHERE student_id NOT IN (SELECT student_id FROM Achievements)
SELECT count(DISTINCT teacher_id) FROM Classes WHERE student_id NOT IN (SELECT student_id FROM Achievements)
SELECT date_of_transcript,  transcript_details FROM Transcripts
SELECT date_of_transcript,  transcript_details FROM Transcripts
SELECT achievement_type_code,  achievement_details,  date_achievement FROM Achievements
SELECT achievement_type_code,  achievement_details,  date_achievement FROM Achievements
SELECT datetime_detention_start,  datetime_detention_end FROM Detention
SELECT datetime_detention_start,  datetime_detention_end FROM Detention
SELECT bio_data FROM Students WHERE student_details LIKE '%Suite%'
SELECT bio_data FROM Students WHERE student_details LIKE "%Suite%"
SELECT T1.teacher_details,  T2.student_details FROM Teachers AS T1 JOIN Classes AS T3 ON T1.teacher_id  =  T3.teacher_id JOIN Students AS T2 ON T2.student_id  =  T3.student_id
SELECT T1.teacher_details,  T2.student_details FROM Teachers AS T1 JOIN Classes AS T2 ON T1.teacher_id  =  T2.teacher_id JOIN Students AS T3 ON T2.student_id  =  T3.student_id
SELECT max(count(*) ),  teacher_id FROM classes GROUP BY teacher_id ORDER BY count(*) DESC LIMIT 1
SELECT teacher_id,  count(*) FROM Classes GROUP BY teacher_id ORDER BY count(*) DESC LIMIT 1
SELECT count(*),  student_id FROM Transcripts GROUP BY student_id ORDER BY count(*) DESC LIMIT 1
SELECT T1.student_id,  count(*) FROM Transcripts AS T1 JOIN Students AS T2 ON T1.student_id  =  T2.student_id GROUP BY T1.student_id ORDER BY count(*) DESC LIMIT 1
SELECT T1.student_id,  T1.student_details FROM Students AS T1 JOIN Transcripts AS T2 ON T1.student_id  =  T2.student_id GROUP BY T1.student_id HAVING count(*)  =  2
SELECT T1.student_id,  T1.student_details FROM Students AS T1 JOIN Transcripts AS T2 ON T1.student_id  =  T2.student_id GROUP BY T1.student_id HAVING count(*)  =  2
SELECT detention_type_code,  detention_type_description FROM Ref_Detention_Type ORDER BY detention_type_code ASC LIMIT 1
SELECT detention_type_code,  detention_type_description FROM Ref_Detention_Type ORDER BY detention_type_code ASC LIMIT 1
SELECT T1.bio_data,  T1.student_details FROM Students AS T1 JOIN Student_Loans AS T2 ON T1.student_id  =  T2.student_id GROUP BY T1.student_id HAVING avg(T2.amount_of_loan)  <  (SELECT avg(amount_of_loan) FROM Student_Loans)
SELECT T1.bio_data,  T1.student_details FROM Students AS T1 JOIN Student_Loans AS T2 ON T1.student_id  =  T2.student_id GROUP BY T1.student_id HAVING avg(T2.amount_of_loan)  >  (SELECT avg(amount_of_loan) FROM Student_Loans)
SELECT date_of_loan FROM Student_Loans ORDER BY date_of_loan ASC LIMIT 1
SELECT date_of_loan FROM Student_Loans ORDER BY date_of_loan ASC LIMIT 1
SELECT T1.bio_data FROM Students AS T1 JOIN Student_Loans AS T2 ON T1.student_id  =  T2.student_id ORDER BY T2.amount_of_loan ASC LIMIT 1
SELECT T1.bio_data FROM Students AS T1 JOIN Student_Loans AS T2 ON T1.student_id  =  T2.student_id ORDER BY T2.amount_of_loan ASC LIMIT 1
SELECT T1.date_of_transcript FROM Transcripts AS T1 JOIN Student_Loans AS T2 ON T1.student_id  =  T2.student_id ORDER BY T2.amount_of_loan DESC LIMIT 1
SELECT T1.date_of_transcript FROM Transcripts AS T1 JOIN Student_Loans AS T2 ON T1.student_id  =  T2.student_id ORDER BY T2.amount_of_loan DESC LIMIT 1
SELECT T1.teacher_details FROM Teachers AS T1 JOIN Classes AS T2 ON T1.teacher_id  =  T2.teacher_id JOIN Transcripts AS T3 ON T2.student_id  =  T3.student_id ORDER BY T3.date_of_transcript ASC LIMIT 1
SELECT T1.teacher_details FROM Teachers AS T1 JOIN Classes AS T2 ON T1.teacher_id  =  T2.teacher_id JOIN Transcripts AS T3 ON T2.student_id  =  T3.student_id ORDER BY T3.date_of_transcript LIMIT 1
SELECT student_id,  sum(amount_of_loan) FROM Student_Loans GROUP BY student_id
SELECT student_id,  sum(amount_of_loan) FROM Student_Loans GROUP BY student_id
SELECT T1.student_id,  T1.bio_data,  count(*) FROM Students AS T1 JOIN Transcripts AS T2 ON T1.student_id  =  T2.student_id GROUP BY T1.student_id
SELECT T1.student_id,  T1.bio_data,  count(*) FROM Students AS T1 JOIN Classes AS T2 ON T1.student_id  =  T2.student_id GROUP BY T1.student_id
SELECT count(*) FROM Detention
SELECT count(*) FROM Detention
SELECT T1.address_type_code,  T1.address_type_description FROM Ref_Address_Types AS T1 JOIN Students_Addresses AS T2 ON T1.address_type_code  =  T2.address_type_code GROUP BY T1.address_type_code ORDER BY count(*) DESC LIMIT 1
SELECT T1.address_type_code,  T1.address_type_description FROM Ref_Address_Types AS T1 JOIN Students_Addresses AS T2 ON T1.address_type_code  =  T2.address_type_code GROUP BY T1.address_type_code ORDER BY count(*) DESC LIMIT 1
SELECT T1.bio_data FROM Students AS T1 JOIN Student_Events AS T2 ON T1.student_id  =  T2.student_id EXCEPT SELECT T1.bio_data FROM Students AS T1 JOIN Student_Loans AS T2 ON T1.student_id  =  T2.student_id
SELECT T1.bio_data FROM Students AS T1 JOIN Student_Events AS T2 ON T1.student_id  =  T2.student_id EXCEPT SELECT T1.bio_data FROM Students AS T1 JOIN Student_Loans AS T2 ON T1.student_id  =  T2.student_id
SELECT T1.date_from,  T1.date_to FROM Addresses AS T1 JOIN Students_Addresses AS T2 ON T1.address_id  =  T2.address_id JOIN Students AS T3 ON T2.student_id  =  T3.student_id JOIN Transcripts AS T4 ON T3.student_id  =  T4.student_id GROUP BY T2.student_id HAVING count(*)  =  2
SELECT T1.datetime_detention_start,  T1.datetime_detention_end FROM Detention AS T1 JOIN Students AS T2 ON T1.student_id  =  T2.student_id JOIN Transcripts AS T3 ON T2.student_id  =  T3.student_id GROUP BY T2.student_id HAVING count(*)  =  2
SELECT datetime_detention_start FROM Detention
SELECT datetime_detention_start FROM Detention
SELECT Name FROM Author
SELECT Name FROM Author
SELECT Name,  Address FROM Client
SELECT Name,  Address FROM Client
SELECT title,  isbn,  saleprice FROM book
SELECT title,  isbn,  saleprice FROM book
SELECT count(*) FROM Book
SELECT count(*) FROM Book
SELECT count(*) FROM Author
SELECT count(*) FROM Author
SELECT count(*) FROM client
SELECT count(*) FROM Client
SELECT Name,  Address FROM Client ORDER BY Name
SELECT Name,  Address FROM Client ORDER BY Name
SELECT T1.Title,  T2.Name FROM Book AS T1 JOIN Author_Book AS T3 ON T1.ISBN  =  T3.ISBN JOIN Author AS T2 ON T3.Author  =  T2.idAuthor
SELECT T1.Title,  T2.Name FROM Book AS T1 JOIN Author_Book AS T2 ON T1.ISBN  =  T2.ISBN JOIN Author AS T3 ON T2.Author  =  T3.idAuthor
SELECT T1.idorder,  T2.name FROM orders AS T1 JOIN client AS T2 ON T1.idclient  =  T2.idclient
SELECT T1.idorder,  T2.name FROM orders AS T1 JOIN client AS T2 ON T1.idclient  =  T2.idclient
SELECT T1.Name,  count(*) FROM Author AS T1 JOIN Author_Book AS T2 ON T1.idAuthor  =  T2.Author GROUP BY T1.idAuthor
SELECT T1.Name,  count(*) FROM Author AS T1 JOIN Author_Book AS T2 ON T1.idAuthor  =  T2.Author GROUP BY T1.idAuthor
SELECT T1.isbn,  count(*) FROM BOOK AS T1 JOIN Books_order AS T2 ON T1.isbn  =  T2.isbn GROUP BY T1.isbn
SELECT ISBN,  count(*) FROM Books_Order GROUP BY ISBN
SELECT ISBN,  sum(amount) FROM Books_order GROUP BY ISBN
SELECT T1.isbn,  sum(T2.amount) FROM book AS T1 JOIN books_order AS T2 ON T1.isbn  =  T2.isbn GROUP BY T1.isbn
SELECT T1.Title FROM BOOK AS T1 JOIN Books_order AS T2 ON T1.ISBN  =  T2.ISBN GROUP BY T1.ISBN ORDER BY count(*) DESC LIMIT 1
SELECT T1.Title FROM BOOK AS T1 JOIN Books_order AS T2 ON T1.ISBN  =  T2.ISBN GROUP BY T1.Title ORDER BY count(*) DESC LIMIT 1
SELECT T1.Title,  T1.PurchasePrice FROM BOOK AS T1 JOIN Books_order AS T2 ON T1.ISBN  =  T2.ISBN GROUP BY T1.ISBN ORDER BY sum(T2.amount) DESC LIMIT 1
SELECT T1.Title,  T1.PurchasePrice FROM BOOK AS T1 JOIN Books_order AS T2 ON T1.ISBN  =  T2.ISBN GROUP BY T1.ISBN ORDER BY sum(T2.amount) DESC LIMIT 1
SELECT T1.Title FROM Book AS T1 JOIN Books_Order AS T2 ON T1.ISBN  =  T2.ISBN
SELECT DISTINCT T1.Title FROM BOOK AS T1 JOIN Books_order AS T2 ON T1.ISBN  =  T2.ISBN WHERE T2.IdOrder  IN  (SELECT IdOrder FROM Orders WHERE DateExped  <  CURRENT_DATE)
SELECT T1.Name FROM Client AS T1 JOIN Orders AS T2 ON T1.IdClient  =  T2.IdClient
SELECT DISTINCT T1.Name FROM Client AS T1 JOIN Orders AS T2 ON T1.IdClient  =  T2.IdClient
SELECT T1.Name,  count(*) FROM Client AS T1 JOIN Orders AS T2 ON T1.IdClient  =  T2.IdClient GROUP BY T1.IdClient
SELECT T1.Name,  count(*) FROM Client AS T1 JOIN Orders AS T2 ON T1.IdClient  =  T2.IdClient GROUP BY T1.Name
SELECT T1.Name FROM Client AS T1 JOIN Orders AS T2 ON T1.IdClient  =  T2.IdClient GROUP BY T1.IdClient ORDER BY count(*) DESC LIMIT 1
SELECT T1.Name FROM Client AS T1 JOIN Orders AS T2 ON T1.IdClient  =  T2.IdClient GROUP BY T1.Name ORDER BY count(*) DESC LIMIT 1
SELECT T1.Name,  sum(T3.amount) FROM Client AS T1 JOIN orders AS T2 ON T1.IdClient  =  T2.IdClient JOIN Books_order AS T3 ON T2.IdOrder  =  T3.IdOrder GROUP BY T1.Name
SELECT T1.Name,  sum(T2.amount) FROM Client AS T1 JOIN Books_order AS T2 ON T1.IdClient  =  T2.IdOrder GROUP BY T1.IdClient
SELECT T1.Name FROM Client AS T1 JOIN orders AS T2 ON T1.IdClient  =  T2.IdClient JOIN books_order AS T3 ON T2.IdOrder  =  T3.IdOrder GROUP BY T1.Name ORDER BY sum(T3.amount) DESC LIMIT 1
SELECT T1.Name FROM Client AS T1 JOIN orders AS T2 ON T1.IdClient  =  T2.IdClient JOIN books_order AS T3 ON T2.IdOrder  =  T3.IdOrder GROUP BY T1.Name ORDER BY sum(T3.amount) DESC LIMIT 1
SELECT title FROM book WHERE isbn NOT IN (SELECT isbn FROM books_order)
SELECT title FROM book WHERE isbn NOT IN (SELECT isbn FROM books_order)
SELECT Name FROM Client EXCEPT SELECT T1.Name FROM Client AS T1 JOIN Orders AS T2 ON T1.IdClient  =  T2.IdClient
SELECT Name FROM Client EXCEPT SELECT T1.Name FROM Client AS T1 JOIN Orders AS T2 ON T1.IdClient  =  T2.IdClient
SELECT max(SalePrice),  min(SalePrice) FROM Book
SELECT max(SalePrice),  min(SalePrice) FROM Book
SELECT avg(PurchasePrice),  avg(SalePrice) FROM Book
SELECT avg(PurchasePrice),  avg(SalePrice) FROM Book
SELECT max(SalePrice - PurchasePrice) FROM Book
SELECT max(SalePrice - PurchasePrice) FROM Book
SELECT title FROM book WHERE saleprice  >  (SELECT avg(saleprice) FROM book)
SELECT title FROM book WHERE saleprice  >  (SELECT avg(saleprice) FROM book)
SELECT title FROM book ORDER BY saleprice ASC LIMIT 1
SELECT title FROM book WHERE saleprice  =  (SELECT min(saleprice) FROM book)
SELECT title FROM book ORDER BY purchaseprice DESC LIMIT 1
SELECT title FROM book ORDER BY purchaseprice DESC LIMIT 1
SELECT avg(T1.SalePrice) FROM Book AS T1 JOIN Author_Book AS T2 ON T1.ISBN  =  T2.ISBN JOIN Author AS T3 ON T2.Author  =  T3.idAuthor WHERE T3.Name  =  "George Orwell"
SELECT avg(T1.SalePrice) FROM Book AS T1 JOIN Author_Book AS T2 ON T1.ISBN  =  T2.ISBN JOIN Author AS T3 ON T2.Author  =  T3.idAuthor WHERE T3.Name  =  "George Orwell"
SELECT T1.SalePrice FROM BOOK AS T1 JOIN Author_Book AS T2 ON T1.ISBN  =  T2.ISBN JOIN Author AS T3 ON T2.Author  =  T3.idAuthor WHERE T3.Name  =  "Plato"
SELECT T1.SalePrice FROM BOOK AS T1 JOIN AUTHOR_BOOK AS T2 ON T1.ISBN  =  T2.ISBN JOIN AUTHOR AS T3 ON T2.Author  =  T3.idAuthor WHERE T3.Name  =  "Plato"
SELECT title FROM book WHERE saleprice  =  (SELECT min(saleprice) FROM book WHERE author  =  "George Orwell")
SELECT title FROM book WHERE saleprice  =  (SELECT min(saleprice) FROM book WHERE author  =  "George Orwell")
SELECT title FROM book WHERE purchaseprice  <  (SELECT avg(saleprice) FROM book) AND author  =  "Plato"
SELECT title FROM book WHERE saleprice  <  (SELECT avg(saleprice) FROM book) AND author  =  "Plato"
SELECT T1.Name FROM Author AS T1 JOIN Author_Book AS T2 ON T1.idAuthor  =  T2.Author JOIN Book AS T3 ON T2.ISBN  =  T3.ISBN WHERE T3.Title  =  "Pride and Prejudice"
SELECT T1.Name FROM Author AS T1 JOIN Author_Book AS T2 ON T1.idAuthor  =  T2.Author JOIN Book AS T3 ON T2.ISBN  =  T3.ISBN WHERE T3.Title  =  "Pride and Prejudice"
SELECT title FROM book AS T1 JOIN author_book AS T2 ON T1.isbn  =  T2.isbn JOIN author AS T3 ON T2.author  =  T3.idauthor WHERE T3.name LIKE '%Plato%'
SELECT title FROM book AS T1 JOIN author_book AS T2 ON T1.isbn  =  T2.isbn JOIN author AS T3 ON T2.author  =  T3.idauthor WHERE T3.name LIKE "%Plato%"
SELECT count(*) FROM BOOK AS T1 JOIN Books_order AS T2 ON T1.isbn  =  T2.isbn WHERE T1.title  =  "Pride and Prejudice"
SELECT count(*) FROM BOOK AS T1 JOIN BOOKS_ORDER AS T2 ON T1.ISBN  =  T2.ISBN WHERE T1.Title  =  "Pride and Prejudice"
SELECT IdOrder FROM Books_Order AS T1 JOIN Book AS T2 ON T1.ISBN  =  T2.ISBN WHERE T2.Title  =  "Pride and Prejudice" INTERSECT SELECT IdOrder FROM Books_Order AS T1 JOIN Book AS T2 ON T1.ISBN  =  T2.ISBN WHERE T2.Title  =  "The Little Prince"
SELECT IdOrder FROM Books_Order WHERE ISBN  =  "978-2-253-06149-3" INTERSECT SELECT IdOrder FROM Books_Order WHERE ISBN  =  "978-2-253-06149-3"
SELECT T1.isbn FROM BOOK AS T1 JOIN Books_order AS T2 ON T1.isbn  =  T2.isbn JOIN Orders AS T3 ON T2.idorder  =  T3.idorder JOIN Client AS T4 ON T3.idclient  =  T4.idclient WHERE T4.name  =  "Peter Doe" INTERSECT SELECT T1.isbn FROM BOOK AS T1 JOIN Books_order AS T2 ON T1.isbn  =  T2.isbn JOIN Orders AS T3 ON T2.idorder  =  T3.idorder JOIN Client AS T4 ON T3.idclient  =  T4.idclient WHERE T4.name  =  "James Smith"
SELECT T1.isbn FROM BOOK AS T1 JOIN BOOKS_ORDER AS T2 ON T1.isbn  =  T2.isbn JOIN orders AS T3 ON T2.idorder  =  T3.idorder JOIN client AS T4 ON T3.idclient  =  T4.idclient WHERE T4.name  =  "Peter Doe" INTERSECT SELECT T1.isbn FROM BOOK AS T1 JOIN BOOKS_ORDER AS T2 ON T1.isbn  =  T2.isbn JOIN orders AS T3 ON T2.idorder  =  T3.idorder JOIN client AS T4 ON T3.idclient  =  T4.idclient WHERE T4.name  =  "James Smith"
SELECT T1.Title FROM Book AS T1 JOIN Books_order AS T2 ON T1.isbn  =  T2.isbn JOIN Orders AS T3 ON T2.idorder  =  T3.idorder JOIN Client AS T4 ON T3.idclient  =  T4.idclient WHERE T4.name  =  "Peter Doe" EXCEPT SELECT T1.Title FROM Book AS T1 JOIN Books_order AS T2 ON T1.isbn  =  T2.isbn JOIN Orders AS T3 ON T2.idorder  =  T3.idorder JOIN Client AS T4 ON T3.idclient  =  T4.idclient WHERE T4.name  =  "James Smith"
SELECT T1.Title FROM BOOK AS T1 JOIN Books_order AS T2 ON T1.ISBN  =  T2.ISBN JOIN Client AS T3 ON T2.IdOrder  =  T3.IdClient WHERE T3.Name  =  "Peter Doe" EXCEPT SELECT T1.Title FROM BOOK AS T1 JOIN Books_order AS T2 ON T1.ISBN  =  T2.ISBN JOIN Client AS T3 ON T2.IdOrder  =  T3.IdClient WHERE T3.Name  =  "James Smith"
SELECT T1.Name FROM Client AS T1 JOIN orders AS T2 ON T1.IdClient  =  T2.IdClient JOIN books_order AS T3 ON T2.IdOrder  =  T3.IdOrder JOIN book AS T4 ON T3.ISBN  =  T4.ISBN WHERE T4.Title  =  "Pride and Prejudice"
SELECT T1.Name FROM Client AS T1 JOIN orders AS T2 ON T1.IdClient  =  T2.IdClient JOIN books_order AS T3 ON T2.IdOrder  =  T3.IdOrder JOIN book AS T4 ON T3.ISBN  =  T4.ISBN WHERE T4.Title  =  "Pride and Prejudice"
SELECT count(*) FROM book
SELECT title FROM book ORDER BY title ASC
SELECT title FROM book ORDER BY pages DESC
SELECT TYPE,  RELEASE FROM book
SELECT max(Chapters),  min(Chapters),  Title FROM book GROUP BY Title
SELECT title FROM book WHERE TYPE!= "Poet"
SELECT avg(Rating) FROM review
SELECT title,  rating FROM book AS T1 JOIN review AS T2 ON T1.book_id  =  T2.book_id
SELECT rating FROM review WHERE book_id  =  (SELECT book_id FROM book ORDER BY chapters DESC LIMIT 1)
SELECT T2.rank FROM book AS T1 JOIN review AS T2 ON T1.book_id  =  T2.book_id ORDER BY T1.pages ASC LIMIT 1
SELECT T1.Title FROM book AS T1 JOIN review AS T2 ON T1.Book_ID  =  T2.Book_ID ORDER BY T2.Rank DESC LIMIT 1
SELECT avg(Readers_in_Million) FROM review AS T1 JOIN book AS T2 ON T1.Book_ID  =  T2.Book_ID WHERE T2.Type  =  "Novel"
SELECT TYPE,  count(*) FROM book GROUP BY TYPE
SELECT TYPE FROM book GROUP BY TYPE ORDER BY COUNT(*) DESC LIMIT 1
SELECT TYPE FROM book GROUP BY TYPE HAVING COUNT(*)  >=  3
SELECT T1.Title FROM book AS T1 JOIN review AS T2 ON T1.Book_ID  =  T2.Book_ID ORDER BY T2.Rating ASC
SELECT T1.Title,  T1.Audio FROM book AS T1 JOIN review AS T2 ON T1.Book_ID  =  T2.Book_ID ORDER BY T2.Readers_in_Million DESC
SELECT count(*) FROM book WHERE book_id NOT IN (SELECT book_id FROM review)
SELECT TYPE FROM book WHERE Chapters  >  75 INTERSECT SELECT TYPE FROM book WHERE Chapters  <  50
SELECT count(DISTINCT TYPE) FROM book
SELECT TYPE,  title FROM book WHERE book_id NOT IN (SELECT book_id FROM review)
SELECT count(*) FROM customer
SELECT count(*) FROM customer
SELECT Name FROM customer ORDER BY Level_of_Membership ASC
SELECT Name FROM customer ORDER BY Level_of_Membership ASC
SELECT Nationality,  Card_Credit FROM customer
SELECT Nationality,  Card_Credit FROM customer
SELECT Name FROM customer WHERE Nationality  =  "England" OR Nationality  =  "Australia"
SELECT Name FROM customer WHERE Nationality  =  "England" OR Nationality  =  "Australia"
SELECT avg(Card_Credit) FROM customer WHERE Level_of_Membership  >  1
SELECT avg(Card_Credit) FROM customer WHERE Level_of_Membership  >  1
SELECT card_credit FROM customer ORDER BY level_of_membership DESC LIMIT 1
SELECT card_credit FROM customer ORDER BY level_of_membership DESC LIMIT 1
SELECT Nationality,  COUNT(*) FROM customer GROUP BY Nationality
SELECT Nationality,  count(*) FROM customer GROUP BY Nationality
SELECT Nationality FROM customer GROUP BY Nationality ORDER BY count(*) DESC LIMIT 1
SELECT Nationality FROM customer GROUP BY Nationality ORDER BY count(*) DESC LIMIT 1
SELECT Nationality FROM customer WHERE Card_Credit  <  50 INTERSECT SELECT Nationality FROM customer WHERE Card_Credit  >  75
SELECT Nationality FROM customer WHERE Card_Credit  >  50 INTERSECT SELECT Nationality FROM customer WHERE Card_Credit  <  75
SELECT T1.Name,  T3.Dish_Name FROM customer AS T1 JOIN customer_order AS T2 ON T1.Customer_ID  =  T2.Customer_ID JOIN branch AS T3 ON T2.Branch_ID  =  T3.Branch_ID
SELECT T1.Name,  T2.Dish_Name FROM customer AS T1 JOIN customer_order AS T2 ON T1.Customer_ID  =  T2.Customer_ID
SELECT T1.Name,  T3.Dish_Name FROM customer AS T1 JOIN customer_order AS T2 ON T1.Customer_ID  =  T2.Customer_ID JOIN branch AS T3 ON T2.Branch_ID  =  T3.Branch_ID ORDER BY T2.Quantity DESC
SELECT T1.name,  T3.dish_name FROM customer AS T1 JOIN customer_order AS T2 ON T1.customer_id  =  T2.customer_id JOIN branch AS T3 ON T2.branch_id  =  T3.branch_id ORDER BY T2.quantity DESC
SELECT T1.Name,  sum(T2.Quantity) FROM customer AS T1 JOIN customer_order AS T2 ON T1.Customer_ID  =  T2.Customer_ID GROUP BY T1.Name
SELECT T1.Name,  sum(T2.Quantity) FROM customer AS T1 JOIN customer_order AS T2 ON T1.Customer_ID  =  T2.Customer_ID GROUP BY T1.Name
SELECT T1.Name FROM customer AS T1 JOIN customer_order AS T2 ON T1.Customer_ID  =  T2.Customer_ID GROUP BY T1.Customer_ID HAVING sum(T2.Quantity)  >  1
SELECT T1.Name FROM customer AS T1 JOIN customer_order AS T2 ON T1.Customer_ID  =  T2.Customer_ID GROUP BY T1.Customer_ID HAVING sum(T2.Quantity)  >  1
SELECT DISTINCT Manager FROM branch
SELECT DISTINCT Manager FROM branch
SELECT name FROM customer EXCEPT SELECT T1.name FROM customer AS T1 JOIN customer_order AS T2 ON T1.customer_id  =  T2.customer_id
SELECT name FROM customer EXCEPT SELECT T1.name FROM customer AS T1 JOIN customer_order AS T2 ON T1.customer_id  =  T2.customer_id
SELECT count(*) FROM member
SELECT Name FROM member ORDER BY Age ASC
SELECT Name,  Nationality FROM member
SELECT Name FROM member WHERE Nationality!= "England"
SELECT Name FROM member WHERE Age  =  19 OR Age  =  20
SELECT Name FROM member ORDER BY Age DESC LIMIT 1
SELECT Nationality,  COUNT(*) FROM member GROUP BY Nationality
SELECT Nationality FROM member GROUP BY Nationality ORDER BY COUNT(*) DESC LIMIT 1
SELECT Nationality FROM member GROUP BY Nationality HAVING COUNT(*)  >=  2
SELECT T1.club_name,  T2.name FROM club AS T1 JOIN club_leader AS T2 ON T1.club_id  =  T2.club_id JOIN member AS T3 ON T2.member_id  =  T3.member_id
SELECT T1.Name FROM member AS T1 JOIN club_leader AS T2 ON T1.Member_ID  =  T2.Member_ID JOIN club AS T3 ON T2.Club_ID  =  T3.Club_ID WHERE T3.Overall_Ranking  >  100
SELECT T1.Name FROM member AS T1 JOIN club_leader AS T2 ON T1.Member_ID  =  T2.Member_ID WHERE T2.Year_Join  <  2018
SELECT T1.Name FROM member AS T1 JOIN club_leader AS T2 ON T1.Member_ID  =  T2.Member_ID JOIN club AS T3 ON T2.Club_ID  =  T3.Club_ID WHERE T3.Club_Name  =  "Houston" AND T3.Team_Leader  =  "Y"
SELECT Name FROM member EXCEPT SELECT T1.Name FROM member AS T1 JOIN club_leader AS T2 ON T1.Member_ID  =  T2.Member_ID
SELECT Nationality FROM member WHERE Age  >  22 INTERSECT SELECT Nationality FROM member WHERE Age  <  19
SELECT avg(T1.age) FROM member AS T1 JOIN club_leader AS T2 ON T1.member_id  =  T2.member_id
SELECT Club_Name FROM club WHERE Club_Name LIKE "%state%"
SELECT T1.Collection_Subset_Name FROM Collection_Subsets AS T1 JOIN Collection_Subset_Members AS T2 ON T1.Collection_Subset_ID  =  T2.Collection_Subset_ID
SELECT Collection_Subset_Name FROM Collection_Subsets
SELECT Collecrtion_Subset_Details FROM Collection_Subsets WHERE Collection_Subset_Name  =  'Top collection'
SELECT Collecrtion_Subset_Details FROM Collection_Subsets WHERE Collection_Subset_Name  =  'Top collection'
SELECT T1.Document_Subset_Name FROM Document_Subsets AS T1 JOIN Document_Subset_Members AS T2 ON T1.Document_Subset_ID  =  T2.Document_Subset_ID
SELECT document_subset_name FROM document_subsets
SELECT document_subset_details FROM document_subsets WHERE document_subset_name  =  'Best for 2000'
SELECT document_subset_details FROM document_subsets WHERE document_subset_name  =  'Best for 2000'
SELECT document_object_id FROM document_objects
SELECT Document_Object_ID FROM Document_Objects
SELECT Parent_Document_Object_ID FROM Document_Objects WHERE Owner  =  "Marlin"
SELECT Document_Object_ID FROM Document_Objects WHERE Owner  =  "Marlin"
SELECT Owner FROM Document_Objects WHERE Description  =  'Braeden Collection'
SELECT OWNER FROM Document_Objects WHERE Description  =  'Braeden Collection'
SELECT T1.owner FROM Document_Objects AS T1 JOIN Documents_in_Collections AS T2 ON T1.Document_Object_ID  =  T2.Document_Object_ID WHERE T1.owner  =  'Marlin'
SELECT T1.Owner FROM Document_Objects AS T1 JOIN Documents_in_Collections AS T2 ON T1.Document_Object_ID  =  T2.Document_Object_ID WHERE T1.Owner  =  'Marlin'
SELECT DISTINCT Description FROM Document_Objects WHERE Parent_Document_Object_ID IS NULL
SELECT DISTINCT Description FROM Document_Objects WHERE Parent_Document_Object_ID IS NULL
SELECT count(*) FROM Document_Objects WHERE Owner  =  "Marlin"
SELECT count(*) FROM Document_Objects WHERE Owner  =  "Marlin"
SELECT document_object_id FROM document_objects WHERE document_object_id NOT IN (SELECT parent_document_object_id FROM document_objects)
SELECT document_object_id FROM document_objects WHERE parent_document_object_id  =  NULL
SELECT Parent_Document_Object_ID,  count(*) FROM Document_Objects GROUP BY Parent_Document_Object_ID
SELECT count(*),  Parent_Document_Object_ID FROM Document_Objects GROUP BY Parent_Document_Object_ID
SELECT Collection_Name FROM Collections
SELECT Collection_Name FROM Collections
SELECT Collection_Description FROM Collections WHERE Collection_Name  =  "Best"
SELECT Collection_Description FROM Collections WHERE Collection_Name  =  'Best'
SELECT T1.Collection_Name FROM Collections AS T1 JOIN Documents_in_Collections AS T2 ON T1.Collection_ID  =  T2.Collection_ID WHERE T1.Collection_Name  =  "Nice"
SELECT T1.Collection_Name FROM Collections AS T1 JOIN Documents_in_Collections AS T2 ON T1.Collection_ID  =  T2.Collection_ID WHERE T1.Collection_Name  =  "Nice"
SELECT Collection_Name FROM Collections WHERE Parent_Collection_ID IS NULL
SELECT collection_name FROM collections WHERE parent_collection_id  =  collection_id
SELECT document_object_id FROM document_objects WHERE parent_document_object_id IS NOT NULL GROUP BY document_object_id HAVING count(*)  >  1
SELECT Document_Object_ID FROM Document_Objects GROUP BY Document_Object_ID HAVING count(*)  >  1
SELECT count(*) FROM Collections WHERE Collection_Name  =  "Best"
SELECT count(*) FROM collections AS T1 JOIN documents_in_collections AS T2 ON T1.collection_id  =  T2.collection_id WHERE T1.collection_name  =  "Best"
SELECT T1.Document_Object_ID FROM Document_Objects AS T1 JOIN Document_Subset_Members AS T2 ON T1.Document_Object_ID  =  T2.Document_Object_ID WHERE T1.Owner  =  "Ransom"
SELECT T1.Document_Object_ID FROM Document_Objects AS T1 JOIN Document_Subset_Members AS T2 ON T1.Document_Object_ID  =  T2.Document_Object_ID WHERE T1.Owner  =  "Ransom"
SELECT T1.Collection_Subset_ID,  T1.Collection_Subset_Name,  count(*) FROM Collection_Subsets AS T1 JOIN Collection_Subset_Members AS T2 ON T1.Collection_Subset_ID  =  T2.Collection_Subset_ID GROUP BY T1.Collection_Subset_ID
SELECT T1.Collection_Subset_ID,  T1.Collection_Subset_Name,  count(*) FROM Collection_Subsets AS T1 JOIN Collection_Subset_Members AS T2 ON T1.Collection_Subset_ID  =  T2.Collection_Subset_ID GROUP BY T1.Collection_Subset_ID
SELECT T1.Document_Object_ID,  count(*) FROM Document_Objects AS T1 JOIN Document_Subset_Members AS T2 ON T1.Document_Object_ID  =  T2.Document_Object_ID GROUP BY T1.Document_Object_ID ORDER BY count(*) DESC LIMIT 1
SELECT Parent_Document_Object_ID,  count(*) FROM Document_Objects GROUP BY Parent_Document_Object_ID
SELECT T1.Document_Object_ID,  count(*) FROM Document_Objects AS T1 JOIN Document_Subset_Members AS T2 ON T1.Document_Object_ID  =  T2.Document_Object_ID GROUP BY T1.Document_Object_ID ORDER BY count(*) ASC LIMIT 1
SELECT Document_Object_ID FROM Documents_in_Collections GROUP BY Document_Object_ID ORDER BY count(*) ASC LIMIT 1
SELECT document_object_id,  count(*) FROM document_subset_members GROUP BY document_object_id HAVING count(*) BETWEEN 2 AND 4
SELECT document_object_id,  count(*) FROM document_subset_members GROUP BY document_object_id HAVING count(*) BETWEEN 2 AND 4
SELECT T1.owner FROM Document_Objects AS T1 JOIN Document_Subset_Members AS T2 ON T1.Document_Object_ID  =  T2.Document_Object_ID JOIN Document_Subset_Members AS T3 ON T2.Related_Document_Object_ID  =  T3.Document_Object_ID JOIN Document_Objects AS T4 ON T3.Document_Object_ID  =  T4.Document_Object_ID WHERE T4.owner  =  "Braeden"
SELECT DISTINCT T1.Owner FROM Document_Objects AS T1 JOIN Document_Subset_Members AS T2 ON T1.Document_Object_ID  =  T2.Document_Object_ID WHERE T1.Owner  =  'Braeden'
SELECT T1.Document_Subset_Name FROM Document_Subsets AS T1 JOIN Document_Subset_Members AS T2 ON T1.Document_Subset_ID  =  T2.Document_Subset_ID JOIN Document_Objects AS T3 ON T2.Document_Object_ID  =  T3.Document_Object_ID WHERE T3.Owner  =  "Braeden" GROUP BY T1.Document_Subset_Name
SELECT DISTINCT T1.Document_Subset_Name FROM Document_Subsets AS T1 JOIN Document_Subset_Members AS T2 ON T1.Document_Subset_ID  =  T2.Document_Subset_ID JOIN Document_Objects AS T3 ON T2.Document_Object_ID  =  T3.Document_Object_ID WHERE T3.Owner  =  "Braeden"
SELECT T1.document_subset_id,  T1.document_subset_name,  count(*) FROM document_subsets AS T1 JOIN document_subset_members AS T2 ON T1.document_subset_id  =  T2.document_subset_id GROUP BY T1.document_subset_id
SELECT T1.document_subset_id,  T1.document_subset_name,  count(*) FROM document_subset_members AS T1 JOIN document_objects AS T2 ON T1.document_object_id  =  T2.document_object_id GROUP BY T1.document_subset_id
SELECT T1.Document_Subset_ID,  T1.Document_Subset_Name,  count(DISTINCT T2.Document_Object_ID) FROM Document_Subsets AS T1 JOIN Document_Subset_Members AS T2 ON T1.Document_Subset_ID  =  T2.Document_Subset_ID GROUP BY T1.Document_Subset_ID ORDER BY count(DISTINCT T2.Document_Object_ID) DESC LIMIT 1
SELECT T1.Document_Subset_ID,  T1.Document_Subset_Name,  count(*) FROM Document_Subsets AS T1 JOIN Document_Subset_Members AS T2 ON T1.Document_Subset_ID  =  T2.Document_Subset_ID GROUP BY T1.Document_Subset_ID ORDER BY count(*) DESC LIMIT 1
SELECT T1.document_object_id FROM document_objects AS T1 JOIN document_subset_members AS T2 ON T1.document_object_id  =  T2.document_object_id JOIN document_subsets AS T3 ON T2.document_subset_id  =  T3.document_subset_id WHERE T3.document_subset_name  =  'Best for 2000'
SELECT T1.document_object_id FROM document_objects AS T1 JOIN document_subset_members AS T2 ON T1.document_object_id  =  T2.document_object_id JOIN document_subsets AS T3 ON T2.document_subset_id  =  T3.document_subset_id WHERE T3.document_subset_name  =  'Best for 2000'
SELECT T1.Document_Subset_Name,  T2.Document_Object_ID FROM Document_Subsets AS T1 JOIN Document_Subset_Members AS T2 ON T1.Document_Subset_ID  =  T2.Document_Subset_ID
SELECT T1.document_subset_name,  T1.document_subset_id,  T2.document_object_id FROM document_subset_members AS T1 JOIN document_objects AS T2 ON T1.document_object_id  =  T2.document_object_id
SELECT T1.Collection_Name FROM Collections AS T1 JOIN Documents_in_Collections AS T2 ON T1.Collection_ID  =  T2.Collection_ID JOIN Document_Objects AS T3 ON T2.Document_Object_ID  =  T3.Document_Object_ID WHERE T3.Owner  =  'Ransom'
SELECT T1.Collection_Name FROM Collections AS T1 JOIN Documents_in_Collections AS T2 ON T1.Collection_ID  =  T2.Collection_ID JOIN Document_Objects AS T3 ON T2.Document_Object_ID  =  T3.Document_Object_ID WHERE T3.Owner  =  'Ransom'
SELECT count(*),  document_object_id FROM Documents_in_Collections GROUP BY document_object_id
SELECT document_object_id,  count(*) FROM Documents_in_Collections GROUP BY document_object_id
SELECT count(*) FROM Documents_in_Collections AS T1 JOIN Collections AS T2 ON T1.Collection_ID  =  T2.Collection_ID WHERE T2.Collection_Name  =  'Best'
SELECT count(*) FROM Documents_in_Collections AS T1 JOIN Collections AS T2 ON T1.Collection_ID  =  T2.Collection_ID WHERE T2.Collection_Name  =  'Best'
SELECT document_object_id FROM Documents_in_Collections AS T1 JOIN Collections AS T2 ON T1.collection_id  =  T2.collection_id WHERE T2.collection_name  =  "Best"
SELECT count(*) FROM Documents_in_Collections AS T1 JOIN Collections AS T2 ON T1.Collection_ID  =  T2.Collection_ID WHERE T2.Collection_Name  =  "Best"
SELECT T1.collection_name,  T1.collection_id,  count(*) FROM collections AS T1 JOIN documents_in_collections AS T2 ON T1.collection_id  =  T2.collection_id GROUP BY T1.collection_id ORDER BY count(*) DESC LIMIT 1
SELECT T1.collection_name,  T1.collection_id,  count(*) FROM collections AS T1 JOIN documents_in_collections AS T2 ON T1.collection_id  =  T2.collection_id WHERE T1.collection_name  =  'Best' GROUP BY T1.collection_id ORDER BY count(*) DESC LIMIT 1
SELECT T1.Document_Object_ID FROM Document_Objects AS T1 JOIN Documents_in_Collections AS T2 ON T1.Document_Object_ID  =  T2.Document_Object_ID JOIN Collections AS T3 ON T2.Collection_ID  =  T3.Collection_ID JOIN Document_Subset_Members AS T4 ON T1.Document_Object_ID  =  T4.Document_Object_ID JOIN Document_Subsets AS T5 ON T4.Document_Subset_ID  =  T5.Document_Subset_ID WHERE T5.Document_Subset_Name  =  "Best for 2000" AND T3.Collection_Name  =  "Best"
SELECT DISTINCT T1.Document_Object_ID FROM Document_Objects AS T1 JOIN Documents_in_Collections AS T2 ON T1.Document_Object_ID  =  T2.Document_Object_ID JOIN Collections AS T3 ON T2.Collection_ID  =  T3.Collection_ID WHERE T3.Collection_Name  =  'Best' INTERSECT SELECT DISTINCT T1.Document_Object_ID FROM Document_Objects AS T1 JOIN Document_Subset_Members AS T2 ON T1.Document_Object_ID  =  T2.Document_Object_ID JOIN Document_Subsets AS T3 ON T2.Document_Subset_ID  =  T3.Document_Subset_ID WHERE T3.Document_Subset_Name  =  'Best for 2000'
SELECT T1.Document_Object_ID FROM Documents_in_Collections AS T1 JOIN Collections AS T2 ON T1.Collection_ID  =  T2.Collection_ID WHERE T2.Collection_Name  =  "Best" EXCEPT SELECT T1.Document_Object_ID FROM Document_Subset_Members AS T1 JOIN Document_Subsets AS T2 ON T1.Document_Subset_ID  =  T2.Document_Subset_ID WHERE T2.Document_Subset_Name  =  "Best" AND T1.Document_Object_ID  =  2000
SELECT T1.Document_Object_ID FROM Document_Objects AS T1 JOIN Documents_in_Collections AS T2 ON T1.Document_Object_ID  =  T2.Document_Object_ID JOIN Collections AS T3 ON T2.Collection_ID  =  T3.Collection_ID WHERE T3.Collection_Name  =  "Best" EXCEPT SELECT T1.Document_Object_ID FROM Document_Objects AS T1 JOIN Document_Subset_Members AS T2 ON T1.Document_Object_ID  =  T2.Document_Object_ID JOIN Document_Subsets AS T3 ON T2.Document_Subset_ID  =  T3.Document_Subset_ID WHERE T3.Document_Subset_Name  =  "Best for 2000"
SELECT T1.Document_Object_ID FROM Document_Objects AS T1 JOIN Document_Subset_Members AS T2 ON T1.Document_Object_ID  =  T2.Document_Object_ID JOIN Document_Subsets AS T3 ON T2.Document_Subset_ID  =  T3.Document_Subset_ID WHERE T3.Document_Subset_Name  =  "Best for 2000" UNION SELECT T1.Document_Object_ID FROM Document_Objects AS T1 JOIN Documents_in_Collections AS T2 ON T1.Document_Object_ID  =  T2.Document_Object_ID JOIN Collections AS T3 ON T2.Collection_ID  =  T3.Collection_ID WHERE T3.Collection_Name  =  "Best"
SELECT DISTINCT document_object_id FROM document_subset_members WHERE document_subset_id  =  (SELECT document_subset_id FROM document_subsets WHERE document_subset_name  =  'Best for 2000') UNION SELECT document_object_id FROM documents_in_collections WHERE collection_id  =  (SELECT collection_id FROM collections WHERE collection_name  =  'Best')
SELECT T1.Collection_Name FROM Collections AS T1 JOIN Collection_Subset_Members AS T2 ON T1.Collection_ID  =  T2.Collection_ID WHERE T1.Collection_Name  =  "Best"
SELECT T1.collection_name FROM collections AS T1 JOIN collection_subset_members AS T2 ON T1.collection_id  =  T2.collection_id WHERE T1.collection_name  =  "Best"
SELECT count(*) FROM Collections AS T1 JOIN Collection_Subset_Members AS T2 ON T1.Collection_ID  =  T2.Collection_ID WHERE T1.Collection_Name  =  "Best"
SELECT count(DISTINCT collection_id) FROM collection_subset_members WHERE collection_subset_id  =  (SELECT collection_subset_id FROM collection_subsets WHERE collection_subset_name  =  'Best')
SELECT T1.Collection_Subset_Name FROM Collection_Subsets AS T1 JOIN Collections AS T2 ON T1.Collection_Subset_ID  =  T2.Parent_Collection_ID WHERE T2.Collection_Name  =  "Best in"
SELECT T1.Collection_Subset_Name FROM Collection_Subsets AS T1 JOIN Collections AS T2 ON T1.Collection_ID  =  T2.Collection_ID WHERE T2.Collection_Name  =  'Best'
SELECT count(*) FROM songs WHERE name LIKE "%Love%"
SELECT name FROM songs ORDER BY name ASC
SELECT name,  language FROM songs
SELECT max(voice_sound_quality),  min(voice_sound_quality) FROM performance_score
SELECT voice_sound_quality,  rhythm_tempo,  stage_presence FROM performance_score AS T1 JOIN participants AS T2 ON T1.participant_id  =  T2.id WHERE T2.name  =  'Freeway'
SELECT id,  language,  original_artist FROM songs WHERE name!= "Love"
SELECT original_artist,  name FROM songs WHERE english_translation  =  'All the streets of love'
SELECT DISTINCT stage_presence FROM performance_score AS T1 JOIN songs AS T2 ON T1.songs_id  =  T2.id WHERE T2.language  =  'English'
SELECT T1.id,  T1.name FROM participants AS T1 JOIN performance_score AS T2 ON T1.id  =  T2.participant_id GROUP BY T1.id HAVING count(*)  >=  2
SELECT T1.id,  T1.name,  T1.popularity,  count(*) FROM participants AS T1 JOIN performance_score AS T2 ON T1.id  =  T2.participant_id GROUP BY T1.id ORDER BY count(*) DESC
SELECT T1.id,  T1.name FROM participants AS T1 JOIN performance_score AS T2 ON T1.id  =  T2.participant_id WHERE T2.voice_sound_quality  =  5 OR T2.rhythm_tempo  =  5
SELECT voice_sound_quality FROM performance_score AS T1 JOIN songs AS T2 ON T1.songs_id  =  T2.id WHERE T2.name  =  "The Balkan Girls" AND T2.english_translation  =  "The Balkan Girls"
SELECT T1.id,  T1.name FROM songs AS T1 JOIN performance_score AS T2 ON T1.id  =  T2.songs_id GROUP BY T1.id ORDER BY count(*) DESC LIMIT 1
SELECT count(*) FROM performance_score WHERE stage_presence  <  7 OR stage_presence  >  9
SELECT count(*) FROM songs WHERE id NOT IN (SELECT songs_id FROM performance_score)
SELECT avg(rhythm_tempo),  language FROM performance_score GROUP BY language
SELECT DISTINCT T1.name FROM participants AS T1 JOIN performance_score AS T2 ON T1.id  =  T2.participant_id JOIN songs AS T3 ON T2.songs_id  =  T3.id WHERE T3.language  =  'English'
SELECT T1.name,  T1.popularity FROM participants AS T1 JOIN performance_score AS T2 ON T1.id  =  T2.participant_id JOIN songs AS T3 ON T2.songs_id  =  T3.id WHERE T3.language  =  'Croatian' INTERSECT SELECT T1.name,  T1.popularity FROM participants AS T1 JOIN performance_score AS T2 ON T1.id  =  T2.participant_id JOIN songs AS T3 ON T2.songs_id  =  T3.id WHERE T3.language  =  'English'
SELECT name FROM songs WHERE name LIKE "%Is%"
SELECT original_artist FROM performance_score AS T1 JOIN songs AS T2 ON T1.songs_id  =  T2.id WHERE rhythm_tempo  >  5 ORDER BY voice_sound_quality DESC
SELECT count(*) FROM city
SELECT count(*) FROM city
SELECT DISTINCT state FROM city
SELECT DISTINCT state FROM city
SELECT count(DISTINCT country) FROM city
SELECT count(DISTINCT country) FROM city
SELECT city_name,  city_code,  state,  country FROM City
SELECT city_name,  city_code,  state,  country FROM City
SELECT latitude,  longitude FROM city WHERE city_name  =  "Baltimore"
SELECT latitude,  longitude FROM city WHERE city_name  =  "Baltimore"
SELECT city_name FROM city WHERE state  =  'PA'
SELECT city_name FROM city WHERE state  =  'PA'
SELECT count(*) FROM city WHERE country  =  "Canada"
SELECT count(*) FROM city WHERE country  =  'Canada'
SELECT city_name FROM city WHERE country  =  'USA' ORDER BY latitude
SELECT city_name FROM city WHERE country  =  'USA' ORDER BY latitude
SELECT state,  count(*) FROM city GROUP BY state
SELECT count(*),  state FROM city GROUP BY state
SELECT country,  count(*) FROM city GROUP BY country
SELECT count(*),  country FROM city GROUP BY country
SELECT state FROM city GROUP BY state HAVING count(*)  >=  2
SELECT state FROM city GROUP BY state HAVING count(*)  >=  2
SELECT state,  count(*) FROM city GROUP BY state ORDER BY count(*) DESC LIMIT 1
SELECT state FROM city GROUP BY state ORDER BY count(*) DESC LIMIT 1
SELECT country FROM city GROUP BY country ORDER BY count(*) ASC LIMIT 1
SELECT country FROM city GROUP BY country ORDER BY count(*) ASC LIMIT 1
SELECT T1.Fname,  T1.LName FROM Student AS T1 JOIN City AS T2 ON T1.city_code  =  T2.city_code WHERE T2.state  =  'MD'
SELECT fname,  lname FROM student WHERE city_code IN (SELECT city_code FROM city WHERE state  =  'MD')
SELECT count(*) FROM Student AS T1 JOIN City AS T2 ON T1.city_code  =  T2.city_code WHERE T2.country  =  "China"
SELECT count(*) FROM Student AS T1 JOIN City AS T2 ON T1.city_code  =  T2.city_code WHERE T2.country  =  "China"
SELECT T1.Fname,  T1.Major FROM Student AS T1 JOIN City AS T2 ON T1.city_code  =  T2.city_code WHERE T2.city_name  =  "Baltimore"
SELECT T1.Fname,  T1.Major FROM Student AS T1 JOIN City AS T2 ON T1.city_code  =  T2.city_code WHERE T2.city_name  =  "Baltimore"
SELECT count(*),  country FROM student JOIN city ON student.city_code  =  city.city_code GROUP BY country
SELECT count(*),  country FROM student JOIN city ON student.city_code  =  city.city_code GROUP BY country
SELECT count(*),  city_name FROM student AS T1 JOIN city AS T2 ON T1.city_code  =  T2.city_code GROUP BY city_name
SELECT city_name,  count(*) FROM city AS T1 JOIN student AS T2 ON T1.city_code  =  T2.city_code GROUP BY city_name
SELECT T1.state FROM city AS T1 JOIN student AS T2 ON T1.city_code  =  T2.city_code GROUP BY T1.state ORDER BY count(*) DESC LIMIT 1
SELECT T1.state FROM city AS T1 JOIN student AS T2 ON T1.city_code  =  T2.city_code GROUP BY T1.state ORDER BY count(*) DESC LIMIT 1
SELECT country FROM student GROUP BY country ORDER BY count(*) ASC LIMIT 1
SELECT country FROM student GROUP BY country ORDER BY count(*) ASC LIMIT 1
SELECT T1.city_name FROM city AS T1 JOIN student AS T2 ON T1.city_code  =  T2.city_code GROUP BY T1.city_name HAVING count(*)  >=  3
SELECT T1.city_name FROM city AS T1 JOIN student AS T2 ON T1.city_code  =  T2.city_code GROUP BY T1.city_name HAVING count(*)  >=  3
SELECT T1.state FROM city AS T1 JOIN student AS T2 ON T1.city_code  =  T2.city_code GROUP BY T1.state HAVING count(*)  >  5
SELECT T1.state FROM city AS T1 JOIN student AS T2 ON T1.city_code  =  T2.city_code GROUP BY T1.state HAVING count(*)  >  5
SELECT StuID FROM Student WHERE city_code NOT IN (SELECT city_code FROM City WHERE country  =  'USA')
SELECT StuID FROM Student WHERE city_code NOT IN (SELECT city_code FROM City WHERE country  =  'USA')
SELECT StuID FROM Student WHERE sex  =  'F' INTERSECT SELECT StuID FROM Student AS T1 JOIN City AS T2 ON T1.city_code  =  T2.city_code WHERE T2.state  =  'PA'
SELECT StuID FROM Student WHERE Sex  =  'F' AND city_code IN (SELECT city_code FROM City WHERE state  =  'PA')
SELECT StuID FROM Student WHERE Sex  =  'M' AND city_code NOT IN (SELECT city_code FROM City WHERE country  =  'USA')
SELECT StuID FROM Student WHERE Sex  =  'M' AND city_code NOT IN (SELECT city_code FROM City WHERE country  =  'USA')
SELECT distance FROM Direct_distance WHERE city1_code  =  "BAL" AND city2_code  =  "CHI"
SELECT T1.distance FROM direct_distance AS T1 JOIN city AS T2 ON T1.city1_code  =  T2.city_code JOIN city AS T3 ON T1.city2_code  =  T3.city_code WHERE T2.city_name  =  "BAL" AND T3.city_name  =  "CHI"
SELECT T1.distance FROM direct_distance AS T1 JOIN city AS T2 ON T1.city1_code  =  T2.city_code JOIN city AS T3 ON T1.city2_code  =  T3.city_code WHERE T2.city_name  =  "Boston" AND T3.city_name  =  "Newark"
SELECT T1.distance FROM direct_distance AS T1 JOIN city AS T2 ON T1.city1_code  =  T2.city_code JOIN city AS T3 ON T1.city2_code  =  T3.city_code WHERE T2.city_name  =  "Boston" AND T3.city_name  =  "Newark"
SELECT avg(distance),  min(distance),  max(distance) FROM direct_distance
SELECT avg(distance),  min(distance),  max(distance) FROM direct_distance
SELECT city2_code FROM Direct_distance WHERE distance  =  (SELECT max(distance) FROM Direct_distance)
SELECT city1_code FROM Direct_distance WHERE distance  =  (SELECT max(distance) FROM Direct_distance)
SELECT city1_code FROM Direct_distance WHERE distance  >  (SELECT avg(distance) FROM Direct_distance)
SELECT city2_code FROM Direct_distance WHERE distance  >  (SELECT avg(distance) FROM Direct_distance)
SELECT city1_code FROM Direct_distance WHERE distance  <  1000 UNION SELECT city2_code FROM Direct_distance WHERE distance  <  1000
SELECT city1_code FROM Direct_distance WHERE distance  <  1000
SELECT sum(distance) FROM Direct_distance WHERE city1_code  =  (SELECT city_code FROM City WHERE city_name  =  'BAL')
SELECT sum(distance) FROM Direct_distance WHERE city1_code  =  "BAL"
SELECT avg(distance) FROM Direct_distance WHERE city1_code  =  21
SELECT avg(distance) FROM direct_distance WHERE city1_code  =  6
SELECT city_name FROM city WHERE city_name  =  "Chicago"
SELECT city_name FROM city WHERE city_name  =  "Chicago"
SELECT city_name FROM city WHERE city_name  =  "Boston"
SELECT T1.city_name FROM city AS T1 JOIN direct_distance AS T2 ON T1.city_code  =  T2.city1_code WHERE T1.city_name  =  "Boston" ORDER BY T2.distance DESC LIMIT 1
SELECT city1_code,  sum(distance) FROM direct_distance GROUP BY city1_code
SELECT city2_code,  sum(distance) FROM direct_distance GROUP BY city2_code
SELECT city_name,  avg(distance) FROM city AS t1 JOIN direct_distance AS t2 ON t1.city_code  =  t2.city1_code GROUP BY city_name
SELECT T1.city_name,  avg(T2.distance) FROM city AS T1 JOIN direct_distance AS T2 ON T1.city_code  =  T2.city1_code GROUP BY T1.city_name
SELECT T1.distance FROM direct_distance AS T1 JOIN student AS T2 ON T1.city1_code  =  T2.city_code WHERE T2.fname  =  "Linda" AND T2.lname  =  "Smith" INTERSECT SELECT T1.distance FROM direct_distance AS T1 JOIN student AS T2 ON T1.city1_code  =  T2.city_code WHERE T2.fname  =  "Tracy" AND T2.lname  =  "Kim"
SELECT T1.distance FROM direct_distance AS T1 JOIN student AS T2 ON T1.city1_code  =  T2.city_code JOIN student AS T3 ON T1.city2_code  =  T3.city_code WHERE T2.fname  =  "Linda" AND T2.lname  =  "Smith" AND T3.fname  =  "Tracy" AND T3.lname  =  "Kim"
SELECT T1.Fname,  T1.LName FROM Student AS T1 JOIN Direct_distance AS T2 ON T1.city_code  =  T2.city1_code WHERE T1.LName  =  "Smith" AND T1.Fname  =  "Linda" ORDER BY T2.distance DESC LIMIT 1
SELECT T1.fname,  T1.lname FROM student AS T1 JOIN direct_distance AS T2 ON T1.city_code  =  T2.city1_code WHERE T1.fname  =  "Linda" AND T1.lname  =  "Smith" ORDER BY T2.distance DESC LIMIT 1
SELECT T1.state FROM city AS T1 JOIN student AS T2 ON T1.city_code  =  T2.city_code WHERE T2.fname  =  "Linda"
SELECT T1.state FROM city AS T1 JOIN student AS T2 ON T1.city_code  =  T2.city_code WHERE T2.fname  =  "Linda"
SELECT * FROM Sailors WHERE age  >  30
SELECT name,  rating,  age FROM Sailors WHERE age  >  30
SELECT name,  age FROM Sailors WHERE age  <  30
SELECT name,  age FROM Sailors WHERE age  <  30
SELECT T2.name FROM Reserves AS T1 JOIN Boats AS T2 ON T1.bid  =  T2.bid WHERE T1.sid  =  1
SELECT DISTINCT bid FROM Reserves WHERE sid  =  1
SELECT name FROM sailors AS T1 JOIN reserves AS T2 ON T1.sid  =  T2.sid JOIN boats AS T3 ON T2.bid  =  T3.bid WHERE T3.bid  =  102
SELECT T1.name FROM Sailors AS T1 JOIN Reserves AS T2 ON T1.sid  =  T2.sid WHERE T2.bid  =  102
SELECT DISTINCT bid FROM Reserves
SELECT bid FROM Reserves
SELECT name FROM Sailors WHERE name LIKE "%e%"
SELECT name FROM Sailors WHERE name LIKE "%e%"
SELECT sid FROM Sailors WHERE age  >  (SELECT max(age) FROM Sailors)
SELECT sid FROM Sailors WHERE age  >  (SELECT min(age) FROM Sailors)
SELECT DISTINCT name FROM Sailors WHERE age  >  (SELECT max(age) FROM Sailors WHERE rating  >  7)
SELECT DISTINCT name FROM Sailors WHERE age  >  (SELECT min(age) FROM Sailors WHERE rating  >  7)
SELECT T1.name,  T1.sid FROM Sailors AS T1 JOIN Reserves AS T2 ON T1.sid  =  T2.sid
SELECT T1.name,  T1.sid FROM Sailors AS T1 JOIN Reserves AS T2 ON T1.sid  =  T2.sid
SELECT sid,  name FROM Sailors WHERE sid IN (SELECT sid FROM Reserves GROUP BY sid HAVING count(*)  >  1)
SELECT name FROM Sailors WHERE sid IN (SELECT sid FROM Reserves GROUP BY sid HAVING count(*)  >=  2)
SELECT sid FROM Reserves AS T1 JOIN Boats AS T2 ON T1.bid  =  T2.bid WHERE T2.color  = 'red' OR T2.color  =  'blue'
SELECT sid FROM Reserves AS T1 JOIN Boats AS T2 ON T1.bid  =  T2.bid WHERE T2.color  = 'red' OR T2.color  =  'blue'
SELECT T1.name,  T1.sid FROM Sailors AS T1 JOIN Reserves AS T2 ON T1.sid  =  T2.sid JOIN Boats AS T3 ON T2.bid  =  T3.bid WHERE T3.color  = 'red' OR T3.color  =  'blue'
SELECT T1.name,  T1.sid FROM Sailors AS T1 JOIN Reserves AS T2 ON T1.sid  =  T2.sid JOIN Boats AS T3 ON T2.bid  =  T3.bid WHERE T3.color  = 'red' OR T3.color  =  'blue'
SELECT sid FROM Reserves AS T1 JOIN Boats AS T2 ON T1.bid  =  T2.bid WHERE T2.color  = 'red' INTERSECT SELECT sid FROM Reserves AS T1 JOIN Boats AS T2 ON T1.bid  =  T2.bid WHERE T2.color  =  'blue'
SELECT sid FROM Reserves AS T1 JOIN Boats AS T2 ON T1.bid  =  T2.bid WHERE T2.color  = 'red' INTERSECT SELECT sid FROM Reserves AS T1 JOIN Boats AS T2 ON T1.bid  =  T2.bid WHERE T2.color  =  'blue'
SELECT T1.name,  T1.sid FROM Sailors AS T1 JOIN Reserves AS T2 ON T1.sid  =  T2.sid JOIN Boats AS T3 ON T2.bid  =  T3.bid WHERE T3.color  = 'red' INTERSECT SELECT T1.name,  T1.sid FROM Sailors AS T1 JOIN Reserves AS T2 ON T1.sid  =  T2.sid JOIN Boats AS T3 ON T2.bid  =  T3.bid WHERE T3.color  =  'blue'
SELECT T1.name,  T1.sid FROM Sailors AS T1 JOIN Reserves AS T2 ON T1.sid  =  T2.sid JOIN Boats AS T3 ON T2.bid  =  T3.bid WHERE T3.color  = 'red' INTERSECT SELECT T1.name,  T1.sid FROM Sailors AS T1 JOIN Reserves AS T2 ON T1.sid  =  T2.sid JOIN Boats AS T3 ON T2.bid  =  T3.bid WHERE T3.color  =  'blue'
SELECT sid FROM Sailors EXCEPT SELECT sid FROM Reserves
SELECT sid FROM Sailors EXCEPT SELECT sid FROM Reserves
SELECT name,  sid FROM Sailors WHERE sid NOT IN (SELECT sid FROM Reserves)
SELECT name,  sid FROM Sailors EXCEPT SELECT T1.name,  T1.sid FROM Sailors AS T1 JOIN Reserves AS T2 ON T1.sid  =  T2.sid
SELECT sid FROM Sailors EXCEPT SELECT sid FROM Reserves
SELECT sid FROM sailors EXCEPT SELECT sid FROM Reserves
SELECT T1.name FROM Sailors AS T1 JOIN Reserves AS T2 ON T1.sid  =  T2.sid WHERE T2.bid  =  103
SELECT T1.name FROM Sailors AS T1 JOIN Reserves AS T2 ON T1.sid  =  T2.sid WHERE T2.bid  =  103
SELECT name FROM Sailors WHERE rating  >  (SELECT max(rating) FROM Sailors WHERE name  =  'Luis')
SELECT name FROM Sailors WHERE rating  >  (SELECT max(rating) FROM Sailors WHERE name  =  'Luis')
SELECT name FROM Sailors WHERE rating  >  (SELECT max(rating) FROM Sailors WHERE name  =  'Luis')
SELECT name FROM Sailors WHERE rating  >  (SELECT max(rating) FROM Sailors WHERE name  =  'Luis')
SELECT name,  sid FROM Sailors WHERE rating  >  2 INTERSECT SELECT T1.name,  T1.sid FROM Reserves AS T1 JOIN Sailors AS T2 ON T1.sid  =  T2.sid
SELECT name,  sid FROM Sailors WHERE rating  >=  3 INTERSECT SELECT T1.name,  T1.sid FROM Reserves AS T1 JOIN Sailors AS T2 ON T1.sid  =  T2.sid
SELECT name,  age FROM Sailors ORDER BY age DESC LIMIT 1
SELECT name,  age FROM Sailors ORDER BY age DESC LIMIT 1
SELECT count(*) FROM Sailors
SELECT count(*) FROM Sailors
SELECT avg(age) FROM Sailors WHERE rating  =  7
SELECT avg(age) FROM Sailors WHERE rating  =  7
SELECT count(*) FROM Sailors WHERE name LIKE 'D%'
SELECT count(*) FROM Sailors WHERE name LIKE 'D%'
SELECT avg(rating),  max(age) FROM Sailors
SELECT avg(rating),  max(age) FROM Sailors
SELECT count(*),  bid FROM Reserves GROUP BY bid
SELECT count(*),  bid FROM Reserves GROUP BY bid
SELECT count(*),  bid FROM Reserves WHERE bid  >  50 GROUP BY bid
SELECT count(*),  bid FROM Reserves WHERE bid  >  50 GROUP BY bid
SELECT count(*),  bid FROM Reserves GROUP BY bid HAVING count(*)  >  1
SELECT count(*),  bid FROM Reserves GROUP BY bid HAVING count(*)  >  1
SELECT count(*),  bid FROM Reserves WHERE sid  >  1 GROUP BY bid
SELECT count(*),  T1.name FROM reserves AS T2 JOIN boats AS T1 ON T2.bid  =  T1.bid JOIN sailors AS T3 ON T2.sid  =  T3.sid WHERE T3.sid  >  1 GROUP BY T1.name
SELECT rating,  avg(age) FROM sailors AS T1 JOIN reserves AS T2 ON T1.sid  =  T2.sid JOIN boats AS T3 ON T2.bid  =  T3.bid WHERE T3.color  = 'red' GROUP BY rating
SELECT rating,  avg(age) FROM sailors AS t1 JOIN reserves AS t2 ON t1.sid  =  t2.sid JOIN boats AS t3 ON t2.bid  =  t3.bid WHERE t3.color  = 'red' GROUP BY rating
SELECT name,  rating,  age FROM Sailors ORDER BY rating,  age
SELECT name,  rating,  age FROM Sailors ORDER BY rating,  age
SELECT count(*) FROM Boats
SELECT count(*) FROM Boats
SELECT count(*) FROM Boats WHERE color  = 'red'
SELECT count(*) FROM Boats WHERE color  = 'red'
SELECT T2.name FROM Reserves AS T1 JOIN Boats AS T2 ON T1.bid  =  T2.bid JOIN Sailors AS T3 ON T1.sid  =  T3.sid WHERE T3.age BETWEEN 20 AND 30
SELECT T2.name FROM Reserves AS T1 JOIN Boats AS T2 ON T1.bid  =  T2.bid JOIN Sailors AS T3 ON T1.sid  =  T3.sid WHERE T3.age BETWEEN 20 AND 30
SELECT name FROM Sailors WHERE rating  >  (SELECT max(rating) FROM Sailors AS T1 JOIN Reserves AS T2 ON T1.sid  =  T2.sid JOIN Boats AS T3 ON T2.bid  =  T3.bid WHERE T3.color  = 'red')
SELECT name FROM Sailors WHERE rating  >  (SELECT max(rating) FROM Sailors AS T1 JOIN Reserves AS T2 ON T1.sid  =  T2.sid JOIN Boats AS T3 ON T2.bid  =  T3.bid WHERE T3.color  = 'red')
SELECT max(rating) FROM Sailors
SELECT max(rating) FROM Sailors
SELECT T1.name FROM Sailors AS T1 JOIN Reserves AS T2 ON T1.sid  =  T2.sid JOIN Boats AS T3 ON T2.bid  =  T3.bid WHERE T3.name  =  "Melon"
SELECT T1.name FROM Sailors AS T1 JOIN Reserves AS T2 ON T1.sid  =  T2.sid JOIN Boats AS T3 ON T2.bid  =  T3.bid WHERE T3.name  =  "Melon"
SELECT name,  age FROM Sailors ORDER BY rating DESC
SELECT name,  age FROM Sailors ORDER BY rating DESC
SELECT Model FROM headphone ORDER BY Price DESC LIMIT 1
SELECT Model FROM headphone ORDER BY Price DESC LIMIT 1
SELECT DISTINCT Model FROM headphone ORDER BY Model ASC
SELECT DISTINCT Model FROM headphone ORDER BY Model
SELECT Class FROM headphone GROUP BY Class ORDER BY COUNT(*) DESC LIMIT 1
SELECT Class FROM headphone GROUP BY Class ORDER BY count(*) DESC LIMIT 1
SELECT Class FROM headphone GROUP BY Class HAVING COUNT(*)  >  2
SELECT Class FROM headphone GROUP BY Class HAVING COUNT(*)  <=  2
SELECT count(*),  CLASS FROM headphone WHERE price  >  200 GROUP BY CLASS
SELECT count(*),  CLASS FROM headphone WHERE price  >  200 GROUP BY CLASS
SELECT count(DISTINCT Earpads) FROM headphone
SELECT count(DISTINCT Earpads) FROM headphone
SELECT Earpads FROM headphone GROUP BY Earpads ORDER BY COUNT(*) DESC LIMIT 2
SELECT Earpads,  COUNT(*) FROM headphone GROUP BY Earpads ORDER BY COUNT(*) DESC LIMIT 2
SELECT Model,  Class,  Construction FROM headphone ORDER BY Price ASC LIMIT 1
SELECT model,  class,  construction FROM headphone ORDER BY price ASC LIMIT 1
SELECT avg(Price),  Construction FROM headphone GROUP BY Construction
SELECT avg(Price),  Construction FROM headphone GROUP BY Construction
SELECT Class FROM headphone WHERE Earpads  =  "Bowls" INTERSECT SELECT Class FROM headphone WHERE Earpads  =  "Comfort Pads"
SELECT DISTINCT CLASS FROM headphone WHERE Earpads  =  "Bowls" INTERSECT SELECT DISTINCT CLASS FROM headphone WHERE Earpads  =  "Comfort Pads"
SELECT Earpads FROM headphone WHERE Construction!= 'Plastic'
SELECT Earpads FROM headphone WHERE Construction!= 'Plastic'
SELECT Model FROM headphone WHERE Price  <  (SELECT avg(Price) FROM headphone)
SELECT Model FROM headphone WHERE Price  <  (SELECT avg(Price) FROM headphone)
SELECT Name FROM store ORDER BY Date_Opened
SELECT Name FROM store ORDER BY Date_Opened
SELECT Name,  Parking FROM store WHERE Neighborhood  =  "Tarzana"
SELECT Name,  Parking FROM store WHERE Neighborhood  =  "Tarzana"
SELECT count(DISTINCT Neighborhood) FROM store
SELECT count(DISTINCT Neighborhood) FROM store
SELECT count(*),  neighborhood FROM store GROUP BY neighborhood
SELECT count(*),  neighborhood FROM store GROUP BY neighborhood
SELECT T1.Name,  count(*) FROM store AS T1 JOIN stock AS T2 ON T1.Store_ID  =  T2.Store_ID GROUP BY T1.Store_ID ORDER BY count(*) DESC LIMIT 1
SELECT T1.Name,  sum(T3.Quantity) FROM store AS T1 JOIN stock AS T2 ON T1.Store_ID  =  T2.Store_ID JOIN headphone AS T3 ON T2.Headphone_ID  =  T3.Headphone_ID GROUP BY T1.Store_ID
SELECT Name FROM store WHERE Store_ID NOT IN (SELECT Store_ID FROM stock)
SELECT T1.Name FROM store AS T1 JOIN stock AS T2 ON T1.Store_ID  =  T2.Store_ID GROUP BY T1.Store_ID HAVING count(*)  =  0
SELECT Model FROM headphone EXCEPT SELECT T1.Model FROM headphone AS T1 JOIN stock AS T2 ON T1.headphone_id  =  T2.headphone_id
SELECT Model FROM headphone EXCEPT SELECT T1.Model FROM headphone AS T1 JOIN stock AS T2 ON T1.headphone_id  =  T2.headphone_id
SELECT T1.Model FROM headphone AS T1 JOIN stock AS T2 ON T1.headphone_id  =  T2.headphone_id GROUP BY T1.Model ORDER BY sum(T2.quantity) DESC LIMIT 1
SELECT T1.Model FROM headphone AS T1 JOIN stock AS T2 ON T1.headphone_id  =  T2.headphone_id GROUP BY T1.Model ORDER BY sum(T2.quantity) DESC LIMIT 1
SELECT count(*) FROM stock AS T1 JOIN store AS T2 ON T1.Store_ID  =  T2.Store_ID WHERE T2.Name  =  "Woodman"
SELECT sum(T1.quantity) FROM stock AS T1 JOIN store AS T2 ON T1.store_id  =  T2.store_id WHERE T2.name  =  "Woodman"
SELECT T1.Name FROM store AS T1 JOIN stock AS T2 ON T1.Store_ID  =  T2.Store_ID GROUP BY T1.Name HAVING count(*)  =  0
SELECT T1.Name FROM store AS T1 JOIN stock AS T2 ON T1.Store_ID  =  T2.Store_ID GROUP BY T1.Store_ID HAVING sum(T2.Quantity)  =  0
SELECT count(*) FROM author
SELECT count(*) FROM author
SELECT count(*) FROM paper
SELECT count(*) FROM paper
SELECT count(*) FROM affiliation
SELECT count(*) FROM affiliation
SELECT count(*) FROM paper WHERE venue  =  "NAACL 2000"
SELECT count(*) FROM paper WHERE venue  =  "NAACL 2000"
SELECT count(*) FROM affiliation AS T1 JOIN paper AS T2 ON T1.name  =  T2.venue JOIN author_list AS T3 ON T1.affiliation_id  =  T3.affiliation_id JOIN author AS T4 ON T3.author_id  =  T4.author_id WHERE T2.year  =  2009 AND T1.name  =  "Columbia University"
SELECT count(*) FROM affiliation AS T1 JOIN paper AS T2 ON T1.affiliation_id  =  T2.paper_id WHERE T1.name  =  "Columbia University" AND T2.year  =  2009
SELECT name,  address FROM affiliation
SELECT name,  address FROM affiliation
SELECT venue,  YEAR FROM PAPER ORDER BY YEAR
SELECT DISTINCT venue FROM paper ORDER BY year
SELECT T1.title,  T1.paper_id FROM paper AS T1 JOIN affiliation AS T2 ON T1.paper_id  =  T2.affiliation_id JOIN author_list AS T3 ON T1.paper_id  =  T3.paper_id JOIN author AS T4 ON T3.author_id  =  T4.author_id JOIN affiliation AS T5 ON T4.affiliation_id  =  T5.affiliation_id WHERE T5.name  =  "Harvard University"
SELECT T1.title,  T1.paper_id FROM paper AS T1 JOIN affiliation AS T2 ON T1.paper_id  =  T2.affiliation_id JOIN author_list AS T3 ON T2.affiliation_id  =  T3.affiliation_id JOIN author AS T4 ON T3.author_id  =  T4.author_id WHERE T4.name  =  "John Smith"
SELECT title,  paper_id FROM paper AS T1 JOIN author_list AS T2 ON T1.paper_id  =  T2.paper_id JOIN author AS T3 ON T2.author_id  =  T3.author_id WHERE T3.name  =  "Mckeown"
SELECT title,  paper_id FROM paper AS T1 JOIN author_list AS T2 ON T1.paper_id  =  T2.paper_id JOIN author AS T3 ON T2.author_id  =  T3.author_id WHERE T3.name  =  "Mckeown"
SELECT T1.title,  T1.paper_id FROM paper AS T1 JOIN affiliation AS T2 ON T1.paper_id  =  T2.affiliation_id JOIN author_list AS T3 ON T1.paper_id  =  T3.paper_id JOIN author AS T4 ON T3.author_id  =  T4.author_id JOIN affiliation AS T5 ON T4.affiliation_id  =  T5.affiliation_id WHERE T5.name  =  "Stanford University" INTERSECT SELECT T1.title,  T1.paper_id FROM paper AS T1 JOIN affiliation AS T2 ON T1.paper_id  =  T2.affiliation_id JOIN author_list AS T3 ON T1.paper_id  =  T3.paper_id JOIN author AS T4 ON T3.author_id  =  T4.author_id JOIN affiliation AS T5 ON T4.affiliation_id  =  T5.affiliation_id WHERE T5.name  =  "Columbia University"
SELECT T1.title,  T1.paper_id FROM paper AS T1 JOIN affiliation AS T2 ON T1.paper_id  =  T2.affiliation_id JOIN author_list AS T3 ON T1.paper_id  =  T3.paper_id JOIN affiliation AS T4 ON T3.affiliation_id  =  T4.affiliation_id WHERE T4.name  =  "Stanford" INTERSECT SELECT T1.title,  T1.paper_id FROM paper AS T1 JOIN affiliation AS T2 ON T1.paper_id  =  T2.affiliation_id JOIN author_list AS T3 ON T1.paper_id  =  T3.paper_id JOIN affiliation AS T4 ON T3.affiliation_id  =  T4.affiliation_id WHERE T4.name  =  "Columbia University"
SELECT title,  paper_id FROM paper AS T1 JOIN author_list AS T2 ON T1.paper_id  =  T2.paper_id JOIN author AS T3 ON T2.author_id  =  T3.author_id WHERE T3.name  =  "Mckeown, Kathleen" INTERSECT SELECT title,  paper_id FROM paper AS T1 JOIN author_list AS T2 ON T1.paper_id  =  T2.paper_id JOIN author AS T3 ON T2.author_id  =  T3.author_id WHERE T3.name  =  "Rambow, Owen"
SELECT T1.title,  T1.paper_id FROM paper AS T1 JOIN author_list AS T2 ON T1.paper_id  =  T2.paper_id JOIN author AS T3 ON T2.author_id  =  T3.author_id WHERE T3.name  =  "McKeown, Kathleen" INTERSECT SELECT T1.title,  T1.paper_id FROM paper AS T1 JOIN author_list AS T2 ON T1.paper_id  =  T2.paper_id JOIN author AS T3 ON T2.author_id  =  T3.author_id WHERE T3.name  =  "Rambow, Owen"
SELECT title,  paper_id FROM paper AS T1 JOIN author_list AS T2 ON T1.paper_id  =  T2.paper_id JOIN author AS T3 ON T2.author_id  =  T3.author_id WHERE T3.name  =  "Mckeown" EXCEPT SELECT title,  paper_id FROM paper AS T1 JOIN author_list AS T2 ON T1.paper_id  =  T2.paper_id JOIN author AS T3 ON T2.author_id  =  T3.author_id WHERE T3.name  =  "Rambow"
SELECT title,  paper_id FROM paper AS T1 JOIN author_list AS T2 ON T1.paper_id  =  T2.paper_id JOIN author AS T3 ON T2.author_id  =  T3.author_id WHERE T3.name  =  "McKeown" EXCEPT SELECT title,  paper_id FROM paper AS T1 JOIN author_list AS T2 ON T1.paper_id  =  T2.paper_id JOIN author AS T3 ON T2.author_id  =  T3.author_id WHERE T3.name  =  "Rambow"
SELECT title,  paper_id FROM paper AS T1 JOIN author_list AS T2 ON T1.paper_id  =  T2.paper_id JOIN author AS T3 ON T2.author_id  =  T3.author_id WHERE T3.name  =  "Mckeown, Kathleen" OR T3.name  =  "Rambow, Owen"
SELECT T1.title,  T1.paper_id FROM paper AS T1 JOIN author_list AS T2 ON T1.paper_id  =  T2.paper_id JOIN author AS T3 ON T2.author_id  =  T3.author_id WHERE T3.name  =  "McKeown, Kathleen" OR T3.name  =  "Rambow, Owen"
SELECT name,  count(*) FROM author AS T1 JOIN affiliation AS T2 ON T1.author_id  =  T2.affiliation_id JOIN author_list AS T3 ON T1.author_id  =  T3.author_id GROUP BY T1.name ORDER BY count(*) DESC
SELECT T1.name,  count(*) FROM author AS T1 JOIN affiliation AS T2 ON T1.author_id  =  T2.affiliation_id JOIN author_list AS T3 ON T1.author_id  =  T3.author_id GROUP BY T1.name ORDER BY count(*) DESC
SELECT T1.name,  count(*) FROM affiliation AS T1 JOIN affiliation AS T2 ON T1.affiliation_id  =  T2.affiliation_id JOIN paper AS T3 ON T2.affiliation_id  =  T3.paper_id GROUP BY T1.affiliation_id ORDER BY count(*) ASC
SELECT T1.name FROM affiliation AS T1 JOIN affiliation AS T2 ON T1.affiliation_id  =  T2.affiliation_id JOIN paper AS T3 ON T2.affiliation_id  =  T3.paper_id GROUP BY T1.affiliation_id ORDER BY count(*) DESC
SELECT T1.name FROM author AS T1 JOIN affiliation AS T2 ON T1.author_id  =  T2.affiliation_id JOIN author_list AS T3 ON T1.author_id  =  T3.author_id GROUP BY T1.name HAVING count(*)  >  50
SELECT name FROM author AS T1 JOIN author_list AS T2 ON T1.author_id  =  T2.author_id GROUP BY T1.author_id HAVING count(*)  >  50
SELECT name FROM author WHERE author_id IN (SELECT author_id FROM paper GROUP BY author_id HAVING count(*)  =  1)
SELECT T1.name FROM author AS T1 JOIN affiliation AS T2 ON T1.author_id  =  T2.affiliation_id JOIN author_list AS T3 ON T1.author_id  =  T3.author_id JOIN paper AS T4 ON T3.paper_id  =  T4.paper_id GROUP BY T1.name HAVING count(*)  =  1
SELECT venue,  year FROM paper GROUP BY venue,  year ORDER BY count(*) DESC LIMIT 1
SELECT venue,  YEAR FROM paper GROUP BY venue,  YEAR ORDER BY count(*) DESC LIMIT 1
SELECT venue FROM paper GROUP BY venue ORDER BY count(*) ASC LIMIT 1
SELECT venue FROM paper GROUP BY venue ORDER BY count(*) ASC LIMIT 1
SELECT count(*) FROM citation WHERE cited_paper_id  =  "A00-1002"
SELECT count(*) FROM citation AS T1 JOIN paper AS T2 ON T1.cited_paper_id  =  T2.paper_id WHERE T2.paper_id  =  'A00-1002'
SELECT count(*) FROM citation AS T1 JOIN paper AS T2 ON T1.cited_paper_id  =  T2.paper_id WHERE T2.paper_id  =  'D12-1027'
SELECT count(*) FROM citation AS T1 JOIN paper AS T2 ON T1.cited_paper_id  =  T2.paper_id WHERE T2.paper_id  =  'D12-1027'
SELECT paper_id,  count(*) FROM citation GROUP BY paper_id ORDER BY count(*) DESC LIMIT 1
SELECT paper_id,  count(*) FROM citation GROUP BY paper_id ORDER BY count(*) DESC LIMIT 1
SELECT title FROM paper WHERE paper_id IN (SELECT cited_paper_id FROM citation GROUP BY cited_paper_id ORDER BY count(*) DESC LIMIT 1)
SELECT title FROM paper WHERE paper_id  =  (SELECT cited_paper_id FROM citation GROUP BY cited_paper_id ORDER BY count(*) DESC LIMIT 1)
SELECT T1.title,  count(*) FROM paper AS T1 JOIN citation AS T2 ON T1.paper_id  =  T2.paper_id GROUP BY T1.paper_id ORDER BY count(*) DESC LIMIT 10
SELECT title,  count(*) FROM citation JOIN paper ON citation.paper_id  =  paper.paper_id GROUP BY citation.paper_id ORDER BY count(*) DESC LIMIT 10
SELECT count(*) FROM citation AS T1 JOIN paper AS T2 ON T1.cited_paper_id  =  T2.paper_id JOIN author_list AS T3 ON T2.paper_id  =  T3.paper_id JOIN author AS T4 ON T3.author_id  =  T4.author_id WHERE T4.name  =  "Mckeown, Kathleen"
SELECT count(*) FROM citation AS T1 JOIN paper AS T2 ON T1.cited_paper_id  =  T2.paper_id JOIN author_list AS T3 ON T2.paper_id  =  T3.paper_id JOIN author AS T4 ON T3.author_id  =  T4.author_id WHERE T4.name  =  "Mckeown, Kathleen"
SELECT count(*) FROM citation AS T1 JOIN paper AS T2 ON T1.cited_paper_id  =  T2.paper_id JOIN author AS T3 ON T2.author_id  =  T3.author_id WHERE T3.name  =  "Mckeown, Kathleen"
SELECT count(*) FROM citation AS T1 JOIN paper AS T2 ON T1.paper_id  =  T2.paper_id JOIN author_list AS T3 ON T2.paper_id  =  T3.paper_id JOIN author AS T4 ON T3.author_id  =  T4.author_id WHERE T4.name  =  "Mckeown, Kathleen"
SELECT T1.name,  count(*) FROM author AS T1 JOIN citation AS T2 ON T1.author_id  =  T2.paper_id GROUP BY T1.name ORDER BY count(*) DESC LIMIT 1
SELECT T1.name,  count(*) FROM Author AS T1 JOIN Citation AS T2 ON T1.author_id  =  T2.paper_id GROUP BY T1.author_id ORDER BY count(*) DESC LIMIT 1
SELECT venue,  YEAR FROM paper AS T1 JOIN author_list AS T2 ON T1.paper_id  =  T2.paper_id JOIN author AS T3 ON T2.author_id  =  T3.author_id WHERE T3.name  =  "Mckeown, Kathleen"
SELECT venue,  YEAR FROM paper AS T1 JOIN author_list AS T2 ON T1.paper_id  =  T2.paper_id JOIN author AS T3 ON T2.author_id  =  T3.author_id WHERE T3.name  =  "Mckeown, Kathleen"
SELECT T1.venue,  T1.year FROM Paper AS T1 JOIN affiliation AS T2 ON T1.paper_id  =  T2.affiliation_id WHERE T2.name  =  "Columbia University"
SELECT T1.venue,  T1.year FROM Paper AS T1 JOIN affiliation AS T2 ON T1.paper_id  =  T2.affiliation_id WHERE T2.name  =  "Columbia University"
SELECT T1.name FROM author AS T1 JOIN affiliation AS T2 ON T1.author_id  =  T2.affiliation_id JOIN paper AS T3 ON T1.author_id  =  T3.paper_id WHERE T3.year  =  2009 GROUP BY T1.name ORDER BY count(*) DESC LIMIT 1
SELECT T1.name FROM author AS T1 JOIN affiliation AS T2 ON T1.author_id  =  T2.affiliation_id JOIN author_list AS T3 ON T1.author_id  =  T3.author_id JOIN paper AS T4 ON T3.paper_id  =  T4.paper_id WHERE T4.year  =  2009 GROUP BY T1.name ORDER BY count(*) DESC LIMIT 1
SELECT T1.name FROM affiliation AS T1 JOIN paper AS T2 ON T1.affiliation_id  =  T2.paper_id WHERE T2.year  =  2009 GROUP BY T1.name ORDER BY count(*) DESC LIMIT 3
SELECT T1.name FROM affiliation AS T1 JOIN affiliation_list AS T2 ON T1.affiliation_id  =  T2.affiliation_id JOIN paper AS T3 ON T2.paper_id  =  T3.paper_id WHERE T3.year  =  2009 GROUP BY T1.name ORDER BY count(*) DESC LIMIT 3
SELECT count(*) FROM affiliation AS T1 JOIN author_list AS T2 ON T1.affiliation_id  =  T2.affiliation_id JOIN paper AS T3 ON T2.paper_id  =  T3.paper_id WHERE T1.name  =  "Columbia University" AND T3.year  <=  2009
SELECT count(*) FROM affiliation AS T1 JOIN author_list AS T2 ON T1.affiliation_id  =  T2.affiliation_id JOIN paper AS T3 ON T2.paper_id  =  T3.paper_id WHERE T1.name  =  "Columbia University" AND T3.year  <=  2009
SELECT count(*) FROM affiliation AS T1 JOIN author_list AS T2 ON T1.affiliation_id  =  T2.affiliation_id JOIN paper AS T3 ON T2.paper_id  =  T3.paper_id WHERE T1.name  =  "Stanford University" AND T3.year BETWEEN 2000 AND 2009
SELECT count(*) FROM affiliation AS T1 JOIN author_list AS T2 ON T1.affiliation_id  =  T2.affiliation_id JOIN paper AS T3 ON T2.paper_id  =  T3.paper_id WHERE T1.name  =  "Stanford University" AND T3.year BETWEEN 2000 AND 2009
SELECT title FROM paper WHERE paper_id = (SELECT paper_id FROM author_list GROUP BY paper_id ORDER BY count(*) DESC LIMIT 1)
SELECT title FROM paper AS t1 JOIN author_list AS t2 ON t1.paper_id  =  t2.paper_id GROUP BY t1.paper_id ORDER BY count(*) DESC LIMIT 1
SELECT count(*) FROM affiliation AS T1 JOIN author_list AS T2 ON T1.affiliation_id  =  T2.affiliation_id JOIN author AS T3 ON T2.author_id  =  T3.author_id WHERE T3.name  =  "Mckeown, Kathleen"
SELECT count(*) FROM affiliation AS T1 JOIN author_list AS T2 ON T1.affiliation_id  =  T2.affiliation_id JOIN author AS T3 ON T2.author_id  =  T3.author_id WHERE T3.name  =  "Mckeown, Kathleen"
SELECT T1.name FROM author AS T1 JOIN affiliation AS T2 ON T1.affiliation_id  =  T2.affiliation_id JOIN author_list AS T3 ON T1.author_id  =  T3.author_id JOIN paper AS T4 ON T3.paper_id  =  T4.paper_id JOIN author AS T5 ON T4.paper_id  =  T5.author_id WHERE T5.name  =  "Mckeown, Kathleen" GROUP BY T1.name ORDER BY count(*) DESC LIMIT 1
SELECT T1.name FROM author AS T1 JOIN affiliation AS T2 ON T1.affiliation_id  =  T2.affiliation_id JOIN author_list AS T3 ON T1.author_id  =  T3.author_id JOIN paper AS T4 ON T3.paper_id  =  T4.paper_id JOIN author AS T5 ON T4.author_id  =  T5.author_id WHERE T5.name  =  "Mckeown, Kathleen" GROUP BY T1.name ORDER BY count(*) DESC LIMIT 1
SELECT paper_id FROM paper WHERE title LIKE "%translation%"
SELECT paper_id FROM paper WHERE title LIKE "%translation%"
SELECT paper_id,  title FROM paper WHERE paper_id NOT IN (SELECT cited_paper_id FROM citation)
SELECT paper_id,  title FROM paper WHERE paper_id NOT IN (SELECT cited_paper_id FROM citation)
SELECT T1.name FROM affiliation AS T1 JOIN affiliation AS T2 ON T1.address LIKE '%China%' JOIN paper AS T3 ON T1.affiliation_id  =  T3.affiliation_id GROUP BY T1.name ORDER BY count(*) DESC LIMIT 1
SELECT T1.name FROM affiliation AS T1 JOIN paper AS T2 ON T1.affiliation_id  =  T2.paper_id WHERE T1.address LIKE '%China%' GROUP BY T1.name ORDER BY count(*) DESC LIMIT 1
SELECT venue,  YEAR,  count(*) FROM paper GROUP BY venue,  YEAR
SELECT venue,  YEAR,  count(*) FROM paper GROUP BY venue,  YEAR
SELECT count(*),  T1.name FROM affiliation AS T1 JOIN affiliation AS T2 ON T1.affiliation_id  =  T2.affiliation_id JOIN paper AS T3 ON T2.affiliation_id  =  T3.paper_id GROUP BY T1.name
SELECT T1.name,  count(*) FROM affiliation AS T1 JOIN affiliation AS T2 ON T1.affiliation_id  =  T2.affiliation_id JOIN paper AS T3 ON T2.affiliation_id  =  T3.paper_id GROUP BY T1.name
SELECT title FROM paper WHERE paper_id IN (SELECT cited_paper_id FROM citation GROUP BY cited_paper_id HAVING count(*)  >  50)
SELECT title FROM paper WHERE paper_id IN (SELECT cited_paper_id FROM citation GROUP BY cited_paper_id HAVING count(*)  >  50)
SELECT count(*) FROM author WHERE author_id NOT IN (SELECT author_id FROM paper AS T1 JOIN citation AS T2 ON T1.paper_id  =  T2.cited_paper_id GROUP BY T1.paper_id HAVING count(*)  >  50)
SELECT count(*) FROM author WHERE author_id NOT IN (SELECT author_id FROM paper AS t1 JOIN citation AS t2 ON t1.paper_id  =  t2.cited_paper_id GROUP BY t1.paper_id HAVING count(*)  >  50)
SELECT T1.name FROM author AS T1 JOIN paper AS T2 ON T1.author_id  =  T2.paper_id WHERE T2.title  =  'NAACL' OR T2.title  =  'ACL' AND T2.year  =  2009
SELECT T1.name FROM author AS T1 JOIN affiliation AS T2 ON T1.author_id  =  T2.affiliation_id JOIN paper AS T3 ON T1.author_id  =  T3.paper_id JOIN affiliation AS T4 ON T4.affiliation_id  =  T3.paper_id WHERE T4.name  =  'NAACL' INTERSECT SELECT T1.name FROM author AS T1 JOIN affiliation AS T2 ON T1.author_id  =  T2.affiliation_id JOIN paper AS T3 ON T1.author_id  =  T3.paper_id JOIN affiliation AS T4 ON T4.affiliation_id  =  T3.paper_id WHERE T4.name  =  'ACL' INTERSECT SELECT T1.name FROM author AS T1 JOIN affiliation AS T2 ON T1.author_id  =  T2.affiliation_id JOIN paper AS T3 ON T1.author_id  =  T3.paper_id WHERE T3.year  =  2009
SELECT name FROM author WHERE author_id NOT IN (SELECT author_id FROM paper WHERE venue  =  'ACL')
SELECT name FROM author WHERE author_id NOT IN (SELECT author_id FROM paper WHERE venue  =  'ACL')
SELECT count(*) FROM conference
SELECT count(*) FROM conference
SELECT DISTINCT Conference_Name FROM conference
SELECT DISTINCT Conference_Name FROM conference
SELECT Conference_Name,  YEAR,  LOCATION FROM conference
SELECT Conference_Name,  YEAR,  LOCATION FROM conference
SELECT Conference_Name,  count(*) FROM conference_participation GROUP BY Conference_Name
SELECT Conference_Name,  count(*) FROM conference GROUP BY Conference_Name
SELECT year,  count(*) FROM conference GROUP BY year
SELECT count(*) FROM conference
SELECT year FROM conference GROUP BY year ORDER BY count(*) ASC LIMIT 1
SELECT YEAR FROM conference GROUP BY YEAR ORDER BY count(*) ASC LIMIT 1
SELECT LOCATION FROM conference GROUP BY LOCATION HAVING COUNT(*)  >=  2
SELECT LOCATION FROM conference GROUP BY LOCATION HAVING COUNT(*)  >=  2
SELECT institution_name,  location,  founded FROM institution
SELECT institution_name,  location,  founded FROM institution
SELECT count(*) FROM institution WHERE founded BETWEEN 1850 AND 1900
SELECT count(*) FROM institution WHERE founded BETWEEN 1850 AND 1900
SELECT institution_name,  LOCATION FROM institution ORDER BY founded DESC LIMIT 1
SELECT institution_name,  LOCATION FROM institution ORDER BY founded DESC LIMIT 1
SELECT T1.institution_name,  count(*) FROM institution AS T1 JOIN staff AS T2 ON T1.institution_id  =  T2.institution_id WHERE T1.founded  >  1800 GROUP BY T1.institution_name
SELECT T1.institution_id,  count(*),  T2.name FROM institution AS T1 JOIN staff AS T2 ON T1.institution_id  =  T2.institution_id WHERE T1.founded  >  1800 GROUP BY T1.institution_id
SELECT institution_name FROM institution EXCEPT SELECT T1.institution_name FROM institution AS T1 JOIN staff AS T2 ON T1.institution_id  =  T2.institution_id
SELECT institution_name FROM institution EXCEPT SELECT T1.institution_name FROM institution AS T1 JOIN staff AS T2 ON T1.institution_id  =  T2.institution_id
SELECT name FROM staff WHERE age  >  (SELECT avg(age) FROM staff)
SELECT name FROM staff WHERE age  >  (SELECT avg(age) FROM staff)
SELECT max(age),  min(age) FROM staff WHERE nationality  =  'United States'
SELECT max(age),  min(age) FROM staff
SELECT T1.Conference_Name FROM conference AS T1 JOIN conference_participation AS T2 ON T1.Conference_ID  =  T2.Conference_ID JOIN staff AS T3 ON T2.staff_ID  =  T3.staff_ID WHERE T3.Nationality  =  "Canada"
SELECT T1.Conference_Name FROM conference AS T1 JOIN conference_participation AS T2 ON T1.Conference_ID  =  T2.Conference_ID JOIN staff AS T3 ON T2.staff_ID  =  T3.staff_ID WHERE T3.Nationality  =  "Canada"
SELECT T1.name FROM staff AS T1 JOIN conference_participation AS T2 ON T1.staff_id  =  T2.staff_id WHERE T2.role  = 'speaker' INTERSECT SELECT T1.name FROM staff AS T1 JOIN conference_participation AS T2 ON T1.staff_id  =  T2.staff_id WHERE T2.role  = 'sponsor'
SELECT T1.name FROM staff AS T1 JOIN conference_participation AS T2 ON T1.staff_id  =  T2.staff_id WHERE T2.role  = 'speaker' INTERSECT SELECT T1.name FROM staff AS T1 JOIN conference_participation AS T2 ON T1.staff_id  =  T2.staff_id WHERE T2.role  = 'sponsor'
SELECT name FROM staff WHERE staff_id IN (SELECT staff_id FROM conference_participation WHERE conference_id IN (SELECT Conference_ID FROM conference WHERE Conference_Name  =  "ACL") INTERSECT SELECT staff_id FROM conference_participation WHERE conference_id IN (SELECT Conference_ID FROM conference WHERE Conference_Name  =  "NACCL"))
SELECT T1.name FROM staff AS T1 JOIN conference_participation AS T2 ON T1.staff_id  =  T2.staff_id JOIN conference AS T3 ON T2.Conference_ID  =  T3.Conference_ID WHERE T3.Conference_Name  =  'ACL' INTERSECT SELECT T1.name FROM staff AS T1 JOIN conference_participation AS T2 ON T1.staff_id  =  T2.staff_id JOIN conference AS T3 ON T2.Conference_ID  =  T3.Conference_ID WHERE T3.Conference_Name  =  'NACCL'
SELECT T1.name FROM staff AS T1 JOIN conference_participation AS T2 ON T1.staff_id  =  T2.staff_id JOIN conference AS T3 ON T2.Conference_ID  =  T3.Conference_ID WHERE T3.year  =  2003 OR T3.year  =  2004
SELECT T1.name FROM staff AS T1 JOIN conference_participation AS T2 ON T1.staff_id  =  T2.staff_id JOIN conference AS T3 ON T2.Conference_ID  =  T3.Conference_ID WHERE T3.year  =  2003 OR T3.year  =  2004
SELECT T1.Conference_Name,  T1.Year,  count(*) FROM conference AS T1 JOIN conference_participation AS T2 ON T1.Conference_ID  =  T2.Conference_ID GROUP BY T1.Conference_ID
SELECT T1.Conference_Name,  T1.Year,  count(*) FROM conference AS T1 JOIN conference_participation AS T2 ON T1.Conference_ID  =  T2.Conference_ID GROUP BY T1.Conference_ID
SELECT T1.Conference_Name FROM conference AS T1 JOIN conference_participation AS T2 ON T1.Conference_ID  =  T2.Conference_ID GROUP BY T1.Conference_ID ORDER BY count(*) DESC LIMIT 2
SELECT T1.Conference_Name FROM conference AS T1 JOIN conference_participation AS T2 ON T1.Conference_ID  =  T2.Conference_ID GROUP BY T1.Conference_ID ORDER BY count(*) DESC LIMIT 2
SELECT name,  Nationality FROM staff WHERE staff_id NOT IN (SELECT staff_id FROM conference_participation WHERE Conference_ID  =  1)
SELECT name,  Nationality FROM staff WHERE staff_id NOT IN (SELECT staff_id FROM conference_participation WHERE Conference_ID  =  1)
SELECT T1.institution_name,  T1.location FROM institution AS T1 JOIN staff AS T2 ON T1.institution_id  =  T2.institution_id JOIN conference_participation AS T3 ON T2.staff_id  =  T3.staff_id WHERE T3.conference_id NOT IN (SELECT conference_id FROM conference WHERE YEAR  =  2004)
SELECT institution_name,  LOCATION FROM institution WHERE institution_id NOT IN (SELECT institution_id FROM staff WHERE staff_id IN (SELECT staff_id FROM conference_participation WHERE conference_id IN (SELECT conference_id FROM conference WHERE YEAR  =  2004)))
SELECT pilot_name FROM pilotskills ORDER BY age DESC LIMIT 1
SELECT pilot_name FROM pilotskills ORDER BY age DESC LIMIT 1
SELECT pilot_name FROM pilots WHERE age  <  (SELECT avg(age) FROM pilots) ORDER BY age
SELECT pilot_name FROM pilotskills WHERE age  <  (SELECT avg(age) FROM pilotskills) ORDER BY age ASC
SELECT * FROM pilots WHERE age  <  30
SELECT * FROM pilots WHERE age  <  30
SELECT pilot_name FROM pilotskills WHERE plane_name  =  "Piper Cub" AND age  <  35
SELECT pilot_name FROM pilotskills WHERE age  <  35 AND plane_name  =  "Piper Cub"
SELECT location FROM hangar WHERE plane_name  =  "F-14 Fighter"
SELECT location FROM hangar WHERE plane_name  =  "F-14 Fighter"
SELECT count(DISTINCT location) FROM hangar
SELECT count(DISTINCT location) FROM hangar
SELECT plane_name FROM pilotskills WHERE pilot_name  =  "Jones" AND age  =  32
SELECT plane_name FROM pilotskills WHERE pilot_name  =  "Jones" AND age  =  32
SELECT count(*) FROM pilotskill WHERE age  >  40
SELECT count(*) FROM pilotskill WHERE age  >  40
SELECT count(*) FROM pilotskills AS T1 JOIN hangar AS T2 ON T1.plane_name  =  T2.plane_name WHERE T1.pilot_name  =  "B-52 Bomber" AND T1.age  <  35
SELECT count(*) FROM pilotskills AS T1 JOIN hangar AS T2 ON T1.plane_name  =  T2.plane_name WHERE T1.plane_name  =  "B-52 Bomber" AND T1.age  <  35
SELECT pilot_name FROM pilotskills WHERE plane_name  =  "Piper Cub" ORDER BY age ASC LIMIT 1
SELECT pilot_name FROM pilotskills WHERE plane_name  =  "Piper Cub" ORDER BY age ASC LIMIT 1
SELECT plane_name FROM PilotSkills GROUP BY plane_name ORDER BY count(*) DESC LIMIT 1
SELECT plane_name FROM PilotSkills GROUP BY plane_name ORDER BY count(*) DESC LIMIT 1
SELECT plane_name FROM hangar GROUP BY plane_name ORDER BY count(*) ASC LIMIT 1
SELECT plane_name FROM pilotSkills GROUP BY plane_name ORDER BY count(*) ASC LIMIT 1
SELECT count(*) FROM hangar AS T1 JOIN pilotskills AS T2 ON T1.plane_name  =  T2.plane_name WHERE T1.location  =  "Chicago"
SELECT count(*) FROM pilotSkills AS T1 JOIN hangar AS T2 ON T1.plane_name  =  T2.plane_name WHERE T2.location  =  "Chicago"
SELECT plane_name FROM pilotskills WHERE pilot_name  =  "Smith" AND age  =  41
SELECT plane_name FROM pilotskills WHERE pilot_name  =  "Smith" AND age  =  41
SELECT count(DISTINCT plane_name) FROM pilotskills
SELECT count(DISTINCT plane_name) FROM pilotskills
SELECT count(*) FROM pilotskills AS T1 JOIN hangar AS T2 ON T1.plane_name  =  T2.plane_name WHERE T1.pilot_name  =  "Smith"
SELECT count(*) FROM PilotSkills WHERE pilot_name  =  "Smith"
SELECT count(*) FROM pilotskills WHERE age  >  40
SELECT count(*) FROM pilotskills WHERE age  >  40
SELECT pilot_name FROM pilotskills WHERE age BETWEEN 30 AND 40 ORDER BY age ASC
SELECT pilot_name FROM pilotskills WHERE age BETWEEN 30 AND 40 ORDER BY age ASC
SELECT pilot_name FROM pilotskills ORDER BY age DESC
SELECT pilot_name FROM pilotskill ORDER BY age DESC
SELECT location FROM hangar ORDER BY plane_name
SELECT location FROM hangar ORDER BY plane_name
SELECT DISTINCT plane_name FROM pilotskills
SELECT DISTINCT plane_name FROM pilotSkills ORDER BY plane_name
SELECT count(*) FROM pilotskills WHERE age  >  40 OR age  <  30
SELECT count(*) FROM pilotskills WHERE age  >  40 OR age  <  30
SELECT pilot_name,  age FROM pilotskills WHERE plane_name  =  "Piper Cub" AND age  >  35 UNION SELECT pilot_name,  age FROM pilotskills WHERE plane_name  =  "F-14 Fighter" AND age  <  30
SELECT pilot_name,  age FROM pilotskills WHERE plane_name  =  "Piper Cub" AND age  >  35 UNION SELECT pilot_name,  age FROM pilotskills WHERE plane_name  =  "F-14 Fighter" AND age  <  30
SELECT pilot_name FROM pilotskills WHERE plane_name  =  "Piper Cub" EXCEPT SELECT pilot_name FROM pilotskills WHERE plane_name  =  "B-52 Bomber"
SELECT pilot_name FROM pilotskills WHERE plane_name  =  "Piper Cub" EXCEPT SELECT pilot_name FROM pilotskills WHERE plane_name  =  "B-52 Bomber"
SELECT pilot_name FROM pilotskills WHERE plane_name  =  "Piper Cub" INTERSECT SELECT pilot_name FROM pilotskills WHERE plane_name  =  "B-52 Bomber"
SELECT pilot_name FROM PilotSkills WHERE plane_name  =  "Piper Cub" INTERSECT SELECT pilot_name FROM PilotSkills WHERE plane_name  =  "B-52 Bomber"
SELECT avg(age),  min(age) FROM pilotskill
SELECT avg(age),  min(age) FROM pilotskill
SELECT pilot_name FROM PilotSkills AS T1 JOIN Hangar AS T2 ON T1.plane_name  =  T2.plane_name WHERE T2.location  =  'Austin' INTERSECT SELECT pilot_name FROM PilotSkills AS T1 JOIN Hangar AS T2 ON T1.plane_name  =  T2.plane_name WHERE T2.location  =  'Boston'
SELECT T1.pilot_name FROM pilotskills AS T1 JOIN hangar AS T2 ON T1.plane_name  =  T2.plane_name WHERE T2.location  =  'Austin' INTERSECT SELECT T1.pilot_name FROM pilotskills AS T1 JOIN hangar AS T2 ON T1.plane_name  =  T2.plane_name WHERE T2.location  =  'Boston'
SELECT pilot_name FROM pilotskills WHERE plane_name  =  "Piper Cub" OR plane_name  =  "F-14 Fighter"
SELECT pilot_name FROM pilotskills WHERE plane_name  =  "Piper Cub" OR plane_name  =  "F-14 Fighter"
SELECT plane_name,  avg(age) FROM pilotskills GROUP BY plane_name
SELECT plane_name,  avg(age) FROM pilotskills GROUP BY plane_name
SELECT count(*),  plane_name FROM hangar GROUP BY plane_name
SELECT plane_name,  count(*) FROM pilotSkills GROUP BY plane_name
SELECT plane_name,  pilot_name FROM PilotSkills WHERE age  =  (SELECT max(age) FROM PilotSkills GROUP BY plane_name)
SELECT plane_name,  pilot_name FROM PilotSkills WHERE age  =  (SELECT max(age) FROM PilotSkills WHERE plane_name  =  PilotSkills.plane_name)
SELECT plane_name,  pilot_name FROM PilotSkills WHERE age  =  (SELECT max(age) FROM PilotSkills GROUP BY plane_name)
SELECT plane_name,  pilot_name FROM PilotSkills WHERE age  =  (SELECT max(age) FROM PilotSkills)
SELECT pilot_name,  max(age) FROM pilots GROUP BY pilot_name
SELECT pilot_name,  max(age) FROM pilotskill GROUP BY pilot_name
SELECT location,  count(*),  avg(age) FROM hangar AS T1 JOIN pilotskills AS T2 ON T1.plane_name  =  T2.plane_name GROUP BY location
SELECT T1.location,  count(*),  avg(T2.age) FROM hangar AS T1 JOIN pilotskills AS T2 ON T1.plane_name  =  T2.plane_name GROUP BY T1.location
SELECT count(*),  plane_name FROM pilotskills GROUP BY plane_name HAVING avg(age)  <  35
SELECT plane_name,  count(*) FROM PilotSkills WHERE age  <  35 GROUP BY plane_name
SELECT T1.location FROM hangar AS T1 JOIN pilotskills AS T2 ON T1.plane_name  =  T2.plane_name ORDER BY T2.age ASC LIMIT 1
SELECT T1.location FROM hangar AS T1 JOIN pilotskills AS T2 ON T1.plane_name  =  T2.plane_name ORDER BY T2.age ASC LIMIT 1
SELECT T1.pilot_name,  T1.age FROM pilotskills AS T1 JOIN hangar AS T2 ON T1.plane_name  =  T2.plane_name WHERE T2.location  =  "Austin"
SELECT T1.pilot_name,  T1.age FROM pilotskills AS T1 JOIN hangar AS T2 ON T1.plane_name  =  T2.plane_name WHERE T2.location  =  "Austin"
SELECT pilot_name FROM pilotskills WHERE age  >  (SELECT min(age) FROM pilotskills WHERE plane_name  =  'Piper Cub') ORDER BY pilot_name
SELECT pilot_name FROM PilotSkills WHERE age  >  (SELECT max(age) FROM PilotSkills WHERE plane_name  =  'Piper Cub') ORDER BY pilot_name
SELECT count(*) FROM pilotskills AS T1 JOIN hangar AS T2 ON T1.plane_name  =  T2.plane_name WHERE T1.plane_name  =  "F-14 Fighter" EXCEPT SELECT count(*) FROM pilotskills AS T1 JOIN hangar AS T2 ON T1.plane_name  =  T2.plane_name WHERE T1.plane_name  =  "F-14 Fighter" AND T1.age  >  (SELECT min(age) FROM pilotskills AS T1 JOIN hangar AS T2 ON T1.plane_name  =  T2.plane_name WHERE T1.plane_name  =  "F-14 Fighter")
SELECT count(*) FROM pilotskills WHERE age  <  (SELECT min(age) FROM pilotskills WHERE plane_name  =  'F-14 Fighter')
SELECT DISTINCT plane_name FROM pilotSkills WHERE plane_name LIKE '%Bomber%'
SELECT DISTINCT plane_name FROM PilotSkills WHERE plane_name LIKE "%Bomber%"
SELECT count(*) FROM pilotskills AS t1 JOIN hangar AS t2 ON t1.plane_name  =  t2.plane_name WHERE t1.plane_name  =  "Piper Cub" EXCEPT SELECT count(*) FROM pilotskills AS t1 JOIN hangar AS t2 ON t1.plane_name  =  t2.plane_name WHERE t1.plane_name  =  "Piper Cub" AND t1.age  <=  (SELECT min(age) FROM pilotskills AS t1 JOIN hangar AS t2 ON t1.plane_name  =  t2.plane_name WHERE t1.plane_name  =  "Piper Cub")
SELECT count(*) FROM pilotskills WHERE age  >  (SELECT min(age) FROM pilotskills WHERE plane_name  =  "Piper Cub")
SELECT Name FROM district ORDER BY Area_km DESC LIMIT 1
SELECT Area_km,  Government_website FROM district ORDER BY Population ASC LIMIT 1
SELECT name,  population FROM district WHERE area_km  >  (SELECT avg(area_km) FROM district)
SELECT max(Area_km),  avg(Area_km) FROM district
SELECT sum(Population) FROM district ORDER BY Area_km DESC LIMIT 3
SELECT District_ID,  Name,  Government_website FROM district ORDER BY Population
SELECT Name FROM district WHERE Government_website LIKE "%.gov%"
SELECT District_ID,  Name FROM district WHERE Population  >  4000 OR Area_km  >  3000
SELECT name,  speach_title FROM spokesman
SELECT avg(Points),  avg(Age) FROM spokesman WHERE Rank_position  =  1
SELECT name,  points FROM spokesman WHERE age  <  40
SELECT name FROM spokesman ORDER BY age DESC LIMIT 1
SELECT name FROM spokesman WHERE points  <  (SELECT avg(points) FROM spokesman)
SELECT T1.Name FROM district AS T1 JOIN spokesman_district AS T2 ON T1.District_ID  =  T2.District_ID GROUP BY T2.District_ID ORDER BY count(*) DESC LIMIT 1
SELECT T1.Name FROM spokesman AS T1 JOIN spokesman_district AS T2 ON T1.Spokesman_ID  =  T2.Spokesman_ID JOIN district AS T3 ON T2.District_ID  =  T3.District_ID WHERE T2.Start_year  <  2004
SELECT T1.Name,  count(*) FROM district AS T1 JOIN spokesman_district AS T2 ON T1.District_ID  =  T2.District_ID JOIN spokesman AS T3 ON T2.Spokesman_ID  =  T3.Spokesman_ID GROUP BY T1.District_ID
SELECT T1.Name FROM district AS T1 JOIN spokesman_district AS T2 ON T1.District_ID  =  T2.District_ID JOIN spokesman AS T3 ON T2.Spokesman_ID  =  T3.Spokesman_ID WHERE T3.Rank_position  =  1 INTERSECT SELECT T1.Name FROM district AS T1 JOIN spokesman_district AS T2 ON T1.District_ID  =  T2.District_ID JOIN spokesman AS T3 ON T2.Spokesman_ID  =  T3.Spokesman_ID WHERE T3.Rank_position  =  2
SELECT T1.Name FROM district AS T1 JOIN spokesman_district AS T2 ON T1.District_ID  =  T2.District_ID GROUP BY T2.District_ID HAVING COUNT(*)  >  1
SELECT count(*) FROM district WHERE District_ID NOT IN (SELECT District_ID FROM spokesman_district)
SELECT name FROM spokesman WHERE spokesman_id NOT IN (SELECT spokesman_id FROM spokesman_district)
SELECT sum(Population),  avg(Population) FROM district WHERE District_ID IN (SELECT District_ID FROM spokesman_district)
SELECT title FROM sculptures ORDER BY year DESC LIMIT 1
SELECT title FROM sculptures ORDER BY year DESC LIMIT 1
SELECT title,  location FROM Paintings ORDER BY YEAR ASC LIMIT 1
SELECT title,  location FROM Paintings ORDER BY YEAR ASC LIMIT 1
SELECT title FROM sculptures WHERE location  =  226
SELECT title FROM sculptures WHERE location  =  226
SELECT title,  location FROM Paintings
SELECT title,  location FROM Paintings
SELECT title,  location FROM sculptures
SELECT title,  location FROM sculptures
SELECT medium FROM Paintings WHERE paintingID  =  80
SELECT medium FROM Paintings WHERE paintingID  =  80
SELECT fname,  lname FROM Artists WHERE birthYear  >  1850
SELECT fname,  lname FROM artists WHERE birthYear  >  1850
SELECT title,  YEAR FROM sculptures WHERE location!= "gallery 226"
SELECT title,  YEAR FROM sculptures WHERE location!= "Gallery 226"
SELECT DISTINCT T1.fname,  T1.lname FROM artists AS T1 JOIN sculptures AS T2 ON T1.artistid  =  T2.sculptorid WHERE T2.year  <  1900
SELECT DISTINCT T1.fname,  T1.lname FROM artists AS T1 JOIN sculptures AS T2 ON T1.artistid  =  T2.sculptorid WHERE T2.year  <  1900
SELECT T1.birthYear FROM Artists AS T1 JOIN Sculptures AS T2 ON T1.artistID  =  T2.sculptorID WHERE T2.year  >  1920 GROUP BY T1.artistID
SELECT T1.birthYear FROM artists AS T1 JOIN sculptures AS T2 ON T1.artistID  =  T2.sculptorID WHERE T2.year  >  1920 GROUP BY T1.artistID
SELECT fname,  lname FROM Artists ORDER BY deathYear - birthYear DESC LIMIT 1
SELECT fname,  lname FROM Artists ORDER BY deathYear - birthYear DESC LIMIT 1
SELECT birthYear - deathYear FROM Artists ORDER BY birthYear - deathYear ASC LIMIT 1
SELECT birthYear FROM artists WHERE deathYear - birthYear = (SELECT min(deathYear - birthYear) FROM artists)
SELECT fname,  deathYear - birthYear FROM Artists ORDER BY deathYear - birthYear DESC LIMIT 1
SELECT fname,  deathYear - birthYear FROM Artists ORDER BY deathYear - birthYear DESC LIMIT 1
SELECT count(*) FROM Paintings WHERE location  =  240
SELECT count(*) FROM Paintings WHERE location  =  240
SELECT count(*) FROM paintings AS T1 JOIN artists AS T2 ON T1.painterid  =  T2.artistid ORDER BY T2.deathyear - T2.birthyear DESC LIMIT 1
SELECT count(*) FROM paintings AS T1 JOIN artists AS T2 ON T1.painterid  =  T2.artistid ORDER BY T2.deathyear - T2.birthyear DESC LIMIT 1
SELECT T1.title,  T1.year FROM Paintings AS T1 JOIN Artists AS T2 ON T1.painterID  =  T2.artistID WHERE T2.fname  =  "Mary"
SELECT T1.title,  T1.year FROM Paintings AS T1 JOIN Artists AS T2 ON T1.painterID  =  T2.artistID WHERE T2.fname  =  "Mary"
SELECT width_mm FROM Paintings AS T1 JOIN Artists AS T2 ON T1.painterID  =  T2.artistID WHERE T2.birthYear  <  1850
SELECT width_mm FROM Paintings AS T1 JOIN Artists AS T2 ON T1.painterID  =  T2.artistID WHERE T2.birthYear  <  1850
SELECT T1.location,  T1.medium FROM Paintings AS T1 JOIN Artists AS T2 ON T1.painterID  =  T2.artistID WHERE T2.fname  =  "Pablo"
SELECT location,  medium FROM Paintings AS T1 JOIN Artists AS T2 ON T1.painterID  =  T2.artistID WHERE T2.fname  =  "Pablo"
SELECT T1.fname,  T1.lname FROM Artists AS T1 JOIN Paintings AS T2 ON T1.artistID  =  T2.painterID JOIN Sculptures AS T3 ON T1.artistID  =  T3.sculptorID
SELECT T1.fname,  T1.lname FROM Artists AS T1 JOIN Paintings AS T2 ON T1.artistID  =  T2.painterID JOIN Sculptures AS T3 ON T1.artistID  =  T3.sculptorID
SELECT T1.fname,  T1.lname FROM Artists AS T1 JOIN Paintings AS T2 ON T1.artistID  =  T2.painterID WHERE T2.medium  =  'oil' INTERSECT SELECT T1.fname,  T1.lname FROM Artists AS T1 JOIN Paintings AS T2 ON T1.artistID  =  T2.painterID WHERE T2.mediumOn  =  'lithographic'
SELECT T1.fname,  T1.lname FROM Artists AS T1 JOIN Paintings AS T2 ON T1.artistID  =  T2.painterID WHERE T2.medium  =  'oil' INTERSECT SELECT T1.fname,  T1.lname FROM Artists AS T1 JOIN Paintings AS T2 ON T1.artistID  =  T2.painterID WHERE T2.mediumOn  =  'lithographic'
SELECT T1.birthYear FROM artists AS T1 JOIN paintings AS T2 ON T1.artistID  =  T2.painterID WHERE T2.year  =  1884 AND T2.mediumOn  =  "canvas"
SELECT T1.birthYear FROM Artists AS T1 JOIN Paintings AS T2 ON T1.artistID  =  T2.painterID WHERE T2.year  =  1884
SELECT DISTINCT T1.fname FROM artists AS T1 JOIN paintings AS T2 ON T1.artistID  =  T2.painterID WHERE T2.mediumOn  =  'oil' AND T2.location  =  'gallery 241'
SELECT T1.fname FROM artists AS T1 JOIN paintings AS T2 ON T1.artistID  =  T2.painterID WHERE T2.mediumOn  =  'oil' AND T2.location  =  'gallery 241'
SELECT count(*),  medium FROM Paintings GROUP BY medium
SELECT count(*),  medium FROM Paintings GROUP BY medium UNION SELECT count(*),  medium FROM Sculptures GROUP BY medium
SELECT avg(height_mm),  medium FROM Paintings GROUP BY medium
SELECT avg(height_mm),  medium FROM Paintings GROUP BY medium
SELECT location,  count(*) FROM Paintings WHERE YEAR  <  1900 GROUP BY location
SELECT count(*),  location FROM Paintings WHERE YEAR  <  1900 GROUP BY location
SELECT title FROM Paintings WHERE YEAR  >  1910 AND medium  =  'oil'
SELECT title FROM Paintings WHERE year  >  1910 AND medium  =  'oil'
SELECT painterID FROM Paintings WHERE medium  =  "oil" AND location  =  "gallery 240" GROUP BY painterID HAVING COUNT(*)  =  1
SELECT painterID FROM Paintings WHERE medium  =  'oil' AND location  =  'gallery 240' GROUP BY painterID HAVING COUNT(*)  =  1
SELECT DISTINCT title FROM Paintings WHERE height_mm  >  (SELECT max(height_mm) FROM Paintings WHERE mediumOn  =  'canvas')
SELECT DISTINCT title FROM Paintings WHERE height_mm  >  (SELECT max(height_mm) FROM Paintings WHERE medium  =  'canvas')
SELECT DISTINCT paintingID FROM Paintings WHERE YEAR  <  (SELECT MIN(YEAR) FROM Paintings WHERE LOCATION  =  'gallery 240')
SELECT DISTINCT paintingID FROM Paintings WHERE YEAR  <  (SELECT min(year) FROM Paintings WHERE LOCATION  =  240)
SELECT paintingID FROM Paintings ORDER BY year ASC LIMIT 1
SELECT paintingID FROM Paintings ORDER BY year ASC LIMIT 1
SELECT T1.fname,  T1.lname FROM artists AS T1 JOIN sculptures AS T2 ON T1.artistid  =  T2.sculptorid WHERE T2.title LIKE "%female%"
SELECT T1.fname,  T1.lname FROM artists AS T1 JOIN sculptures AS T2 ON T1.artistid  =  T2.sculptorid WHERE T2.title LIKE "%female%"
SELECT DISTINCT title FROM Paintings ORDER BY title
SELECT DISTINCT title FROM Paintings ORDER BY title
SELECT title FROM Paintings ORDER BY width_mm DESC
SELECT title FROM Paintings ORDER BY height_mm ASC
SELECT title FROM Paintings WHERE YEAR  >=  1900 AND YEAR  <=  1950 UNION SELECT title FROM Sculptures WHERE YEAR  >=  1900 AND YEAR  <=  1950
SELECT title FROM Paintings WHERE YEAR  >=  1900 AND YEAR  <=  1950 UNION SELECT title FROM Sculptures WHERE YEAR  >=  1900 AND YEAR  <=  1950
SELECT title FROM Paintings WHERE painterID  =  222 UNION SELECT title FROM Sculptures WHERE sculptorID  =  222
SELECT title FROM Paintings WHERE painterID  =  222 UNION SELECT title FROM Sculptures WHERE sculptorID  =  222
SELECT painterID FROM Paintings WHERE YEAR  <  1900 GROUP BY painterID ORDER BY count(*) DESC LIMIT 1
SELECT painterID FROM Paintings WHERE YEAR  <  1900 GROUP BY painterID ORDER BY count(*) DESC LIMIT 1
SELECT T1.fname FROM artists AS T1 JOIN sculptures AS T2 ON T1.artistid  =  T2.sculptorid GROUP BY T1.artistid ORDER BY count(*) DESC LIMIT 1
SELECT T1.fname FROM artists AS T1 JOIN sculptures AS T2 ON T1.artistID  =  T2.sculptorID GROUP BY T1.artistID ORDER BY count(*) DESC LIMIT 1
SELECT title FROM Paintings WHERE width_mm  <  600 OR height_mm  >  800
SELECT title FROM Paintings WHERE width_mm  <  600 OR height_mm  >  800
SELECT location FROM Paintings WHERE YEAR  <  1885 OR YEAR  >  1930
SELECT location FROM Paintings WHERE YEAR  <  1885 OR YEAR  >  1930
SELECT paintingID FROM Paintings WHERE height_mm  >  500 AND height_mm  <  2000
SELECT paintingID FROM Paintings WHERE height_mm  >  500 AND height_mm  <  2000
SELECT location FROM Paintings WHERE medium  =  "on panel" INTERSECT SELECT location FROM Paintings WHERE medium  =  "on canvas"
SELECT location FROM Paintings WHERE mediumOn  =  "on panels" INTERSECT SELECT location FROM Paintings WHERE mediumOn  =  "on canvas"
SELECT location FROM Paintings WHERE YEAR  <  1885 INTERSECT SELECT location FROM Paintings WHERE YEAR  >  1930
SELECT location FROM Paintings WHERE YEAR  <  1885 INTERSECT SELECT location FROM Paintings WHERE YEAR  >  1930
SELECT avg(height_mm),  avg(width_mm) FROM Paintings WHERE mediumOn  =  "Oil" AND location  =  "Gallery 241"
SELECT avg(height_mm),  avg(width_mm) FROM Paintings WHERE mediumOn  =  "Oil" AND location  =  "Gallery 241"
SELECT max(height_mm),  paintingID FROM Paintings WHERE YEAR  <  1900 GROUP BY paintingID
SELECT height_mm,  paintingID FROM Paintings WHERE YEAR  <  1900 ORDER BY height_mm DESC LIMIT 1
SELECT year,  max(height_mm),  max(width_mm) FROM Paintings GROUP BY year
SELECT year,  max(height_mm),  max(width_mm) FROM Paintings GROUP BY year
SELECT painterID,  avg(height_mm),  avg(width_mm) FROM Paintings GROUP BY painterID ORDER BY lname
SELECT T1.fname,  T1.lname,  avg(T2.height_mm),  avg(T2.width_mm) FROM Artists AS T1 JOIN Paintings AS T2 ON T1.artistID  =  T2.painterID GROUP BY T1.fname,  T1.lname ORDER BY T1.fname,  T1.lname
SELECT T1.fname,  count(*) FROM artists AS T1 JOIN paintings AS T2 ON T1.artistID  =  T2.painterID GROUP BY T1.fname HAVING count(*)  >=  2
SELECT T1.fname,  count(*) FROM Artists AS T1 JOIN Paintings AS T2 ON T1.artistID  =  T2.painterID GROUP BY T1.artistID HAVING count(*)  >=  2
SELECT deathYear FROM artists WHERE artistID IN (SELECT painterID FROM paintings GROUP BY painterID HAVING count(*)  <=  3)
SELECT T1.deathYear FROM artists AS T1 JOIN paintings AS T2 ON T1.artistID  =  T2.painterID GROUP BY T1.artistID HAVING count(*)  <  4
SELECT T1.deathYear FROM artists AS T1 JOIN sculptures AS T2 ON T1.artistID  =  T2.sculptorID GROUP BY T1.artistID ORDER BY count(*) ASC LIMIT 1
SELECT T1.deathYear FROM artists AS T1 JOIN sculptures AS T2 ON T1.artistID  =  T2.sculptorID GROUP BY T1.artistID ORDER BY count(*) ASC LIMIT 1
SELECT paintingID,  height_mm FROM Paintings WHERE width_mm  =  (SELECT max(width_mm) FROM Paintings WHERE location  =  "Gallery 240") AND location  =  "Gallery 240"
SELECT height_mm,  paintingID FROM Paintings WHERE width_mm  =  (SELECT max(width_mm) FROM Paintings WHERE location  =  "Gallery 240") AND location  =  "Gallery 240"
SELECT paintingID FROM Paintings WHERE YEAR  <  (SELECT min(year) FROM Paintings WHERE LOCATION  =  240)
SELECT paintingID FROM Paintings WHERE YEAR  <  (SELECT YEAR FROM Paintings WHERE LOCATION  =  240 ORDER BY YEAR ASC LIMIT 1)
SELECT paintingID FROM Paintings WHERE height_mm  >  (SELECT max(height_mm) FROM Paintings WHERE YEAR  >  1900)
SELECT paintingID FROM Paintings WHERE height_mm  >  (SELECT max(height_mm) FROM Paintings WHERE YEAR  >  1900)
SELECT T1.fname,  T1.lname,  count(*) FROM artists AS T1 JOIN paintings AS T2 ON T1.artistID  =  T2.painterID WHERE T2.medium  =  "oil" GROUP BY T1.artistID ORDER BY count(*) DESC LIMIT 3
SELECT T1.fname,  T1.lname FROM artists AS T1 JOIN paintings AS T2 ON T1.artistID  =  T2.painterID WHERE T2.medium  =  'oil' GROUP BY T1.artistID ORDER BY count(*) DESC LIMIT 1
SELECT paintingID,  LOCATION,  title FROM Paintings WHERE medium  =  "oil" ORDER BY year
SELECT T1.paintingID,  T1.location,  T1.title FROM Paintings AS T1 JOIN Medium AS T2 ON T1.mediumOn  =  T2.medium WHERE T2.medium  =  'Oil' ORDER BY T1.year
SELECT title,  year,  location FROM Paintings WHERE height_mm  >  1000 ORDER BY title
SELECT title,  year,  location FROM Paintings WHERE height_mm  >  1000 ORDER BY title
SELECT T1.fname,  T1.lname FROM Artists AS T1 JOIN Paintings AS T2 ON T1.artistID  =  T2.painterID EXCEPT SELECT T1.fname,  T1.lname FROM Artists AS T1 JOIN Sculptures AS T2 ON T1.sculptorID  =  T2.sculptorID
SELECT fname,  lname FROM artists WHERE artistID NOT IN (SELECT sculptorID FROM sculptures)
SELECT location FROM Paintings WHERE year  <  1885 AND medium!= "canvas"
SELECT location FROM Paintings WHERE year  <  1885 AND medium!= "canvas"
SELECT count(*) FROM race
SELECT count(*) FROM race
SELECT winning_driver,  winning_team FROM race ORDER BY winning_team ASC
SELECT Winning_driver,  Winning_team FROM race ORDER BY Winning_team
SELECT Winning_driver FROM race WHERE Pole_Position!= "Junior Strous"
SELECT Winning_driver FROM race WHERE Pole_Position!= "Junior Strous"
SELECT Constructor FROM driver ORDER BY Age ASC
SELECT DISTINCT Constructor FROM driver ORDER BY Age ASC
SELECT DISTINCT Entrant FROM driver WHERE Age  >=  20
SELECT DISTINCT Entrant FROM driver WHERE Age  >=  20
SELECT max(age),  min(age) FROM driver
SELECT max(age),  min(age) FROM driver
SELECT count(DISTINCT Engine) FROM driver WHERE Age  >  30 OR Age  <  20
SELECT count(DISTINCT Engine) FROM driver WHERE Age  >  30 OR Age  <  20
SELECT Driver_Name FROM driver ORDER BY Driver_Name DESC
SELECT Driver_Name FROM driver ORDER BY Driver_Name DESC
SELECT T1.Driver_Name,  T2.Race_Name FROM driver AS T1 JOIN race AS T2 ON T1.Driver_ID  =  T2.Driver_ID
SELECT T1.Driver_Name,  T2.Race_Name FROM driver AS T1 JOIN race AS T2 ON T1.Driver_ID  =  T2.Driver_ID
SELECT T1.Driver_Name,  count(*) FROM driver AS T1 JOIN race AS T2 ON T1.Driver_ID  =  T2.Driver_ID GROUP BY T1.Driver_Name
SELECT Driver_ID,  count(*) FROM race GROUP BY Driver_ID
SELECT T1.age FROM driver AS T1 JOIN race AS T2 ON T1.driver_id  =  T2.driver_id GROUP BY T1.driver_id ORDER BY count(*) DESC LIMIT 1
SELECT T1.age FROM driver AS T1 JOIN race AS T2 ON T1.driver_id  =  T2.driver_id GROUP BY T1.driver_id ORDER BY count(*) DESC LIMIT 1
SELECT T1.Driver_Name,  T1.Age FROM driver AS T1 JOIN race AS T2 ON T1.Driver_ID  =  T2.Driver_ID GROUP BY T1.Driver_ID HAVING count(*)  >=  2
SELECT T1.Driver_Name,  T1.Age FROM driver AS T1 JOIN race AS T2 ON T1.Driver_ID  =  T2.Driver_ID GROUP BY T1.Driver_ID HAVING COUNT(*)  >=  2
SELECT DISTINCT T1.Race_Name FROM race AS T1 JOIN driver AS T2 ON T1.Driver_ID  =  T2.Driver_ID WHERE T2.Age  >=  26
SELECT T1.Race_Name FROM race AS T1 JOIN driver AS T2 ON T1.Driver_ID  =  T2.Driver_ID WHERE T2.Age  >=  26
SELECT Driver_Name FROM driver WHERE Constructor!= "Bugatti"
SELECT Driver_Name FROM driver WHERE Constructor!= "Bugatti"
SELECT Constructor,  COUNT(*) FROM driver GROUP BY Constructor
SELECT constructor,  count(*) FROM driver GROUP BY constructor
SELECT Engine FROM driver GROUP BY Engine ORDER BY COUNT(*) DESC LIMIT 1
SELECT Engine FROM driver GROUP BY Engine ORDER BY COUNT(*) DESC LIMIT 1
SELECT Engine FROM driver GROUP BY Engine HAVING COUNT(*)  >=  2
SELECT Engine FROM driver GROUP BY Engine HAVING COUNT(*)  >=  2
SELECT Driver_Name FROM driver EXCEPT SELECT T1.Driver_Name FROM driver AS T1 JOIN race AS T2 ON T1.Driver_ID  =  T2.Driver_ID
SELECT Driver_Name FROM driver EXCEPT SELECT T1.Driver_Name FROM driver AS T1 JOIN race AS T2 ON T1.Driver_ID  =  T2.Driver_ID
SELECT Constructor FROM driver WHERE Age  <  20 INTERSECT SELECT Constructor FROM driver WHERE Age  >  30
SELECT Constructor FROM driver WHERE Age  <  20 INTERSECT SELECT Constructor FROM driver WHERE Age  >  30
SELECT Winning_team FROM race GROUP BY Winning_team HAVING COUNT(*)  >  1
SELECT Winning_team FROM race GROUP BY Winning_team HAVING COUNT(*)  >  1
SELECT T1.Driver_Name FROM driver AS T1 JOIN race AS T2 ON T1.Driver_ID  =  T2.Pole_Position WHERE T2.Race_Name  =  "James Hinchcliffe" INTERSECT SELECT T1.Driver_Name FROM driver AS T1 JOIN race AS T2 ON T1.Driver_ID  =  T2.Pole_Position WHERE T2.Race_Name  =  "Carl Skerlong"
SELECT T1.Driver_Name FROM driver AS T1 JOIN race AS T2 ON T1.Driver_ID  =  T2.Pole_Position WHERE T2.Pole_Position  =  "James Hinchcliffe" INTERSECT SELECT T1.Driver_Name FROM driver AS T1 JOIN race AS T2 ON T1.Driver_ID  =  T2.Pole_Position WHERE T2.Pole_Position  =  "Carl Skerlong"
SELECT T1.Driver_Name FROM driver AS T1 JOIN race AS T2 ON T1.Driver_ID  =  T2.Driver_ID WHERE T2.Pole_Position  =  "James Hinchcliffe" EXCEPT SELECT T1.Driver_Name FROM driver AS T1 JOIN race AS T2 ON T1.Driver_ID  =  T2.Driver_ID WHERE T2.Pole_Position  =  T1.Driver_Name
SELECT Driver_Name FROM driver WHERE Driver_ID NOT IN (SELECT Driver_ID FROM race WHERE Pole_Position  =  "James Hinchcliffe")
SELECT count(*) FROM languages
SELECT count(*) FROM languages
SELECT name FROM languages ORDER BY name ASC
SELECT name FROM languages ORDER BY name ASC
SELECT name FROM languages WHERE name LIKE "%ish%"
SELECT name FROM languages WHERE name LIKE "%ish%"
SELECT name FROM countries ORDER BY overall_score DESC
SELECT name FROM countries ORDER BY overall_score DESC
SELECT avg(justice_score) FROM countries
SELECT avg(justice_score) FROM countries
SELECT max(health_score),  min(health_score) FROM countries WHERE name!= "Norway"
SELECT max(health_score),  min(health_score) FROM countries WHERE name!= "Norway"
SELECT count(DISTINCT language_id) FROM official_languages
SELECT count(DISTINCT language_id) FROM official_languages
SELECT name FROM countries ORDER BY education_score DESC
SELECT name FROM countries ORDER BY education_score DESC
SELECT name FROM countries ORDER BY politics_score DESC LIMIT 1
SELECT name FROM countries ORDER BY politics_score DESC LIMIT 1
SELECT T1.name,  T3.name FROM countries AS T1 JOIN official_languages AS T2 ON T1.id  =  T2.country_id JOIN languages AS T3 ON T2.language_id  =  T3.id
SELECT T1.name,  T3.name FROM countries AS T1 JOIN official_languages AS T2 ON T1.id  =  T2.country_id JOIN languages AS T3 ON T2.language_id  =  T3.id
SELECT T1.name,  count(*) FROM languages AS T1 JOIN official_languages AS T2 ON T1.id  =  T2.language_id GROUP BY T1.id
SELECT T1.name,  count(*) FROM languages AS T1 JOIN official_languages AS T2 ON T1.id  =  T2.language_id GROUP BY T1.id
SELECT T1.name FROM languages AS T1 JOIN official_languages AS T2 ON T1.id  =  T2.language_id GROUP BY T1.id ORDER BY count(*) DESC LIMIT 1
SELECT T1.name FROM languages AS T1 JOIN official_languages AS T2 ON T1.id  =  T2.language_id GROUP BY T2.language_id ORDER BY count(*) DESC LIMIT 1
SELECT T1.name FROM languages AS T1 JOIN official_languages AS T2 ON T1.id  =  T2.language_id GROUP BY T2.language_id HAVING count(*)  >=  2
SELECT T1.name FROM languages AS T1 JOIN official_languages AS T2 ON T1.id  =  T2.language_id GROUP BY T2.language_id HAVING count(*)  >=  2
SELECT avg(overall_score) FROM countries AS t1 JOIN official_languages AS t2 ON t1.id  =  t2.country_id JOIN languages AS t3 ON t2.language_id  =  t3.id WHERE t3.name  =  "English"
SELECT avg(overall_score) FROM countries JOIN official_languages ON countries.id = official_languages.country_id JOIN languages ON official_languages.language_id = languages.id WHERE languages.name = 'English'
SELECT T1.name FROM languages AS T1 JOIN official_languages AS T2 ON T1.id  =  T2.language_id GROUP BY T2.language_id ORDER BY count(*) DESC LIMIT 3
SELECT T1.name FROM languages AS T1 JOIN official_languages AS T2 ON T1.id  =  T2.language_id GROUP BY T1.id ORDER BY count(*) DESC LIMIT 3
SELECT T1.name FROM languages AS T1 JOIN official_languages AS T2 ON T1.id  =  T2.language_id JOIN countries AS T3 ON T2.country_id  =  T3.id GROUP BY T1.id ORDER BY avg(T3.overall_score) DESC
SELECT T1.name FROM languages AS T1 JOIN official_languages AS T2 ON T1.id  =  T2.language_id JOIN countries AS T3 ON T2.country_id  =  T3.id GROUP BY T1.id ORDER BY avg(T3.overall_score) DESC
SELECT T1.name FROM countries AS T1 JOIN official_languages AS T2 ON T1.id  =  T2.country_id GROUP BY T2.country_id ORDER BY count(*) DESC LIMIT 1
SELECT T1.name FROM countries AS T1 JOIN official_languages AS T2 ON T1.id  =  T2.country_id GROUP BY T2.country_id ORDER BY count(*) DESC LIMIT 1
SELECT name FROM languages EXCEPT SELECT T1.name FROM languages AS T1 JOIN official_languages AS T2 ON T1.id  =  T2.language_id
SELECT name FROM languages EXCEPT SELECT T1.name FROM languages AS T1 JOIN official_languages AS T2 ON T1.id  =  T2.language_id
SELECT name FROM countries WHERE id NOT IN (SELECT country_id FROM official_languages)
SELECT name FROM countries WHERE id NOT IN (SELECT country_id FROM official_languages)
SELECT T1.name FROM languages AS T1 JOIN official_languages AS T2 ON T1.id  =  T2.language_id JOIN countries AS T3 ON T2.country_id  =  T3.id WHERE T3.overall_score  >  95 INTERSECT SELECT T1.name FROM languages AS T1 JOIN official_languages AS T2 ON T1.id  =  T2.language_id JOIN countries AS T3 ON T2.country_id  =  T3.id WHERE T3.overall_score  <  90
SELECT T1.name FROM languages AS T1 JOIN official_languages AS T2 ON T1.id  =  T2.language_id JOIN countries AS T3 ON T2.country_id  =  T3.id WHERE T3.overall_score  >  95 INTERSECT SELECT T1.name FROM languages AS T1 JOIN official_languages AS T2 ON T1.id  =  T2.language_id JOIN countries AS T3 ON T2.country_id  =  T3.id WHERE T3.overall_score  <  90
SELECT country,  town_city FROM Addresses
SELECT country,  town_city FROM Addresses
SELECT T1.county_state_province,  T2.property_name FROM Addresses AS T1 JOIN Properties AS T2 ON T1.address_id  =  T2.property_address_id
SELECT T1.county_state_province FROM Addresses AS T1 JOIN Properties AS T2 ON T1.address_id  =  T2.property_address_id
SELECT feature_description FROM Features WHERE feature_name  =  "rooftop"
SELECT feature_description FROM Features WHERE feature_name  =  'rooftop'
SELECT T1.feature_name,  T1.feature_description FROM Features AS T1 JOIN Property_Features AS T2 ON T1.feature_id  =  T2.feature_id GROUP BY T1.feature_id ORDER BY count(*) DESC LIMIT 1
SELECT T1.feature_name,  T1.feature_description FROM Features AS T1 JOIN Property_Features AS T2 ON T1.feature_id  =  T2.feature_id GROUP BY T1.feature_id ORDER BY count(*) DESC LIMIT 1
SELECT min(room_size) FROM Rooms
SELECT min(room_count) FROM Properties
SELECT count(*) FROM Properties WHERE parking_lots  =  1 OR garage_yn  =  1
SELECT count(*) FROM Properties WHERE parking_lots  =  1 OR garage_yn  =  1
SELECT T1.age_category_description FROM Ref_Age_Categories AS T1 JOIN Users AS T2 ON T1.age_category_code  =  T2.age_category_code WHERE T2.user_category_description LIKE '%Mother%'
SELECT T1.age_category_description FROM Ref_Age_Categories AS T1 JOIN Users AS T2 ON T1.age_category_code  =  T2.age_category_code WHERE T1.age_category_description LIKE "%Mother%"
SELECT T1.first_name FROM Users AS T1 JOIN Properties AS T2 ON T1.user_id  =  T2.owner_user_id GROUP BY T1.user_id ORDER BY count(*) DESC LIMIT 1
SELECT T1.first_name FROM Users AS T1 JOIN Properties AS T2 ON T1.user_id  =  T2.owner_user_id GROUP BY T1.user_id ORDER BY count(*) DESC LIMIT 1
SELECT avg(T1.room_count) FROM Rooms AS T1 JOIN Property_Features AS T2 ON T1.property_id  =  T2.property_id WHERE T2.feature_name  =  "Garden"
SELECT avg(T1.room_count) FROM Properties AS T1 JOIN Property_Features AS T2 ON T1.property_id  =  T2.property_id WHERE T2.feature_name  =  "Garden"
SELECT T1.town_city FROM Addresses AS T1 JOIN Properties AS T2 ON T1.address_id  =  T2.property_address_id JOIN Property_Features AS T3 ON T2.property_id  =  T3.property_id WHERE T3.feature_name  =  'Swimming Pool'
SELECT T1.town_city FROM Addresses AS T1 JOIN Properties AS T2 ON T1.address_id  =  T2.property_address_id JOIN Property_Features AS T3 ON T2.property_id  =  T3.property_id WHERE T3.feature_name  =  'Swimming Pool'
SELECT property_id,  vendor_requested_price FROM Properties ORDER BY vendor_requested_price ASC LIMIT 1
SELECT property_id,  vendor_requested_price FROM Properties ORDER BY vendor_requested_price ASC LIMIT 1
SELECT avg(room_count) FROM Properties
SELECT avg(room_count) FROM Properties
SELECT count(DISTINCT room_size) FROM Rooms
SELECT count(DISTINCT room_size) FROM Rooms
SELECT user_id,  search_string FROM User_Searches GROUP BY user_id HAVING count(*)  >=  2
SELECT user_id,  search_seq FROM User_Searches GROUP BY user_id HAVING count(*)  >=  2
SELECT search_datetime FROM User_Searches ORDER BY search_datetime DESC LIMIT 1
SELECT search_datetime FROM User_Searches ORDER BY search_datetime DESC LIMIT 1
SELECT search_datetime,  search_string FROM User_Searches ORDER BY search_string DESC
SELECT search_string,  search_datetime FROM User_Searches ORDER BY search_string DESC
SELECT T1.zip_postcode FROM Addresses AS T1 JOIN Properties AS T2 ON T1.address_id  =  T2.property_address_id JOIN Users AS T3 ON T2.owner_user_id  =  T3.user_id GROUP BY T2.owner_user_id HAVING count(*)  >  2
SELECT T1.zip_postcode FROM Addresses AS T1 JOIN Properties AS T2 ON T1.address_id  =  T2.property_address_id JOIN Users AS T3 ON T2.owner_user_id  =  T3.user_id GROUP BY T2.owner_user_id HAVING count(*)  >  2
SELECT user_category_code,  user_id FROM Users WHERE user_id IN (SELECT user_id FROM User_Searches GROUP BY user_id HAVING count(*)  =  1)
SELECT user_id,  user_category_code FROM Users WHERE user_id IN (SELECT user_id FROM User_Searches GROUP BY user_id HAVING count(*)  =  1)
SELECT T1.age_category_description FROM Ref_Age_Categories AS T1 JOIN Users AS T2 ON T1.age_category_code  =  T2.age_category_code JOIN User_Searches AS T3 ON T2.user_id  =  T3.user_id ORDER BY T3.search_datetime LIMIT 1
SELECT T1.age_category_description FROM Ref_Age_Categories AS T1 JOIN Users AS T2 ON T1.age_category_code  =  T2.age_category_code JOIN User_Searches AS T3 ON T2.user_id  =  T3.user_id ORDER BY T3.search_datetime LIMIT 1
SELECT login_name FROM Users WHERE user_category_code  =  'S' ORDER BY first_name
SELECT login_name FROM Users WHERE user_category_code  =  'S' ORDER BY first_name
SELECT count(*) FROM Users AS T1 JOIN User_Searches AS T2 ON T1.user_id  =  T2.user_id WHERE T1.is_buyer  =  'Y'
SELECT count(*) FROM Users AS T1 JOIN User_Searches AS T2 ON T1.user_id  =  T2.user_id WHERE T1.is_buyer  =  'Y'
SELECT date_registered FROM Users WHERE login_name = "ratione"
SELECT date_registered FROM Users WHERE login_name  =  "ratione"
SELECT first_name,  middle_name,  last_name,  login_name FROM Users WHERE is_seller  =  1
SELECT first_name,  middle_name,  last_name,  login_name FROM Users WHERE is_seller  =  'Y'
SELECT T1.line_1_number_building,  T1.line_2_number_street,  T1.town_city FROM Addresses AS T1 JOIN Users AS T2 ON T1.address_id  =  T2.user_address_id JOIN Ref_Age_Categories AS T3 ON T2.age_category_code  =  T3.age_category_code WHERE T3.age_category_description  =  "Senior Citizen"
SELECT T1.line_1_number_building,  T1.line_2_number_street,  T1.town_city FROM Addresses AS T1 JOIN Users AS T2 ON T1.user_address_id  =  T2.user_address_id JOIN Ref_Age_Categories AS T3 ON T2.age_category_code  =  T3.age_category_code WHERE T3.age_category_description  =  'Senior'
SELECT count(*) FROM Properties AS T1 JOIN Property_Features AS T2 ON T1.property_id  =  T2.property_id GROUP BY T1.property_id HAVING count(*)  >=  2
SELECT count(*) FROM Properties AS T1 JOIN Property_Features AS T2 ON T1.property_id  =  T2.property_id GROUP BY T1.property_id HAVING count(*)  >=  2
SELECT property_id,  count(*) FROM Property_Photos GROUP BY property_id
SELECT property_id,  count(*) FROM Property_Photos GROUP BY property_id
SELECT T1.owner_user_id,  count(*) FROM Properties AS T1 JOIN Property_Photos AS T2 ON T1.property_id  =  T2.property_id GROUP BY T1.owner_user_id
SELECT T1.user_id,  count(*) FROM Users AS T1 JOIN Properties AS T2 ON T1.user_id  =  T2.owner_user_id JOIN Property_Photos AS T3 ON T2.property_id  =  T3.property_id GROUP BY T1.user_id
SELECT sum(price_max) FROM properties AS T1 JOIN users AS T2 ON T1.owner_user_id  =  T2.user_id WHERE T2.user_category_code  =  'Single Mother' OR T2.user_category_code  =  'Student'
SELECT max(price_max) FROM Properties AS T1 JOIN Users AS T2 ON T1.owner_user_id  =  T2.user_id WHERE T2.user_category_code  =  'Single Mother' OR T2.user_category_code  =  'Student'
SELECT T1.datestamp,  T2.property_name FROM User_Property_History AS T1 JOIN Properties AS T2 ON T1.property_id  =  T2.property_id ORDER BY T1.datestamp
SELECT T1.datestamp,  T2.property_name FROM User_Property_History AS T1 JOIN Properties AS T2 ON T1.property_id  =  T2.property_id ORDER BY T1.datestamp
SELECT property_type_description,  property_type_code FROM Ref_Property_Types ORDER BY count(*) DESC LIMIT 1
SELECT property_type_description FROM Ref_Property_Types GROUP BY property_type_description ORDER BY count(*) DESC LIMIT 1
SELECT age_category_description FROM Ref_Age_Categories WHERE age_category_code  =  'Over 60'
SELECT age_category_description FROM Ref_Age_Categories WHERE age_category_code  =  'Over 60'
SELECT room_size,  count(*) FROM Rooms GROUP BY room_size
SELECT room_size,  count(*) FROM Rooms GROUP BY room_size
SELECT T1.country FROM Addresses AS T1 JOIN Users AS T2 ON T1.user_address_id  =  T2.user_address_id WHERE T2.first_name  =  "Robbie"
SELECT T1.country FROM Addresses AS T1 JOIN Users AS T2 ON T1.address_id  =  T2.user_address_id WHERE T2.first_name  =  "Robbie"
SELECT T1.first_name,  T1.middle_name,  T1.last_name FROM Users AS T1 JOIN Properties AS T2 ON T1.user_id  =  T2.owner_user_id WHERE T1.user_address_id  =  T2.property_address_id
SELECT T1.first_name,  T1.middle_name,  T1.last_name FROM Users AS T1 JOIN Properties AS T2 ON T1.user_id  =  T2.owner_user_id
SELECT T1.search_string FROM User_Searches AS T1 JOIN Users AS T2 ON T1.user_id  =  T2.user_id WHERE T2.user_id NOT IN (SELECT owner_user_id FROM Properties)
SELECT search_string FROM Users AS T1 JOIN User_Property_History AS T2 ON T1.user_id  =  T2.user_id WHERE T1.user_id NOT IN (SELECT owner_user_id FROM Properties)
SELECT T1.last_name,  T1.user_id FROM Users AS T1 JOIN User_Property_History AS T2 ON T1.user_id  =  T2.user_id GROUP BY T1.user_id HAVING count(*)  >=  2 INTERSECT SELECT T1.last_name,  T1.user_id FROM Users AS T1 JOIN User_Searches AS T2 ON T1.user_id  =  T2.user_id GROUP BY T1.user_id HAVING count(*)  <=  2
SELECT T1.last_name,  T1.user_id FROM Users AS T1 JOIN User_Property_History AS T2 ON T1.user_id  =  T2.user_id GROUP BY T1.user_id HAVING count(*)  <=  2 INTERSECT SELECT T1.last_name,  T1.user_id FROM Users AS T1 JOIN Properties AS T2 ON T1.user_id  =  T2.owner_user_id GROUP BY T1.user_id HAVING count(*)  >=  2
SELECT count(*) FROM bike WHERE weight  >  780
SELECT product_name,  weight FROM bike ORDER BY price ASC
SELECT heat,  name,  nation FROM cyclist
SELECT max(weight),  min(weight) FROM bike
SELECT avg(price) FROM bike WHERE material  =  'Carbon CC'
SELECT name,  result FROM cyclist WHERE nation!= 'Russia'
SELECT DISTINCT T1.id,  T1.product_name FROM bike AS T1 JOIN cyclists_own_bikes AS T2 ON T1.id  =  T2.bike_id WHERE T2.purchase_year  >  2015
SELECT T1.id,  T1.name FROM cyclist AS T1 JOIN cyclists_own_bikes AS T2 ON T1.id  =  T2.cyclist_id JOIN bike AS T3 ON T2.bike_id  =  T3.id WHERE T3.product_name  =  "Racing Bike" GROUP BY T1.id HAVING count(*)  >=  4
SELECT T1.id,  T1.name FROM cyclist AS T1 JOIN cyclists_own_bikes AS T2 ON T1.id  =  T2.cyclist_id GROUP BY T1.id ORDER BY count(*) DESC LIMIT 1
SELECT DISTINCT T1.product_name FROM bike AS T1 JOIN cyclists_own_bikes AS T2 ON T1.id  =  T2.bike_id JOIN cyclist AS T3 ON T2.cyclist_id  =  T3.id WHERE T3.nation  =  'Russia' OR T3.nation  =  'Great Britain'
SELECT count(DISTINCT heat) FROM cyclist
SELECT count(*) FROM cyclist WHERE id NOT IN (SELECT cyclist_id FROM cyclists_own_bikes WHERE purchase_year > 2015)
SELECT DISTINCT T1.product_name FROM bike AS T1 JOIN cyclists_own_bikes AS T2 ON T1.id  =  T2.bike_id JOIN cyclist AS T3 ON T2.cyclist_id  =  T3.id WHERE T3.result  <  '4:21.558'
SELECT T1.product_name,  T1.price FROM bike AS T1 JOIN cyclists_own_bikes AS T2 ON T1.id  =  T2.bike_id JOIN cyclist AS T3 ON T2.cyclist_id  =  T3.id WHERE T3.name  =  'Bradley Wiggins' INTERSECT SELECT T1.product_name,  T1.price FROM bike AS T1 JOIN cyclists_own_bikes AS T2 ON T1.id  =  T2.bike_id JOIN cyclist AS T3 ON T2.cyclist_id  =  T3.id WHERE T3.name  =  'Antonio Tauler'
SELECT name,  nation,  result FROM cyclist WHERE id NOT IN (SELECT cyclist_id FROM cyclists_own_bikes WHERE product_name  =  'racing bike')
SELECT product_name FROM bike WHERE material LIKE "%fiber%"
SELECT cyclist_id,  count(*) FROM cyclists_own_bikes GROUP BY cyclist_id ORDER BY cyclist_id
SELECT T1.Flavor,  T1.Price FROM goods AS T1 JOIN items AS T2 ON T1.id  =  T2.item WHERE T1.Food  =  "Cake" ORDER BY T1.Price DESC LIMIT 1
SELECT id,  flavor FROM goods WHERE food  =  'cake' ORDER BY price DESC LIMIT 1
SELECT T1.Flavor,  T1.Price FROM goods AS T1 JOIN items AS T2 ON T1.id  =  T2.item WHERE T1.Food  =  "Cookie" ORDER BY T1.Price LIMIT 1
SELECT id,  flavor FROM goods WHERE food  =  'cookie' ORDER BY price LIMIT 1
SELECT id FROM goods WHERE flavor  =  "apple"
SELECT id FROM goods WHERE flavor  =  "apple"
SELECT id FROM goods WHERE price  <  3
SELECT Id FROM goods WHERE Price  <  3
SELECT DISTINCT T1.customerid FROM receipts AS T1 JOIN items AS T2 ON T1.receiptnumber  =  T2.receipt JOIN goods AS T3 ON T2.item  =  T3.id WHERE T3.flavor  =  "Lemon" AND T3.food  =  "Cake"
SELECT DISTINCT T1.customerid FROM receipts AS T1 JOIN items AS T2 ON T1.receiptnumber  =  T2.receipt JOIN goods AS T3 ON T2.item  =  T3.id WHERE T3.flavor  =  "lemon" AND T3.food  =  "cake"
SELECT food,  count(*) FROM items AS T1 JOIN goods AS T2 ON T1.item  =  T2.id GROUP BY T2.food
SELECT T1.Food,  count(*) FROM goods AS T1 JOIN items AS T2 ON T1.id  =  T2.item GROUP BY T1.Food
SELECT T1.id FROM customers AS T1 JOIN receipts AS T2 ON T1.id  =  T2.customerid GROUP BY T1.id HAVING count(*)  >=  15
SELECT customerid FROM receipts GROUP BY customerid HAVING count(*)  >=  15
SELECT T1.LastName FROM customers AS T1 JOIN receipts AS T2 ON T1.Id  =  T2.CustomerId GROUP BY T1.Id HAVING COUNT(*)  >  10
SELECT T1.LastName FROM customers AS T1 JOIN receipts AS T2 ON T1.Id  =  T2.CustomerId GROUP BY T1.Id HAVING COUNT(*)  >  10
SELECT count(*) FROM goods WHERE Food  =  "Cake"
SELECT count(DISTINCT Flavor) FROM goods WHERE Food  =  'Cake'
SELECT Flavor FROM goods WHERE Food  =  'Croissant'
SELECT Flavor FROM goods WHERE Food  =  "Croissant"
SELECT DISTINCT T1.Item FROM items AS T1 JOIN receipts AS T2 ON T1.Receipt  =  T2.ReceiptNumber WHERE T2.CustomerId  =  15
SELECT DISTINCT T1.Item FROM items AS T1 JOIN receipts AS T2 ON T1.Receipt  =  T2.ReceiptNumber WHERE T2.CustomerId  =  15
SELECT Food,  avg(Price),  max(Price),  min(Price) FROM goods GROUP BY Food
SELECT avg(T1.price),  min(T1.price),  max(T1.price),  T2.food FROM goods AS T1 JOIN items AS T2 ON T1.id  =  T2.item GROUP BY T2.food
SELECT Receipt FROM items WHERE Item  =  "Cake" INTERSECT SELECT Receipt FROM items WHERE Item  =  "Cookie"
SELECT T1.ReceiptNumber FROM receipts AS T1 JOIN items AS T2 ON T1.ReceiptNumber  =  T2.Receipt WHERE T2.Item  =  'cakes' INTERSECT SELECT T1.ReceiptNumber FROM receipts AS T1 JOIN items AS T2 ON T1.ReceiptNumber  =  T2.Receipt WHERE T2.Item  =  'cookies'
SELECT T1.ReceiptNumber FROM receipts AS T1 JOIN items AS T2 ON T1.ReceiptNumber  =  T2.Receipt JOIN customers AS T3 ON T1.CustomerId  =  T3.Id JOIN goods AS T4 ON T2.Item  =  T4.Id WHERE T3.LastName  =  "LOGAN" AND T4.Food  =  "Croissant"
SELECT T1.ReceiptNumber FROM receipts AS T1 JOIN items AS T2 ON T1.ReceiptNumber  =  T2.Receipt JOIN customers AS T3 ON T1.CustomerId  =  T3.Id JOIN goods AS T4 ON T4.Id  =  T2.Item WHERE T3.LastName  =  "Logan" AND T4.Food  =  "Croissant"
SELECT T1.ReceiptNumber,  T1.Date FROM receipts AS T1 JOIN items AS T2 ON T1.ReceiptNumber  =  T2.Receipt JOIN goods AS T3 ON T2.Item  =  T3.Id ORDER BY T3.Price DESC LIMIT 1
SELECT T1.ReceiptNumber,  T1.Date FROM receipts AS T1 JOIN items AS T2 ON T1.ReceiptNumber  =  T2.Receipt JOIN goods AS T3 ON T2.Item  =  T3.Id ORDER BY T3.Price DESC LIMIT 1
SELECT Item FROM items GROUP BY Item ORDER BY count(*) ASC LIMIT 1
SELECT Item FROM items GROUP BY Item ORDER BY count(*) ASC LIMIT 1
SELECT Food,  count(*) FROM goods GROUP BY Food
SELECT Food,  COUNT(*) FROM goods GROUP BY Food
SELECT avg(T1.price),  T2.food FROM goods AS T1 JOIN items AS T2 ON T1.id  =  T2.item GROUP BY T2.food
SELECT avg(T1.price),  T2.food FROM goods AS T1 JOIN items AS T2 ON T1.id  =  T2.item GROUP BY T2.food
SELECT id FROM goods WHERE Flavor  =  'Apricot' AND Price  <  5
SELECT id FROM goods WHERE Flavor  =  "Apricot" AND Price  <  5
SELECT Flavor FROM goods WHERE Price  >  10 AND Food  =  'Cake'
SELECT Flavor FROM goods WHERE Price  >  10 AND Food  =  'Cake'
SELECT DISTINCT id,  price FROM goods WHERE price  <  (SELECT avg(price) FROM goods)
SELECT DISTINCT Id,  Price FROM goods WHERE Price  <  (SELECT avg(Price) FROM goods)
SELECT DISTINCT Id FROM goods WHERE Price  <  (SELECT min(Price) FROM goods WHERE Flavor  =  'Tart')
SELECT DISTINCT Id FROM goods WHERE Price  <  (SELECT min(Price) FROM goods WHERE Flavor  =  'Tart')
SELECT DISTINCT T1.ReceiptNumber FROM receipts AS T1 JOIN items AS T2 ON T1.ReceiptNumber  =  T2.Receipt JOIN goods AS T3 ON T2.Item  =  T3.Id WHERE T3.Price  >  13
SELECT DISTINCT T1.ReceiptNumber FROM receipts AS T1 JOIN items AS T2 ON T1.ReceiptNumber  =  T2.Receipt JOIN goods AS T3 ON T2.Item  =  T3.Id WHERE T3.Price  >  13
SELECT T1.Date FROM receipts AS T1 JOIN items AS T2 ON T1.ReceiptNumber  =  T2.Receipt JOIN goods AS T3 ON T2.Item  =  T3.Id WHERE T3.Price  >  15
SELECT T1.Date FROM receipts AS T1 JOIN items AS T2 ON T1.ReceiptNumber  =  T2.Receipt JOIN goods AS T3 ON T2.Item  =  T3.Id WHERE T3.Price  >  15
SELECT id FROM goods WHERE id LIKE "%APP%"
SELECT id FROM goods WHERE id LIKE "%APP%"
SELECT Flavor,  Price FROM goods WHERE Id  =  "70"
SELECT id,  price FROM goods WHERE id  =  "70"
SELECT LastName FROM customers ORDER BY LastName
SELECT LastName FROM customers ORDER BY LastName
SELECT Id FROM goods ORDER BY Id
SELECT DISTINCT Id FROM goods
SELECT Receipt FROM items AS T1 JOIN goods AS T2 ON T1.Item  =  T2.Id WHERE T2.Flavor  =  "Apple Flavor Pie" OR T1.Receipt IN (SELECT Receipt FROM receipts WHERE CustomerId  =  12)
SELECT ReceiptNumber FROM receipts AS T1 JOIN items AS T2 ON T1.ReceiptNumber  =  T2.Receipt WHERE T2.Item  =  "Apple Flavor Pie" OR T1.CustomerId  =  12
SELECT ReceiptNumber,  Date FROM receipts ORDER BY Date DESC LIMIT 1
SELECT ReceiptNumber,  Date FROM receipts ORDER BY Date DESC LIMIT 1
SELECT ReceiptNumber FROM receipts WHERE Date  =  (SELECT min(Date) FROM receipts) OR Price  >  10
SELECT T1.ReceiptNumber FROM receipts AS T1 JOIN items AS T2 ON T1.ReceiptNumber  =  T2.Receipt JOIN goods AS T3 ON T2.Item  =  T3.Id WHERE T3.Price  >  10 OR T1.Date  =  (SELECT min(Date) FROM receipts)
SELECT id FROM goods WHERE price BETWEEN 3 AND 7 AND flavor  =  "Cookie" OR flavor  =  "Cake"
SELECT id FROM goods WHERE price BETWEEN 3 AND 7 AND food  =  'Cookies' OR food  =  'Cakes'
SELECT T1.FirstName,  T1.LastName FROM customers AS T1 JOIN receipts AS T2 ON T1.Id  =  T2.CustomerId ORDER BY T2.Date ASC LIMIT 1
SELECT T1.FirstName,  T1.LastName FROM customers AS T1 JOIN receipts AS T2 ON T1.Id  =  T2.CustomerId ORDER BY T2.Date ASC LIMIT 1
SELECT avg(T1.price) FROM goods AS T1 JOIN items AS T2 ON T1.id  =  T2.item WHERE T1.flavor  =  "blackberry" OR T1.flavor  =  "blueberry"
SELECT avg(T1.price) FROM goods AS T1 JOIN items AS T2 ON T1.id  =  T2.item WHERE T1.flavor  =  "blackberry" OR T1.flavor  =  "blueberry"
SELECT min(Price) FROM goods WHERE Flavor  =  "cheese"
SELECT min(price) FROM goods WHERE flavor  =  "cheese"
SELECT max(Price),  min(Price),  avg(Price),  Flavor FROM goods GROUP BY Flavor ORDER BY Flavor
SELECT max(T1.Price),  min(T1.Price),  avg(T1.Price),  T1.Flavor FROM goods AS T1 GROUP BY T1.Flavor ORDER BY T1.Flavor
SELECT min(Price),  max(Price),  Food FROM goods GROUP BY Food ORDER BY Food
SELECT min(T1.price),  max(T1.price),  T1.food FROM goods AS T1 JOIN items AS T2 ON T1.id  =  T2.item WHERE T1.food  =  'food' GROUP BY T1.food ORDER BY T1.food
SELECT Date FROM receipts GROUP BY Date ORDER BY count(*) DESC LIMIT 3
SELECT Date FROM receipts GROUP BY Date ORDER BY count(*) DESC LIMIT 3
SELECT T1.FirstName,  T1.LastName,  count(*) FROM customers AS T1 JOIN receipts AS T2 ON T1.Id  =  T2.CustomerId GROUP BY T1.Id ORDER BY count(*) DESC LIMIT 1
SELECT T1.CustomerId,  count(*) FROM receipts AS T1 JOIN items AS T2 ON T1.ReceiptNumber  =  T2.Receipt GROUP BY T1.CustomerId ORDER BY count(*) DESC LIMIT 1
SELECT count(DISTINCT customerid),  date FROM receipts GROUP BY date
SELECT count(*),  Date FROM receipts GROUP BY Date
SELECT T1.FirstName,  T1.LastName FROM customers AS T1 JOIN items AS T2 ON T1.Id  =  T2.Receipt JOIN goods AS T3 ON T2.Item  =  T3.Id WHERE T3.Flavor  =  "Apple" AND T3.Food  =  "Tart"
SELECT T1.FirstName,  T1.LastName FROM customers AS T1 JOIN items AS T2 ON T1.Id  =  T2.Receipt JOIN goods AS T3 ON T2.Item  =  T3.Id WHERE T3.Flavor  =  "Apple" AND T3.Food  =  "Tart"
SELECT id FROM goods WHERE price  <  (SELECT min(price) FROM goods WHERE flavor  =  'Croissant') AND flavor  =  'Cookie'
SELECT id FROM goods WHERE price  >  (SELECT min(price) FROM goods WHERE flavor  =  'croissant') AND flavor  =  'cookie'
SELECT id FROM goods WHERE price  >=  (SELECT avg(price) FROM goods WHERE flavor  =  'Tart') AND flavor  =  'Cake'
SELECT id FROM goods WHERE price  >=  (SELECT avg(price) FROM goods WHERE flavor  =  'Tart') AND flavor  =  'Cake'
SELECT id FROM goods WHERE price  >  (SELECT avg(price) FROM goods) * 2
SELECT id FROM goods WHERE price  >  (SELECT avg(price) FROM goods) * 2
SELECT id,  flavor,  food FROM goods ORDER BY price
SELECT Id,  Flavor,  Food FROM goods ORDER BY Price
SELECT T1.id,  T1.flavor FROM goods AS T1 JOIN items AS T2 ON T1.id  =  T2.item WHERE T1.food  =  "Cakes" ORDER BY T1.flavor
SELECT Id,  Flavor FROM goods WHERE Food  =  "Cake" ORDER BY Flavor
SELECT item FROM items WHERE item IN (SELECT item FROM goods WHERE flavor  =  "chocolate") EXCEPT SELECT item FROM items GROUP BY item HAVING count(*)  >  10
SELECT Item FROM items WHERE Item IN (SELECT Item FROM items WHERE Item IN (SELECT Item FROM items WHERE Flavor  =  "chocolate") GROUP BY Item HAVING count(*)  <=  10)
SELECT Flavor FROM goods WHERE Food  =  "Cake" EXCEPT SELECT Flavor FROM goods WHERE Food  =  "Tart"
SELECT Flavor FROM goods WHERE Food  =  'Cake' EXCEPT SELECT Flavor FROM goods WHERE Food  =  'Tart'
SELECT Flavor FROM goods GROUP BY Flavor ORDER BY COUNT(*) DESC LIMIT 3
SELECT T1.Item FROM items AS T1 JOIN receipts AS T2 ON T1.Receipt  =  T2.ReceiptNumber GROUP BY T1.Item ORDER BY count(*) DESC LIMIT 3
SELECT T1.id FROM customers AS T1 JOIN receipts AS T2 ON T1.id  =  T2.customerid GROUP BY T1.id HAVING sum(T2.price)  >  150
SELECT T1.id FROM customers AS T1 JOIN receipts AS T2 ON T1.id  =  T2.customerid GROUP BY T1.id HAVING sum(T2.price)  >  150
SELECT T1.id FROM customers AS T1 JOIN receipts AS T2 ON T1.id  =  T2.customerid JOIN items AS T3 ON T2.receiptnumber  =  T3.receipt JOIN goods AS T4 ON T3.item  =  T4.id GROUP BY T1.id HAVING avg(T4.price)  >  5
SELECT T1.customerid FROM receipts AS T1 JOIN items AS T2 ON T1.receiptnumber  =  T2.receipt JOIN goods AS T3 ON T2.item  =  T3.id GROUP BY T1.customerid HAVING avg(T3.price)  >  5
SELECT T1.Date FROM receipts AS T1 JOIN items AS T2 ON T1.ReceiptNumber  =  T2.Receipt JOIN goods AS T3 ON T2.Item  =  T3.Id GROUP BY T1.Date HAVING sum(T3.Price)  >  100
SELECT T1.Date FROM receipts AS T1 JOIN items AS T2 ON T1.ReceiptNumber  =  T2.Receipt JOIN goods AS T3 ON T2.Item  =  T3.Id GROUP BY T1.Date HAVING sum(T3.Price)  >  100
SELECT count(*) FROM driver
SELECT count(*) FROM driver
SELECT count(*),  make FROM driver WHERE points  >  150 GROUP BY make
SELECT make,  count(*) FROM driver WHERE points  >  150 GROUP BY make
SELECT avg(Age),  Make FROM driver GROUP BY Make
SELECT avg(Age),  Make FROM driver GROUP BY Make
SELECT avg(Laps) FROM driver WHERE Age  <  20
SELECT avg(Laps) FROM driver WHERE Age  <  20
SELECT Manager,  Sponsor FROM team ORDER BY Car_Owner
SELECT manager,  sponsor,  car_owner FROM team ORDER BY car_owner
SELECT Make FROM team GROUP BY Make HAVING COUNT(*)  >  1
SELECT Make FROM team GROUP BY Make HAVING COUNT(*)  >  1
SELECT Make FROM team WHERE Car_Owner  =  "Buddy Arrington"
SELECT Make FROM team WHERE Car_owner  =  "Buddy Arrington"
SELECT max(Points),  min(Points) FROM driver
SELECT max(Points),  min(Points) FROM driver
SELECT count(*) FROM driver WHERE points  <  150
SELECT count(*) FROM driver WHERE points  <  150
SELECT Driver FROM driver ORDER BY Age ASC
SELECT driver FROM driver ORDER BY Age ASC
SELECT Driver FROM driver ORDER BY Points DESC
SELECT Driver FROM driver ORDER BY Points DESC
SELECT driver,  country FROM driver
SELECT driver,  country FROM driver
SELECT max(Points) FROM driver AS T1 JOIN country AS T2 ON T1.Country  =  T2.Country WHERE T2.Capital  =  "Dublin"
SELECT max(Points) FROM driver AS T1 JOIN country AS T2 ON T1.Country  =  T2.Country WHERE T2.Capital  =  "Dublin"
SELECT avg(age) FROM driver AS T1 JOIN country AS T2 ON T1.country  =  T2.country_id WHERE T2.official_native_language  =  "English"
SELECT avg(age) FROM driver AS T1 JOIN country AS T2 ON T1.country  =  T2.country_id WHERE T2.official_native_language  =  "English"
SELECT country FROM driver WHERE points  >  150
SELECT country FROM driver WHERE points  >  150 GROUP BY country
SELECT T1.Capital FROM country AS T1 JOIN driver AS T2 ON T1.Country  =  T2.Country ORDER BY T2.Points DESC LIMIT 1
SELECT T1.Capital FROM country AS T1 JOIN driver AS T2 ON T1.Country  =  T2.Country ORDER BY T2.Points DESC LIMIT 1
SELECT Make,  COUNT(*) FROM driver GROUP BY Make
SELECT Make,  COUNT(*) FROM driver GROUP BY Make
SELECT Make FROM driver GROUP BY Make ORDER BY count(*) DESC LIMIT 1
SELECT Make FROM driver GROUP BY Make ORDER BY count(*) DESC LIMIT 1
SELECT Make FROM driver GROUP BY Make HAVING COUNT(*)  >=  3
SELECT make FROM driver GROUP BY make HAVING count(*)  >=  3
SELECT Team FROM team EXCEPT SELECT T1.Team FROM team AS T1 JOIN team_driver AS T2 ON T1.Team_ID  =  T2.Team_ID
SELECT team FROM team EXCEPT SELECT T1.team FROM team AS T1 JOIN team_driver AS T2 ON T1.team_id  =  T2.team_id
SELECT T1.Country FROM driver AS T1 JOIN team_driver AS T2 ON T1.Driver_ID  =  T2.Driver_ID JOIN team AS T3 ON T2.Team_ID  =  T3.Team_ID WHERE T1.Make  =  "Dodge" INTERSECT SELECT T1.Country FROM driver AS T1 JOIN team_driver AS T2 ON T1.Driver_ID  =  T2.Driver_ID JOIN team AS T3 ON T2.Team_ID  =  T3.Team_ID WHERE T1.Make  =  "Chevrolet"
SELECT country FROM driver WHERE make  =  "Dodge" INTERSECT SELECT country FROM driver WHERE make  =  "Chevrolet"
SELECT sum(Points),  avg(Points) FROM driver
SELECT sum(Points),  avg(Points) FROM driver
SELECT country FROM country EXCEPT SELECT country FROM driver
SELECT country FROM country EXCEPT SELECT country FROM driver
SELECT T1.Manager,  T1.Sponsor FROM team AS T1 JOIN team_driver AS T2 ON T1.Team_ID  =  T2.Team_ID GROUP BY T1.Team_ID ORDER BY count(*) DESC LIMIT 1
SELECT T1.Manager,  T1.Sponsor FROM team AS T1 JOIN team_driver AS T2 ON T1.Team_ID  =  T2.Team_ID GROUP BY T1.Team_ID ORDER BY count(*) DESC LIMIT 1
SELECT T1.Manager,  T1.Car_Owner FROM team AS T1 JOIN team_driver AS T2 ON T1.Team_ID  =  T2.Team_ID GROUP BY T1.Team_ID HAVING count(*)  >=  2
SELECT T1.Manager,  T1.Car_Owner FROM team AS T1 JOIN team_driver AS T2 ON T1.Team_ID  =  T2.Team_ID GROUP BY T1.Team_ID HAVING count(*)  >=  2
SELECT count(*) FROM institution
SELECT count(*) FROM institution
SELECT Name FROM institution ORDER BY Name ASC
SELECT Name FROM institution ORDER BY Name ASC
SELECT Name FROM institution ORDER BY Founded ASC
SELECT Name FROM institution ORDER BY Founded
SELECT City,  Province FROM institution
SELECT city,  province FROM institution
SELECT max(Enrollment),  min(Enrollment) FROM institution
SELECT max(Enrollment),  min(Enrollment) FROM institution
SELECT affiliation FROM institution WHERE city!= "Vancouver"
SELECT affiliation FROM institution WHERE city!= 'Vancouver'
SELECT stadium FROM institution ORDER BY capacity DESC
SELECT Stadium FROM institution ORDER BY Capacity DESC
SELECT stadium FROM institution ORDER BY enrollment DESC LIMIT 1
SELECT stadium FROM institution ORDER BY enrollment DESC LIMIT 1
SELECT Name,  Nickname FROM institution AS T1 JOIN championship AS T2 ON T1.Institution_ID  =  T2.Institution_ID
SELECT T1.Name,  T2.Nickname FROM institution AS T1 JOIN championship AS T2 ON T1.Institution_ID  =  T2.Institution_ID
SELECT T2.Nickname FROM institution AS T1 JOIN championship AS T2 ON T1.Institution_ID  =  T2.Institution_ID ORDER BY T1.Enrollment ASC LIMIT 1
SELECT nickname FROM championship WHERE institution_id  =  (SELECT institution_id FROM institution ORDER BY enrollment ASC LIMIT 1)
SELECT T1.Name FROM institution AS T1 JOIN championship AS T2 ON T1.Institution_ID  =  T2.Institution_ID ORDER BY T2.Number_of_Championships DESC
SELECT T1.Name FROM institution AS T1 JOIN championship AS T2 ON T1.Institution_ID  =  T2.Institution_ID ORDER BY T2.Number_of_Championships DESC
SELECT Name FROM institution WHERE Institution_ID IN (SELECT Institution_ID FROM championship)
SELECT T1.Name FROM institution AS T1 JOIN championship AS T2 ON T1.Institution_ID  =  T2.Institution_ID GROUP BY T1.Name HAVING count(*)  >=  1
SELECT count(*) FROM championship AS T1 JOIN institution AS T2 ON T1.institution_id  =  T2.institution_id WHERE T2.affiliation  =  "Public"
SELECT sum(Number_of_Championships) FROM Championship WHERE Institution_ID IN (SELECT Institution_ID FROM institution WHERE Affiliation  =  'Public')
SELECT affiliation,  count(*) FROM institution GROUP BY affiliation
SELECT count(*),  affiliation FROM institution GROUP BY affiliation
SELECT affiliation FROM institution GROUP BY affiliation ORDER BY count(*) DESC LIMIT 1
SELECT affiliation FROM institution GROUP BY affiliation ORDER BY count(*) DESC LIMIT 1
SELECT Founded FROM institution GROUP BY Founded HAVING COUNT(*)  >  1
SELECT Founded,  COUNT(*) FROM institution GROUP BY Founded HAVING COUNT(*)  >  1
SELECT T2.Nickname FROM institution AS T1 JOIN championship AS T2 ON T1.Institution_ID  =  T2.Institution_ID ORDER BY T1.Capacity DESC
SELECT T1.Nickname FROM Championship AS T1 JOIN institution AS T2 ON T1.Institution_ID  =  T2.Institution_ID ORDER BY T2.Capacity DESC
SELECT sum(Enrollment) FROM institution WHERE City  =  "Vancouver" OR City  =  "Calgary"
SELECT Enrollment FROM institution WHERE City  =  "Vancouver" OR City  =  "Calgary"
SELECT Province FROM institution WHERE Founded  <  1920 INTERSECT SELECT Province FROM institution WHERE Founded  >  1950
SELECT Province FROM institution WHERE Founded  <  1920 INTERSECT SELECT Province FROM institution WHERE Founded  >  1950
SELECT count(DISTINCT Province) FROM institution
SELECT count(DISTINCT Province) FROM institution
SELECT * FROM Warehouses
SELECT * FROM Warehouses
SELECT DISTINCT T1.Contents FROM Boxes AS T1 JOIN Warehouses AS T2 ON T1.Warehouse  =  T2.Code WHERE T2.Location  =  "New York"
SELECT DISTINCT T2.Contents FROM Warehouses AS T1 JOIN Boxes AS T2 ON T1.Code  =  T2.Warehouse WHERE T1.Location  =  "New York"
SELECT Contents FROM Boxes WHERE Value  >  150
SELECT Contents FROM Boxes WHERE Value  >  150
SELECT T1.Code,  avg(T2.Value) FROM Warehouses AS T1 JOIN Boxes AS T2 ON T1.Code  =  T2.Warehouse GROUP BY T1.Code
SELECT avg(T2.value),  T1.location FROM warehouses AS T1 JOIN boxes AS T2 ON T1.code  =  T2.warehouse GROUP BY T1.location
SELECT avg(value),  sum(value) FROM boxes
SELECT avg(value),  sum(value) FROM boxes
SELECT avg(Capacity),  sum(Capacity) FROM Warehouses
SELECT avg(Capacity),  sum(Capacity) FROM Warehouses
SELECT Contents,  avg(Value),  max(Value) FROM Boxes GROUP BY Contents
SELECT contents,  avg(value),  max(value) FROM boxes GROUP BY contents
SELECT Contents FROM Boxes GROUP BY Contents ORDER BY sum(Value) DESC LIMIT 1
SELECT Contents FROM Boxes ORDER BY Value DESC LIMIT 1
SELECT avg(value) FROM boxes
SELECT avg(value) FROM boxes
SELECT DISTINCT Contents FROM Boxes
SELECT DISTINCT Contents FROM Boxes
SELECT count(DISTINCT Contents) FROM Boxes
SELECT count(DISTINCT Contents) FROM Boxes
SELECT DISTINCT LOCATION FROM Warehouses
SELECT DISTINCT LOCATION FROM Warehouses
SELECT T2.code FROM Warehouses AS T1 JOIN Boxes AS T2 ON T1.code  =  T2.warehouse WHERE T1.location  =  'Chicago' OR T1.location  =  'New York'
SELECT T2.code FROM warehouses AS T1 JOIN boxes AS T2 ON T1.code  =  T2.warehouse WHERE T1.location  =  "Chicago" OR T1.location  =  "New York"
SELECT sum(T2.value) FROM warehouses AS T1 JOIN boxes AS T2 ON T1.code  =  T2.warehouse WHERE T1.location  =  'Chicago' OR T1.location  =  'New York'
SELECT sum(T2.value) FROM warehouses AS T1 JOIN boxes AS T2 ON T1.code  =  T2.warehouse WHERE T1.location  =  'Chicago' OR T1.location  =  'New York'
SELECT DISTINCT Contents FROM Boxes WHERE Warehouse IN (SELECT Code FROM Warehouses WHERE Location  =  'Chicago') INTERSECT SELECT DISTINCT Contents FROM Boxes WHERE Warehouse IN (SELECT Code FROM Warehouses WHERE Location  =  'New York')
SELECT Contents FROM Boxes WHERE LOCATION  =  "Chicago" INTERSECT SELECT Contents FROM Boxes WHERE LOCATION  =  "New York"
SELECT Contents FROM Boxes WHERE Code NOT IN (SELECT Code FROM Boxes WHERE Location  =  "New York")
SELECT Contents FROM Boxes WHERE Contents NOT IN (SELECT Contents FROM Boxes WHERE LOCATION  =  "New York")
SELECT T1.Location FROM Warehouses AS T1 JOIN Boxes AS T2 ON T1.Code  =  T2.Warehouse WHERE T2.Contents  =  "Rocks" EXCEPT SELECT T1.Location FROM Warehouses AS T1 JOIN Boxes AS T2 ON T1.Code  =  T2.Warehouse WHERE T2.Contents  =  "Scissors"
SELECT T1.Location FROM Warehouses AS T1 JOIN Boxes AS T2 ON T1.Code  =  T2.Warehouse WHERE T2.Contents  =  "Rocks" EXCEPT SELECT T1.Location FROM Warehouses AS T1 JOIN Boxes AS T2 ON T1.Code  =  T2.Warehouse WHERE T2.Contents  =  "Scissors"
SELECT T1.Location FROM Warehouses AS T1 JOIN Boxes AS T2 ON T1.Code  =  T2.Warehouse WHERE T2.Contents  =  "Rocks" OR T2.Contents  =  "Scissors"
SELECT DISTINCT T1.Location FROM Warehouses AS T1 JOIN Boxes AS T2 ON T1.Code  =  T2.Warehouse WHERE T2.Contents  =  "Rocks" OR T2.Contents  =  "Scissors"
SELECT T1.Location FROM Warehouses AS T1 JOIN Boxes AS T2 ON T1.Code  =  T2.Warehouse WHERE T2.Contents  =  "Rocks" INTERSECT SELECT T1.Location FROM Warehouses AS T1 JOIN Boxes AS T2 ON T1.Code  =  T2.Warehouse WHERE T2.Contents  =  "Scissors"
SELECT T1.Location FROM Warehouses AS T1 JOIN Boxes AS T2 ON T1.Code  =  T2.Warehouse WHERE T2.Contents  =  "Rocks" INTERSECT SELECT T1.Location FROM Warehouses AS T1 JOIN Boxes AS T2 ON T1.Code  =  T2.Warehouse WHERE T2.Contents  =  "Scissors"
SELECT code,  contents FROM Boxes ORDER BY value
SELECT Code,  Contents FROM Boxes ORDER BY Value
SELECT code,  contents FROM boxes ORDER BY value ASC LIMIT 1
SELECT code,  contents FROM boxes ORDER BY value ASC LIMIT 1
SELECT DISTINCT Contents FROM Boxes WHERE Value  >  (SELECT avg(Value) FROM Boxes)
SELECT DISTINCT Contents FROM Boxes WHERE Value  >  (SELECT avg(Value) FROM Boxes)
SELECT DISTINCT Contents FROM Boxes ORDER BY Contents
SELECT DISTINCT Contents FROM Boxes ORDER BY Contents ASC
SELECT Code FROM Boxes WHERE Value  >  (SELECT max(Value) FROM Boxes WHERE Contents  =  'Rocks')
SELECT code FROM boxes WHERE value  >  (SELECT max(value) FROM boxes WHERE contents  =  "Rocks")
SELECT code,  contents FROM boxes WHERE value  >  (SELECT max(value) FROM boxes WHERE contents  =  'Scissors')
SELECT T1.code,  T1.contents FROM boxes AS T1 JOIN boxes AS T2 ON T1.value  >  T2.value JOIN warehouses AS T3 ON T2.warehouse  =  T3.code WHERE T2.contents  =  "Scissors"
SELECT sum(T2.value) FROM warehouses AS T1 JOIN boxes AS T2 ON T1.code  =  T2.warehouse WHERE T1.capacity  =  (SELECT max(capacity) FROM warehouses)
SELECT sum(T2.value) FROM warehouses AS T1 JOIN boxes AS T2 ON T1.code  =  T2.warehouse WHERE T1.capacity  =  (SELECT max(capacity) FROM warehouses)
SELECT T1.Code,  avg(T2.Value) FROM Warehouses AS T1 JOIN Boxes AS T2 ON T1.Code  =  T2.Warehouse GROUP BY T1.Code HAVING avg(T2.Value)  >  150
SELECT avg(T2.value),  T1.location FROM warehouses AS T1 JOIN boxes AS T2 ON T1.code  =  T2.warehouse GROUP BY T1.location HAVING avg(T2.value)  >  150
SELECT contents,  sum(value),  count(*) FROM boxes GROUP BY contents
SELECT contents,  sum(value),  count(*) FROM boxes GROUP BY contents
SELECT LOCATION,  sum(capacity),  avg(capacity),  max(capacity) FROM warehouses GROUP BY LOCATION
SELECT LOCATION,  sum(capacity),  avg(capacity),  max(capacity) FROM warehouses GROUP BY LOCATION
SELECT sum(capacity) FROM warehouses
SELECT sum(capacity) FROM warehouses
SELECT T1.value FROM boxes AS T1 JOIN warehouses AS T2 ON T1.warehouse  =  T2.code ORDER BY T1.value DESC LIMIT 1
SELECT T1.Location,  max(T2.Value) FROM Warehouses AS T1 JOIN Boxes AS T2 ON T1.Code  =  T2.Warehouse GROUP BY T1.Location
SELECT T1.Code,  count(*) FROM Warehouses AS T1 JOIN Boxes AS T2 ON T1.Code  =  T2.Warehouse GROUP BY T1.Code
SELECT count(*),  T1.location FROM warehouses AS T1 JOIN boxes AS T2 ON T1.code  =  T2.warehouse GROUP BY T1.location
SELECT count(DISTINCT T1.Location) FROM WAREHOUSES AS T1 JOIN BOXES AS T2 ON T1.Code  =  T2.Warehouse WHERE T2.Contents  =  "Rocks"
SELECT count(DISTINCT T1.Warehouse) FROM Boxes AS T1 JOIN Contents AS T2 ON T1.Contents  =  T2.Code WHERE T2.Name  =  "Rocks"
SELECT T1.code,  T2.location FROM Boxes AS T1 JOIN Warehouses AS T2 ON T1.warehouse  =  T2.code
SELECT T1.Code,  T2.Location FROM Boxes AS T1 JOIN Warehouses AS T2 ON T1.Warehouse  =  T2.Code
SELECT T2.Code FROM Warehouses AS T1 JOIN Boxes AS T2 ON T1.Code  =  T2.Warehouse WHERE T1.Location  =  "Chicago"
SELECT T2.code FROM warehouses AS T1 JOIN boxes AS T2 ON T1.code  =  T2.warehouse WHERE T1.location  =  "Chicago"
SELECT count(*),  T1.location FROM warehouses AS T1 JOIN boxes AS T2 ON T1.code  =  T2.warehouse GROUP BY T1.location
SELECT count(*),  T1.location FROM warehouses AS T1 JOIN boxes AS T2 ON T1.code  =  T2.warehouse GROUP BY T1.location
SELECT count(DISTINCT contents),  warehouse FROM boxes GROUP BY warehouse
SELECT T1.location,  count(*) FROM warehouses AS T1 JOIN boxes AS T2 ON T1.code  =  T2.warehouse GROUP BY T1.location
SELECT T1.code FROM warehouses AS T1 JOIN boxes AS T2 ON T1.code  =  T2.warehouse GROUP BY T1.code HAVING sum(T2.value)  >  T1.capacity
SELECT T1.code FROM warehouses AS T1 JOIN boxes AS T2 ON T1.code  =  T2.warehouse GROUP BY T1.code HAVING count(*)  >  T1.capacity
SELECT sum(value) FROM boxes WHERE code NOT IN (SELECT code FROM warehouses WHERE location  =  'Chicago')
SELECT sum(T2.value) FROM warehouses AS T1 JOIN boxes AS T2 ON T1.code  =  T2.warehouse WHERE T1.location!= "Chicago"
SELECT University_Name,  City,  State FROM university ORDER BY University_Name
SELECT University_Name,  City,  State FROM university ORDER BY University_Name
SELECT count(*) FROM university WHERE state  =  "IL" OR state  =  "OH"
SELECT count(*) FROM university WHERE state  =  "Illinois" OR state  =  "Ohio"
SELECT max(Enrollment),  avg(Enrollment),  min(Enrollment) FROM university
SELECT max(Enrollment),  avg(Enrollment),  min(Enrollment) FROM university
SELECT Team_Name FROM university WHERE Enrollment  >  (SELECT avg(Enrollment) FROM university)
SELECT Team_Name FROM university WHERE Enrollment  >  (SELECT avg(Enrollment) FROM university)
SELECT DISTINCT Home_Conference FROM university
SELECT DISTINCT Home_Conference FROM university
SELECT Home_Conference,  COUNT(*) FROM university GROUP BY Home_Conference
SELECT count(*),  home_conference FROM university GROUP BY home_conference
SELECT State FROM university GROUP BY State ORDER BY count(*) DESC LIMIT 1
SELECT State FROM university GROUP BY State ORDER BY count(*) DESC LIMIT 1
SELECT Home_Conference,  avg(Enrollment) FROM university WHERE Enrollment  >  2000 GROUP BY Home_Conference
SELECT Home_Conference FROM university GROUP BY Home_Conference HAVING avg(Enrollment)  >  2000
SELECT Home_Conference FROM university GROUP BY Home_Conference ORDER BY sum(Enrollment) ASC LIMIT 1
SELECT Home_Conference FROM university GROUP BY Home_Conference ORDER BY Enrollment ASC LIMIT 1
SELECT Major_Name,  Major_Code FROM major ORDER BY Major_Code
SELECT Major_Name,  Major_Code FROM major ORDER BY Major_Code
SELECT T1.Major_Name,  T1.Major_ID,  T2.Rank FROM major AS T1 JOIN major_ranking AS T2 ON T1.Major_ID  =  T2.Major_ID JOIN university AS T3 ON T2.University_ID  =  T3.University_ID WHERE T3.University_Name  =  "Augustana College"
SELECT T1.Rank,  T1.Major_Name FROM major AS T1 JOIN major_ranking AS T2 ON T1.Major_ID  =  T2.Major_ID JOIN university AS T3 ON T2.University_ID  =  T3.University_ID WHERE T3.University_Name  =  "Augustana College"
SELECT T1.university_name,  T1.city,  T1.state FROM university AS T1 JOIN major_ranking AS T2 ON T1.university_id  =  T2.university_id JOIN major AS T3 ON T2.major_id  =  T3.major_id WHERE T3.major_name  =  "Accounting" AND T2.rank  =  1
SELECT T1.university_name,  T1.city,  T1.state FROM university AS T1 JOIN major_ranking AS T2 ON T1.university_id  =  T2.university_id JOIN major AS T3 ON T2.major_id  =  T3.major_id WHERE T3.major_name  =  "Accounting" AND T2.rank  =  1
SELECT T1.university_name FROM university AS T1 JOIN major_ranking AS T2 ON T1.university_id  =  T2.university_id WHERE T2.rank  =  1 GROUP BY T1.university_name ORDER BY count(*) DESC LIMIT 1
SELECT T1.University_Name FROM university AS T1 JOIN major_ranking AS T2 ON T1.University_ID  =  T2.University_ID WHERE T2.Rank  =  1 GROUP BY T1.University_Name ORDER BY count(*) DESC LIMIT 1
SELECT University_Name FROM university EXCEPT SELECT T1.University_Name FROM university AS T1 JOIN major_ranking AS T2 ON T1.University_ID  =  T2.University_ID WHERE T2.Rank  =  1
SELECT University_Name FROM university EXCEPT SELECT T1.University_Name FROM university AS T1 JOIN major_ranking AS T2 ON T1.University_ID  =  T2.University_ID JOIN major AS T3 ON T2.Major_ID  =  T3.Major_ID WHERE T2.Rank  =  1
SELECT T1.University_Name FROM university AS T1 JOIN major_ranking AS T2 ON T1.University_ID  =  T2.University_ID JOIN major AS T3 ON T2.Major_ID  =  T3.Major_ID WHERE T3.Major_Name  =  "Accounting" INTERSECT SELECT T1.University_Name FROM university AS T1 JOIN major_ranking AS T2 ON T1.University_ID  =  T2.University_ID JOIN major AS T3 ON T2.Major_ID  =  T3.Major_ID WHERE T3.Major_Name  =  "Urban Education"
SELECT T1.university_name FROM university AS T1 JOIN major_ranking AS T2 ON T1.university_id  =  T2.university_id JOIN major AS T3 ON T2.major_id  =  T3.major_id WHERE T3.major_name  =  'Accounting' INTERSECT SELECT T1.university_name FROM university AS T1 JOIN major_ranking AS T2 ON T1.university_id  =  T2.university_id JOIN major AS T3 ON T2.major_id  =  T3.major_id WHERE T3.major_name  =  'Urban Education'
SELECT T1.University_Name,  T2.Rank FROM university AS T1 JOIN overall_ranking AS T2 ON T1.University_ID  =  T2.University_ID WHERE T1.State  =  "Wisconsin"
SELECT University_Name,  Rank FROM university AS T1 JOIN overall_ranking AS T2 ON T1.University_ID  =  T2.University_ID WHERE T1.State  =  "Wisconsin"
SELECT T1.University_Name FROM university AS T1 JOIN overall_ranking AS T2 ON T1.University_ID  =  T2.University_ID ORDER BY T2.research_point DESC LIMIT 1
SELECT T1.University_Name FROM university AS T1 JOIN overall_ranking AS T2 ON T1.University_ID  =  T2.University_ID ORDER BY T2.research_point DESC LIMIT 1
SELECT T1.University_Name FROM university AS T1 JOIN overall_ranking AS T2 ON T1.University_ID  =  T2.University_ID ORDER BY T2.Reputation_point ASC
SELECT T1.University_Name FROM university AS T1 JOIN overall_ranking AS T2 ON T1.University_ID  =  T2.University_ID ORDER BY T2.Reputation_point ASC
SELECT T1.University_Name FROM university AS T1 JOIN major_ranking AS T2 ON T1.University_ID  =  T2.University_ID JOIN major AS T3 ON T2.Major_ID  =  T3.Major_ID WHERE T3.Major_Name  =  "Accounting" AND T2.Rank  >=  3
SELECT T1.University_Name FROM university AS T1 JOIN major_ranking AS T2 ON T1.University_ID  =  T2.University_ID JOIN major AS T3 ON T2.Major_ID  =  T3.Major_ID WHERE T3.Major_Name  =  "Accounting" AND T2.Rank  >=  3
SELECT sum(Enrollment) FROM university AS T1 JOIN overall_ranking AS T2 ON T1.University_ID  =  T2.University_ID WHERE T2.Rank  <=  5
SELECT count(*) FROM overall_ranking AS T1 JOIN university AS T2 ON T1.university_id  =  T2.university_id WHERE T1.rank  <=  5
SELECT T1.University_Name,  T2.Citation_point FROM university AS T1 JOIN overall_ranking AS T2 ON T1.University_ID  =  T2.University_ID ORDER BY T2.Reputation_point DESC LIMIT 3
SELECT T1.University_Name,  T2.Citation_point FROM university AS T1 JOIN overall_ranking AS T2 ON T1.University_ID  =  T2.University_ID ORDER BY T2.Reputation_point DESC LIMIT 3
SELECT State FROM university WHERE Enrollment  <  3000 GROUP BY State HAVING count(*)  >  2
SELECT State FROM university WHERE Enrollment  <  3000 GROUP BY State HAVING COUNT(*)  >  2
SELECT title FROM Movies WHERE rating  =  "NR"
SELECT title FROM Movies WHERE rating  =  "NR"
SELECT title FROM Movies WHERE rating  =  'G'
SELECT title FROM Movies WHERE Rating  =  'G'
SELECT T1.Title FROM Movies AS T1 JOIN MovieTheaters AS T2 ON T1.Code  =  T2.Movie WHERE T2.Name  =  "Odeon"
SELECT T1.Title FROM Movies AS T1 JOIN MovieTheaters AS T2 ON T1.Code  =  T2.Movie WHERE T2.Name  =  "Odeon"
SELECT T1.Name,  T2.Title FROM MovieTheaters AS T1 JOIN Movies AS T2 ON T1.Movie  =  T2.Code
SELECT T1.Name,  T2.Title FROM MovieTheaters AS T1 JOIN Movies AS T2 ON T1.Movie  =  T2.Code
SELECT count(*) FROM Movies WHERE Rating  =  'G'
SELECT count(*) FROM Movies WHERE Rating  =  'G'
SELECT count(*) FROM MovieTheaters
SELECT count(*) FROM MovieTheaters
SELECT count(DISTINCT movie) FROM MovieTheaters
SELECT count(DISTINCT movie) FROM MovieTheaters
SELECT count(DISTINCT name) FROM MovieTheaters
SELECT count(DISTINCT name) FROM MovieTheaters
SELECT T1.Rating FROM Movies AS T1 JOIN MovieTheaters AS T2 ON T1.Code  =  T2.Movie WHERE T2.Name LIKE "%Citizen%"
SELECT T1.Rating FROM Movies AS T1 JOIN MovieTheaters AS T2 ON T1.Code  =  T2.Movie WHERE T2.Name LIKE "%Citizen%"
SELECT T2.Name FROM Movies AS T1 JOIN MovieTheaters AS T2 ON T1.Code  =  T2.Movie WHERE T1.Rating  =  'G' INTERSECT SELECT T2.Name FROM Movies AS T1 JOIN MovieTheaters AS T2 ON T1.Code  =  T2.Movie WHERE T1.Rating  =  'PG'
SELECT T2.Name FROM Movies AS T1 JOIN MovieTheaters AS T2 ON T1.Code  =  T2.Movie WHERE T1.Rating  =  'G' OR T1.Rating  =  'PG'
SELECT T1.Title FROM Movies AS T1 JOIN MovieTheaters AS T2 ON T1.Code  =  T2.Movie WHERE T2.Name  =  'Odeon' OR T2.Name  =  'Imperial'
SELECT T1.Title FROM Movies AS T1 JOIN MovieTheaters AS T2 ON T1.Code  =  T2.Movie WHERE T2.Name  =  "Odeon" OR T2.Name  =  "Imperial"
SELECT T1.Title FROM Movies AS T1 JOIN MovieTheaters AS T2 ON T1.Code  =  T2.Movie WHERE T2.Name  =  "Odeon" INTERSECT SELECT T1.Title FROM Movies AS T1 JOIN MovieTheaters AS T2 ON T1.Code  =  T2.Movie WHERE T2.Name  =  "Imperial"
SELECT T1.Title FROM Movies AS T1 JOIN MovieTheaters AS T2 ON T1.Code  =  T2.Movie WHERE T2.Name  =  "Odeon" INTERSECT SELECT T1.Title FROM Movies AS T1 JOIN MovieTheaters AS T2 ON T1.Code  =  T2.Movie WHERE T2.Name  =  "Imperial"
SELECT Title FROM Movies EXCEPT SELECT T2.Title FROM MovieTheaters AS T1 JOIN Movies AS T2 ON T1.Code  =  T2.Code WHERE T1.Name  =  "Odeon"
SELECT title FROM Movies EXCEPT SELECT T2.title FROM MovieTheaters AS T1 JOIN Movies AS T2 ON T1.code  =  T2.code WHERE T1.name  =  "Odeon"
SELECT title FROM Movies ORDER BY title ASC
SELECT title FROM Movies ORDER BY title ASC
SELECT title FROM Movies ORDER BY Rating
SELECT T1.Title FROM Movies AS T1 JOIN MovieTheaters AS T2 ON T1.Code  =  T2.Movie ORDER BY T1.Rating
SELECT Name FROM MovieTheaters GROUP BY Name ORDER BY count(*) DESC LIMIT 1
SELECT Name FROM MovieTheaters GROUP BY Name ORDER BY count(*) DESC LIMIT 1
SELECT T1.Title FROM Movies AS T1 JOIN MovieTheaters AS T2 ON T1.Code  =  T2.Movie GROUP BY T1.Title ORDER BY count(*) DESC LIMIT 1
SELECT T1.Title FROM Movies AS T1 JOIN MovieTheaters AS T2 ON T1.Code  =  T2.Movie GROUP BY T1.Title ORDER BY count(*) DESC LIMIT 1
SELECT count(*),  rating FROM Movies GROUP BY rating
SELECT rating,  count(*) FROM movies GROUP BY rating
SELECT count(*) FROM Movies WHERE Rating IS NOT NULL
SELECT count(*) FROM Movies WHERE Rating IS NOT NULL
SELECT Name FROM MovieTheaters WHERE Code IN (SELECT Code FROM Movies)
SELECT Name FROM MovieTheaters WHERE Code IN (SELECT Code FROM Movies)
SELECT Name FROM MovieTheaters EXCEPT SELECT T2.Name FROM Movies AS T1 JOIN MovieTheaters AS T2 ON T1.Code  =  T2.Movie
SELECT Name FROM MovieTheaters WHERE Code NOT IN (SELECT Code FROM Movies)
SELECT T2.Name FROM Movies AS T1 JOIN MovieTheaters AS T2 ON T1.Code  =  T2.Movie WHERE T1.Rating  =  'G'
SELECT T2.Name FROM Movies AS T1 JOIN MovieTheaters AS T2 ON T1.Code  =  T2.Movie WHERE T1.Rating  =  'G'
SELECT title FROM Movies
SELECT Title FROM Movies
SELECT DISTINCT Rating FROM Movies
SELECT DISTINCT Rating FROM Movies
SELECT * FROM Movies WHERE Rating  =  "Unrated"
SELECT * FROM Movies WHERE Rating  =  'Unrated'
SELECT title FROM movies EXCEPT SELECT T2.title FROM movieTheaters AS T1 JOIN movies AS T2 ON T1.movie  =  T2.code
SELECT title FROM movies EXCEPT SELECT T2.title FROM movieTheaters AS T1 JOIN movies AS T2 ON T1.movie  =  T2.code
SELECT T1.Recipient FROM Package AS T1 JOIN Shipment AS T2 ON T1.Shipment  =  T2.ShipmentID ORDER BY T1.Weight DESC LIMIT 1
SELECT T1.Name FROM Client AS T1 JOIN PACKAGE AS T2 ON T1.AccountNumber  =  T2.Recipient GROUP BY T2.Recipient ORDER BY T2.Weight DESC LIMIT 1
SELECT sum(T1.weight) FROM Package AS T1 JOIN Client AS T2 ON T1.Sender  =  T2.AccountNumber WHERE T2.Name  =  "Leo Wong"
SELECT sum(T1.Weight) FROM Package AS T1 JOIN Employee AS T2 ON T1.Sender  =  T2.EmployeeID WHERE T2.Name  =  "Leo Wong"
SELECT Position FROM Employee WHERE Name  =  "Amy Wong"
SELECT Position FROM Employee WHERE Name  =  "Amy Wong"
SELECT Salary,  Position FROM Employee WHERE Name = "Turanga Leela"
SELECT salary,  position FROM Employee WHERE Name  =  "Turanga Leela"
SELECT avg(Salary) FROM Employee WHERE Position  =  "Intern"
SELECT avg(Salary) FROM Employee WHERE Position  =  "Intern"
SELECT T1.Level FROM Has_Clearance AS T1 JOIN Employee AS T2 ON T1.Employee  =  T2.EmployeeID WHERE T2.Position  =  "Physician"
SELECT T1.Level FROM Has_Clearance AS T1 JOIN Employee AS T2 ON T1.Employee  =  T2.EmployeeID JOIN Position AS T3 ON T2.Position  =  T3.Position WHERE T3.Position  =  "Physician"
SELECT PackageNumber FROM Package WHERE Sender  =  "Leo Wong"
SELECT count(*) FROM Package AS T1 JOIN Employee AS T2 ON T1.Sender  =  T2.EmployeeID WHERE T2.Name  =  "Leo Wong"
SELECT T1.PackageNumber FROM Package AS T1 JOIN Recipient AS T2 ON T1.Recipient  =  T2.Name WHERE T2.Name  =  "Leo Wong"
SELECT T1.PackageNumber FROM Package AS T1 JOIN Recipient AS T2 ON T1.Recipient  =  T2.Name WHERE T2.Name  =  "Leo Wong"
SELECT contents FROM Package WHERE sender  =  "Leo Wong" OR recipient  =  "Leo Wong"
SELECT DISTINCT sender,  recipient FROM Package WHERE sender  =  "Leo Wong" OR recipient  =  "Leo Wong"
SELECT count(*) FROM Package AS T1 JOIN Employee AS T2 ON T1.Sender  =  T2.EmployeeID JOIN Employee AS T3 ON T1.Recipient  =  T3.EmployeeID WHERE T2.Name  =  "Ogden Wernstrom" AND T3.Name  =  "Leo Wong"
SELECT count(*) FROM Package AS T1 JOIN Employee AS T2 ON T1.Sender  =  T2.EmployeeID JOIN Employee AS T3 ON T1.Recipient  =  T3.EmployeeID WHERE T2.Name  =  "Ogden Wernstrom" AND T3.Name  =  "Leo Wong"
SELECT Contents FROM Package WHERE Sender  =  "John Zoidfarb"
SELECT Contents FROM Package WHERE Sender  =  "John Zoidfarb"
SELECT T1.PackageNumber,  T1.Weight FROM Package AS T1 JOIN Client AS T2 ON T1.Sender  =  T2.AccountNumber WHERE T2.Name LIKE "%John%" ORDER BY T1.Weight DESC LIMIT 1
SELECT T1.PackageNumber,  T1.Weight FROM Package AS T1 JOIN Client AS T2 ON T1.Sender  =  T2.AccountNumber WHERE T2.Name LIKE 'John%' ORDER BY T1.Weight DESC LIMIT 1
SELECT PackageNumber,  Weight FROM Package ORDER BY Weight ASC LIMIT 3
SELECT PackageNumber,  Weight FROM Package ORDER BY Weight ASC LIMIT 3
SELECT T1.Name,  count(*) FROM Client AS T1 JOIN Package AS T2 ON T1.AccountNumber  =  T2.Sender GROUP BY T1.Name ORDER BY count(*) DESC LIMIT 1
SELECT T1.Name,  count(*) FROM Client AS T1 JOIN Package AS T2 ON T1.AccountNumber  =  T2.Sender GROUP BY T1.Name ORDER BY count(*) DESC LIMIT 1
SELECT T1.Name,  count(*) FROM Client AS T1 JOIN Package AS T2 ON T1.AccountNumber  =  T2.Recipient GROUP BY T1.Name ORDER BY count(*) ASC LIMIT 1
SELECT T1.Recipient,  count(*) FROM Package AS T1 JOIN Shipment AS T2 ON T1.Shipment  =  T2.ShipmentID GROUP BY T1.Recipient ORDER BY count(*) ASC LIMIT 1
SELECT T1.Name FROM Client AS T1 JOIN Package AS T2 ON T1.AccountNumber  =  T2.Sender GROUP BY T2.Sender HAVING COUNT(*)  >  1
SELECT T1.Name FROM Client AS T1 JOIN PACKAGE AS T2 ON T1.AccountNumber  =  T2.Sender GROUP BY T1.Name HAVING COUNT(*)  >  1
SELECT coordinates FROM planet WHERE name  =  "Mars"
SELECT coordinates FROM planet WHERE name  =  "Mars"
SELECT name,  coordinates FROM planet ORDER BY name
SELECT name,  coordinates FROM planet ORDER BY name
SELECT ShipmentID FROM Shipment WHERE Manager  =  "Phillip J. Fry"
SELECT ShipmentID FROM Shipment WHERE Manager  =  "Phillip J Fry"
SELECT Date FROM Shipment
SELECT Date FROM Shipment
SELECT shipmentid FROM shipment WHERE planet  =  "Mars"
SELECT shipmentid FROM shipment WHERE planet  =  "Mars"
SELECT shipmentid FROM shipment WHERE planet  =  "Mars" AND manager  =  "Turanga Leela"
SELECT shipmentid FROM shipment WHERE planet  =  "Mars" AND manager  =  "Turanga Leela"
SELECT shipmentid FROM shipment WHERE planet  =  "Mars" OR manager  =  "Turanga Leela"
SELECT shipmentid FROM shipment WHERE planet  =  "Mars" AND manager  =  "Turanga Leela"
SELECT T1.name,  count(*) FROM planet AS T1 JOIN shipment AS T2 ON T1.planetid  =  T2.planet GROUP BY T1.name
SELECT count(*),  T1.name FROM planet AS T1 JOIN shipment AS T2 ON T1.planetid  =  T2.planet GROUP BY T1.name
SELECT T1.name FROM planet AS T1 JOIN shipment AS T2 ON T1.planetid  =  T2.planet GROUP BY T2.planet ORDER BY count(*) DESC LIMIT 1
SELECT T1.name FROM planet AS T1 JOIN shipment AS T2 ON T1.planetid  =  T2.planet GROUP BY T1.name ORDER BY count(*) DESC LIMIT 1
SELECT T1.Name,  count(*) FROM Employee AS T1 JOIN Shipment AS T2 ON T1.EmployeeID  =  T2.Manager GROUP BY T1.Name
SELECT count(*),  Manager FROM shipment GROUP BY Manager
SELECT sum(T1.weight) FROM package AS T1 JOIN shipment AS T2 ON T1.shipment  =  T2.shipmentid JOIN planet AS T3 ON T2.planet  =  T3.planetid WHERE T3.name  =  "Mars"
SELECT sum(T1.weight) FROM package AS T1 JOIN shipment AS T2 ON T1.shipment  =  T2.shipmentid JOIN planet AS T3 ON T2.planet  =  T3.planetid WHERE T3.name  =  "Mars"
SELECT T1.name,  sum(T3.weight) FROM planet AS T1 JOIN shipment AS T2 ON T1.planetid  =  T2.planet JOIN package AS T3 ON T2.shipmentid  =  T3.shipment GROUP BY T1.name
SELECT T1.name,  sum(T2.weight) FROM planet AS T1 JOIN package AS T2 ON T1.planetid  =  T2.planet GROUP BY T1.name
SELECT T1.name FROM planet AS T1 JOIN shipment AS T2 ON T1.planetid  =  T2.planet JOIN package AS T3 ON T2.shipmentid  =  T3.shipment GROUP BY T1.name HAVING sum(T3.weight)  >  30
SELECT T1.name FROM planet AS T1 JOIN shipment AS T2 ON T1.planetid  =  T2.planet JOIN package AS T3 ON T2.shipmentid  =  T3.shipment GROUP BY T1.name HAVING sum(T3.weight)  >  30
SELECT T1.PackageNumber FROM Package AS T1 JOIN Shipment AS T2 ON T1.Shipment  =  T2.ShipmentID JOIN Planet AS T3 ON T2.Planet  =  T3.PlanetID JOIN Employee AS T4 ON T2.Manager  =  T4.EmployeeID WHERE T3.Name  =  "Omicron Persei 8" AND T4.Name  =  "Zapp Brannigan"
SELECT count(*) FROM Package AS T1 JOIN Shipment AS T2 ON T1.Shipment  =  T2.ShipmentID JOIN Employee AS T3 ON T2.Manager  =  T3.EmployeeID JOIN Planet AS T4 ON T2.Planet  =  T4.PlanetID WHERE T3.Name  =  "Zapp Brannigan" AND T4.Name  =  "Omicron Persei 8"
SELECT PackageNumber FROM Package WHERE Sender  =  "Zapp Brannigan" OR Recipient  =  "Omicron Persei 8"
SELECT count(*) FROM Package AS T1 JOIN Shipment AS T2 ON T1.Shipment  =  T2.ShipmentID WHERE T2.Planet  =  "Omicron Persei 8" OR T1.Sender  =  "Zapp Brannigan"
SELECT PackageNumber,  Weight FROM Package WHERE Weight BETWEEN 10 AND 30
SELECT PackageNumber,  Weight FROM Package WHERE Weight BETWEEN 10 AND 30
SELECT T1.Name FROM Employee AS T1 JOIN Has_Clearance AS T2 ON T1.EmployeeID  =  T2.Employee JOIN Planet AS T3 ON T3.PlanetID  =  T2.Planet WHERE T3.Name!= 'Mars'
SELECT Name FROM Employee EXCEPT SELECT T1.Name FROM Employee AS T1 JOIN Has_Clearance AS T2 ON T1.EmployeeID  =  T2.Employee JOIN Planet AS T3 ON T2.Planet  =  T3.PlanetID WHERE T3.Name  =  "Mars"
SELECT T1.Name FROM Employee AS T1 JOIN Has_Clearance AS T2 ON T1.EmployeeID  =  T2.Employee JOIN Planet AS T3 ON T2.Planet  =  T3.PlanetID WHERE T3.Name  =  "Omega III"
SELECT T1.Name FROM Employee AS T1 JOIN Has_Clearance AS T2 ON T1.EmployeeID  =  T2.Employee JOIN Planet AS T3 ON T3.PlanetID  =  T2.Planet WHERE T3.Name  =  "Omega III"
SELECT T1.name FROM planet AS T1 JOIN has_clearance AS T2 ON T1.planetid  =  T2.planet GROUP BY T2.planet HAVING count(*)  =  1
SELECT T1.Name FROM Planet AS T1 JOIN Has_Clearance AS T2 ON T1.PlanetID  =  T2.Planet GROUP BY T1.PlanetID HAVING count(*)  =  1
SELECT Name FROM Employee WHERE Salary BETWEEN 5000 AND 10000
SELECT Name FROM Employee WHERE Salary BETWEEN 5000 AND 10000
SELECT Name FROM Employee WHERE Salary  >  (SELECT avg(Salary) FROM Employee) OR Salary  >  5000
SELECT Name FROM Employee WHERE Salary  >  (SELECT avg(Salary) FROM Employee) OR Salary  >  5000
SELECT count(*) FROM Employee WHERE EmployeeID NOT IN (SELECT Employee FROM Has_Clearance WHERE Planet  =  "Mars")
SELECT count(*) FROM Employee WHERE EmployeeID NOT IN (SELECT Employee FROM Has_Clearance WHERE Planet  =  'Mars')
SELECT count(*) FROM game
SELECT count(*) FROM game
SELECT title,  developers FROM game ORDER BY Units_sold_Millions DESC
SELECT title,  developers FROM game ORDER BY Units_sold_Millions DESC
SELECT avg(Units_sold_Millions) FROM game WHERE Developers!= "Nintendo"
SELECT avg(Units_sold_Millions) FROM game WHERE Developers!= "Nintendo"
SELECT Platform_name,  Market_district FROM platform
SELECT platform_name,  market_district FROM platform
SELECT Platform_ID,  Platform_name FROM platform WHERE Download_rank  =  1
SELECT Platform_name,  Platform_ID FROM platform WHERE Download_rank  =  1
SELECT max(Rank_of_the_year),  min(Rank_of_the_year) FROM player
SELECT max(Rank_of_the_year),  min(Rank_of_the_year) FROM player
SELECT count(*) FROM player WHERE rank_of_the_year  <  3
SELECT count(*) FROM player WHERE rank_of_the_year  <=  3
SELECT Player_name FROM player ORDER BY Player_name ASC
SELECT Player_name FROM player ORDER BY Player_name ASC
SELECT Player_name,  College FROM player ORDER BY Rank_of_the_year DESC
SELECT Player_name,  College FROM player ORDER BY Rank_of_the_year DESC
SELECT T1.Player_name,  T1.Rank_of_the_year FROM player AS T1 JOIN game_player AS T2 ON T1.Player_ID  =  T2.Player_ID JOIN game AS T3 ON T2.Game_ID  =  T3.Game_ID WHERE T3.Title  =  "Super Mario World"
SELECT T1.Player_name,  T1.Rank_of_the_year FROM player AS T1 JOIN game_player AS T2 ON T1.Player_ID  =  T2.Player_ID JOIN game AS T3 ON T2.Game_ID  =  T3.Game_ID WHERE T3.Title  =  "Super Mario World"
SELECT DISTINCT T1.Developers FROM game AS T1 JOIN game_player AS T2 ON T1.Game_ID  =  T2.Game_ID JOIN player AS T3 ON T2.Player_ID  =  T3.Player_ID WHERE T3.College  =  "Auburn"
SELECT DISTINCT T1.Developers FROM game AS T1 JOIN game_player AS T2 ON T1.Game_ID  =  T2.Game_ID JOIN player AS T3 ON T2.Player_ID  =  T3.Player_ID WHERE T3.College  =  "Auburn"
SELECT avg(T1.units_sold_millions) FROM game AS T1 JOIN game_player AS T2 ON T1.game_id  =  T2.game_id JOIN player AS T3 ON T2.player_id  =  T3.player_id WHERE T3.position  =  "Guard"
SELECT avg(T1.units_sold_millions) FROM game AS T1 JOIN game_player AS T2 ON T1.game_id  =  T2.game_id JOIN player AS T3 ON T2.player_id  =  T3.player_id WHERE T3.position  =  "Guard"
SELECT T1.Title,  T2.Platform_name FROM game AS T1 JOIN platform AS T2 ON T1.Platform_ID  =  T2.Platform_ID
SELECT T1.Title,  T2.Platform_name FROM game AS T1 JOIN platform AS T2 ON T1.Platform_ID  =  T2.Platform_ID
SELECT T1.Title FROM game AS T1 JOIN platform AS T2 ON T1.Platform_ID  =  T2.Platform_ID WHERE T2.Market_district  =  'Asia' OR T2.Market_district  =  'USA'
SELECT title FROM game AS T1 JOIN platform AS T2 ON T1.platform_id  =  T2.platform_id WHERE T2.market_district  =  'Asia' OR T2.market_district  =  'USA'
SELECT Franchise,  COUNT(*) FROM game GROUP BY Franchise
SELECT Franchise,  COUNT(*) FROM game GROUP BY Franchise
SELECT Franchise FROM game GROUP BY Franchise ORDER BY count(*) DESC LIMIT 1
SELECT Franchise FROM game GROUP BY Franchise ORDER BY count(*) DESC LIMIT 1
SELECT Franchise FROM game GROUP BY Franchise HAVING COUNT(*)  >=  2
SELECT Franchise FROM game GROUP BY Franchise HAVING COUNT(*)  >=  2
SELECT Player_name FROM player EXCEPT SELECT T1.Player_name FROM player AS T1 JOIN game_player AS T2 ON T1.Player_ID  =  T2.Player_ID
SELECT Player_name FROM player EXCEPT SELECT T1.Player_name FROM player AS T1 JOIN game_player AS T2 ON T1.Player_ID  =  T2.Player_ID
SELECT T1.Title FROM game AS T1 JOIN game_player AS T2 ON T1.Game_ID  =  T2.Game_ID JOIN player AS T3 ON T2.Player_ID  =  T3.Player_ID WHERE T3.College  =  "Oklahoma" INTERSECT SELECT T1.Title FROM game AS T1 JOIN game_player AS T2 ON T1.Game_ID  =  T2.Game_ID JOIN player AS T3 ON T2.Player_ID  =  T3.Player_ID WHERE T3.College  =  "Auburn"
SELECT T1.Title FROM game AS T1 JOIN game_player AS T2 ON T1.Game_ID  =  T2.Game_ID JOIN player AS T3 ON T2.Player_ID  =  T3.Player_ID WHERE T3.College  =  'Oklahoma' OR T3.College  =  'Auburn'
SELECT DISTINCT Franchise FROM game
SELECT DISTINCT Franchise FROM game
SELECT title FROM game WHERE game_id NOT IN (SELECT game_id FROM game_player WHERE player_id IN (SELECT player_id FROM player WHERE position  =  'Guard'))
SELECT title FROM game WHERE game_id NOT IN (SELECT game_id FROM game_player WHERE player_id IN (SELECT player_id FROM player WHERE position  =  'Guard'))
SELECT name FROM press ORDER BY Year_Profits_billion DESC
SELECT name FROM press ORDER BY Year_Profits_billion DESC
SELECT name FROM press WHERE YEAR_Profits_billion  >  15 OR Month_Profits_billion  >  1
SELECT name FROM press WHERE Year_Profits_billion  >  15 OR Month_Profits_billion  >  1
SELECT avg(Year_Profits_billion),  max(Year_Profits_billion) FROM press
SELECT max(Year_Profits_billion),  avg(Year_Profits_billion),  Name FROM press GROUP BY Name
SELECT name FROM press ORDER BY month_profits_billion DESC LIMIT 1
SELECT name FROM press ORDER BY month_profits_billion DESC LIMIT 1
SELECT Name FROM press ORDER BY Month_Profits_billion DESC LIMIT 1 UNION SELECT Name FROM press ORDER BY Month_Profits_billion ASC LIMIT 1
SELECT Name FROM press ORDER BY Month_Profits_billion DESC LIMIT 1 UNION SELECT Name FROM press ORDER BY Month_Profits_billion ASC LIMIT 1
SELECT count(*) FROM author WHERE Age  <  30
SELECT count(*) FROM author WHERE Age  <  30
SELECT avg(Age),  Gender FROM author GROUP BY Gender
SELECT gender,  avg(age) FROM author GROUP BY gender
SELECT count(*),  gender FROM author WHERE age  >  30 GROUP BY gender
SELECT count(*),  gender FROM author WHERE age  >  30 GROUP BY gender
SELECT title FROM book ORDER BY release_date DESC
SELECT title FROM book ORDER BY release_date DESC
SELECT count(*),  Book_Series FROM book GROUP BY Book_Series
SELECT Book_Series,  count(*) FROM book GROUP BY Book_Series
SELECT title,  release_date FROM book ORDER BY sale_amount DESC LIMIT 5
SELECT title,  release_date FROM book ORDER BY sale_amount DESC LIMIT 5
SELECT Book_Series FROM book WHERE Sale_Amount  >  1000 INTERSECT SELECT Book_Series FROM book WHERE Sale_Amount  <  500
SELECT Book_Series FROM book WHERE Sale_Amount  >  1000 INTERSECT SELECT Book_Series FROM book WHERE Sale_Amount  <  500
SELECT T1.Name FROM author AS T1 JOIN book AS T2 ON T1.Author_ID  =  T2.Author_ID WHERE T2.Book_Series  =  "MM" INTERSECT SELECT T1.Name FROM author AS T1 JOIN book AS T2 ON T1.Author_ID  =  T2.Author_ID WHERE T2.Book_Series  =  "LT"
SELECT T1.Name FROM author AS T1 JOIN book AS T2 ON T1.Author_ID  =  T2.Author_ID WHERE T2.Book_Series  =  "MM" INTERSECT SELECT T1.Name FROM author AS T1 JOIN book AS T2 ON T1.Author_ID  =  T2.Author_ID WHERE T2.Book_Series  =  "LT"
SELECT name,  age FROM author WHERE author_id NOT IN (SELECT author_id FROM book)
SELECT name FROM author WHERE author_id NOT IN (SELECT author_id FROM book)
SELECT T1.Name FROM author AS T1 JOIN book AS T2 ON T1.Author_ID  =  T2.Author_ID GROUP BY T1.Name HAVING COUNT(*)  >  1
SELECT T1.Name FROM author AS T1 JOIN book AS T2 ON T1.Author_ID  =  T2.Author_ID GROUP BY T1.Name HAVING COUNT(*)  >  1
SELECT T1.Title,  T2.Name,  T3.Name FROM book AS T1 JOIN author AS T2 ON T1.Author_ID  =  T2.Author_ID JOIN press AS T3 ON T1.Press_ID  =  T3.Press_ID ORDER BY T1.Sale_Amount DESC LIMIT 3
SELECT T1.Title,  T3.Name,  T4.Name FROM book AS T1 JOIN author AS T2 ON T1.Author_ID  =  T2.Author_ID JOIN press AS T3 ON T1.Press_ID  =  T3.Press_ID JOIN author AS T4 ON T1.Author_ID  =  T4.Author_ID ORDER BY T1.Sale_Amount DESC LIMIT 3
SELECT T1.Name,  sum(T2.Sale_Amount) FROM press AS T1 JOIN book AS T2 ON T1.Press_ID  =  T2.Press_ID GROUP BY T1.Press_ID
SELECT T1.Name,  sum(T2.Sale_Amount) FROM press AS T1 JOIN book AS T2 ON T1.Press_ID  =  T2.Press_ID GROUP BY T1.Press_ID
SELECT T1.Name,  count(*) FROM press AS T1 JOIN book AS T2 ON T1.Press_ID  =  T2.Press_ID WHERE T2.Sale_Amount  >  1000 GROUP BY T1.Press_ID
SELECT T1.Name,  count(*) FROM press AS T1 JOIN book AS T2 ON T1.Press_ID  =  T2.Press_ID WHERE T2.Sale_Amount  >  1000 GROUP BY T1.Press_ID
SELECT T1.Name FROM author AS T1 JOIN book AS T2 ON T1.Author_ID  =  T2.Author_ID ORDER BY T2.Sale_Amount DESC LIMIT 1
SELECT T1.Name FROM author AS T1 JOIN book AS T2 ON T1.Author_ID  =  T2.Author_ID ORDER BY T2.Sale_Amount DESC LIMIT 1
SELECT T1.Name,  T1.Gender FROM author AS T1 JOIN book AS T2 ON T1.Author_ID  =  T2.Author_ID GROUP BY T1.Author_ID ORDER BY count(*) DESC LIMIT 1
SELECT T1.Name,  T1.Gender FROM author AS T1 JOIN book AS T2 ON T1.Author_ID  =  T2.Author_ID GROUP BY T1.Name ORDER BY count(*) DESC LIMIT 1
SELECT Name FROM author EXCEPT SELECT T1.Name FROM author AS T1 JOIN book AS T2 ON T1.Author_ID  =  T2.Author_ID JOIN press AS T3 ON T2.Press_ID  =  T3.Press_ID WHERE T3.Name  =  "Accor"
SELECT Name FROM author WHERE Author_ID NOT IN (SELECT Author_ID FROM book WHERE Press_ID  =  (SELECT Press_ID FROM press WHERE Name  =  "Accor"))
SELECT T2.Name,  T2.Year_Profits_billion FROM book AS T1 JOIN press AS T2 ON T1.Press_ID  =  T2.Press_ID GROUP BY T1.Press_ID HAVING count(*)  >  2
SELECT T1.Name,  T1.Year_Profits_billion FROM press AS T1 JOIN book AS T2 ON T1.Press_ID  =  T2.Press_ID GROUP BY T1.Press_ID HAVING count(*)  >  2
SELECT count(*) FROM Authors
SELECT author_name FROM Authors
SELECT author_name,  other_details FROM Authors
SELECT other_details FROM authors WHERE author_name  =  "Addison Denesik"
SELECT count(*) FROM Documents
SELECT author_name FROM Documents WHERE document_id  =  4
SELECT author_name FROM Documents WHERE document_name  =  "Travel to Brazil"
SELECT count(*) FROM Documents AS T1 JOIN Authors AS T2 ON T1.author_name  =  T2.author_name WHERE T2.author_name  =  "Era Kerluke"
SELECT document_name,  document_description FROM Documents
SELECT document_id,  document_name FROM Documents WHERE author_name  =  "Bianka Cummings"
SELECT author_name,  other_details FROM Documents WHERE document_name  =  "Travel to China"
SELECT author_name,  count(*) FROM Documents GROUP BY author_name
SELECT author_name FROM Documents GROUP BY author_name ORDER BY count(*) DESC LIMIT 1
SELECT author_name FROM Documents GROUP BY author_name HAVING count(*)  >=  2
SELECT count(*) FROM Business_Processes
SELECT next_process_id,  process_name,  process_description FROM Business_Processes WHERE process_id  =  9
SELECT process_name FROM Business_Processes WHERE process_id  =  9
SELECT count(*) FROM Process_Outcomes
SELECT process_outcome_code,  process_outcome_description FROM Process_Outcomes
SELECT process_outcome_description FROM Process_Outcomes WHERE process_outcome_code  =  'Working'
SELECT count(*) FROM Process_Status
SELECT process_status_code,  process_status_description FROM Process_Status
SELECT process_status_description FROM Process_Status WHERE process_status_code  =  'ct'
SELECT count(*) FROM Staff
SELECT staff_id,  staff_details FROM Staff
SELECT staff_details FROM Staff WHERE staff_id  =  100
SELECT count(*) FROM Ref_Staff_Roles
SELECT staff_role_code,  staff_role_description FROM Ref_Staff_Roles
SELECT staff_role_description FROM Ref_Staff_Roles WHERE staff_role_code  =  'HR'
SELECT count(*) FROM Documents WHERE document_id IN (SELECT document_id FROM Documents_Processes)
SELECT process_id FROM Documents_Processes
SELECT document_id FROM Documents EXCEPT SELECT document_id FROM Documents_Processes
SELECT process_id FROM Business_Processes EXCEPT SELECT process_id FROM Documents_Processes
SELECT T1.process_outcome_description,  T2.process_status_description FROM Process_Outcomes AS T1 JOIN Documents_Processes AS T2 ON T1.process_outcome_code  =  T2.process_outcome_code JOIN Documents AS T3 ON T2.document_id  =  T3.document_id WHERE T3.document_id  =  0
SELECT T1.process_name FROM Business_Processes AS T1 JOIN Documents_Processes AS T2 ON T1.process_id  =  T2.process_id JOIN Documents AS T3 ON T2.document_id  =  T3.document_id WHERE T3.document_name  =  "Travel to Brazil"
SELECT process_id,  count(*) FROM Documents_Processes GROUP BY process_id
SELECT count(*) FROM Staff_in_Processes WHERE document_id  =  0 AND process_id  =  9
SELECT T1.staff_id,  count(*) FROM Staff AS T1 JOIN Documents_Processes AS T2 ON T1.staff_id  =  T2.staff_id GROUP BY T1.staff_id
SELECT T1.staff_role_code,  count(*) FROM Ref_Staff_Roles AS T1 JOIN Documents_Processes AS T2 ON T1.staff_role_code  =  T2.staff_role_code GROUP BY T1.staff_role_code
SELECT count(*) FROM Staff_in_processes WHERE staff_id  =  3
SELECT count(*) FROM Agencies
SELECT count(*) FROM Agencies
SELECT agency_id,  agency_details FROM Agencies
SELECT agency_id,  agency_details FROM Agencies
SELECT count(*) FROM Clients
SELECT count(*) FROM Clients
SELECT client_id,  client_details FROM Clients
SELECT client_id,  client_details FROM Clients
SELECT agency_id,  count(*) FROM Clients GROUP BY agency_id
SELECT count(*),  T1.agency_id FROM clients AS T1 JOIN agencies AS T2 ON T1.agency_id  =  T2.agency_id GROUP BY T1.agency_id
SELECT agency_id,  agency_details FROM Clients GROUP BY agency_id ORDER BY count(*) DESC LIMIT 1
SELECT T1.agency_id,  T1.agency_details FROM Agencies AS T1 JOIN Clients AS T2 ON T1.agency_id  =  T2.agency_id GROUP BY T1.agency_id ORDER BY count(*) DESC LIMIT 1
SELECT agency_id,  agency_details FROM Agencies WHERE agency_id IN (SELECT agency_id FROM Clients GROUP BY agency_id HAVING count(*)  >=  2)
SELECT agency_id,  agency_details FROM Agencies WHERE agency_id IN (SELECT agency_id FROM Clients GROUP BY agency_id HAVING count(*)  >=  2)
SELECT T1.agency_details FROM Agencies AS T1 JOIN Clients AS T2 ON T1.agency_id  =  T2.agency_id WHERE T2.client_details  =  'Mac'
SELECT T1.agency_details FROM Agencies AS T1 JOIN Clients AS T2 ON T1.agency_id  =  T2.agency_id WHERE T2.client_details  =  "Mac"
SELECT T1.client_details,  T2.agency_details FROM Clients AS T1 JOIN Agencies AS T2 ON T1.agency_id  =  T2.agency_id
SELECT T1.client_details,  T2.agency_details FROM Clients AS T1 JOIN Agencies AS T2 ON T1.agency_id  =  T2.agency_id
SELECT sic_code,  count(*) FROM Clients GROUP BY sic_code
SELECT sic_code,  count(*) FROM Clients GROUP BY sic_code
SELECT client_id,  client_details FROM Clients WHERE sic_code  =  "Bad"
SELECT client_details FROM clients WHERE sic_code  =  'Bad'
SELECT agency_id,  agency_details FROM Agencies WHERE agency_id IN (SELECT agency_id FROM Clients)
SELECT agency_id,  agency_details FROM Agencies WHERE agency_id IN (SELECT agency_id FROM Clients)
SELECT agency_id FROM agencies EXCEPT SELECT agency_id FROM clients
SELECT agency_id FROM Agencies EXCEPT SELECT agency_id FROM Clients
SELECT count(*) FROM Invoices
SELECT count(*) FROM Invoices
SELECT invoice_id,  invoice_status,  invoice_details FROM Invoices
SELECT invoice_id,  invoice_status,  invoice_details FROM Invoices
SELECT client_id,  count(*) FROM Invoices GROUP BY client_id
SELECT client_id,  count(*) FROM Invoices GROUP BY client_id
SELECT client_id,  client_details FROM Clients WHERE client_id  =  (SELECT client_id FROM Invoices GROUP BY client_id ORDER BY count(*) DESC LIMIT 1)
SELECT client_id,  client_details FROM Clients WHERE client_id  =  (SELECT client_id FROM Invoices GROUP BY client_id ORDER BY count(*) DESC LIMIT 1)
SELECT client_id FROM Invoices GROUP BY client_id HAVING count(*)  >=  2
SELECT client_id FROM Invoices GROUP BY client_id HAVING count(*)  >=  2
SELECT invoice_status,  count(*) FROM Invoices GROUP BY invoice_status
SELECT invoice_status,  count(*) FROM Invoices GROUP BY invoice_status
SELECT invoice_status FROM Invoices GROUP BY invoice_status ORDER BY count(*) DESC LIMIT 1
SELECT invoice_status FROM Invoices GROUP BY invoice_status ORDER BY count(*) DESC LIMIT 1
SELECT T1.invoice_status,  T1.invoice_details,  T2.client_id,  T2.client_details,  T3.agency_id,  T3.agency_details FROM Invoices AS T1 JOIN Clients AS T2 ON T1.client_id  =  T2.client_id JOIN Agencies AS T3 ON T2.agency_id  =  T3.agency_id
SELECT T1.invoice_status,  T1.invoice_details,  T2.client_id,  T2.client_details,  T3.agency_id,  T3.agency_details FROM Invoices AS T1 JOIN Clients AS T2 ON T1.client_id  =  T2.client_id JOIN Agencies AS T3 ON T2.agency_id  =  T3.agency_id
SELECT meeting_type,  meeting_details FROM Meetings
SELECT meeting_type,  other_details FROM Meetings
SELECT meeting_outcome,  purpose_of_meeting FROM Meetings
SELECT meeting_outcome,  purpose_of_meeting FROM Meetings
SELECT payment_id,  payment_details FROM Payments AS T1 JOIN Invoices AS T2 ON T1.invoice_id  =  T2.invoice_id WHERE invoice_status  =  'Working'
SELECT payment_id,  payment_details FROM Payments AS T1 JOIN Invoices AS T2 ON T1.invoice_id  =  T2.invoice_id WHERE invoice_status  =  'Working'
SELECT invoice_id,  invoice_status FROM Invoices WHERE invoice_id NOT IN (SELECT invoice_id FROM Payments)
SELECT invoice_id,  invoice_status FROM Invoices WHERE invoice_id NOT IN (SELECT invoice_id FROM Payments)
SELECT count(*) FROM Payments
SELECT count(*) FROM Payments
SELECT payment_id,  invoice_id,  payment_details FROM Payments
SELECT payment_id,  invoice_id,  payment_details FROM Payments
SELECT invoice_id,  invoice_status FROM Payments
SELECT DISTINCT invoice_id,  invoice_status FROM Payments
SELECT invoice_id,  count(*) FROM Payments GROUP BY invoice_id
SELECT invoice_id,  count(*) FROM Payments GROUP BY invoice_id
SELECT T1.invoice_id,  T1.invoice_status,  T1.invoice_details FROM Invoices AS T1 JOIN Payments AS T2 ON T1.invoice_id  =  T2.invoice_id GROUP BY T1.invoice_id ORDER BY count(*) DESC LIMIT 1
SELECT invoice_id,  invoice_status,  invoice_details FROM Invoices WHERE invoice_id IN (SELECT invoice_id FROM Payments GROUP BY invoice_id ORDER BY count(*) DESC LIMIT 1)
SELECT count(*) FROM Staff
SELECT count(*) FROM Staff
SELECT agency_id,  count(*) FROM Staff GROUP BY agency_id
SELECT agency_id,  count(*) FROM Staff GROUP BY agency_id
SELECT agency_id,  agency_details FROM Agencies GROUP BY agency_id ORDER BY count(*) DESC LIMIT 1
SELECT T1.agency_id,  T1.agency_details FROM Agencies AS T1 JOIN Staff AS T2 ON T1.agency_id  =  T2.agency_id GROUP BY T1.agency_id ORDER BY count(*) DESC LIMIT 1
SELECT meeting_outcome,  count(*) FROM Meetings GROUP BY meeting_outcome
SELECT meeting_outcome,  count(*) FROM Meetings GROUP BY meeting_outcome
SELECT client_id,  count(*) FROM Meetings GROUP BY client_id
SELECT client_id,  count(*) FROM Meetings GROUP BY client_id
SELECT meeting_type,  count(*) FROM Meetings GROUP BY meeting_type
SELECT meeting_type,  count(*) FROM Meetings GROUP BY meeting_type
SELECT meeting_id,  meeting_outcome,  meeting_type,  T2.client_details FROM Meetings AS T1 JOIN Clients AS T2 ON T1.client_id  =  T2.client_id
SELECT meeting_id,  meeting_outcome,  meeting_type,  client_details FROM Meetings
SELECT meeting_id,  count(*) FROM Staff_in_Meetings GROUP BY meeting_id
SELECT meeting_id,  count(*) FROM Staff_in_Meetings GROUP BY meeting_id
SELECT staff_id,  count(*) FROM Staff_in_Meetings GROUP BY staff_id HAVING count(*)  =  (SELECT min(count(*)) FROM Staff_in_Meetings GROUP BY staff_id)
SELECT staff_id FROM Staff_in_Meetings GROUP BY staff_id ORDER BY count(*) ASC LIMIT 1
SELECT count(DISTINCT staff_id) FROM Staff_in_Meetings
SELECT count(DISTINCT staff_id) FROM Staff_in_Meetings
SELECT count(*) FROM Staff WHERE staff_id NOT IN (SELECT staff_id FROM Staff_in_Meetings)
SELECT count(*) FROM Staff WHERE staff_id NOT IN (SELECT staff_id FROM Staff_in_Meetings)
SELECT client_id,  client_details FROM Clients WHERE client_id IN (SELECT client_id FROM Meetings UNION SELECT client_id FROM Invoices)
SELECT client_id,  client_details FROM Clients WHERE client_id IN (SELECT client_id FROM Meetings UNION SELECT client_id FROM Invoices)
SELECT staff_id,  staff_details FROM Staff WHERE staff_id IN (SELECT staff_id FROM Staff_in_Meetings GROUP BY staff_id HAVING count(*)  >=  1) AND staff_details LIKE '%s%'
SELECT staff_id,  staff_details FROM Staff WHERE staff_id IN (SELECT staff_id FROM Staff_in_Meetings) AND staff_details LIKE "%s%"
SELECT T1.client_id,  T1.sic_code,  T1.agency_id FROM Clients AS T1 JOIN Meetings AS T2 ON T1.client_id  =  T2.client_id WHERE T2.meeting_id  =  1 INTERSECT SELECT T1.client_id,  T1.sic_code,  T1.agency_id FROM Clients AS T1 JOIN Invoices AS T2 ON T1.client_id  =  T2.client_id
SELECT T1.client_id,  T1.sic_code,  T1.agency_id FROM Clients AS T1 JOIN Meetings AS T2 ON T1.client_id  =  T2.client_id WHERE T2.meeting_id IN (SELECT meeting_id FROM Meetings GROUP BY meeting_id HAVING count(*)  =  1) INTERSECT SELECT T1.client_id,  T1.sic_code,  T1.agency_id FROM Clients AS T1 JOIN Invoices AS T2 ON T1.client_id  =  T2.client_id
SELECT T1.start_date_time,  T1.end_date_time,  T2.client_details,  T3.staff_details FROM Meetings AS T1 JOIN Clients AS T2 ON T1.client_id  =  T2.client_id JOIN Staff AS T3 ON T1.staff_id  =  T3.staff_id
SELECT T1.start_date_time,  T1.end_date_time,  T2.staff_details,  T3.client_details FROM Meetings AS T1 JOIN Staff AS T2 ON T1.meeting_id  =  T2.staff_id JOIN Clients AS T3 ON T1.client_id  =  T3.client_id
