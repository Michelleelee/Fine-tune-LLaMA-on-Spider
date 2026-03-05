SELECT COUNT(Club_ID) FROM club
SELECT COUNT(Club_ID) FROM club
SELECT Name FROM club ORDER BY Name ASC
SELECT Name FROM club ORDER BY Name ASC
SELECT Manager, Captain FROM club
SELECT Manager, Captain FROM club
SELECT Name FROM club WHERE Manufacturer!= 'Nike'
SELECT Name FROM club WHERE Manufacturer!= 'Nike'
SELECT Name FROM player ORDER BY Wins_count ASC
SELECT Name FROM player ORDER BY Wins_count ASC
SELECT Name FROM player ORDER BY Earnings DESC LIMIT 1
SELECT Name FROM player ORDER BY Earnings DESC LIMIT 1
SELECT DISTINCT Country FROM player WHERE Earnings > 1200000
SELECT Country FROM player WHERE Earnings > 1200000
SELECT T2.Country FROM player AS T1 INNER JOIN club AS T2 ON T1.Club_ID = T2.Club_ID WHERE T1.Wins_count > 2 ORDER BY T1.Earnings DESC LIMIT 1
SELECT T2.Country FROM player AS T1 INNER JOIN club AS T2 ON T1.Club_ID = T2.Club_ID WHERE T1.Wins_count > 2 ORDER BY T1.Earnings DESC LIMIT 1
SELECT T1.Name, T2.Name FROM player AS T1 INNER JOIN club AS T2 ON T1.Club_ID = T2.Club_ID
SELECT T1.Name, T2.Name FROM club AS T1 INNER JOIN player AS T2 ON T1.Club_ID = T2.Club_ID
SELECT T1.Name FROM club AS T1 INNER JOIN player AS T2 ON T1.Club_ID = T2.Club_ID GROUP BY T2.Club_ID HAVING SUM(T2.Wins_count) > 2
SELECT T1.Name FROM club AS T1 INNER JOIN player AS T2 ON T1.Club_ID = T2.Club_ID GROUP BY T2.Club_ID HAVING SUM(T2.Wins_count) > 2
SELECT T2.Name
SELECT T2.Name FROM club AS T1 INNER JOIN player AS T2 ON T1.Club_ID = T2.Club_ID WHERE T1.Manager = 'Sam Allardyce'
SELECT T1.Name FROM club AS T1 INNER JOIN player AS T2 ON T1.Club_ID = T2.Club_ID GROUP BY T1.Club_ID ORDER BY AVG(T2.Earnings) DESC
SELECT Name FROM club ORDER BY ( SELECT AVG(Earnings) FROM player WHERE Club_ID = club.Club_ID ) DESC
SELECT Manufacturer, COUNT(Club_ID) FROM club GROUP BY Manufacturer
SELECT Manufacturer, COUNT(*) FROM club GROUP BY Manufacturer
SELECT Manufacturer FROM club GROUP BY Manufacturer ORDER BY COUNT(Manufacturer) DESC LIMIT 1
SELECT Manufacturer FROM club GROUP BY Manufacturer ORDER BY COUNT(Manufacturer) DESC LIMIT 1
SELECT Manufacturer FROM club GROUP BY Manufacturer HAVING COUNT(Club_ID) > 1
SELECT Manufacturer FROM club GROUP BY Manufacturer HAVING COUNT(Club_ID) > 1
SELECT Country FROM player GROUP BY Country HAVING COUNT(Country) > 1
SELECT Country FROM player GROUP BY Country HAVING COUNT(Country) > 1
SELECT Name FROM club WHERE Club_ID NOT IN (SELECT Club_ID FROM player)
SELECT Name FROM club WHERE Club_ID NOT IN (SELECT Club_ID FROM player)
SELECT Country FROM player WHERE Earnings > 1400000 OR Earnings < 1100000
SELECT Country FROM player WHERE Earnings > 1400000 INTERSECT SELECT Country FROM player WHERE Earnings < 1100000
SELECT COUNT(DISTINCT Country) FROM player
SELECT COUNT(DISTINCT Country) FROM player
SELECT Earnings FROM player WHERE Country = 'Australia' OR Country = 'Zimbabwe'
SELECT Earnings FROM player WHERE Country = 'Australia' OR Country = 'Zimbabwe'
SELECT C.customer_id, C.customer_first_name, C.customer_last_name
SELECT T1.customer_id, T1.customer_first_name, T1.customer_last_name
SELECT T1.order_id, T1.order_status_code, COUNT(T2.order_item_id) FROM Orders AS T1 INNER JOIN Order_Items AS T2 ON T1.order_id = T2.order_id GROUP BY T1.order_id
SELECT COUNT(T1.order_item_id) AS num_products, T2.order_status_code, T2.order_id
SELECT date_order_placed FROM Orders WHERE order_id IN ( SELECT order_id FROM Order_Items GROUP BY order_id HAVING COUNT(order_item_id) > 1 )
SELECT MIN(T1.date_order_placed) AS earliest_order_date, T1.date_order_placed
SELECT customer_first_name, customer_middle_initial, customer_last_name FROM Customers WHERE customer_id NOT IN (SELECT customer_id FROM Orders)
SELECT customer_first_name, customer_middle_initial, customer_last_name FROM Customers WHERE customer_id NOT IN (SELECT customer_id FROM Orders)
SELECT product_id, product_name, product_price, product_color
SELECT T1.product_id, T1.product_name, T1.product_price, T1.product_color
SELECT T1.order_id, T1.date_order_placed
SELECT T1.order_id, T1.date_order_placed
SELECT T1.product_id, T1.product_name, T1.product_price
SELECT T1.product_id, T1.product_name, T1.product_price
SELECT T1.order_id, SUM(T2.product_price) FROM Orders AS T1 INNER JOIN Order_Items AS T2 ON T1.order_id = T2.order_id GROUP BY T1.order_id ORDER BY SUM(T2.product_price) ASC LIMIT 1
SELECT T1.order_id, SUM(T1.product_price) AS total_cost
SELECT payment_method_code FROM Customer_Payment_Methods GROUP BY payment_method_code ORDER BY COUNT(customer_id) DESC LIMIT 1
SELECT payment_method_code FROM Customer_Payment_Methods GROUP BY customer_id ORDER BY COUNT(customer_id) DESC LIMIT 1
SELECT T1.gender_code, COUNT(T2.order_id) FROM Customers AS T1 INNER JOIN Orders AS T2 ON T1.customer_id = T2.customer_id GROUP BY T1.gender_code
SELECT T1.gender_code, COUNT(T2.product_id) FROM Customers AS T1 INNER JOIN Orders AS T3 ON T1.customer_id = T3.customer_id INNER JOIN Order_Items AS T2 ON T3.order_id = T2.order_id GROUP BY T1.gender_code
SELECT T1.gender_code, COUNT(T2.order_id) FROM Customers AS T1 INNER JOIN Orders AS T2 ON T1.customer_id = T2.customer_id GROUP BY T1.gender_code
SELECT T1.gender_code, COUNT(T2.order_id) FROM Customers AS T1 INNER JOIN Orders AS T2 ON T1.customer_id = T2.customer_id GROUP BY T1.gender_code
SELECT C.customer_first_name, C.customer_middle_initial, C.customer_last_name, PM.payment_method_code
SELECT T1.customer_first_name, T1.customer_middle_initial, T1.customer_last_name, T2.payment_method_code
SELECT T1.invoice_status_code, T1.invoice_date, T3.shipment_date
SELECT invoice_status_code, invoice_date, shipment_date FROM Invoices LEFT JOIN Shipments ON Invoices.invoice_number = Shipments.invoice_number
SELECT T1.product_name, T2.shipment_date
SELECT T1.product_name, T2.shipment_date
SELECT T1.order_item_status_code, T2.shipment_tracking_number
SELECT T1.order_item_status_code, T2.shipment_tracking_number
SELECT T1.product_name, T1.product_color
SELECT T1.product_name, T1.product_color
SELECT DISTINCT T1.product_name, T1.product_price, T1.product_description
SELECT DISTINCT T1.product_name, T1.product_price, T1.product_description
SELECT T1.invoice_status_code
SELECT T1.invoice_status_code
SELECT O.order_id, O.date_order_placed, SUM(P.product_price) AS total_cost
SELECT o.order_id, o.date_order_placed, SUM(p.product_price) AS total_amount_paid
SELECT COUNT(DISTINCT T1.customer_id) FROM Customers AS T1 INNER JOIN Orders AS T2 ON T1.customer_id = T2.customer_id
SELECT COUNT(DISTINCT customer_id) FROM Orders
SELECT COUNT(DISTINCT order_item_status_code) FROM Order_Items
SELECT COUNT(DISTINCT order_item_status_code) FROM Order_Items
SELECT COUNT(DISTINCT payment_method_code) FROM Customer_Payment_Methods
SELECT COUNT(DISTINCT payment_method_code) FROM Customer_Payment_Methods
SELECT login_name, login_password FROM Customers WHERE phone_number LIKE '+12%'
SELECT login_name, login_password FROM Customers WHERE phone_number LIKE '+12%'
SELECT product_size FROM Products WHERE product_name LIKE '%Dell%'
SELECT product_size FROM Products WHERE product_name LIKE '%Dell%'
SELECT product_price, product_size FROM Products WHERE product_price > ( SELECT AVG(product_price) FROM Products )
SELECT product_price, product_size FROM Products WHERE product_price > ( SELECT AVG(product_price) FROM Products )
SELECT COUNT(DISTINCT product_id) FROM Order_Items WHERE order_item_id IS NULL
SELECT COUNT(*) FROM Products WHERE product_id NOT IN (SELECT product_id FROM Order_Items)
SELECT COUNT(customer_id) FROM Customer_Payment_Methods WHERE customer_id IS NULL
SELECT COUNT(customer_id) FROM Customers WHERE customer_id NOT IN (SELECT customer_id FROM Customer_Payment_Methods)
SELECT order_status_code, date_order_placed FROM Orders
SELECT order_status_code, date_order_placed FROM Orders
SELECT address_line_1, town_city, county FROM Customers WHERE country = 'USA'
SELECT address_line_1, town_city, county FROM Customers WHERE country = 'United States'
SELECT T1.customer_first_name, T3.product_name
SELECT T1.customer_first_name, T3.product_name
SELECT COUNT(*) FROM Shipments
SELECT COUNT(DISTINCT oi.product_id)
SELECT AVG(product_price) FROM Products
SELECT AVG(product_price) FROM Products
SELECT AVG(T2.product_price)
SELECT AVG(T1.product_price)
SELECT T1.email_address, T1.town_city, T1.county
SELECT T1.email_address, T1.town_city, T1.county
SELECT T1.date_order_placed
SELECT T1.date_order_placed
SELECT order_status_code FROM Orders GROUP BY order_status_code ORDER BY COUNT(order_status_code) ASC LIMIT 1
SELECT order_status_code FROM Orders GROUP BY order_status_code ORDER BY COUNT(order_status_code) ASC LIMIT 1
SELECT T1.product_id, T1.product_description
SELECT T1.product_id, T1.product_description
SELECT T1.invoice_date, T1.invoice_number
SELECT T1.invoice_date, T1.invoice_number
SELECT shipment_tracking_number, shipment_date FROM Shipments
SELECT shipment_tracking_number, shipment_date FROM Shipments
SELECT product_color, product_description, product_size FROM Products WHERE product_price < ( SELECT MAX(product_price) FROM Products )
SELECT product_color, product_description, product_size FROM Products WHERE product_price < ( SELECT MAX(product_price) FROM Products )
SELECT Name FROM director WHERE Age > ( SELECT AVG(Age) FROM director )
SELECT Name FROM director ORDER BY Age DESC LIMIT 1
SELECT COUNT(*) FROM channel WHERE Internet LIKE '%bbc%'
SELECT COUNT(DISTINCT Digital_terrestrial_channel) FROM channel
SELECT Title FROM program ORDER BY Start_Year DESC
SELECT Name FROM director WHERE Director_ID IN ( SELECT Director_ID FROM program GROUP BY Director_ID ORDER BY COUNT(Director_ID) DESC LIMIT 1 )
SELECT T1.Name, T1.Age FROM director AS T1 INNER JOIN program AS T2 ON T1.Director_ID = T2.Director_ID GROUP BY T1.Director_ID ORDER BY COUNT(T2.Program_ID) DESC LIMIT 1
SELECT Title FROM program WHERE Start_Year = ( SELECT MAX(Start_Year ) FROM program )
SELECT T1.Name, T1.Internet FROM channel AS T1 INNER JOIN program AS T2 ON T1.Channel_ID = T2.Channel_ID GROUP BY T1.Channel_ID HAVING COUNT(T2.Program_ID) > 1
SELECT T1.Name, COUNT(T2.Program_ID) FROM channel AS T1 INNER JOIN program AS T2 ON T1.Channel_ID = T2.Channel_ID GROUP BY T1.Channel_ID
SELECT COUNT(DISTINCT Channel_ID) FROM program WHERE Channel_ID NOT IN (SELECT Channel_ID FROM program)
SELECT T2.Name FROM program AS T1 INNER JOIN director AS T2 ON T1.Director_ID = T2.Director_ID WHERE T1.Title = 'Dracula'
SELECT T1.Name, T1.Internet
SELECT Name FROM director WHERE Age BETWEEN 30 AND 60
SELECT T1.Name FROM channel AS T1 INNER JOIN director_admin AS T2 ON T1.Channel_ID = T2.Channel_ID INNER JOIN director AS T3 ON T2.Director_ID = T3.Director_ID WHERE T3.Age < 40 INTERSECT SELECT T1.Name FROM channel AS T1 INNER JOIN director_admin AS T2 ON T1.Channel_ID = T2.Channel_ID INNER JOIN director AS T3 ON T2.Director_ID = T3.Director_ID WHERE T3.Age > 60
SELECT Channel_ID, Name FROM channel WHERE Channel_ID NOT IN ( SELECT Channel_ID FROM director_admin WHERE Director_ID = ( SELECT Director_ID FROM director WHERE Name = 'Hank Baskett' ) );
SELECT COUNT(*) FROM radio
SELECT Transmitter FROM radio ORDER BY ERP_kW ASC
SELECT tv_show_name, Original_Airdate FROM tv_show
SELECT Station_name FROM city_channel WHERE Affiliation!= 'ABC'
SELECT Transmitter FROM radio WHERE ERP_kW > 150 OR ERP_kW < 30
SELECT Transmitter FROM radio ORDER BY ERP_kW DESC LIMIT 1
SELECT AVG(ERP_kW) FROM radio
SELECT Affiliation, COUNT(*) FROM city_channel GROUP BY Affiliation
SELECT Affiliation FROM city_channel GROUP BY Affiliation ORDER BY COUNT(Affiliation) DESC LIMIT 1
SELECT Affiliation FROM city_channel GROUP BY Affiliation HAVING COUNT(City) > 3
SELECT City, Station_name FROM city_channel ORDER BY Station_name ASC
SELECT T1.Transmitter, T3.City
SELECT T1.Transmitter, T3.Station_name
SELECT T1.Transmitter, COUNT(T2.City_channel_ID) FROM radio AS T1 INNER JOIN city_channel_radio AS T2 ON T1.Radio_ID = T2.Radio_ID GROUP BY T1.Transmitter
SELECT DISTINCT Transmitter FROM radio WHERE Radio_ID NOT IN (SELECT Radio_ID FROM city_channel_radio)
SELECT T1.Model FROM vehicle AS T1 INNER JOIN vehicle_driver AS T2 ON T1.Vehicle_ID = T2.Vehicle_ID WHERE T1.Power > 6000 ORDER BY T1.Top_Speed DESC LIMIT 1
SELECT Model FROM vehicle WHERE Power > 6000 ORDER BY Top_Speed DESC LIMIT 1
SELECT Name FROM driver WHERE Citizenship = 'United States'
SELECT Name FROM driver WHERE Citizenship = 'United States'
SELECT MAX(COUNT(Driver_ID)), Driver_ID FROM vehicle_driver GROUP BY Driver_ID
SELECT Driver_ID, COUNT(Vehicle_ID) FROM vehicle_driver GROUP BY Driver_ID ORDER BY COUNT(Vehicle_ID) DESC LIMIT 1
SELECT MAX(Power), AVG(Power) FROM vehicle WHERE Builder = 'Zhuzhou'
SELECT MAX(Power), AVG(Power) FROM vehicle WHERE Builder = 'Zhuzhou'
SELECT T1.Vehicle_ID FROM vehicle_driver AS T1 INNER JOIN ( SELECT Driver_ID, COUNT(Vehicle_ID) AS cnt FROM vehicle_driver GROUP BY Driver_ID ORDER BY cnt LIMIT 1 ) AS T2 ON T1.Driver_ID = T2.Driver_ID ORDER BY T1.Vehicle_ID LIMIT 1
SELECT Vehicle_ID FROM vehicle_driver GROUP BY Vehicle_ID ORDER BY COUNT(Driver_ID) ASC LIMIT 1
SELECT Top_Speed, Power FROM vehicle WHERE Build_Year = 1996
SELECT Top_Speed, Power FROM vehicle WHERE Build_Year = 1996
SELECT Build_Year, Model, Builder FROM vehicle
SELECT Build_Year, Model, Builder FROM vehicle
SELECT COUNT(DISTINCT T1.Driver_ID) FROM vehicle_driver AS T1 INNER JOIN vehicle AS T2 ON T1.Vehicle_ID = T2.Vehicle_ID WHERE T2.Build_Year = 2012
SELECT COUNT(DISTINCT Driver_ID) FROM vehicle_driver AS T1 INNER JOIN vehicle AS T2 ON T1.Vehicle_ID = T2.Vehicle_ID WHERE T2.Build_Year = 2012
SELECT COUNT(Driver_ID) FROM driver WHERE Racing_Series = 'NASCAR'
SELECT COUNT(DISTINCT Driver_ID) FROM driver WHERE Racing_Series = 'NASCAR'
SELECT AVG(Top_Speed) FROM vehicle
SELECT AVG(Top_Speed) FROM vehicle
SELECT DISTINCT T1.Name FROM driver AS T1 INNER JOIN vehicle_driver AS T2 ON T1.Driver_ID = T2.Driver_ID INNER JOIN vehicle AS T3 ON T2.Vehicle_ID = T3.Vehicle_ID WHERE T3.Power > 5000
SELECT T2.Name FROM vehicle_driver AS T1 INNER JOIN driver AS T2 ON T1.Driver_ID = T2.Driver_ID INNER JOIN vehicle AS T3 ON T1.Vehicle_ID = T3.Vehicle_ID WHERE T3.Power > 5000
SELECT Model FROM vehicle WHERE Total_Production > 100 OR Top_Speed > 150
SELECT Model FROM vehicle WHERE Total_Production > 100 OR Top_Speed > 150
SELECT Model, Build_Year FROM vehicle WHERE Model LIKE '%DJ%'
SELECT Model, Build_Year FROM vehicle WHERE Model LIKE '%DJ%'
SELECT Model FROM vehicle WHERE Vehicle_ID NOT IN (SELECT Vehicle_ID FROM vehicle_driver)
SELECT Model FROM vehicle WHERE Vehicle_ID NOT IN (SELECT Vehicle_ID FROM vehicle_driver)
SELECT T1.Vehicle_ID, T1.Model
SELECT T1.Vehicle_ID, T1.Model
SELECT Vehicle_ID, Model
SELECT T1.Vehicle_ID, T1.Model
SELECT COUNT(*) FROM vehicle WHERE Top_Speed = ( SELECT MAX(Top_Speed) FROM vehicle )
SELECT COUNT(*) FROM vehicle WHERE Top_Speed = ( SELECT MAX(Top_Speed) FROM vehicle )
SELECT Name FROM driver ORDER BY Name ASC
SELECT Name FROM driver ORDER BY Name ASC
SELECT Racing_Series, COUNT(Driver_ID) FROM driver GROUP BY Racing_Series
SELECT Racing_Series, COUNT(Driver_ID) FROM driver GROUP BY Racing_Series
SELECT T2.Name, T2.Citizenship
SELECT T2.Name, T2.Citizenship
SELECT COUNT(Driver_ID) FROM driver WHERE Driver_ID NOT IN (SELECT Driver_ID FROM vehicle_driver)
SELECT COUNT(Driver_ID) FROM driver WHERE Driver_ID NOT IN (SELECT Driver_ID FROM vehicle_driver)
SELECT COUNT(Exam_ID) FROM Exams
SELECT COUNT(Exam_ID) FROM Exams
SELECT DISTINCT Subject_Code FROM Exams ORDER BY Subject_Code ASC
SELECT DISTINCT Subject_Code FROM Exams ORDER BY Subject_Code
SELECT Exam_Name, Exam_Date FROM Exams WHERE Subject_Code!= 'Database'
SELECT Exam_Date, Exam_Name FROM Exams WHERE Subject_Code!= 'Database'
SELECT Exam_Date FROM Exams WHERE Subject_Code LIKE '%data%' ORDER BY Exam_Date DESC
SELECT Exam_Date FROM Exams WHERE Subject_Code LIKE '%data%' ORDER BY Exam_Date DESC
SELECT Type_of_Question_Code, COUNT(*) FROM Questions GROUP BY Type_of_Question_Code
SELECT Type_of_Question_Code, COUNT(Question_ID) FROM Questions GROUP BY Type_of_Question_Code
SELECT DISTINCT Student_Answer_Text FROM Student_Answers WHERE Comments = 'Normal'
SELECT DISTINCT T1.Student_Answer_Text
SELECT COUNT(DISTINCT Comments) FROM Student_Answers
SELECT COUNT(DISTINCT Comments) FROM Student_Answers
SELECT Student_Answer_Text FROM Student_Answers GROUP BY Student_Answer_Text ORDER BY COUNT(Student_Answer_Text) DESC
SELECT Student_Answer_Text FROM Student_Answers GROUP BY Student_Answer_Text ORDER BY COUNT(Student_Answer_Text) DESC
SELECT T1.First_Name, T2.Date_of_Answer
SELECT T1.First_Name, T1.Date_of_Answer
SELECT Email_Adress, Date_of_Answer FROM Student_Answers ORDER BY Date_of_Answer DESC
SELECT T1.Email_Adress, T2.Date_of_Answer
SELECT Student_Answer_Text FROM Student_Answers GROUP BY Student_Answer_Text ORDER BY COUNT(Student_Answer_Text) ASC LIMIT 1
SELECT Student_Answer_ID FROM Student_Answers GROUP BY Student_Answer_ID ORDER BY COUNT(Student_Answer_ID) ASC LIMIT 1
SELECT T1.First_Name FROM Students AS T1 INNER JOIN Student_Answers AS T2 ON T1.Student_ID = T2.Student_ID GROUP BY T1.Student_ID HAVING COUNT(T2.Student_ID) >= 2
SELECT T1.First_Name FROM Students AS T1 INNER JOIN Student_Answers AS T2 ON T1.Student_ID = T2.Student_ID GROUP BY T1.Student_ID HAVING COUNT(T2.Student_ID) >= 2
SELECT Valid_Answer_Text FROM Valid_Answers GROUP BY Valid_Answer_Text ORDER BY COUNT(*) DESC LIMIT 1
SELECT Valid_Answer_Text FROM Valid_Answers GROUP BY Valid_Answer_Text ORDER BY COUNT(Valid_Answer_ID) DESC LIMIT 1
SELECT Last_Name FROM Students WHERE Gender_MFU!= 'M'
SELECT Last_Name FROM Students WHERE Gender_MFU!= 'M'
SELECT Gender_MFU, COUNT(*) FROM Students GROUP BY Gender_MFU
SELECT Gender_MFU, COUNT(*) FROM Students GROUP BY Gender_MFU
SELECT Last_Name FROM Students WHERE Gender_MFU IN ('F', 'M')
SELECT Last_Name FROM Students WHERE Gender_MFU IN ('F', 'M')
SELECT T1.First_Name
SELECT T1.First_Name FROM Students AS T1 INNER JOIN Student_Answers AS T2 ON T1.Student_ID = T2.Student_ID WHERE T2.Student_Answer_ID IS NULL
SELECT Student_Answer_Text FROM Student_Answers WHERE Comments = 'Normal' INTERSECT SELECT Student_Answer_Text FROM Student_Answers WHERE Comments = 'Absent'
SELECT Student_Answer_Text FROM Student_Answers WHERE Comments = 'Normal' INTERSECT SELECT Student_Answer_Text FROM Student_Answers WHERE Comments = 'Absent'
SELECT DISTINCT T1.Type_of_Question_Code
SELECT Type_of_Question_Code FROM Questions GROUP BY Type_of_Question_Code HAVING COUNT(Question_ID) >= 3
SELECT Student_ID, First_Name, Middle_Name, Last_Name, Gender_MFU, Student_Address, Email_Adress, Cell_Mobile_Phone, Home_Phone FROM Students
SELECT Student_ID, First_Name, Middle_Name, Last_Name, Gender_MFU, Student_Address, Email_Adress, Cell_Mobile_Phone, Home_Phone FROM Students
SELECT COUNT(*) FROM Addresses
SELECT COUNT(*) FROM Addresses
SELECT address_id, address_details FROM Addresses
SELECT address_id, address_details FROM Addresses
SELECT COUNT(*) FROM Products
SELECT COUNT(*) FROM Products
SELECT product_id, product_type_code, product_name FROM Products
SELECT product_id, product_type_code, product_name FROM Products
SELECT product_price FROM Products WHERE product_name = 'Monitor'
SELECT product_price FROM Products WHERE product_name = 'Monitor'
SELECT MIN(product_price),  AVG(product_price),  MAX(product_price) FROM Products
SELECT MIN(product_price) AS min_price, AVG(product_price) AS avg_price, MAX(product_price) AS max_price FROM Products
SELECT AVG(product_price) FROM Products WHERE product_type_code = 'Clothes'
SELECT AVG(product_price) FROM Products WHERE product_type_code = 'Clothes'
SELECT COUNT(*) FROM Products WHERE product_type_code = 'Hardware'
SELECT COUNT(*) FROM Products WHERE product_type_code = 'Hardware'
SELECT product_name FROM Products WHERE product_price > ( SELECT AVG(product_price) FROM Products )
SELECT product_name FROM Products WHERE product_price > ( SELECT AVG(product_price) FROM Products )
SELECT product_name FROM Products WHERE product_price > ( SELECT AVG(product_price) FROM Products WHERE product_type_code = 'H' ) AND product_type_code = 'H'
SELECT product_name FROM Products WHERE product_type_code = 'Hardware' AND product_price > ( SELECT AVG(product_price) FROM Products WHERE product_type_code = 'Hardware' )
SELECT product_name FROM Products WHERE product_price = ( SELECT MAX(product_price) FROM Products WHERE product_type_code = 'Clothes' )
SELECT T2.product_name FROM Products AS T1 INNER JOIN Customer_Orders AS T3 ON T1.product_id = T3.order_id INNER JOIN Order_Items AS T4 ON T3.order_id = T4.order_id INNER JOIN Addresses AS T5 ON T3.customer_id = T5.address_id INNER JOIN Customers AS T6 ON T5.address_id = T6.address_id INNER JOIN Order_Items AS T7 ON T3.order_id = T7.order_id WHERE T1.product_type_code = 'Clothes' ORDER BY T1.product_price DESC LIMIT 1
SELECT product_id, product_name FROM Products WHERE product_price = ( SELECT MIN(product_price) FROM Products WHERE product_type_code = 'Hardware' )
SELECT product_id, product_name FROM Products WHERE product_price = ( SELECT MIN(product_price) FROM Products WHERE product_type_code = 'Hardware' ) AND product_type_code = 'Hardware'
SELECT product_name FROM Products ORDER BY product_price DESC
SELECT product_name FROM Products ORDER BY product_price DESC
SELECT product_name FROM Products WHERE product_type_code = 'Hardware' ORDER BY product_price ASC
SELECT product_name FROM Products WHERE product_type_code = 'Hardware' ORDER BY product_price ASC
SELECT product_type_code, COUNT(product_id) FROM Products GROUP BY product_type_code
SELECT product_type_code, COUNT(product_id) FROM Products GROUP BY product_type_code
SELECT product_type_code, AVG(product_price) FROM Products GROUP BY product_type_code
SELECT product_type_code, AVG(product_price) FROM Products GROUP BY product_type_code
SELECT product_type_code FROM Products GROUP BY product_type_code HAVING COUNT(product_id) >= 2
SELECT product_type_code FROM Products GROUP BY product_type_code HAVING COUNT(product_id) >= 2
SELECT product_type_code FROM Products GROUP BY product_type_code ORDER BY COUNT(product_id) DESC LIMIT 1
SELECT product_type_code FROM Products GROUP BY product_type_code ORDER BY COUNT(product_type_code) DESC LIMIT 1
SELECT COUNT(customer_id) FROM Customers
SELECT COUNT(customer_id) FROM Customers
SELECT customer_id, customer_name FROM Customers
SELECT customer_id, customer_name FROM Customers
SELECT customer_address, customer_phone, customer_email FROM Customers WHERE customer_name = 'Jeromy'
SELECT T1.address_details, T1.customer_phone, T1.customer_email
SELECT payment_method_code, COUNT(*) FROM Customers GROUP BY payment_method_code
SELECT payment_method_code, COUNT(*) FROM Customers GROUP BY payment_method_code
SELECT payment_method_code FROM Customers GROUP BY payment_method_code ORDER BY COUNT(customer_id) DESC LIMIT 1
SELECT payment_method_code FROM Customers GROUP BY payment_method_code ORDER BY COUNT(customer_id) DESC LIMIT 1
SELECT T1.customer_name FROM Customers AS T1 INNER JOIN ( SELECT payment_method_code, COUNT(*) AS num FROM Customers GROUP BY payment_method_code ORDER BY num LIMIT 1 ) AS T2 ON T1.payment_method_code = T2.payment_method_code
SELECT customer_name FROM Customers GROUP BY payment_method_code ORDER BY COUNT(payment_method_code) ASC LIMIT 1
SELECT payment_method_code, customer_number FROM Customers WHERE customer_name = 'Jeromy'
SELECT payment_method_code, customer_number FROM Customers WHERE customer_name = 'Jeromy'
SELECT DISTINCT payment_method_code FROM Customers
SELECT DISTINCT payment_method_code FROM Customers
SELECT product_id, product_type_code FROM Products ORDER BY product_name
SELECT product_id, product_type_code FROM Products ORDER BY product_name ASC
SELECT product_type_code FROM Products GROUP BY product_type_code ORDER BY COUNT(product_id) ASC LIMIT 1
SELECT product_type_code FROM Products GROUP BY product_type_code ORDER BY COUNT(product_type_code) ASC LIMIT 1
SELECT COUNT(order_id) FROM Customer_Orders
SELECT COUNT(order_id) FROM Customer_Orders
SELECT T1.order_id, T1.order_date, T1.order_status_code
SELECT T1.order_id, T1.order_date, T1.order_status_code
SELECT customer_name, customer_id, COUNT(order_id) FROM Customer_Orders GROUP BY customer_id
SELECT customer_name, customer_id, COUNT(order_id) FROM Customer_Orders GROUP BY customer_id
SELECT T1.customer_id, T1.customer_name, T1.customer_phone, T1.customer_email
SELECT T1.customer_id, T1.customer_name, T1.customer_phone, T1.customer_email
SELECT order_status_code, COUNT(order_id) FROM Customer_Orders GROUP BY order_status_code
SELECT order_status_code, COUNT(order_id) FROM Customer_Orders GROUP BY order_status_code
SELECT order_status_code FROM Customer_Orders GROUP BY order_status_code ORDER BY COUNT(order_status_code) DESC LIMIT 1
SELECT order_status_code FROM Customer_Orders GROUP BY order_status_code ORDER BY COUNT(order_status_code) DESC LIMIT 1
SELECT COUNT(customer_id) FROM Customers WHERE customer_id NOT IN (SELECT customer_id FROM Customer_Orders)
SELECT COUNT(DISTINCT customer_id) FROM Customers WHERE customer_id NOT IN (SELECT customer_id FROM Customer_Orders)
SELECT T1.product_name
SELECT product_name FROM Products WHERE product_id NOT IN (SELECT product_id FROM Order_Items)
SELECT COUNT(T1.order_item_id)
SELECT SUM(T2.order_quantity) FROM Products AS T1 INNER JOIN Order_Items AS T2 ON T1.product_id = T2.product_id WHERE T1.product_type_code = 'Monitor'
SELECT COUNT(DISTINCT T1.customer_id)
SELECT COUNT(DISTINCT T1.customer_id)
SELECT COUNT(DISTINCT customer_id) FROM Customer_Orders
SELECT COUNT(DISTINCT customer_id) FROM Customer_Orders
SELECT customer_id FROM Customers WHERE customer_id NOT IN (SELECT customer_id FROM Customer_Orders)
SELECT customer_id FROM Customers WHERE customer_id NOT IN (SELECT customer_id FROM Customer_Orders)
SELECT T1.order_date, T1.order_id
SELECT T1.order_id, T1.order_date
SELECT COUNT(Building_ID) FROM building
SELECT COUNT(Building_ID) FROM building
SELECT Name FROM building ORDER BY Number_of_Stories ASC
SELECT Name FROM building ORDER BY Number_of_Stories ASC
SELECT Address FROM building ORDER BY Completed_Year DESC
SELECT Address FROM building ORDER BY Completed_Year DESC
SELECT MAX(Number_of_Stories) FROM building WHERE Completed_Year!= 1980
SELECT MAX(Number_of_Stories) FROM building WHERE Completed_Year!= 1980
SELECT AVG(Population) FROM region
SELECT AVG(Population) FROM region
SELECT Name FROM region ORDER BY Name ASC
SELECT Name FROM region ORDER BY Name ASC
SELECT T2.Capital FROM building AS T1 INNER JOIN region AS T2 ON T1.Region_ID = T2.Region_ID WHERE T2.Area > 10000
SELECT T2.Capital FROM region AS T1 INNER JOIN region_building AS T2 ON T1.Region_ID = T2.Region_ID WHERE T1.Area > 10000
SELECT T2.Capital FROM region AS T1 INNER JOIN region AS T2 ON T1.Region_ID = T2.Region_ID WHERE T1.Population = ( SELECT MAX(Population) FROM region )
SELECT Name, Capital FROM region WHERE Population = ( SELECT MAX(Population) FROM region );
SELECT Name FROM region ORDER BY Area DESC LIMIT 5
SELECT Name FROM region ORDER BY Area DESC LIMIT 5
SELECT T1.Name, T2.Name FROM building AS T1 INNER JOIN region AS T2 ON T1.Region_ID = T2.Region_ID
SELECT T1.Name, T2.Name FROM building AS T1 INNER JOIN region AS T2 ON T1.Region_ID = T2.Region_ID
SELECT T2.Name FROM building AS T1 INNER JOIN region AS T2 ON T1.Region_ID = T2.Region_ID GROUP BY T1.Region_ID HAVING COUNT(T1.Building_ID) > 1
SELECT T2.Name FROM building AS T1 INNER JOIN region AS T2 ON T1.Region_ID = T2.Region_ID GROUP BY T1.Region_ID HAVING COUNT(T1.Building_ID) > 1
SELECT T2.Capital FROM building AS T1 INNER JOIN region AS T2 ON T1.Region_ID = T2.Region_ID GROUP BY T1.Region_ID ORDER BY COUNT(T1.Building_ID) DESC LIMIT 1
SELECT T2.Name, T2.Capital FROM building AS T1 INNER JOIN region AS T2 ON T1.Region_ID = T2.Region_ID GROUP BY T1.Region_ID ORDER BY COUNT(T1.Building_ID) DESC LIMIT 1
SELECT T1.Address, T2.Capital
SELECT T1.Address, T2.Name
SELECT T1.Number_of_Stories
SELECT T1.Number_of_Stories
SELECT Completed_Year, COUNT(Building_ID) FROM building GROUP BY Completed_Year
SELECT Completed_Year, COUNT(Building_ID) FROM building GROUP BY Completed_Year
SELECT Completed_Year FROM building GROUP BY Completed_Year ORDER BY COUNT(Completed_Year) DESC LIMIT 1
SELECT Completed_Year FROM building ORDER BY Completed_Year DESC LIMIT 1
SELECT Name FROM region WHERE Region_ID NOT IN (SELECT Region_ID FROM building)
SELECT Name FROM region WHERE Region_ID NOT IN (SELECT Region_ID FROM building)
SELECT Completed_Year FROM building WHERE Number_of_Stories > 20 INTERSECT SELECT Completed_Year FROM building WHERE Number_of_Stories < 15
SELECT Completed_Year FROM building WHERE Number_of_Stories > 20 INTERSECT SELECT Completed_Year FROM building WHERE Number_of_Stories < 15
SELECT DISTINCT Address FROM building
SELECT DISTINCT Address FROM building
SELECT Completed_Year FROM building ORDER BY Number_of_Stories DESC
SELECT Completed_Year FROM building ORDER BY Number_of_Stories DESC
SELECT Channel_Details FROM Channels ORDER BY Channel_Details ASC
SELECT Channel_Details FROM Channels ORDER BY Channel_Details ASC
SELECT COUNT(Service_ID) FROM Services
SELECT COUNT(Service_ID) FROM Services
SELECT Analytical_Layer_Type_Code FROM Analytical_Layer GROUP BY Analytical_Layer_Type_Code ORDER BY COUNT(Analytical_Layer_Type_Code) DESC LIMIT 1
SELECT Analytical_Layer_Type_Code FROM Analytical_Layer GROUP BY Analytical_Layer_Type_Code ORDER BY COUNT(Analytical_Layer_Type_Code) DESC LIMIT 1
SELECT T1.Service_ID, T1.Service_Details
SELECT T1.Service_Details
SELECT T1.Service_Details
SELECT T1.Service_Details
SELECT T1.Customer_Details FROM Customers AS T1 INNER JOIN Customers_and_Services AS T2 ON T1.Customer_ID = T2.Customer_ID GROUP BY T1.Customer_ID ORDER BY COUNT(T2.Customers_and_Services_ID) DESC LIMIT 1
SELECT T1.Customer_Details FROM Customers AS T1 INNER JOIN Customers_and_Services AS T2 ON T1.Customer_ID = T2.Customer_ID GROUP BY T1.Customer_ID ORDER BY COUNT(T2.Service_ID) DESC LIMIT 1
SELECT T1.Customer_Details FROM Customers AS T1 INNER JOIN Customers_and_Services AS T2 ON T1.Customer_ID = T2.Customer_ID GROUP BY T1.Customer_ID ORDER BY COUNT(T2.Service_ID) DESC LIMIT 1
SELECT T1.Customer_Details FROM Customers AS T1 INNER JOIN Customers_and_Services AS T2 ON T1.Customer_ID = T2.Customer_ID GROUP BY T1.Customer_ID ORDER BY COUNT(T2.Service_ID) DESC LIMIT 1
SELECT T1.Customer_Details FROM Customers AS T1 LEFT JOIN Customers_and_Services AS T2 ON T1.Customer_ID = T2.Customer_ID WHERE T2.Customer_ID IS NULL
SELECT T1.Customer_Details FROM Customers AS T1 LEFT JOIN Customers_and_Services AS T2 ON T1.Customer_ID = T2.Customer_ID WHERE T2.Customer_ID IS NULL
SELECT T1.Customer_Details
SELECT DISTINCT T1.Customer_Details
SELECT COUNT(DISTINCT Customer_Details) FROM Customers
SELECT COUNT(Customer_ID) FROM Customers
SELECT T1.Customer_ID
SELECT Customer_Details FROM Customers WHERE Customer_Details LIKE '%Kutch%'
SELECT T1.Service_Details
SELECT T1.Service_Details
SELECT T1.Service_Details
SELECT T1.Service_Details
SELECT T1.Service_Details
SELECT T1.Service_Details
SELECT T1.Customer_Details
SELECT T1.Customer_Details FROM Customers AS T1 INNER JOIN Customer_Interactions AS T2 ON T1.Customer_ID = T2.Customer_ID WHERE T2.Status_Code = 'Stuck' AND T2.Services_and_Channels_Details = 'bad'
SELECT COUNT(Integration_Platform_ID) FROM Integration_Platform WHERE Integration_Platform_Details = 'Successful'
SELECT COUNT(Integration_Platform_ID) FROM Integration_Platform WHERE Integration_Platform_Details LIKE '%Success%'
SELECT T1.Customer_Details FROM Customers AS T1 INNER JOIN Integration_Platform AS T2 ON T1.Customer_ID = T2.Customer_Interaction_ID WHERE T2.Integration_Platform_ID IN ( SELECT Integration_Platform_ID FROM Integration_Platform WHERE Integration_Platform_Details = 'Failed' )
SELECT T1.Customer_Details
SELECT T1.Service_Details
SELECT Service_Details FROM Services WHERE Service_ID NOT IN (SELECT Service_ID FROM Customers_and_Services)
SELECT Analytical_Layer_Type_Code, COUNT(*) FROM Analytical_Layer GROUP BY Analytical_Layer_Type_Code
SELECT Analytical_Layer_Type_Code, COUNT(*) FROM Analytical_Layer GROUP BY Analytical_Layer_Type_Code
SELECT T1.Service_Details
SELECT T1.Service_Details
SELECT COUNT(id) FROM Vehicles
SELECT COUNT(id) FROM Vehicles
SELECT name FROM Vehicles ORDER BY Model_year DESC
SELECT name FROM Vehicles ORDER BY Model_year DESC
SELECT DISTINCT Type_of_powertrain FROM Vehicles
SELECT DISTINCT Type_of_powertrain FROM Vehicles
SELECT name, Type_of_powertrain, Annual_fuel_cost FROM Vehicles WHERE Model_year = 2013 OR Model_year = 2014
SELECT name, Type_of_powertrain, Annual_fuel_cost FROM Vehicles WHERE Model_year = 2013 OR Model_year = 2014
SELECT DISTINCT Type_of_powertrain FROM Vehicles WHERE Model_year = 2014 INTERSECT SELECT DISTINCT Type_of_powertrain FROM Vehicles WHERE Model_year = 2013
SELECT Type_of_powertrain FROM Vehicles WHERE Model_year = 2013 INTERSECT SELECT Type_of_powertrain FROM Vehicles WHERE Model_year = 2014
SELECT Type_of_powertrain, COUNT(*) FROM Vehicles GROUP BY Type_of_powertrain
SELECT Type_of_powertrain, COUNT(*) FROM Vehicles GROUP BY Type_of_powertrain
SELECT Type_of_powertrain FROM Vehicles GROUP BY Type_of_powertrain ORDER BY COUNT(*) DESC LIMIT 1
SELECT Type_of_powertrain FROM Vehicles GROUP BY Type_of_powertrain ORDER BY COUNT(Type_of_powertrain) DESC LIMIT 1
SELECT MIN(Annual_fuel_cost), MAX(Annual_fuel_cost), AVG(Annual_fuel_cost) FROM Vehicles
SELECT MIN(Annual_fuel_cost), MAX(Annual_fuel_cost), AVG(Annual_fuel_cost) FROM Vehicles
SELECT name, Model_year FROM Vehicles WHERE City_fuel_economy_rate <= Highway_fuel_economy_rate
SELECT name, Model_year FROM Vehicles WHERE City_fuel_economy_rate <= Highway_fuel_economy_rate
SELECT Type_of_powertrain, AVG(Average_annual_fuel_cost)
SELECT Type_of_powertrain, AVG(Average_annual_fuel_cost)
SELECT name, age, membership_credit FROM Customers
SELECT name, age, membership_credit FROM Customers
SELECT name, age FROM Customers ORDER BY membership_credit DESC LIMIT 1
SELECT name, age FROM Customers ORDER BY membership_credit DESC LIMIT 1
SELECT AVG(age) FROM Customers WHERE membership_credit > ( SELECT AVG(membership_credit) FROM Customers )
SELECT AVG(age) FROM Customers WHERE membership_credit > ( SELECT AVG(membership_credit) FROM Customers )
SELECT * FROM Discount
SELECT * FROM Discount
SELECT T1.name, SUM(T3.total_hours) FROM Vehicles AS T1 INNER JOIN Renting_history AS T2 ON T1.id = T2.vehicles_id INNER JOIN Vehicles AS T3 ON T3.id = T2.vehicles_id GROUP BY T1.name
SELECT T1.name, SUM(T3.total_hours) FROM Vehicles AS T1 INNER JOIN Renting_history AS T2 ON T1.id = T2.vehicles_id INNER JOIN Customers AS T3 ON T2.customer_id = T3.id GROUP BY T1.name
SELECT T1.name FROM Vehicles AS T1 LEFT JOIN Renting_history AS T2 ON T1.id = T2.vehicles_id WHERE T2.id IS NULL
SELECT T1.name FROM Vehicles AS T1 LEFT JOIN Renting_history AS T2 ON T1.id = T2.vehicles_id WHERE T2.id IS NULL
SELECT name FROM Customers WHERE id IN ( SELECT customer_id FROM Renting_history GROUP BY customer_id HAVING COUNT(id) >= 2 )
SELECT name FROM Customers WHERE id IN ( SELECT customer_id FROM Renting_history GROUP BY customer_id HAVING COUNT(id) >= 2 )
SELECT T1.name, T1.Model_year
SELECT T1.name, T1.Model_year
SELECT T1.name FROM Vehicles AS T1 INNER JOIN Renting_history AS T2 ON T1.id = T2.vehicles_id ORDER BY T2.total_hours DESC
SELECT T1.name FROM Vehicles AS T1 INNER JOIN Renting_history AS T2 ON T1.id = T2.vehicles_id ORDER BY T2.total_hours DESC
SELECT T2.name FROM Renting_history AS T1 INNER JOIN Discount AS T2 ON T1.discount_id = T2.id GROUP BY T2.id ORDER BY COUNT(T1.id) DESC LIMIT 1
SELECT T2.name FROM Renting_history AS T1 INNER JOIN Discount AS T2 ON T1.discount_id = T2.id GROUP BY T2.id ORDER BY COUNT(T1.id) DESC LIMIT 1
SELECT T1.name, T1.Type_of_powertrain
SELECT T1.name, T1.Type_of_powertrain
SELECT AVG(City_fuel_economy_rate) AS avg_city_rate, AVG(Highway_fuel_economy_rate) AS avg_highway_rate, Type_of_powertrain FROM Vehicles WHERE Type_of_powertrain!= 'Electric' GROUP BY Type_of_powertrain
SELECT AVG(City_fuel_economy_rate), AVG(Highway_fuel_economy_rate), Type_of_powertrain FROM Vehicles GROUP BY Type_of_powertrain
SELECT AVG(amount_of_loan) FROM Student_Loans
SELECT AVG(amount_of_loan) FROM Student_Loans
SELECT T1.bio_data, T1.student_id
SELECT T1.bio_data, T1.student_id
SELECT T1.teacher_details
SELECT teacher_details FROM Teachers WHERE teacher_id IN ( SELECT teacher_id FROM Classes WHERE class_details LIKE '%data%' EXCEPT SELECT teacher_id FROM Classes WHERE class_details LIKE 'net%' )
SELECT bio_data FROM Students WHERE student_id NOT IN (SELECT student_id FROM Detention UNION SELECT student_id FROM Student_Loans)
SELECT bio_data FROM Students WHERE student_id NOT IN (SELECT student_id FROM Detention UNION SELECT student_id FROM Student_Loans)
SELECT T1.amount_of_loan, T1.date_of_loan
SELECT T1.amount_of_loan, T1.date_of_loan
SELECT T1.teacher_id, T1.teacher_details FROM Teachers AS T1 INNER JOIN Classes AS T2 ON T1.teacher_id = T2.teacher_id GROUP BY T1.teacher_id ORDER BY COUNT(T1.teacher_id) DESC LIMIT 1
SELECT T2.teacher_details, T2.teacher_id FROM Classes AS T1 INNER JOIN Teachers AS T2 ON T1.teacher_id = T2.teacher_id GROUP BY T2.teacher_id ORDER BY COUNT(T1.class_id) DESC LIMIT 1
SELECT DISTINCT detention_summary FROM Detention
SELECT DISTINCT detention_summary FROM Detention
SELECT T1.student_details, T3.address_type_description FROM Students AS T1 INNER JOIN Students_Addresses AS T2 ON T1.student_id = T2.student_id INNER JOIN Ref_Address_Types AS T3 ON T2.address_type_code = T3.address_type_code
SELECT T1.student_details, T3.address_type_description
SELECT T1.address_details, T2.bio_data FROM Addresses AS T1 INNER JOIN Students AS T2 ON T1.address_id = T2.student_id
SELECT T1.address_details, T2.bio_data FROM Addresses AS T1 INNER JOIN Students AS T2 ON T1.address_id = T2.student_id
SELECT T1.bio_data, T2.date_of_transcript FROM Students AS T1 INNER JOIN Transcripts AS T2 ON T1.student_id = T2.student_id
SELECT T1.bio_data, T2.date_of_transcript FROM Students AS T1 INNER JOIN Transcripts AS T2 ON T1.student_id = T2.student_id
SELECT COUNT(*),  T1.behaviour_monitoring_details FROM Behaviour_Monitoring AS T1 GROUP BY T1.behaviour_monitoring_details ORDER BY COUNT(*) DESC LIMIT 1
SELECT behaviour_monitoring_details, COUNT(*) AS count FROM Behaviour_Monitoring GROUP BY behaviour_monitoring_details ORDER BY COUNT(*) DESC LIMIT 1
SELECT T1.bio_data, T1.student_details
SELECT T1.bio_data, T1.student_details
SELECT T1.bio_data FROM Students AS T1 INNER JOIN Behaviour_Monitoring AS T2 ON T1.student_id = T2.student_id GROUP BY T2.student_id ORDER BY COUNT(T2.behaviour_monitoring_id) DESC LIMIT 1
SELECT T1.bio_data FROM Students AS T1 INNER JOIN Behaviour_Monitoring AS T2 ON T1.student_id = T2.student_id GROUP BY T2.behaviour_monitoring_details ORDER BY COUNT(T2.behaviour_monitoring_details) DESC LIMIT 1
SELECT S.bio_data, SE.event_date FROM Students S INNER JOIN Student_Events SE ON S.student_id = SE.student_id
SELECT T1.bio_data, T2.event_date FROM Students AS T1 INNER JOIN Student_Events AS T2 ON T1.student_id = T2.student_id
SELECT COUNT(T1.student_id), T2.event_type_description, T2.event_type_code
SELECT T1.event_type_code, T1.event_type_description, COUNT(T2.student_id) FROM Ref_Event_Types AS T1 INNER JOIN Student_Events AS T2 ON T1.event_type_code = T2.event_type_code GROUP BY T1.event_type_code ORDER BY COUNT(T2.student_id) DESC LIMIT 1
SELECT T1.achievement_details, T2.achievement_type_description FROM Achievements AS T1 INNER JOIN Ref_Achievement_Type AS T2 ON T1.achievement_type_code = T2.achievement_type_code
SELECT T1.achievement_details, T2.achievement_type_description
SELECT COUNT(DISTINCT T2.teacher_id)
SELECT COUNT(DISTINCT T2.teacher_id) FROM Achievements AS T1 INNER JOIN Classes AS T2 ON T1.student_id = T2.student_id WHERE T1.achievement_id IS NULL
SELECT date_of_transcript, transcript_details FROM Transcripts
SELECT date_of_transcript, transcript_details FROM Transcripts
SELECT achievement_type_code, achievement_details, date_achievement FROM Achievements
SELECT achievement_type_code, achievement_details, date_achievement FROM Achievements
SELECT datetime_detention_start, datetime_detention_end FROM Detention
SELECT datetime_detention_start, datetime_detention_end FROM Detention
SELECT bio_data FROM Students WHERE student_details LIKE '%Suite%'
SELECT bio_data FROM Students WHERE student_details LIKE '%Suite%'
SELECT T1.teacher_details, T2.student_details
SELECT T1.teacher_details, T2.student_details FROM Teachers AS T1 INNER JOIN Classes AS T3 ON T1.teacher_id = T3.teacher_id INNER JOIN Students AS T2 ON T2.student_id = T3.student_id
SELECT MAX(COUNT(class_id)) AS max_courses, teacher_id FROM Classes GROUP BY teacher_id ORDER BY COUNT(class_id) DESC LIMIT 1
SELECT teacher_id, COUNT(class_id) FROM Classes GROUP BY teacher_id ORDER BY COUNT(class_id) DESC LIMIT 1
SELECT COUNT(DISTINCT T1.transcript_id),  T2.student_id FROM Transcripts AS T1 INNER JOIN Students AS T2 ON T1.student_id = T2.student_id GROUP BY T2.student_id ORDER BY COUNT(DISTINCT T1.transcript_id) DESC LIMIT 1
SELECT T1.student_id, COUNT(T2.transcript_id) FROM Students AS T1 INNER JOIN Transcripts AS T2 ON T1.student_id = T2.student_id GROUP BY T1.student_id ORDER BY COUNT(T2.transcript_id) DESC LIMIT 1
SELECT T1.student_id, T1.student_details
SELECT T1.student_id, T1.student_details
SELECT detention_type_code, detention_type_description FROM Ref_Detention_Type ORDER BY COUNT(detention_type_code) ASC LIMIT 1
SELECT detention_type_code, detention_type_description FROM Ref_Detention_Type ORDER BY DETENTION_TYPE_CODE ASC LIMIT 1
SELECT bio_data, student_details FROM Students WHERE student_id IN ( SELECT student_id FROM Student_Loans WHERE amount_of_loan > ( SELECT AVG(amount_of_loan) FROM Student_Loans ) )
SELECT T1.bio_data, T1.student_details
SELECT MIN(date_of_loan) FROM Student_Loans
SELECT MIN(date_of_loan) FROM Student_Loans
SELECT T1.bio_data FROM Students AS T1 INNER JOIN Student_Loans AS T2 ON T1.student_id = T2.student_id ORDER BY T2.amount_of_loan ASC LIMIT 1
SELECT T1.bio_data FROM Students AS T1 INNER JOIN Student_Loans AS T2 ON T1.student_id = T2.student_id ORDER BY T2.amount_of_loan ASC LIMIT 1
SELECT T2.date_of_transcript FROM Student_Loans AS T1 INNER JOIN Transcripts AS T2 ON T1.student_id = T2.student_id ORDER BY T1.amount_of_loan DESC LIMIT 1
SELECT T2.date_of_transcript
SELECT T2.teacher_details
SELECT T2.teacher_details
SELECT student_id, SUM(amount_of_loan) FROM Student_Loans GROUP BY student_id
SELECT student_id, SUM(amount_of_loan) FROM Student_Loans GROUP BY student_id
SELECT T1.student_id, T1.bio_data, COUNT(T2.transcript_id) FROM Students AS T1 INNER JOIN Transcripts AS T2 ON T1.student_id = T2.student_id GROUP BY T1.student_id
SELECT T1.student_id, T1.bio_data, COUNT(T2.transcript_id) FROM Students AS T1 INNER JOIN Transcripts AS T2 ON T1.student_id = T2.student_id GROUP BY T1.student_id
SELECT COUNT(DISTINCT T1.student_id) FROM Detention AS T1 INNER JOIN Ref_Detention_Type AS T2 ON T1.detention_type_code = T2.detention_type_code
SELECT COUNT(DISTINCT T1.student_id) FROM Detention AS T1 INNER JOIN Students AS T2 ON T1.student_id = T2.student_id
SELECT T1.address_type_code, T1.address_type_description
SELECT T1.address_type_code, T1.address_type_description
SELECT T1.bio_data FROM Students AS T1 INNER JOIN Student_Events AS T2 ON T1.student_id = T2.student_id LEFT JOIN Student_Loans AS T3 ON T1.student_id = T3.student_id WHERE T3.student_loan_id IS NULL
SELECT T1.bio_data FROM Students AS T1 INNER JOIN Student_Events AS T2 ON T1.student_id = T2.student_id LEFT JOIN Student_Loans AS T3 ON T1.student_id = T3.student_id WHERE T3.student_loan_id IS NULL
SELECT T2.date_from, T2.date_to
SELECT T1.date_from, T1.date_to
SELECT datetime_detention_start FROM Detention
SELECT datetime_detention_start FROM Detention
SELECT Name FROM Author
SELECT Name FROM Author
SELECT Name, Address FROM Client
SELECT Name, Address FROM Client
SELECT Title, ISBN, SalePrice FROM Book
SELECT Title, ISBN, SalePrice FROM Book
SELECT COUNT(*) FROM Book
SELECT COUNT(*) FROM Book
SELECT COUNT(idAuthor) FROM Author
SELECT COUNT(idAuthor) FROM Author
SELECT COUNT(IdClient) FROM Client
SELECT COUNT(IdClient) FROM Client
SELECT Name, Address FROM Client ORDER BY Name
SELECT Name, Address FROM Client ORDER BY Name
SELECT T1.Title, T2.Name FROM Book AS T1 INNER JOIN Author_Book AS T3 ON T1.ISBN = T3.ISBN INNER JOIN Author AS T2 ON T3.Author = T2.idAuthor
SELECT T1.Title, T2.Name FROM Book AS T1 INNER JOIN Author_Book AS T3 ON T1.ISBN = T3.ISBN INNER JOIN Author AS T2 ON T3.Author = T2.idAuthor
SELECT IdOrder, T2.Name FROM Orders AS T1 INNER JOIN Client AS T2 ON T1.IdClient = T2.IdClient
SELECT T1.IdOrder, T2.Name FROM Orders AS T1 INNER JOIN Client AS T2 ON T1.IdClient = T2.IdClient
SELECT T1.Name, COUNT(T2.ISBN) FROM Author AS T1 INNER JOIN Author_Book AS T2 ON T1.idAuthor = T2.Author GROUP BY T1.idAuthor
SELECT T1.Name, COUNT(T2.ISBN) FROM Author AS T1 INNER JOIN Author_Book AS T2 ON T1.idAuthor = T2.Author GROUP BY T1.idAuthor
SELECT T1.ISBN, COUNT(T2.IdOrder) FROM Book AS T1 INNER JOIN Books_Order AS T2 ON T1.ISBN = T2.ISBN GROUP BY T1.ISBN
SELECT ISBN, COUNT(*) FROM Books_Order GROUP BY ISBN
SELECT ISBN, SUM(amount) FROM Books_Order GROUP BY ISBN
SELECT ISBN, SUM(amount) FROM Books_Order GROUP BY ISBN
SELECT T1.Title FROM Book AS T1 INNER JOIN Books_Order AS T2 ON T1.ISBN = T2.ISBN GROUP BY T1.ISBN ORDER BY COUNT(T2.ISBN) DESC LIMIT 1
SELECT T1.Title FROM Book AS T1 INNER JOIN Books_Order AS T2 ON T1.ISBN = T2.ISBN GROUP BY T1.ISBN ORDER BY COUNT(T2.ISBN) DESC LIMIT 1
SELECT T1.Title, T1.PurchasePrice
SELECT T1.Title, T1.PurchasePrice
SELECT T1.Title FROM Book AS T1 INNER JOIN Books_Order AS T2 ON T1.ISBN = T2.ISBN
SELECT DISTINCT T1.Title FROM Book AS T1 INNER JOIN Books_Order AS T2 ON T1.ISBN = T2.ISBN WHERE T2.IdOrder IN ( SELECT IdOrder FROM Orders WHERE DateExped < CURRENT_DATE )
SELECT T1.Name FROM Client AS T1 INNER JOIN Orders AS T2 ON T1.IdClient = T2.IdClient
SELECT DISTINCT T1.Name FROM Client AS T1 INNER JOIN Orders AS T2 ON T1.IdClient = T2.IdClient
SELECT T1.Name, COUNT(T2.IdOrder) FROM Client AS T1 INNER JOIN Orders AS T2 ON T1.IdClient = T2.IdClient GROUP BY T1.IdClient
SELECT T1.Name, COUNT(T2.IdOrder) FROM Client AS T1 INNER JOIN Orders AS T2 ON T1.IdClient = T2.IdClient GROUP BY T1.IdClient
SELECT T1.Name FROM Client AS T1 INNER JOIN Orders AS T2 ON T1.IdClient = T2.IdClient GROUP BY T1.IdClient ORDER BY COUNT(T2.IdOrder) DESC LIMIT 1
SELECT T1.Name FROM Client AS T1 INNER JOIN Orders AS T2 ON T1.IdClient = T2.IdClient GROUP BY T1.IdClient ORDER BY COUNT(T2.IdOrder) DESC LIMIT 1
SELECT T1.Name, SUM(T3.amount) FROM Client AS T1 INNER JOIN Orders AS T2 ON T1.IdClient = T2.IdClient INNER JOIN Books_Order AS T3 ON T2.IdOrder = T3.IdOrder GROUP BY T1.IdClient
SELECT T1.Name, SUM(T3.amount) FROM Client AS T1 INNER JOIN Orders AS T2 ON T1.IdClient = T2.IdClient INNER JOIN Books_Order AS T3 ON T2.IdOrder = T3.IdOrder GROUP BY T1.Name
SELECT T1.Name FROM Client AS T1 INNER JOIN Orders AS T2 ON T1.IdClient = T2.IdClient GROUP BY T1.IdClient ORDER BY SUM(T3.amount) DESC LIMIT 1
SELECT T1.Name FROM Client AS T1 INNER JOIN Orders AS T2 ON T1.IdClient = T2.IdClient INNER JOIN Books_Order AS T3 ON T2.IdOrder = T3.IdOrder GROUP BY T1.IdClient ORDER BY SUM(T3.amount) DESC LIMIT 1
SELECT T1.Title
SELECT Title FROM Book WHERE ISBN NOT IN ( SELECT ISBN FROM Books_Order )
SELECT Name FROM Client WHERE IdClient NOT IN (SELECT IdClient FROM Orders)
SELECT Name FROM Client WHERE IdClient NOT IN (SELECT IdClient FROM Orders)
SELECT MAX(SalePrice), MIN(SalePrice) FROM Book
SELECT MAX(SalePrice), MIN(SalePrice) FROM Book
SELECT AVG(PurchasePrice), AVG(SalePrice) FROM Book
SELECT AVG(PurchasePrice), AVG(SalePrice) FROM Book
SELECT MAX(SalePrice - PurchasePrice) FROM Book
SELECT MAX(SalePrice - PurchasePrice) FROM Book
SELECT Title FROM Book WHERE SalePrice > ( SELECT AVG(SalePrice) FROM Book )
SELECT Title FROM Book WHERE SalePrice > ( SELECT AVG(SalePrice) FROM Book )
SELECT Title FROM Book WHERE SalePrice = ( SELECT MIN(SalePrice) FROM Book )
SELECT Title FROM Book WHERE SalePrice = ( SELECT MIN(SalePrice) FROM Book )
SELECT Title FROM Book WHERE PurchasePrice = ( SELECT MAX(PurchasePrice) FROM Book )
SELECT Title FROM Book ORDER BY PurchasePrice DESC LIMIT 1
SELECT AVG(T2.SalePrice) FROM Author AS T1 INNER JOIN Book AS T2 ON T1.idAuthor = T2.Author INNER JOIN Author_Book AS T3 ON T2.ISBN = T3.ISBN WHERE T1.Name = 'George Orwell'
SELECT AVG(T2.SalePrice) FROM Author AS T1 INNER JOIN Book AS T2 ON T1.idAuthor = T2.Author INNER JOIN Author_Book AS T3 ON T2.ISBN = T3.ISBN WHERE T1.Name = 'George Orwell'
SELECT T2.SalePrice FROM Author_Book AS T1 INNER JOIN Book AS T2 ON T1.ISBN = T2.ISBN INNER JOIN Author AS T3 ON T1.Author = T3.idAuthor WHERE T3.Name = 'Plato'
SELECT T2.SalePrice
SELECT T1.Title FROM Book AS T1 INNER JOIN Author_Book AS T2 ON T1.ISBN = T2.ISBN INNER JOIN Author AS T3 ON T2.Author = T3.idAuthor WHERE T3.Name = 'George Orwell' ORDER BY T1.SalePrice LIMIT 1
SELECT T1.Title FROM Book AS T1 INNER JOIN Author_Book AS T2 ON T1.ISBN = T2.ISBN INNER JOIN Author AS T3 ON T2.Author = T3.idAuthor WHERE T3.Name = 'George Orwell' ORDER BY T1.SalePrice LIMIT 1
SELECT T1.Title FROM Book AS T1 INNER JOIN Author_Book AS T2 ON T1.ISBN = T2.ISBN INNER JOIN Author AS T3 ON T2.Author = T3.idAuthor WHERE T3.Name = 'Plato' AND T1.SalePrice < ( SELECT AVG(SalePrice) FROM Book );
SELECT T1.Title FROM Book AS T1 INNER JOIN Author_Book AS T2 ON T1.ISBN = T2.ISBN INNER JOIN Author AS T3 ON T2.Author = T3.idAuthor WHERE T3.Name = 'Plato' AND T1.SalePrice < ( SELECT AVG(SalePrice) FROM Book )
SELECT Name FROM Author JOIN Author_Book ON Author.idAuthor = Author_Book.Author JOIN Book ON Author_Book.ISBN = Book.ISBN WHERE Book.Title = 'Pride and Prejudice'
SELECT T2.Name FROM Book AS T1 INNER JOIN Author_Book AS T2 ON T1.ISBN = T2.ISBN WHERE T1.Title = 'Pride and Prejudice'
SELECT T1.Title FROM Book AS T1 INNER JOIN Author_Book AS T2 ON T1.ISBN = T2.ISBN INNER JOIN Author AS T3 ON T2.Author = T3.idAuthor WHERE T3.Name LIKE '%Plato%'
SELECT T2.Title FROM Author AS T1 INNER JOIN Author_Book AS T2 ON T1.idAuthor = T2.Author INNER JOIN Book AS T3 ON T2.ISBN = T3.ISBN WHERE T1.Name LIKE '%Plato%'
SELECT COUNT(T1.IdOrder) FROM Books_Order AS T1 INNER JOIN Book AS T2 ON T1.ISBN = T2.ISBN WHERE T2.Title = 'Pride and Prejudice'
SELECT COUNT(T1.IdOrder) FROM Orders AS T1 INNER JOIN Books_Order AS T2 ON T1.IdOrder = T2.IdOrder INNER JOIN Book AS T3 ON T2.ISBN = T3.ISBN WHERE T3.Title = 'Pride and Prejudice'
SELECT IdOrder FROM Books_Order WHERE ISBN IN (SELECT ISBN FROM Book WHERE Title = 'Pride and Prejudice' OR Title = 'The Little Prince')
SELECT IdOrder FROM Books_Order WHERE ISBN IN (SELECT ISBN FROM Author_Book WHERE Author = 'Austen, Jane' OR Author = 'Saint-Exupéry, Antoine de')
SELECT T1.ISBN
SELECT T1.ISBN
SELECT T1.Title
SELECT T1.Title
SELECT T1.Name
SELECT T1.Name FROM Client AS T1 INNER JOIN Orders AS T2 ON T1.IdClient = T2.IdClient INNER JOIN Books_Order AS T3 ON T2.IdOrder = T3.IdOrder INNER JOIN Book AS T4 ON T3.ISBN = T4.ISBN INNER JOIN Author_Book AS T5 ON T4.ISBN = T5.ISBN INNER JOIN Author AS T6 ON T5.Author = T6.idAuthor WHERE T4.Title = 'Pride and Prejudice'
SELECT COUNT(Book_ID) FROM book
SELECT Title FROM book ORDER BY Title ASC
SELECT Title FROM book ORDER BY Pages DESC
SELECT Type, Release FROM book
SELECT Book_ID, MAX(Chapters) AS Max_Chapters, MIN(Chapters) AS Min_Chapters FROM book GROUP BY Book_ID
SELECT Title FROM book WHERE Type!= 'Poet'
SELECT AVG(Rating) FROM review
SELECT Title, Rating FROM book INNER JOIN review ON book.Book_ID = review.Book_ID
SELECT Rating FROM review WHERE Book_ID = ( SELECT Book_ID FROM book WHERE Chapters = ( SELECT MAX(Chapters) FROM book ) )
SELECT T2.Rank FROM book AS T1 INNER JOIN review AS T2 ON T1.Book_ID = T2.Book_ID ORDER BY T1.Pages ASC LIMIT 1
SELECT T1.Title FROM book AS T1 INNER JOIN review AS T2 ON T1.Book_ID = T2.Book_ID ORDER BY T2.Rank DESC LIMIT 1
SELECT AVG(Readers_in_Million) FROM review WHERE Book_ID IN ( SELECT Book_ID FROM book WHERE Type = 'Novel' )
SELECT Type, COUNT(Book_ID) FROM book GROUP BY Type
SELECT Type FROM book GROUP BY Type ORDER BY COUNT(Type) DESC LIMIT 1
SELECT Type FROM book GROUP BY Type HAVING COUNT(Book_ID) >= 3
SELECT T1.Title FROM book AS T1 INNER JOIN review AS T2 ON T1.Book_ID = T2.Book_ID ORDER BY T2.Rating ASC
SELECT T1.Title, T1.Audio FROM book AS T1 INNER JOIN review AS T2 ON T1.Book_ID = T2.Book_ID ORDER BY T2.Readers_in_Million DESC
SELECT COUNT(Book_ID) FROM book WHERE Book_ID NOT IN (SELECT Book_ID FROM review)
SELECT Type FROM book WHERE Chapters > 75 INTERSECT SELECT Type FROM book WHERE Chapters < 50
SELECT COUNT(DISTINCT Type) FROM book
SELECT Type, Title FROM book WHERE Book_ID NOT IN (SELECT Book_ID FROM review)
SELECT COUNT(Customer_ID) FROM customer
SELECT COUNT(Customer_ID) FROM customer
SELECT Name FROM customer ORDER BY Level_of_Membership ASC
SELECT Name FROM customer ORDER BY Level_of_Membership ASC
SELECT Nationality, Card_Credit FROM customer
SELECT Nationality, Card_Credit FROM customer
SELECT Name FROM customer WHERE Nationality = 'England' OR Nationality = 'Australia'
SELECT Name FROM customer WHERE Nationality = 'England' OR Nationality = 'Australia'
SELECT AVG(Card_Credit) FROM customer WHERE Level_of_Membership > 1
SELECT AVG(Card_Credit) FROM customer WHERE Level_of_Membership > 1
SELECT Card_Credit FROM customer ORDER BY Level_of_Membership DESC LIMIT 1
SELECT Card_Credit FROM customer ORDER BY Level_of_Membership DESC LIMIT 1
SELECT Nationality, COUNT(*) FROM customer GROUP BY Nationality
SELECT Nationality, COUNT(Customer_ID) FROM customer GROUP BY Nationality
SELECT Nationality FROM customer GROUP BY Nationality ORDER BY COUNT(Nationality) DESC LIMIT 1
SELECT Nationality FROM customer GROUP BY Nationality ORDER BY COUNT(Customer_ID) DESC LIMIT 1
SELECT T1.Nationality FROM customer AS T1 INNER JOIN customer AS T2 ON T1.Customer_ID = T2.Customer_ID WHERE T1.Card_Credit < 50 AND T2.Card_Credit > 75
SELECT Nationality FROM customer WHERE Card_Credit > 50 INTERSECT SELECT Nationality FROM customer WHERE Card_Credit < 75
SELECT T1.Name, T2.Dish_Name FROM customer AS T1 INNER JOIN customer_order AS T2 ON T1.Customer_ID = T2.Customer_ID
SELECT T1.Name, T2.Dish_Name FROM customer AS T1 INNER JOIN customer_order AS T2 ON T1.Customer_ID = T2.Customer_ID
SELECT T1.Name, T3.Dish_Name, T2.Quantity FROM customer AS T1 INNER JOIN customer_order AS T2 ON T1.Customer_ID = T2.Customer_ID INNER JOIN branch AS T3 ON T2.Branch_ID = T3.Branch_ID ORDER BY T2.Quantity DESC
SELECT T1.Name, T3.Dish_Name, T3.Quantity FROM customer AS T1 INNER JOIN customer_order AS T2 ON T1.Customer_ID = T2.Customer_ID INNER JOIN customer_order AS T3 ON T1.Customer_ID = T3.Customer_ID ORDER BY T3.Quantity DESC
SELECT T1.Name, SUM(T2.Quantity) FROM customer AS T1 INNER JOIN customer_order AS T2 ON T1.Customer_ID = T2.Customer_ID GROUP BY T1.Name
SELECT T1.Name, SUM(T2.Quantity) FROM customer AS T1 INNER JOIN customer_order AS T2 ON T1.Customer_ID = T2.Customer_ID GROUP BY T1.Customer_ID
SELECT Name FROM customer WHERE Customer_ID IN ( SELECT Customer_ID FROM customer_order GROUP BY Customer_ID HAVING SUM(Quantity) > 1 )
SELECT T1.Name FROM customer AS T1 INNER JOIN customer_order AS T2 ON T1.Customer_ID = T2.Customer_ID GROUP BY T1.Customer_ID HAVING SUM(T2.Quantity) > 1
SELECT DISTINCT Manager FROM branch
SELECT DISTINCT Manager FROM branch
SELECT Name FROM customer WHERE Customer_ID NOT IN (SELECT Customer_ID FROM customer_order)
SELECT Name FROM customer WHERE Customer_ID NOT IN (SELECT Customer_ID FROM customer_order)
SELECT COUNT(Member_ID) FROM member
SELECT Name FROM member ORDER BY Age ASC
SELECT Name, Nationality FROM member
SELECT Name FROM member WHERE Nationality!= 'England'
SELECT Name FROM member WHERE Age = 19 OR Age = 20
SELECT Name FROM member WHERE Age = ( SELECT MAX(Age) FROM member )
SELECT Nationality, COUNT(*) FROM member GROUP BY Nationality
SELECT Nationality FROM member GROUP BY Nationality ORDER BY COUNT(Member_ID) DESC LIMIT 1
SELECT Nationality FROM member GROUP BY Nationality HAVING COUNT(Member_ID) >= 2
SELECT T1.Name, T3.Club_Name
SELECT T2.Name
SELECT T1.Name FROM member AS T1 INNER JOIN club_leader AS T2 ON T1.Member_ID = T2.Member_ID WHERE T2.Year_Join < 2018
SELECT T2.Name FROM club AS T1 INNER JOIN club_leader AS T2 ON T1.Club_ID = T2.Club_ID INNER JOIN member AS T3 ON T2.Member_ID = T3.Member_ID WHERE T1.Club_Name = 'Houston' AND T1.Team_Leader = 1
SELECT Name FROM member WHERE Member_ID NOT IN (SELECT Member_ID FROM club_leader)
SELECT Nationality FROM member WHERE Age > 22 INTERSECT SELECT Nationality FROM member WHERE Age < 19
SELECT AVG(T1.Age) FROM member AS T1 INNER JOIN club_leader AS T2 ON T1.Member_ID = T2.Member_ID
SELECT Club_Name FROM club WHERE Club_Name LIKE '%state%'
SELECT T1.Collection_Subset_Name
SELECT Collection_Subset_Name FROM Collection_Subsets
SELECT Collecrtion_Subset_Details FROM Collection_Subsets WHERE Collection_Subset_Name = 'Top collection'
SELECT T2.Collection_Subset_Details FROM Collection_Subsets AS T1 INNER JOIN Document_Subsets AS T2 ON T1.Collection_Subset_ID = T2.Document_Subset_ID WHERE T1.Collection_Subset_Name = 'Top collection'
SELECT T1.Document_Subset_Name
SELECT Document_Subset_Name FROM Document_Subsets
SELECT Document_Subset_Details FROM Document_Subsets WHERE Document_Subset_Name = 'Best for 2000'
SELECT Document_Subset_Details FROM Document_Subsets WHERE Document_Subset_Name = 'Best for 2000'
SELECT Document_Object_ID FROM Document_Objects
SELECT Document_Object_ID FROM Document_Objects
SELECT Parent_Document_Object_ID FROM Document_Objects WHERE Owner = 'Marlin'
SELECT Document_Object_ID FROM Document_Objects WHERE Owner = 'Marlin'
SELECT Owner FROM Document_Objects WHERE Description = 'Braeden Collection'
SELECT Owner FROM Document_Objects WHERE Description = 'Braeden Collection'
SELECT T2.Owner FROM Document_Objects AS T1 INNER JOIN Document_Objects AS T2 ON T1.Parent_Document_Object_ID = T2.Document_Object_ID WHERE T1.Owner = 'Marlin'
SELECT T1.Owner FROM Document_Objects AS T1 INNER JOIN Documents_in_Collections AS T2 ON T1.Document_Object_ID = T2.Document_Object_ID WHERE T1.Owner = 'Marlin'
SELECT DISTINCT Description FROM Document_Objects WHERE Parent_Document_Object_ID IS NULL
SELECT DISTINCT Description FROM Document_Objects WHERE Parent_Document_Object_ID IS NULL
SELECT COUNT(Document_Object_ID) FROM Document_Objects WHERE Owner = 'Marlin'
SELECT COUNT(Document_Object_ID) FROM Document_Objects WHERE Owner = 'Marlin'
SELECT Document_Object_ID FROM Document_Objects WHERE Parent_Document_Object_ID IS NULL
SELECT Document_Object_ID FROM Document_Objects WHERE Parent_Document_Object_ID IS NULL
SELECT Parent_Document_Object_ID, COUNT(*) FROM Document_Objects GROUP BY Parent_Document_Object_ID
SELECT COUNT(DISTINCT T1.Document_Object_ID) AS Child_Doc_Count, T1.Parent_Document_Object_ID
SELECT Collection_Name FROM Collections
SELECT Collection_Name FROM Collections
SELECT Collection_Description FROM Collections WHERE Collection_Name = 'Best'
SELECT Collection_Description FROM Collections WHERE Collection_Name = 'Best'
SELECT T2.Collection_Name FROM Collections AS T1 INNER JOIN Collections AS T2 ON T1.Parent_Collection_ID = T2.Collection_ID WHERE T1.Collection_Name = 'Nice'
SELECT T2.Collection_Name FROM Collections AS T1 INNER JOIN Documents_in_Collections AS T2 ON T1.Collection_ID = T2.Collection_ID WHERE T1.Collection_Name = 'Nice'
SELECT Collection_Name FROM Collections WHERE Parent_Collection_ID IS NULL
SELECT Collection_Name FROM Collections WHERE Parent_Collection_ID IS NULL
SELECT T1.Document_Object_ID
SELECT T1.Document_Object_ID
SELECT COUNT(Collection_ID) FROM Collections WHERE Collection_Name = 'Best'
SELECT COUNT(T1.Collection_ID) FROM Collections AS T1 INNER JOIN Documents_in_Collections AS T2 ON T1.Collection_ID = T2.Collection_ID WHERE T1.Collection_Name = 'Best'
SELECT T1.Document_Object_ID
SELECT T1.Document_Object_ID FROM Document_Objects AS T1 INNER JOIN Document_Subset_Members AS T2 ON T1.Document_Object_ID = T2.Document_Object_ID WHERE T1.Owner = 'Ransom'
SELECT Collection_Subset_ID, Collection_Subset_Name, COUNT(Collection_ID) FROM Collection_Subsets
SELECT Collection_Subset_ID, Collection_Subset_Name, COUNT(Collection_ID) FROM Collection_Subsets
SELECT Document_Object_ID, COUNT(Document_Object_ID) FROM Document_Objects GROUP BY Document_Object_ID ORDER BY COUNT(Document_Object_ID) DESC LIMIT 1
SELECT Document_Object_ID, COUNT(*) FROM Document_Subset_Members GROUP BY Document_Object_ID
SELECT Document_Object_ID, COUNT(*) FROM Document_Subset_Members GROUP BY Document_Object_ID ORDER BY COUNT(*) ASC LIMIT 1
SELECT Document_Object_ID FROM Documents_in_Collections GROUP BY Document_Object_ID ORDER BY COUNT(Document_Object_ID) ASC LIMIT 1
SELECT Document_Object_ID, COUNT(Document_Object_ID) FROM Document_Subset_Members GROUP BY Document_Object_ID HAVING COUNT(Document_Object_ID) BETWEEN 2 AND 4
SELECT T1.Document_Object_ID, COUNT(T2.Document_Object_ID) FROM Document_Objects AS T1 INNER JOIN Document_Subset_Members AS T2 ON T1.Document_Object_ID = T2.Document_Object_ID GROUP BY T1.Document_Object_ID HAVING COUNT(T2.Document_Object_ID) BETWEEN 2 AND 4
SELECT T1.Owner FROM Document_Objects AS T1 INNER JOIN Document_Subset_Members AS T2 ON T1.Document_Object_ID = T2.Document_Object_ID WHERE T1.Owner = 'Braeden'
SELECT DISTINCT T1.Owner FROM Document_Objects AS T1 INNER JOIN Document_Subset_Members AS T2 ON T1.Document_Object_ID = T2.Document_Object_ID WHERE T1.Owner = 'Braeden'
SELECT T2.Document_Subset_Name
SELECT DISTINCT T1.Document_Subset_Name
SELECT T1.Document_Subset_ID, T1.Document_Subset_Name, COUNT(DISTINCT T2.Document_Object_ID)
SELECT T1.Document_Subset_ID, T1.Document_Subset_Name, COUNT(DISTINCT T2.Document_Object_ID)
SELECT Document_Subset_ID, Document_Subset_Name, COUNT(DISTINCT Document_Object_ID) AS Number_of_Documents
SELECT Document_Subset_ID, Document_Subset_Name, COUNT(DISTINCT Document_Object_ID) FROM Document_Subset_Members GROUP BY Document_Subset_ID ORDER BY COUNT(DISTINCT Document_Object_ID) DESC LIMIT 1
SELECT T1.Document_Object_ID
SELECT T1.Document_Object_ID
SELECT T1.Document_Subset_Name, T2.Document_Object_ID
SELECT T1.Document_Subset_Name, T1.Document_Subset_ID, T2.Document_Object_ID
SELECT T2.Collection_Name
SELECT T2.Collection_Name FROM Document_Objects AS T1 INNER JOIN Collections AS T2 ON T1.Parent_Collection_ID = T2.Collection_ID WHERE T1.Owner = 'Ransom'
SELECT COUNT(T2.Collection_ID), T1.Document_Object_ID
SELECT Document_Object_ID, COUNT(Collection_ID) FROM Documents_in_Collections GROUP BY Document_Object_ID
SELECT COUNT(DISTINCT T1.Document_Object_ID) FROM Documents_in_Collections AS T1 INNER JOIN Collections AS T2 ON T1.Collection_ID = T2.Collection_ID WHERE T2.Collection_Name = 'Best'
SELECT COUNT(DISTINCT T1.Document_Object_ID) FROM Documents_in_Collections AS T1 INNER JOIN Collections AS T2 ON T1.Collection_ID = T2.Collection_ID WHERE T2.Collection_Name = 'Best'
SELECT T1.Document_Object_ID
SELECT COUNT(DISTINCT T1.Document_Object_ID)
SELECT T1.Collection_Name, T1.Collection_ID, COUNT(T2.Document_Object_ID) FROM Collections AS T1 INNER JOIN Documents_in_Collections AS T2 ON T1.Collection_ID = T2.Collection_ID GROUP BY T1.Collection_ID ORDER BY COUNT(T2.Document_Object_ID) DESC LIMIT 1
SELECT T1.Collection_Name, T1.Collection_ID, COUNT(T2.Document_Object_ID) FROM Collections AS T1 INNER JOIN Documents_in_Collections AS T2 ON T1.Collection_ID = T2.Collection_ID WHERE T1.Collection_Name = 'Best' GROUP BY T1.Collection_ID ORDER BY COUNT(T2.Document_Object_ID) DESC LIMIT 1
SELECT T1.Document_Object_ID
SELECT DISTINCT T1.Document_Object_ID
SELECT T1.Document_Object_ID
SELECT T1.Document_Object_ID
SELECT T1.Document_Object_ID
SELECT DISTINCT T1.Document_Object_ID
SELECT T2.Collection_Name
SELECT T2.Collection_Name FROM Collection_Subsets AS T1 INNER JOIN Collections AS T2 ON T1.Related_Collection_ID = T2.Collection_ID WHERE T1.Collection_Subset_Name = 'Best'
SELECT COUNT(DISTINCT Collection_ID) FROM Collection_Subset_Members WHERE Related_Collection_ID IN (SELECT Collection_ID FROM Collections WHERE Collection_Name = 'Best')
SELECT COUNT(DISTINCT Collection_ID) FROM Collection_Subset_Members WHERE Collection_Subset_ID IN (SELECT Collection_Subset_ID FROM Collection_Subsets WHERE Collection_Subset_Name = 'Best')
SELECT T2.Collection_Subset_Name
SELECT T1.Collection_Subset_ID, T1.Collection_Subset_Name, T1.Collecrtion_Subset_Details
SELECT COUNT(*) FROM songs WHERE name LIKE '%Love%'
SELECT name FROM songs ORDER BY name ASC
SELECT name, language FROM songs
SELECT MAX(voice_sound_quality),  MIN(voice_sound_quality) FROM performance_score
SELECT voice_sound_quality, rhythm_tempo, stage_presence FROM performance_score AS T1 INNER JOIN participants AS T2 ON T1.participant_id = T2.id WHERE T2.name = 'Freeway'
SELECT id, language, original_artist FROM songs WHERE name!= 'Love'
SELECT original_artist, name FROM songs WHERE english_translation = 'All the streets of love'
SELECT DISTINCT T2.stage_presence FROM songs AS T1 INNER JOIN performance_score AS T2 ON T1.id = T2.songs_id WHERE T1.language = 'English'
SELECT T1.id, T1.name
SELECT p.id, p.name, p.popularity, COUNT(ps.songs_id) FROM participants p LEFT JOIN performance_score ps ON p.id = ps.participant_id GROUP BY p.id ORDER BY COUNT(ps.songs_id) DESC
SELECT T1.id, T1.name
SELECT voice_sound_quality FROM performance_score AS T1 INNER JOIN songs AS T2 ON T1.songs_id = T2.id WHERE T2.name = 'The Balkan Girls' AND T2.english_translation = 1
SELECT T1.id, T1.name FROM songs AS T1 INNER JOIN performance_score AS T2 ON T1.id = T2.songs_id GROUP BY T1.id ORDER BY COUNT(T2.id) DESC LIMIT 1
SELECT COUNT(*) FROM performance_score WHERE stage_presence < 7 OR stage_presence > 9
SELECT COUNT(*) FROM songs WHERE id NOT IN (SELECT songs_id FROM performance_score)
SELECT AVG(rhythm_tempo),  T2.language FROM performance_score AS T1 INNER JOIN songs AS T2 ON T1.songs_id = T2.id GROUP BY T2.language
SELECT DISTINCT T1.name FROM participants AS T1 INNER JOIN performance_score AS T2 ON T1.id = T2.participant_id INNER JOIN songs AS T3 ON T2.songs_id = T3.id WHERE T3.language = 'English'
SELECT T1.name, T1.popularity
SELECT name FROM songs WHERE english_translation LIKE '%Is%'
SELECT T2.original_artist FROM performance_score AS T1 INNER JOIN songs AS T2 ON T1.songs_id = T2.id WHERE T1.rhythm_tempo > 5 ORDER BY T1.voice_sound_quality DESC
SELECT COUNT(city_code) FROM City
SELECT COUNT(city_code) FROM City
SELECT DISTINCT state FROM City
SELECT DISTINCT state FROM City
SELECT COUNT(DISTINCT country) FROM City
SELECT COUNT(DISTINCT country) FROM City
SELECT city_name, city_code, state, country FROM City
SELECT city_name, city_code, state, country FROM City
SELECT latitude, longitude FROM City WHERE city_name = 'Baltimore'
SELECT latitude, longitude FROM City WHERE city_name = 'Baltimore'
SELECT city_name FROM City WHERE state = 'PA'
SELECT city_name FROM City WHERE state = 'PA'
SELECT COUNT(*) FROM City WHERE country = 'Canada'
SELECT COUNT(city_code) FROM City WHERE country = 'Canada'
SELECT city_name FROM City WHERE country = 'USA' ORDER BY latitude
SELECT city_name FROM City WHERE country = 'USA' ORDER BY latitude
SELECT state, COUNT(*) FROM City GROUP BY state
SELECT state, COUNT(*) FROM City GROUP BY state
SELECT country, COUNT(*) FROM City GROUP BY country
SELECT country, COUNT(*) FROM City GROUP BY country
SELECT state FROM City GROUP BY state HAVING COUNT(city_code) >= 2
SELECT T2.state FROM City AS T1 INNER JOIN Direct_distance AS T2 ON T1.city_code = T2.city1_code GROUP BY T2.state HAVING COUNT(T2.city1_code) >= 2
SELECT state FROM City GROUP BY state ORDER BY COUNT(city_code) DESC LIMIT 1
SELECT state FROM City GROUP BY state ORDER BY COUNT(city_code) DESC LIMIT 1
SELECT country FROM City GROUP BY country ORDER BY COUNT(city_code) LIMIT 1
SELECT country FROM City GROUP BY country ORDER BY COUNT(city_code) ASC LIMIT 1
SELECT T1.Fname, T1.LName
SELECT T1.Fname, T1.LName FROM Student AS T1 INNER JOIN City AS T2 ON T1.city_code = T2.city_code WHERE T2.state = 'MD'
SELECT COUNT(*) FROM Student AS T1 INNER JOIN City AS T2 ON T1.city_code = T2.city_code WHERE T2.country = 'China'
SELECT COUNT(StuID) FROM Student WHERE country = 'China'
SELECT T1.Fname, T1.Major
SELECT T1.Fname, T1.Major
SELECT COUNT(*),  T2.country FROM Student AS T1 INNER JOIN City AS T2 ON T1.city_code = T2.city_code GROUP BY T2.country
SELECT COUNT(*),  T2.country FROM Student AS T1 INNER JOIN City AS T2 ON T1.city_code = T2.city_code GROUP BY T2.country
SELECT city_name, COUNT(*) FROM City INNER JOIN Student ON City.city_code = Student.city_code GROUP BY city_name
SELECT city_name, COUNT(*) FROM City INNER JOIN Student ON City.city_code = Student.city_code GROUP BY city_name
SELECT T2.state FROM Student AS T1 INNER JOIN City AS T2 ON T1.city_code = T2.city_code GROUP BY T2.state ORDER BY COUNT(T1.StuID) DESC LIMIT 1
SELECT T2.state FROM Student AS T1 INNER JOIN City AS T2 ON T1.city_code = T2.city_code GROUP BY T2.state ORDER BY COUNT(T1.StuID) DESC LIMIT 1
SELECT T2.country FROM Student AS T1 INNER JOIN City AS T2 ON T1.city_code = T2.city_code GROUP BY T2.country ORDER BY COUNT(T1.StuID) ASC LIMIT 1
SELECT T2.country FROM Student AS T1 INNER JOIN City AS T2 ON T1.city_code = T2.city_code GROUP BY T2.country ORDER BY COUNT(T1.StuID) ASC LIMIT 1
SELECT T2.city_name
SELECT T2.city_name FROM Student AS T1 INNER JOIN City AS T2 ON T1.city_code = T2.city_code GROUP BY T1.city_code HAVING COUNT(T1.StuID) >= 3
SELECT T2.state
SELECT T2.state FROM Student AS T1 INNER JOIN City AS T2 ON T1.city_code = T2.city_code GROUP BY T2.state HAVING COUNT(T1.StuID) > 5
SELECT StuID FROM Student WHERE city_code NOT IN ( SELECT city_code FROM City WHERE country = 'USA' )
SELECT StuID FROM Student WHERE city_code NOT IN (SELECT city_code FROM City WHERE country = 'USA')
SELECT StuID FROM Student WHERE Sex = 'F' AND city_code IN ( SELECT city_code FROM City WHERE state = 'PA' )
SELECT StuID FROM Student WHERE Sex = 'F' AND city_code IN ( SELECT city_code FROM City WHERE state = 'PA' )
SELECT StuID FROM Student WHERE Sex = 'M' AND city_code NOT IN (SELECT city_code FROM City WHERE country = 'USA')
SELECT StuID FROM Student WHERE Sex = 'M' AND city_code NOT IN (SELECT city_code FROM City WHERE country = 'USA')
SELECT T1.distance FROM Direct_distance AS T1 INNER JOIN City AS T2 ON T1.city1_code = T2.city_code INNER JOIN City AS T3 ON T1.city2_code = T3.city_code WHERE T2.city_name = 'BAL' AND T3.city_name = 'CHI'
SELECT T1.distance FROM Direct_distance AS T1 INNER JOIN City AS T2 ON T1.city1_code = T2.city_code INNER JOIN City AS T3 ON T1.city2_code = T3.city_code WHERE T2.city_name = 'BAL' AND T3.city_name = 'CHI'
SELECT T1.distance FROM Direct_distance AS T1 INNER JOIN City AS T2 ON T1.city1_code = T2.city_code WHERE T2.city_name = 'Boston' AND T1.city2_code = ( SELECT city_code FROM City WHERE city_name = 'Newark' )
SELECT T1.distance FROM Direct_distance AS T1 INNER JOIN City AS T2 ON T1.city1_code = T2.city_code WHERE T2.city_name = 'Boston' AND T2.city_name = 'Newark'
SELECT AVG(distance), MIN(distance), MAX(distance) FROM Direct_distance
SELECT AVG(distance), MIN(distance), MAX(distance) FROM Direct_distance
SELECT city2_code FROM Direct_distance WHERE distance = ( SELECT MAX(distance) FROM Direct_distance )
SELECT city2_code FROM Direct_distance WHERE distance = ( SELECT MAX(distance) FROM Direct_distance )
SELECT city2_code FROM Direct_distance WHERE distance > ( SELECT AVG(distance) FROM Direct_distance )
SELECT city2_code FROM Direct_distance WHERE distance > ( SELECT AVG(distance) FROM Direct_distance )
SELECT city2_code FROM Direct_distance WHERE distance < 1000
SELECT city2_code FROM Direct_distance WHERE distance < 1000
SELECT SUM(T1.distance) FROM Direct_distance AS T1 INNER JOIN City AS T2 ON T1.city1_code = T2.city_code WHERE T2.city_name = 'BAL'
SELECT SUM(T1.distance) FROM Direct_distance AS T1 INNER JOIN City AS T2 ON T1.city1_code = T2.city_code WHERE T2.city_name = 'BAL'
SELECT AVG(T1.distance) FROM Direct_distance AS T1 INNER JOIN City AS T2 ON T1.city1_code = T2.city_code WHERE T2.city_name = 'Boston'
SELECT AVG(T1.distance) FROM Direct_distance AS T1 INNER JOIN City AS T2 ON T1.city1_code = T2.city_code WHERE T2.city_name = 'Boston'
SELECT T2.city_name FROM Direct_distance AS T1 INNER JOIN City AS T2 ON T1.city1_code = T2.city_code WHERE T2.city_name = 'Chicago' ORDER BY T1.distance LIMIT 1
SELECT city_name FROM City WHERE latitude = ( SELECT latitude FROM City WHERE city_name = 'Chicago' )
SELECT T2.city_name FROM Direct_distance AS T1 INNER JOIN City AS T2 ON T1.city1_code = T2.city_code WHERE T2.city_name = 'Boston' ORDER BY T1.distance DESC LIMIT 1
SELECT T2.city_name FROM Direct_distance AS T1 INNER JOIN City AS T2 ON T1.city1_code = T2.city_code WHERE T2.city_name = 'Boston' ORDER BY T1.distance DESC LIMIT 1
SELECT city_code, SUM(distance) FROM Direct_distance GROUP BY city_code
SELECT city_code, SUM(distance) FROM Direct_distance GROUP BY city_code
SELECT T1.city_name, AVG(T2.distance) FROM City AS T1 INNER JOIN Direct_distance AS T2 ON T1.city_code = T2.city1_code GROUP BY T1.city_name
SELECT T2.city_name, AVG(T1.distance) FROM Direct_distance AS T1 INNER JOIN City AS T2 ON T1.city1_code = T2.city_code GROUP BY T2.city_name
SELECT T1.distance FROM Direct_distance AS T1 INNER JOIN Student AS T2 ON T1.city1_code = T2.city_code WHERE T2.Fname = 'Linda' AND T2.LName = 'Smith' INTERSECT SELECT T1.distance FROM Direct_distance AS T1 INNER JOIN Student AS T2 ON T1.city1_code = T2.city_code WHERE T2.Fname = 'Tracy' AND T2.LName = 'Kim'
SELECT T1.distance
SELECT T1.Fname, T1.LName FROM Student AS T1 INNER JOIN Direct_distance AS T2 ON T1.city_code = T2.city1_code WHERE T1.LName = 'Smith' AND T1.Fname = 'Linda' ORDER BY T2.distance DESC LIMIT 1
SELECT T1.Fname, T1.LName FROM Student AS T1 INNER JOIN Direct_distance AS T2 ON T1.city_code = T2.city1_code WHERE T1.LName = 'Smith' AND T1.Fname = 'Linda' ORDER BY T2.distance DESC LIMIT 1
SELECT T2.state FROM Student AS T1 INNER JOIN City AS T2 ON T1.city_code = T2.city_code WHERE T1.Fname = 'Linda'
SELECT T2.state FROM Student AS T1 INNER JOIN City AS T2 ON T1.city_code = T2.city_code WHERE T1.Fname = 'Linda'
SELECT * FROM Sailors WHERE age > 30
SELECT name, rating, age FROM Sailors WHERE age > 30
SELECT name, age FROM Sailors WHERE age < 30
SELECT name, age FROM Sailors WHERE age < 30
SELECT T2.name FROM Sailors AS T1 INNER JOIN Reserves AS T2 ON T1.sid = T2.sid INNER JOIN Boats AS T3 ON T2.bid = T3.bid WHERE T1.sid = 1
SELECT bid FROM Reserves WHERE sid = 1
SELECT name FROM Sailors AS T1 INNER JOIN Reserves AS T2 ON T1.sid = T2.sid WHERE T2.bid = 102
SELECT T1.name FROM Sailors AS T1 INNER JOIN Reserves AS T2 ON T1.sid = T2.sid WHERE T2.bid = 102
SELECT bid FROM Reserves
SELECT bid FROM Reserves
SELECT name FROM Sailors WHERE name LIKE '%e%'
SELECT name FROM Sailors WHERE name LIKE '%e%'
SELECT sid FROM Sailors WHERE age > ( SELECT MAX(age) FROM Sailors )
SELECT sid FROM Sailors WHERE age > ( SELECT MIN(age) FROM Sailors )
SELECT name FROM Sailors WHERE age > ( SELECT MAX(age) FROM Sailors WHERE rating > 7 )
SELECT DISTINCT name FROM Sailors WHERE age > ( SELECT MIN(age) FROM Sailors WHERE rating > 7 )
SELECT T1.sid, T1.name FROM Sailors AS T1 INNER JOIN Reserves AS T2 ON T1.sid = T2.sid
SELECT T1.sid, T1.name FROM Sailors AS T1 INNER JOIN Reserves AS T2 ON T1.sid = T2.sid
SELECT sid, name FROM Sailors WHERE sid IN ( SELECT sid FROM Reserves GROUP BY sid HAVING COUNT(bid) > 1 )
SELECT name FROM Sailors WHERE sid IN ( SELECT sid FROM Reserves GROUP BY sid HAVING COUNT(bid)  >= 2 )
SELECT T1.sid
SELECT T1.sid
SELECT T1.sid, T1.name
SELECT T1.name, T1.sid
SELECT T1.sid
SELECT T1.sid
SELECT T1.sid, T1.name
SELECT T1.name, T1.sid
SELECT sid FROM Sailors WHERE sid NOT IN ( SELECT sid FROM Reserves )
SELECT sid FROM Sailors WHERE sid NOT IN (SELECT sid FROM Reserves)
SELECT name, sid FROM Sailors WHERE sid NOT IN (SELECT sid FROM Reserves)
SELECT name, sid FROM Sailors WHERE sid NOT IN (SELECT sid FROM Reserves)
SELECT sid FROM Sailors WHERE sid NOT IN (SELECT sid FROM Reserves)
SELECT sid FROM Sailors WHERE sid NOT IN (SELECT sid FROM Reserves)
SELECT T1.name FROM Sailors AS T1 INNER JOIN Reserves AS T2 ON T1.sid = T2.sid WHERE T2.bid = 103
SELECT T1.name FROM Sailors AS T1 INNER JOIN Reserves AS T2 ON T1.sid = T2.sid WHERE T2.bid = 103
SELECT name FROM Sailors WHERE rating > ( SELECT MAX(rating) FROM Sailors WHERE name = 'Luis' )
SELECT name FROM Sailors WHERE rating > ( SELECT MAX(rating) FROM Sailors WHERE name = 'Luis' )
SELECT name FROM Sailors WHERE rating > ( SELECT MAX(rating) FROM Sailors WHERE name = 'Luis' )
SELECT name FROM Sailors WHERE rating > ( SELECT MAX(rating) FROM Sailors WHERE name = 'Luis' )
SELECT T1.sid, T1.name FROM Sailors AS T1 INNER JOIN Reserves AS T2 ON T1.sid = T2.sid WHERE T1.rating > 2
SELECT T1.sid, T1.name FROM Sailors AS T1 INNER JOIN Reserves AS T2 ON T1.sid = T2.sid WHERE T1.rating >= 3
SELECT name, age FROM Sailors ORDER BY age DESC LIMIT 1
SELECT name, age FROM Sailors WHERE age = ( SELECT MAX(age) FROM Sailors )
SELECT COUNT(sid) FROM Sailors
SELECT COUNT(sid) FROM Sailors
SELECT AVG(age) FROM Sailors WHERE rating = 7
SELECT AVG(age) FROM Sailors WHERE rating = 7
SELECT COUNT(*) FROM Sailors WHERE name LIKE 'D%'
SELECT COUNT(*) FROM Sailors WHERE name LIKE 'D%'
SELECT AVG(rating), MAX(age) FROM Sailors
SELECT AVG(rating), MAX(age) FROM Sailors
SELECT COUNT(*),  T2.name FROM Reserves AS T1 INNER JOIN Boats AS T2 ON T1.bid = T2.bid GROUP BY T2.name
SELECT name, COUNT(*) FROM Boats AS T1 INNER JOIN Reserves AS T2 ON T1.bid = T2.bid GROUP BY T1.name
SELECT COUNT(*) FROM Reserves AS T1 INNER JOIN Boats AS T2 ON T1.bid = T2.bid WHERE T2.bid > 50 GROUP BY T2.bid
SELECT COUNT(T2.sid), T1.name
SELECT COUNT(*) FROM Reserves AS T1 JOIN Boats AS T2 ON T1.bid = T2.bid GROUP BY T2.bid HAVING COUNT(T1.sid) > 1
SELECT name FROM Boats WHERE bid IN ( SELECT bid FROM Reserves GROUP BY bid HAVING COUNT(sid) > 1 )
SELECT COUNT(T2.bid), T2.bid FROM Sailors AS T1 INNER JOIN Reserves AS T2 ON T1.sid = T2.sid WHERE T1.sid > 1 GROUP BY T2.bid
SELECT COUNT(T2.bid), T2.name
SELECT T1.rating, AVG(T1.age) FROM Sailors AS T1 INNER JOIN Reserves AS T2 ON T1.sid = T2.sid INNER JOIN Boats AS T3 ON T2.bid = T3.bid WHERE T3.color ='red' GROUP BY T1.rating
SELECT T1.rating, AVG(T1.age) FROM Sailors AS T1 INNER JOIN Reserves AS T2 ON T1.sid = T2.sid INNER JOIN Boats AS T3 ON T2.bid = T3.bid WHERE T3.color ='red' GROUP BY T1.rating
SELECT name, rating, age FROM Sailors ORDER BY rating, age
SELECT name, rating, age FROM Sailors ORDER BY rating, age
SELECT COUNT(bid) FROM Boats
SELECT COUNT(bid) FROM Boats
SELECT COUNT(*) FROM Boats WHERE color ='red'
SELECT COUNT(*) FROM Boats WHERE color ='red'
SELECT T2.name
SELECT T2.name FROM Sailors AS T1 INNER JOIN Reserves AS T2 ON T1.sid = T2.sid INNER JOIN Boats AS T3 ON T2.bid = T3.bid WHERE T1.age BETWEEN 20 AND 30
SELECT name FROM Sailors WHERE rating > ( SELECT MAX(rating) FROM Sailors WHERE sid IN ( SELECT sid FROM Reserves WHERE bid IN ( SELECT bid FROM Boats WHERE color ='red' ) ) )
SELECT name FROM Sailors WHERE rating > ( SELECT MAX(rating) FROM Sailors WHERE sid IN ( SELECT sid FROM Reserves WHERE bid IN ( SELECT bid FROM Boats WHERE color ='red' ) ) )
SELECT MAX(rating) FROM Sailors
SELECT MAX(rating) FROM Sailors
SELECT T1.name FROM Sailors AS T1 INNER JOIN Reserves AS T2 ON T1.sid = T2.sid INNER JOIN Boats AS T3 ON T2.bid = T3.bid WHERE T3.name = 'Melon'
SELECT T1.name FROM Sailors AS T1 INNER JOIN Reserves AS T2 ON T1.sid = T2.sid INNER JOIN Boats AS T3 ON T2.bid = T3.bid WHERE T3.name = 'Melon'
SELECT name, age FROM Sailors ORDER BY rating DESC
SELECT name, age FROM Sailors ORDER BY rating DESC
SELECT Model FROM headphone ORDER BY Price DESC LIMIT 1
SELECT Model FROM headphone ORDER BY Price DESC LIMIT 1
SELECT Model FROM headphone ORDER BY Model ASC
SELECT DISTINCT Model FROM headphone ORDER BY Model ASC
SELECT Class FROM headphone GROUP BY Class ORDER BY COUNT(Class) DESC LIMIT 1
SELECT Class FROM headphone GROUP BY Class ORDER BY COUNT(Headphone_ID) DESC LIMIT 1
SELECT Class FROM headphone GROUP BY Class HAVING COUNT(Headphone_ID) > 2
SELECT Class FROM headphone GROUP BY Class HAVING COUNT(Headphone_ID) <= 2
SELECT Class, COUNT(*) FROM headphone WHERE Price > 200 GROUP BY Class
SELECT Class, COUNT(*) FROM headphone WHERE Price > 200 GROUP BY Class
SELECT COUNT(DISTINCT Earpads) FROM headphone
SELECT COUNT(DISTINCT Earpads) FROM headphone
SELECT Earpads FROM headphone GROUP BY Earpads ORDER BY COUNT(Earpads) DESC LIMIT 2
SELECT Earpads FROM headphone GROUP BY Earpads ORDER BY COUNT(Earpads) DESC LIMIT 2
SELECT Model, Class, Construction FROM headphone ORDER BY Price ASC LIMIT 1
SELECT Model, Class, Construction FROM headphone ORDER BY Price ASC LIMIT 1
SELECT Construction, AVG(Price) FROM headphone GROUP BY Construction
SELECT AVG(Price) FROM headphone GROUP BY Construction
SELECT Class FROM headphone WHERE Earpads = 'Bowls' INTERSECT SELECT Class FROM headphone WHERE Earpads = 'Comfort Pads'
SELECT Class FROM headphone WHERE Earpads = 'Bowls' INTERSECT SELECT Class FROM headphone WHERE Earpads = 'Comfort Pads'
SELECT Earpads FROM headphone WHERE Construction!= 'Plastic'
SELECT Earpads FROM headphone WHERE Construction!= 'Plastic'
SELECT Model FROM headphone WHERE Price < ( SELECT AVG(Price) FROM headphone )
SELECT Model FROM headphone WHERE Price < ( SELECT AVG(Price) FROM headphone )
SELECT Name FROM store ORDER BY Date_Opened
SELECT Name FROM store ORDER BY Date_Opened
SELECT Name, Parking FROM store WHERE Neighborhood = 'Tarzana'
SELECT Name, Parking FROM store WHERE Neighborhood = 'Tarzana'
SELECT COUNT(DISTINCT Neighborhood) FROM store
SELECT COUNT(DISTINCT Neighborhood) FROM store
SELECT Neighborhood, COUNT(*) FROM store GROUP BY Neighborhood
SELECT Neighborhood, COUNT(*) FROM store GROUP BY Neighborhood
SELECT T2.Name, SUM(T1.Quantity) FROM stock AS T1 INNER JOIN store AS T2 ON T1.Store_ID = T2.Store_ID GROUP BY T2.Store_ID ORDER BY SUM(T1.Quantity) DESC LIMIT 1
SELECT T2.Name, SUM(T1.Quantity) FROM stock AS T1 INNER JOIN store AS T2 ON T1.Store_ID = T2.Store_ID GROUP BY T2.Name
SELECT Name FROM store WHERE Store_ID NOT IN (SELECT Store_ID FROM stock)
SELECT T2.Name FROM stock AS T1 INNER JOIN store AS T2 ON T1.Store_ID = T2.Store_ID WHERE T1.Headphone_ID IS NULL
SELECT Model FROM headphone WHERE Headphone_ID NOT IN (SELECT Headphone_ID FROM stock)
SELECT Model FROM headphone WHERE Headphone_ID NOT IN (SELECT Headphone_ID FROM stock)
SELECT T1.Model FROM headphone AS T1 INNER JOIN stock AS T2 ON T1.Headphone_ID = T2.Headphone_ID GROUP BY T1.Model ORDER BY SUM(T2.Quantity) DESC LIMIT 1
SELECT T1.Model FROM headphone AS T1 INNER JOIN stock AS T2 ON T1.Headphone_ID = T2.Headphone_ID GROUP BY T1.Model ORDER BY SUM(T2.Quantity) DESC LIMIT 1
SELECT COUNT(T2.Headphone_ID)
SELECT SUM(T2.Quantity) FROM store AS T1 INNER JOIN stock AS T2 ON T1.Store_ID = T2.Store_ID WHERE T1.Name = 'Woodman'
SELECT T2.Name FROM stock AS T1 INNER JOIN store AS T2 ON T1.Store_ID = T2.Store_ID WHERE T1.Headphone_ID IS NULL
SELECT T2.Name FROM stock AS T1 INNER JOIN store AS T2 ON T1.Store_ID = T2.Store_ID WHERE T1.Headphone_ID IS NULL
SELECT COUNT(author_id) FROM Author
SELECT COUNT(author_id) FROM Author
SELECT COUNT(paper_id) FROM Paper
SELECT COUNT(paper_id) FROM Paper
SELECT COUNT(*) FROM Affiliation
SELECT COUNT(*) FROM Affiliation
SELECT COUNT(paper_id) FROM Paper WHERE venue = 'NAACL 2000'
SELECT COUNT(paper_id) FROM Paper WHERE venue = 'NAACL 2000'
SELECT COUNT(paper_id) FROM Paper AS T1 INNER JOIN Author_list AS T2 ON T1.paper_id = T2.paper_id INNER JOIN Author AS T3 ON T2.author_id = T3.author_id INNER JOIN Affiliation AS T4 ON T3.affiliation_id = T4.affiliation_id WHERE T1.year = 2009 AND T4.name = 'Columbia University'
SELECT COUNT(paper_id)
SELECT name, address FROM Affiliation
SELECT name, address FROM Affiliation
SELECT venue, year FROM Paper ORDER BY year
SELECT DISTINCT venue FROM Paper ORDER BY year
SELECT T1.title, T1.paper_id
SELECT T1.title, T1.paper_id
SELECT p.paper_id, p.title FROM Paper p INNER JOIN Author_list al ON p.paper_id = al.paper_id INNER JOIN Author a ON al.author_id = a.author_id WHERE a.name = 'Mckeown'
SELECT T1.title, T1.paper_id FROM Paper AS T1 INNER JOIN Author_list AS T2 ON T1.paper_id = T2.paper_id INNER JOIN Author AS T3 ON T2.author_id = T3.author_id WHERE T3.name = 'Mckeown'
SELECT p.paper_id, p.title
SELECT T1.title, T1.paper_id
SELECT p.paper_id, p.title FROM Paper p INNER JOIN Author_list al ON p.paper_id = al.paper_id INNER JOIN Author a1 ON al.author_id = a1.author_id INNER JOIN Author_list al2 ON p.paper_id = al2.paper_id INNER JOIN Author a2 ON al2.author_id = a2.author_id WHERE a1.name = 'Mckeown, Kathleen' AND a2.name = 'Rambow, Owen'
SELECT T1.title, T1.paper_id
SELECT T1.title, T1.paper_id
SELECT T1.title, T1.paper_id
SELECT T1.title, T1.paper_id
SELECT T1.title, T1.paper_id
SELECT name, COUNT(paper_id) FROM Author_list GROUP BY author_id ORDER BY COUNT(paper_id) DESC
SELECT COUNT(paper_id), a.author_id, a.name FROM Author_list AS al INNER JOIN Author AS a ON al.author_id = a.author_id GROUP BY al.author_id ORDER BY COUNT(paper_id) DESC
SELECT name FROM Affiliation ORDER BY (SELECT COUNT(*) FROM Author_list WHERE affiliation_id = Affiliation.affiliation_id) ASC
SELECT T1.name FROM Affiliation AS T1 INNER JOIN Author_list AS T2 ON T1.affiliation_id = T2.affiliation_id GROUP BY T1.affiliation_id ORDER BY COUNT(T2.paper_id) DESC
SELECT T2.name FROM Author_list AS T1 INNER JOIN Author AS T2 ON T1.author_id = T2.author_id GROUP BY T1.author_id HAVING COUNT(T1.paper_id) > 50
SELECT T2.name FROM Author_list AS T1 INNER JOIN Author AS T2 ON T1.author_id = T2.author_id GROUP BY T1.author_id HAVING COUNT(T1.paper_id) > 50
SELECT name FROM Author WHERE author_id IN ( SELECT author_id FROM Author_list GROUP BY author_id HAVING COUNT(paper_id) = 1 )
SELECT T2.name FROM Paper AS T1 INNER JOIN Author_list AS T2 ON T1.paper_id = T2.paper_id INNER JOIN Author AS T3 ON T2.author_id = T3.author_id GROUP BY T2.author_id HAVING COUNT(T1.paper_id) = 1
SELECT venue, year FROM Paper GROUP BY venue, year ORDER BY COUNT(paper_id) DESC LIMIT 1
SELECT venue, year FROM Paper GROUP BY venue, year ORDER BY COUNT(paper_id) DESC LIMIT 1
SELECT venue FROM Paper GROUP BY venue ORDER BY COUNT(paper_id) ASC LIMIT 1
SELECT venue FROM Paper GROUP BY venue ORDER BY COUNT(paper_id) ASC LIMIT 1
SELECT COUNT(*) FROM Citation WHERE cited_paper_id = 'A00-1002'
SELECT COUNT(paper_id) FROM Citation WHERE cited_paper_id = 'A00-1002'
SELECT COUNT(cited_paper_id) FROM Citation WHERE paper_id = ( SELECT paper_id FROM Paper WHERE paper_id = 'D12-1027' )
SELECT COUNT(*) FROM Citation WHERE cited_paper_id IN ( SELECT paper_id FROM Paper WHERE paper_id = 'D12-1027' )
SELECT paper_id, COUNT(cited_paper_id) FROM Citation GROUP BY paper_id ORDER BY COUNT(cited_paper_id) DESC LIMIT 1
SELECT paper_id, COUNT(cited_paper_id) FROM Citation GROUP BY paper_id ORDER BY COUNT(cited_paper_id) DESC LIMIT 1
SELECT title FROM Paper WHERE paper_id IN ( SELECT cited_paper_id FROM Citation GROUP BY cited_paper_id ORDER BY COUNT(cited_paper_id) DESC LIMIT 1 )
SELECT T1.title FROM Paper AS T1 INNER JOIN Citation AS T2 ON T1.paper_id = T2.paper_id GROUP BY T1.paper_id ORDER BY COUNT(T2.cited_paper_id) DESC LIMIT 1
SELECT p.title, COUNT(c.cited_paper_id) AS num_citations
SELECT title, COUNT(cited_paper_id) FROM Paper JOIN Citation ON Paper.paper_id = Citation.paper_id GROUP BY paper_id ORDER BY COUNT(cited_paper_id) DESC LIMIT 10
SELECT COUNT(T2.cited_paper_id) FROM Author AS T1 INNER JOIN Citation AS T2 ON T1.author_id = T2.paper_id INNER JOIN Paper AS T3 ON T2.cited_paper_id = T3.paper_id WHERE T1.name = 'Mckeown, Kathleen'
SELECT COUNT(T2.cited_paper_id)
SELECT COUNT(T1.paper_id) FROM Citation AS T1 INNER JOIN Paper AS T2 ON T1.paper_id = T2.paper_id INNER JOIN Author AS T3 ON T2.paper_id = T3.author_id WHERE T3.name = 'Mckeown, Kathleen'
SELECT COUNT(T2.paper_id)
SELECT T1.name, COUNT(T2.paper_id) FROM Author AS T1 INNER JOIN Citation AS T2 ON T1.author_id = T2.paper_id GROUP BY T1.author_id ORDER BY COUNT(T2.paper_id) DESC LIMIT 1
SELECT T1.name, COUNT(T2.paper_id) FROM Author AS T1 INNER JOIN Paper AS T2 ON T1.author_id = T2.author_id WHERE T1.author_id IN ( SELECT T1.author_id FROM Author AS T1 INNER JOIN Citation AS T2 ON T1.author_id = T2.paper_id GROUP BY T1.author_id ORDER BY COUNT(T2.paper_id) DESC LIMIT 1 )
SELECT T1.venue, T1.year FROM Paper AS T1 INNER JOIN Author_list AS T2 ON T1.paper_id = T2.paper_id INNER JOIN Author AS T3 ON T2.author_id = T3.author_id WHERE T3.name = 'Mckeown, Kathleen'
SELECT T1.venue, T1.year
SELECT T1.venue, T1.year
SELECT T1.venue, T1.year
SELECT T1.name FROM Author AS T1 INNER JOIN Author_list AS T2 ON T1.author_id = T2.author_id INNER JOIN Paper AS T3 ON T2.paper_id = T3.paper_id WHERE T3.year = 2009 GROUP BY T1.name ORDER BY COUNT(T1.name) DESC LIMIT 1
SELECT T1.name FROM Author AS T1 INNER JOIN Author_list AS T2 ON T1.author_id = T2.author_id INNER JOIN Paper AS T3 ON T2.paper_id = T3.paper_id WHERE T3.year = 2009 GROUP BY T1.name ORDER BY COUNT(T2.paper_id) DESC LIMIT 1
SELECT T1.name FROM Affiliation AS T1 INNER JOIN Author_list AS T2 ON T1.affiliation_id = T2.affiliation_id INNER JOIN Paper AS T3 ON T2.paper_id = T3.paper_id WHERE T3.year = 2009 GROUP BY T1.name ORDER BY COUNT(T1.name) DESC LIMIT 3
SELECT name FROM Affiliation WHERE affiliation_id IN ( SELECT affiliation_id FROM Author_list AS T1 INNER JOIN Paper AS T2 ON T1.paper_id = T2.paper_id WHERE T2.year = 2009 GROUP BY T1.affiliation_id ORDER BY COUNT(T1.paper_id) DESC LIMIT 3 )
SELECT COUNT(p.paper_id) FROM Author_list a JOIN Affiliation af ON a.affiliation_id = af.affiliation_id JOIN Paper p ON a.paper_id = p.paper_id WHERE af.name = 'Columbia University' AND p.year <= 2009
SELECT COUNT(p.paper_id)
SELECT COUNT(p.paper_id) FROM Author_list a JOIN Affiliation af ON a.affiliation_id = af.affiliation_id JOIN Paper p ON a.paper_id = p.paper_id WHERE af.name = 'Stanford University' AND p.year BETWEEN 2000 AND 2009
SELECT COUNT(p.paper_id)
SELECT T1.title FROM Paper AS T1 INNER JOIN Author_list AS T2 ON T1.paper_id = T2.paper_id GROUP BY T1.paper_id ORDER BY COUNT(T2.author_id) DESC LIMIT 1
SELECT T1.title FROM Paper AS T1 INNER JOIN Author_list AS T2 ON T1.paper_id = T2.paper_id GROUP BY T1.paper_id ORDER BY COUNT(T2.author_id) DESC LIMIT 1
SELECT COUNT(DISTINCT T2.author_id) FROM Author AS T1 INNER JOIN Author_list AS T2 ON T1.author_id = T2.author_id WHERE T1.name = 'Mckeown, Kathleen'
SELECT COUNT(DISTINCT a2.author_id) FROM Author_list AS a1 INNER JOIN Author_list AS a2 ON a1.paper_id = a2.paper_id INNER JOIN Author AS a ON a1.author_id = a.author_id WHERE a.name = 'Mckeown, Kathleen'
SELECT T2.name FROM Author_list AS T1 INNER JOIN Author AS T2 ON T1.author_id = T2.author_id INNER JOIN Author AS T3 ON T3.author_id = T1.author_id WHERE T3.name = 'Mckeown, Kathleen' GROUP BY T2.name ORDER BY COUNT(T1.paper_id) DESC LIMIT 1
SELECT T2.name FROM Author_list AS T1 INNER JOIN Author AS T2 ON T1.author_id = T2.author_id INNER JOIN Author AS T3 ON T3.author_id = ( SELECT author_id FROM Author WHERE name = 'Mckeown, Kathleen' ) WHERE T1.author_id = T3.author_id GROUP BY T2.name ORDER BY COUNT(T1.paper_id) DESC LIMIT 1
SELECT paper_id FROM Paper WHERE title LIKE '%translation%'
SELECT paper_id FROM Paper WHERE title LIKE '%translation%'
SELECT p.paper_id, p.title
SELECT paper_id, title FROM Paper WHERE paper_id NOT IN (SELECT cited_paper_id FROM Citation)
SELECT T1.name FROM Affiliation AS T1 INNER JOIN Author_list AS T2 ON T1.affiliation_id = T2.affiliation_id GROUP BY T1.affiliation_id ORDER BY COUNT(T2.paper_id) DESC LIMIT 1
SELECT T1.name FROM Affiliation AS T1 INNER JOIN Author_list AS T2 ON T1.affiliation_id = T2.affiliation_id INNER JOIN Paper AS T3 ON T2.paper_id = T3.paper_id WHERE T1.address LIKE '%China%' GROUP BY T1.name ORDER BY COUNT(T3.paper_id) DESC LIMIT 1
SELECT venue, year, COUNT(paper_id) FROM Paper GROUP BY venue, year
SELECT venue, year, COUNT(paper_id) FROM Paper GROUP BY venue, year
SELECT COUNT(paper_id), affiliation_id FROM Author_list GROUP BY affiliation_id
SELECT name, COUNT(paper_id) FROM Affiliation AS T1 INNER JOIN Author_list AS T2 ON T1.affiliation_id = T2.affiliation_id GROUP BY T1.name
SELECT title FROM Paper WHERE paper_id IN ( SELECT cited_paper_id FROM Citation GROUP BY cited_paper_id HAVING COUNT(cited_paper_id) > 50 )
SELECT title FROM Paper WHERE paper_id IN ( SELECT cited_paper_id FROM Citation GROUP BY cited_paper_id HAVING COUNT(cited_paper_id) > 50 )
SELECT COUNT(DISTINCT T1.author_id) FROM Author AS T1 LEFT JOIN Paper AS T2 ON T1.author_id = T2.author_id LEFT JOIN Citation AS T3 ON T2.paper_id = T3.paper_id GROUP BY T1.author_id HAVING COUNT(T3.paper_id) <= 50
SELECT COUNT(DISTINCT author_id) FROM Author WHERE author_id NOT IN ( SELECT author_id FROM Paper WHERE paper_id IN ( SELECT cited_paper_id FROM Citation GROUP BY cited_paper_id HAVING COUNT(cited_paper_id) > 50 ) );
SELECT T1.name
SELECT T1.name FROM Author AS T1 INNER JOIN Author_list AS T2 ON T1.author_id = T2.author_id INNER JOIN Paper AS T3 ON T2.paper_id = T3.paper_id WHERE T3.year = 2009 AND T1.name IN ( SELECT T1.name FROM Author AS T1 INNER JOIN Author_list AS T2 ON T1.author_id = T2.author_id INNER JOIN Paper AS T3 ON T2.paper_id = T3.paper_id WHERE T3.year = 2009 AND T1.name LIKE 'NAACL%' ) AND T1.name IN ( SELECT T1.name FROM Author AS T1 INNER JOIN Author_list AS T2 ON T1.author_id = T2.author_id INNER JOIN Paper AS T3 ON T2.paper_id = T3.paper_id WHERE T3.year = 2009 AND T1.name LIKE 'ACL%' )
SELECT name FROM Author WHERE author_id NOT IN ( SELECT author_id FROM Author_list WHERE paper_id IN ( SELECT paper_id FROM Paper WHERE venue = 'ACL' ) )
SELECT name FROM Author WHERE author_id NOT IN ( SELECT author_id FROM Author_list WHERE venue = 'ACL' )
SELECT COUNT(Conference_ID) FROM conference
SELECT COUNT(Conference_ID) FROM conference
SELECT DISTINCT Conference_Name FROM conference
SELECT DISTINCT Conference_Name FROM conference
SELECT Conference_Name, Year, Location FROM conference
SELECT Conference_Name, Year, Location FROM conference
SELECT Conference_Name, COUNT(*) FROM conference GROUP BY Conference_Name
SELECT Conference_Name, COUNT(*) FROM conference GROUP BY Conference_Name
SELECT Year, COUNT(Conference_ID) FROM conference GROUP BY Year
SELECT COUNT(DISTINCT Year) FROM conference
SELECT Year FROM conference GROUP BY Year ORDER BY COUNT(Conference_ID) ASC LIMIT 1
SELECT Year FROM conference GROUP BY Year ORDER BY COUNT(Conference_ID) ASC LIMIT 1
SELECT Location FROM conference GROUP BY Location HAVING COUNT(Conference_ID) >= 2
SELECT Location FROM conference GROUP BY Location HAVING COUNT(Conference_ID) >= 2
SELECT Institution_Name, Location, Founded FROM institution
SELECT Institution_Name, Location, Founded FROM institution
SELECT COUNT(*) FROM institution WHERE Founded BETWEEN 1850 AND 1900
SELECT COUNT(*) FROM institution WHERE Founded BETWEEN 1850 AND 1900
SELECT Institution_Name, Location FROM institution ORDER BY Founded DESC LIMIT 1
SELECT Institution_Name, Location FROM institution ORDER BY Founded DESC LIMIT 1
SELECT T1.Institution_Name, COUNT(T2.staff_ID) FROM institution AS T1 INNER JOIN staff AS T2 ON T1.Institution_ID = T2.Institution_ID WHERE T1.Founded > 1800 GROUP BY T1.Institution_Name
SELECT T1.Institution_ID, COUNT(T2.name), T2.name FROM institution AS T1 INNER JOIN staff AS T2 ON T1.Institution_ID = T2.Institution_ID WHERE T1.Founded > 1800 GROUP BY T1.Institution_ID, T2.name
SELECT T2.Institution_Name
SELECT Institution_Name FROM institution WHERE Institution_ID NOT IN (SELECT Institution_ID FROM staff)
SELECT name FROM staff WHERE Age > ( SELECT AVG(Age) FROM staff )
SELECT name FROM staff WHERE Age > ( SELECT AVG(Age) FROM staff )
SELECT MAX(Age), MIN(Age) FROM staff WHERE Nationality = 'United States'
SELECT MAX(Age), MIN(Age) FROM staff
SELECT T1.Conference_Name
SELECT T1.Conference_Name FROM conference AS T1 INNER JOIN conference_participation AS T2 ON T1.Conference_ID = T2.Conference_ID INNER JOIN staff AS T3 ON T2.staff_ID = T3.staff_ID WHERE T3.Nationality = 'Canada'
SELECT T1.name FROM staff AS T1 INNER JOIN conference_participation AS T2 ON T1.staff_ID = T2.staff_ID INNER JOIN conference_participation AS T3 ON T1.staff_ID = T3.staff_ID WHERE T2.role ='speaker' AND T3.role ='sponsor'
SELECT T1.name FROM staff AS T1 INNER JOIN conference_participation AS T2 ON T1.staff_ID = T2.staff_ID INNER JOIN conference_participation AS T3 ON T1.staff_ID = T3.staff_ID WHERE T2.role ='speaker' AND T3.role ='sponsor'
SELECT name FROM staff WHERE staff_ID IN ( SELECT staff_ID FROM conference_participation WHERE Conference_ID IN ( SELECT Conference_ID FROM conference WHERE Conference_Name = 'ACL' ) INTERSECT SELECT staff_ID FROM conference_participation WHERE Conference_ID IN ( SELECT Conference_ID FROM conference WHERE Conference_Name = 'NACCL' ) )
SELECT T2.name FROM conference AS T1 INNER JOIN conference_participation AS T2 ON T1.Conference_ID = T2.Conference_ID INNER JOIN staff AS T3 ON T2.staff_ID = T3.staff_ID WHERE T1.Conference_Name = 'ACL' INTERSECT SELECT T2.name FROM conference AS T1 INNER JOIN conference_participation AS T2 ON T1.Conference_ID = T2.Conference_ID INNER JOIN staff AS T3 ON T2.staff_ID = T3.staff_ID WHERE T1.Conference_Name = 'NACCL'
SELECT T2.name FROM conference AS T1 INNER JOIN conference_participation AS T2 ON T1.Conference_ID = T2.Conference_ID INNER JOIN staff AS T3 ON T2.staff_ID = T3.staff_ID WHERE T1.Year BETWEEN 2003 AND 2004
SELECT T2.name FROM conference AS T1 INNER JOIN conference_participation AS T2 ON T1.Conference_ID = T2.Conference_ID INNER JOIN staff AS T3 ON T2.staff_ID = T3.staff_ID WHERE T1.Year BETWEEN 2003 AND 2004
SELECT T1.Conference_Name, T1.Year, COUNT(T2.staff_ID) FROM conference AS T1 INNER JOIN conference_participation AS T2 ON T1.Conference_ID = T2.Conference_ID GROUP BY T1.Conference_ID
SELECT T1.Conference_ID, T1.Conference_Name, T1.Year, COUNT(T3.staff_ID) FROM conference AS T1 INNER JOIN conference_participation AS T2 ON T1.Conference_ID = T2.Conference_ID INNER JOIN staff AS T3 ON T2.staff_ID = T3.staff_ID GROUP BY T1.Conference_ID
SELECT T1.Conference_Name FROM conference AS T1 INNER JOIN conference_participation AS T2 ON T1.Conference_ID = T2.Conference_ID GROUP BY T1.Conference_ID ORDER BY COUNT(T2.staff_ID) DESC LIMIT 2
SELECT T1.Conference_Name FROM conference AS T1 INNER JOIN conference_participation AS T2 ON T1.Conference_ID = T2.Conference_ID GROUP BY T1.Conference_ID ORDER BY COUNT(T2.staff_ID) DESC LIMIT 2
SELECT name, Nationality FROM staff WHERE staff_ID NOT IN (SELECT staff_ID FROM conference_participation WHERE Conference_ID IN (SELECT Conference_ID FROM conference WHERE Conference_Name = 'ACL'))
SELECT name, Nationality FROM staff WHERE staff_ID NOT IN (SELECT staff_ID FROM conference_participation WHERE Conference_ID = (SELECT Conference_ID FROM conference WHERE Conference_Name = 'ACL'))
SELECT T2.Institution_Name, T2.Location
SELECT T2.Institution_Name, T2.Location
SELECT pilot_name FROM PilotSkills ORDER BY age DESC LIMIT 1
SELECT pilot_name FROM PilotSkills ORDER BY age DESC LIMIT 1
SELECT pilot_name FROM PilotSkills WHERE age < ( SELECT AVG(age) FROM PilotSkills ) ORDER BY age
SELECT pilot_name FROM PilotSkills WHERE age < ( SELECT AVG(age) FROM PilotSkills ) ORDER BY age ASC
SELECT * FROM PilotSkills WHERE age < 30
SELECT * FROM PilotSkills WHERE age < 30
SELECT pilot_name FROM PilotSkills WHERE plane_name = 'Piper Cub' AND age < 35
SELECT pilot_name FROM PilotSkills WHERE age < 35 AND plane_name = 'Piper Cub'
SELECT location FROM Hangar WHERE plane_name = 'F-14 Fighter'
SELECT location FROM Hangar WHERE plane_name = 'F-14 Fighter'
SELECT COUNT(DISTINCT location) FROM Hangar
SELECT COUNT(DISTINCT location) FROM Hangar
SELECT plane_name FROM PilotSkills WHERE pilot_name = 'Jones' AND age = 32
SELECT plane_name FROM PilotSkills WHERE pilot_name = 'Jones' AND age = 32
SELECT COUNT(pilot_name) FROM PilotSkills WHERE age > 40
SELECT COUNT(pilot_name) FROM PilotSkills WHERE age > 40
SELECT COUNT(plane_name) FROM PilotSkills WHERE age < 35 AND plane_name = 'B-52 Bomber'
SELECT COUNT(plane_name) FROM PilotSkills AS T1 INNER JOIN Hangar AS T2 ON T1.plane_name = T2.plane_name WHERE T1.age < 35 AND T2.plane_name = 'B-52 Bomber'
SELECT pilot_name FROM PilotSkills WHERE plane_name = 'Piper Cub' ORDER BY age ASC LIMIT 1
SELECT T1.pilot_name FROM PilotSkills AS T1 INNER JOIN Hangar AS T2 ON T1.plane_name = T2.plane_name WHERE T1.plane_name = 'Piper Cub' ORDER BY T1.age ASC LIMIT 1
SELECT plane_name FROM Hangar GROUP BY plane_name ORDER BY COUNT(plane_name) DESC LIMIT 1
SELECT plane_name FROM PilotSkills GROUP BY plane_name ORDER BY COUNT(pilot_name) DESC LIMIT 1
SELECT plane_name FROM Hangar GROUP BY plane_name ORDER BY COUNT(plane_name) ASC LIMIT 1
SELECT plane_name FROM Hangar GROUP BY plane_name ORDER BY COUNT(pilot_name) ASC LIMIT 1
SELECT COUNT(pilot_name) FROM PilotSkills AS ps INNER JOIN Hangar AS h ON ps.plane_name = h.plane_name WHERE h.location = 'Chicago'
SELECT COUNT(T1.pilot_name)
SELECT plane_name FROM PilotSkills WHERE pilot_name = 'Smith' AND age = 41
SELECT T2.plane_name
SELECT COUNT(DISTINCT plane_name) FROM PilotSkills
SELECT COUNT(DISTINCT plane_name) FROM PilotSkills
SELECT COUNT(plane_name) FROM PilotSkills WHERE pilot_name = 'Smith'
SELECT COUNT(plane_name) FROM PilotSkills WHERE pilot_name = 'Smith'
SELECT COUNT(plane_name) FROM PilotSkills WHERE age > 40
SELECT COUNT(plane_name) FROM PilotSkills WHERE age > 40
SELECT pilot_name FROM PilotSkills WHERE age BETWEEN 30 AND 40 ORDER BY age ASC
SELECT pilot_name FROM PilotSkills WHERE age BETWEEN 30 AND 40 ORDER BY age ASC
SELECT pilot_name FROM PilotSkills ORDER BY age DESC
SELECT pilot_name FROM PilotSkills ORDER BY age DESC
SELECT location FROM Hangar ORDER BY plane_name
SELECT location FROM Hangar ORDER BY plane_name
SELECT DISTINCT plane_name FROM PilotSkills
SELECT DISTINCT plane_name FROM Hangar ORDER BY plane_name
SELECT COUNT(*) FROM PilotSkills WHERE age > 40 OR age < 30
SELECT COUNT(pilot_name) FROM PilotSkills WHERE age > 40 OR age < 30
SELECT pilot_name, age FROM PilotSkills WHERE (plane_name = 'Piper Cub' AND age > 35) OR (plane_name = 'F-14 Fighter' AND age < 30)
SELECT pilot_name, age FROM PilotSkills WHERE plane_name = 'Piper Cub' AND age > 35 OR plane_name = 'F-14 Fighter' AND age < 30
SELECT pilot_name FROM PilotSkills WHERE plane_name = 'Piper Cub' AND plane_name!= 'B-52 Bomber'
SELECT pilot_name FROM PilotSkills WHERE plane_name = 'Piper Cub' EXCEPT SELECT pilot_name FROM PilotSkills WHERE plane_name = 'B-52 Bomber'
SELECT pilot_name FROM PilotSkills WHERE plane_name = 'Piper Cub' INTERSECT SELECT pilot_name FROM PilotSkills WHERE plane_name = 'B-52 Bomber'
SELECT pilot_name FROM PilotSkills WHERE plane_name = 'Piper Cub' INTERSECT SELECT pilot_name FROM PilotSkills WHERE plane_name = 'B-52 Bomber'
SELECT AVG(age), MIN(age) FROM PilotSkills
SELECT AVG(age), MIN(age) FROM PilotSkills
SELECT T1.pilot_name
SELECT T1.pilot_name
SELECT pilot_name FROM PilotSkills WHERE plane_name = 'Piper Cub' OR plane_name = 'F-14 Fighter'
SELECT pilot_name FROM PilotSkills WHERE plane_name = 'Piper Cub' OR plane_name = 'F-14 Fighter'
SELECT AVG(age), plane_name FROM PilotSkills GROUP BY plane_name
SELECT plane_name, AVG(age) FROM PilotSkills GROUP BY plane_name
SELECT COUNT(plane_name), plane_name FROM Hangar GROUP BY plane_name
SELECT plane_name, COUNT(*) FROM PilotSkills GROUP BY plane_name
SELECT T1.plane_name, T2.pilot_name FROM Hangar AS T1 INNER JOIN PilotSkills AS T2 ON T1.plane_name = T2.plane_name ORDER BY T1.plane_name
SELECT T1.plane_name, T2.pilot_name FROM Hangar AS T1 INNER JOIN PilotSkills AS T2 ON T1.plane_name = T2.plane_name ORDER BY T1.plane_name, T2.age DESC
SELECT T1.plane_name, T1.age FROM PilotSkills AS T1 INNER JOIN Hangar AS T2 ON T1.plane_name = T2.plane_name ORDER BY T1.age DESC LIMIT 1
SELECT T1.plane_name, T2.pilot_name
SELECT pilot_name, MAX(age) FROM PilotSkills GROUP BY pilot_name
SELECT pilot_name, MAX(age) FROM PilotSkills GROUP BY pilot_name
SELECT T1.location, COUNT(T2.pilot_name) AS num_pilots, AVG(T2.age) AS avg_age
SELECT T1.location, COUNT(T2.pilot_name) AS pilot_count, AVG(T2.age) AS avg_age
SELECT COUNT(pilot_name) FROM PilotSkills WHERE age < ( SELECT AVG(age) FROM PilotSkills GROUP BY plane_name HAVING AVG(age) < 35 )
SELECT plane_name, COUNT(pilot_name) FROM PilotSkills GROUP BY plane_name HAVING AVG(age) < 35
SELECT T2.location FROM PilotSkills AS T1 INNER JOIN Hangar AS T2 ON T1.plane_name = T2.plane_name ORDER BY T1.age LIMIT 1
SELECT T2.location FROM PilotSkills AS T1 INNER JOIN Hangar AS T2 ON T1.plane_name = T2.plane_name ORDER BY T1.age LIMIT 1
SELECT T1.pilot_name, T1.age
SELECT T1.pilot_name, T1.age FROM PilotSkills AS T1 INNER JOIN Hangar AS T2 ON T1.plane_name = T2.plane_name WHERE T2.location = 'Austin'
SELECT pilot_name FROM PilotSkills WHERE age > ( SELECT MAX(age) FROM PilotSkills WHERE plane_name = 'Piper Cub' )
SELECT pilot_name FROM PilotSkills WHERE age > ( SELECT MAX(age) FROM PilotSkills WHERE plane_name = 'Piper Cub' )
SELECT COUNT(pilot_name) FROM PilotSkills WHERE age < ( SELECT MAX(age) FROM PilotSkills WHERE plane_name = 'F-14 Fighter' )
SELECT COUNT(*) FROM PilotSkills WHERE age > ( SELECT MAX(age) FROM PilotSkills WHERE plane_name = 'F-14 Fighter' )
SELECT DISTINCT plane_name FROM Hangar WHERE plane_name LIKE '%Bomber%'
SELECT plane_name FROM Hangar WHERE plane_name LIKE '%Bomber%'
SELECT COUNT(pilot_name) FROM PilotSkills WHERE age < ( SELECT age FROM PilotSkills WHERE plane_name = 'Piper Cub' )
SELECT COUNT(pilot_name) FROM PilotSkills WHERE age > ( SELECT MIN(age) FROM PilotSkills WHERE plane_name = 'Piper Cub' )
SELECT Name FROM district WHERE Area_km = ( SELECT MAX(Area_km) FROM district )
SELECT Area_km, Government_website FROM district WHERE Population = ( SELECT MIN(Population) FROM district )
SELECT Name, Population FROM district WHERE Area_km > ( SELECT AVG(Area_km) FROM district )
SELECT MAX(Area_km),  AVG(Area_km) FROM district
SELECT SUM(T1.Population) FROM district AS T1 INNER JOIN spokesman_district AS T2 ON T1.District_ID = T2.District_ID GROUP BY T2.District_ID ORDER BY T1.Area_km DESC LIMIT 3
SELECT District_ID, Name, Government_website FROM district ORDER BY Population
SELECT Name FROM district WHERE Government_website LIKE '%gov%'
SELECT District_ID, Name FROM district WHERE Population > 4000 OR Area_km > 3000
SELECT T1.Name, T1.Speach_title FROM spokesman AS T1
SELECT AVG(T2.Points), AVG(T2.Age) FROM district AS T1 INNER JOIN spokesman_district AS T3 ON T1.District_ID = T3.District_ID INNER JOIN spokesman AS T2 ON T2.Spokesman_ID = T3.Spokesman_ID WHERE T2.Rank_position = 1
SELECT T1.Name, T1.Points FROM spokesman AS T1 INNER JOIN spokesman_district AS T2 ON T1.Spokesman_ID = T2.Spokesman_ID WHERE T1.Age < 40
SELECT Name FROM spokesman WHERE Age = ( SELECT MAX(Age) FROM spokesman )
SELECT Name FROM spokesman WHERE Points < ( SELECT AVG(Points) FROM spokesman )
SELECT T1.Name FROM district AS T1 INNER JOIN spokesman_district AS T2 ON T1.District_ID = T2.District_ID GROUP BY T2.District_ID ORDER BY COUNT(T2.Spokeperson_ID) DESC LIMIT 1
SELECT T2.Name FROM spokesman_district AS T1 INNER JOIN spokesman AS T2 ON T1.Spokesman_ID = T2.Spokesman_ID WHERE T1.Start_year < 2004
SELECT T1.Name, COUNT(T2.Spokesman_ID) FROM district AS T1 INNER JOIN spokesman_district AS T2 ON T1.District_ID = T2.District_ID GROUP BY T1.District_ID
SELECT T1.Name FROM district AS T1 INNER JOIN spokesman_district AS T2 ON T1.District_ID = T2.District_ID INNER JOIN spokesman AS T3 ON T2.Spokesman_ID = T3.Spokesman_ID WHERE T3.Rank_position = 1 INTERSECT SELECT T1.Name FROM district AS T1 INNER JOIN spokesman_district AS T2 ON T1.District_ID = T2.District_ID INNER JOIN spokesman AS T3 ON T2.Spokesman_ID = T3.Spokesman_ID WHERE T3.Rank_position = 2
SELECT T1.Name FROM district AS T1 INNER JOIN spokesman_district AS T2 ON T1.District_ID = T2.District_ID GROUP BY T2.District_ID HAVING COUNT(T2.District_ID) > 1
SELECT COUNT(District_ID) FROM district WHERE District_ID NOT IN (SELECT District_ID FROM spokesman_district)
SELECT Name FROM spokesman WHERE Spokesman_ID NOT IN (SELECT Spokesman_ID FROM spokesman_district)
SELECT SUM(T1.Population) AS total_population, AVG(T1.Population) AS average_population
SELECT title FROM Sculptures WHERE year = ( SELECT MAX(year) FROM Sculptures )
SELECT title FROM Sculptures WHERE year = ( SELECT MAX(year) FROM Sculptures );
SELECT title, location FROM Paintings WHERE year = ( SELECT MIN(year ) FROM Paintings )
SELECT title, location FROM Paintings WHERE year = ( SELECT MIN(year ) FROM Paintings );
SELECT t1.title FROM Sculptures AS t1 INNER JOIN Artists AS t2 ON t1.sculptorID = t2.artistID WHERE t1.location = 226
SELECT title FROM Sculptures WHERE location = 226
SELECT title, location FROM Paintings
SELECT title, location FROM Paintings
SELECT title, location FROM Sculptures
SELECT title, location FROM Sculptures
SELECT medium, mediumOn FROM Paintings WHERE paintingID = 80
SELECT medium, mediumOn FROM Paintings WHERE paintingID = 80
SELECT fname, lname FROM Artists WHERE birthYear > 1850
SELECT fname, lname FROM Artists WHERE birthYear > 1850
SELECT T1.title, T1.year FROM Sculptures AS T1 INNER JOIN Artists AS T2 ON T1.sculptorID = T2.artistID WHERE T1.location!= 'gallery 226'
SELECT T1.title, T1.year FROM Sculptures AS T1 INNER JOIN Artists AS T2 ON T1.sculptorID = T2.artistID WHERE T1.location!= 'gallery 226'
SELECT DISTINCT T1.fname, T1.lname
SELECT T1.fname, T1.lname
SELECT T1.birthYear FROM Artists AS T1 INNER JOIN Sculptures AS T2 ON T1.artistID = T2.sculptorID WHERE T2.year > 1920 GROUP BY T1.artistID
SELECT T1.birthYear FROM Artists AS T1 INNER JOIN Sculptures AS T2 ON T1.artistID = T2.sculptorID WHERE T2.year > 1920 GROUP BY T1.artistID
SELECT fname, lname FROM Artists ORDER BY deathYear - birthYear DESC LIMIT 1
SELECT fname, lname FROM Artists WHERE deathYear - birthYear = ( SELECT MAX(deathYear - birthYear) FROM Artists );
SELECT CAST(CASE WHEN deathYear IS NULL THEN 2024 - birthYear ELSE deathYear - birthYear END AS INTEGER) - 1 FROM Artists ORDER BY CASE WHEN deathYear IS NULL THEN 2024 - birthYear ELSE deathYear - birthYear END LIMIT 1
SELECT fname, lname, deathYear - birthYear AS age FROM Artists ORDER BY deathYear - birthYear ASC LIMIT 1
SELECT fname, deathYear - birthYear AS age FROM Artists ORDER BY deathYear - birthYear DESC LIMIT 1
SELECT fname, deathYear - birthYear AS age FROM Artists ORDER BY deathYear - birthYear DESC LIMIT 1
SELECT COUNT(title) FROM Paintings WHERE location = 240
SELECT COUNT(paintingID) FROM Paintings WHERE location = 240
SELECT COUNT(paintingID) FROM Paintings WHERE painterID = ( SELECT artistID FROM Artists WHERE deathYear - birthYear = ( SELECT MAX(deathYear - birthYear) FROM Artists ) )
SELECT COUNT(paintingID) FROM Paintings WHERE painterID = ( SELECT artistID FROM Artists ORDER BY deathYear - birthYear DESC LIMIT 1 )
SELECT T1.fname, T1.lname, T2.year FROM Artists AS T1 INNER JOIN Paintings AS T2 ON T1.artistID = T2.painterID WHERE T1.fname = 'Mary'
SELECT T1.title, T1.year FROM Paintings AS T1 INNER JOIN Artists AS T2 ON T1.painterID = T2.artistID WHERE T2.fname = 'Mary'
SELECT T2.width_mm FROM Artists AS T1 INNER JOIN Paintings AS T2 ON T1.artistID = T2.painterID WHERE T1.birthYear < 1850
SELECT width_mm FROM Paintings WHERE painterID IN ( SELECT artistID FROM Artists WHERE birthYear < 1850 )
SELECT T2.location, T2.medium
SELECT T2.location, T2.mediumOn FROM Artists AS T1 INNER JOIN Paintings AS T2 ON T1.artistID = T2.painterID WHERE T1.fname = 'Pablo'
SELECT T1.fname, T1.lname
SELECT DISTINCT T1.fname, T1.lname
SELECT T1.fname, T1.lname
SELECT T1.fname, T1.lname
SELECT T1.birthYear FROM Artists AS T1 INNER JOIN Paintings AS T2 ON T1.artistID = T2.painterID WHERE T2.year = 1884 AND T2.mediumOn = 'canvas'
SELECT T1.birthYear FROM Artists AS T1 INNER JOIN Paintings AS T2 ON T1.artistID = T2.painterID WHERE T2.year = 1884
SELECT DISTINCT T1.fname FROM Artists AS T1 INNER JOIN Paintings AS T2 ON T1.artistID = T2.painterID WHERE T2.mediumOn = 'oil' AND T2.location = 'gallery 241'
SELECT T1.fname FROM Artists AS T1 INNER JOIN Paintings AS T2 ON T1.artistID = T2.painterID WHERE T2.mediumOn = 'oil' AND T2.location = 241
SELECT medium, COUNT(paintingID) FROM Paintings GROUP BY medium
SELECT medium, COUNT(paintingID) FROM Paintings GROUP BY medium UNION SELECT medium, COUNT(sculptureID) FROM Sculptures GROUP BY medium
SELECT AVG(height_mm), medium FROM Paintings GROUP BY medium
SELECT AVG(height_mm), medium FROM Paintings GROUP BY medium
SELECT location, COUNT(title) FROM Paintings WHERE year < 1900 GROUP BY location
SELECT COUNT(paintingID) FROM Paintings WHERE year < 1900 AND location!= 'location'
SELECT title FROM Paintings WHERE year > 1910 AND medium = 'oil'
SELECT T1.title FROM Paintings AS T1 INNER JOIN Artists AS T2 ON T1.painterID = T2.artistID WHERE T1.mediumOn = 'oil' AND T1.year > 1910
SELECT T1.painterID FROM Paintings AS T1 INNER JOIN location AS T2 ON T1.location = T2.location WHERE T1.mediumOn = 'oil' AND T2.galleryID = 240 GROUP BY T1.painterID
SELECT T1.painterID FROM Paintings AS T1 INNER JOIN location AS T2 ON T1.location = T2.location WHERE T1.mediumOn = 'oil' AND T2.galleryID = 240 GROUP BY T1.painterID
SELECT DISTINCT title FROM Paintings WHERE height_mm > ( SELECT MAX(height_mm) FROM Paintings WHERE mediumOn = 'canvas' )
SELECT DISTINCT title FROM Paintings WHERE height_mm > ( SELECT MAX(height_mm) FROM Paintings WHERE medium = 'canvas' )
SELECT DISTINCT painterID FROM Paintings WHERE year < ( SELECT year FROM Paintings WHERE location = 'gallery 240' )
SELECT DISTINCT T1.painterID FROM Paintings AS T1 INNER JOIN Paintings AS T2 ON T1.year < T2.year WHERE T2.location = 240
SELECT paintingID FROM Paintings ORDER BY year ASC LIMIT 1
SELECT paintingID FROM Paintings ORDER BY year ASC LIMIT 1
SELECT T1.fname, T1.lname FROM Artists AS T1 INNER JOIN Sculptures AS T2 ON T1.sculptorID = T2.sculptorID WHERE T2.title LIKE '%female%'
SELECT T1.fname, T1.lname FROM Artists AS T1 INNER JOIN Sculptures AS T2 ON T1.sculptorID = T2.sculptorID WHERE T2.title LIKE '%female%'
SELECT title FROM Paintings
SELECT title FROM Paintings
SELECT DISTINCT title FROM Paintings ORDER BY width_mm + height_mm
SELECT title FROM Paintings ORDER BY height_mm ASC
SELECT title FROM Paintings WHERE year BETWEEN 1900 AND 1950 UNION SELECT title FROM Sculptures WHERE year BETWEEN 1900 AND 1950
SELECT title FROM Paintings WHERE year BETWEEN 1900 AND 1950 UNION SELECT title FROM Sculptures WHERE year BETWEEN 1900 AND 1950
SELECT T1.title FROM Paintings AS T1 INNER JOIN Artists AS T2 ON T1.painterID = T2.artistID WHERE T2.artistID = 222 UNION SELECT T1.title FROM Sculptures AS T1 INNER JOIN Artists AS T2 ON T1.sculptorID = T2.artistID WHERE T2.artistID = 222
SELECT title FROM Paintings WHERE painterID = 222
SELECT T1.artistID FROM Artists AS T1 INNER JOIN Paintings AS T2 ON T1.artistID = T2.painterID WHERE T2.year < 1900 GROUP BY T1.artistID ORDER BY COUNT(T2.paintingID) DESC LIMIT 1
SELECT T1.artistID FROM Artists AS T1 INNER JOIN Paintings AS T2 ON T1.artistID = T2.painterID WHERE T2.year < 1900 GROUP BY T1.artistID ORDER BY COUNT(T2.paintingID) DESC LIMIT 1
SELECT T1.fname FROM Artists AS T1 INNER JOIN Sculptures AS T2 ON T1.artistID = T2.sculptorID GROUP BY T1.artistID ORDER BY COUNT(T2.sculptureID) DESC LIMIT 1
SELECT T1.fname FROM Artists AS T1 INNER JOIN Sculptures AS T2 ON T1.artistID = T2.sculptorID GROUP BY T1.artistID ORDER BY COUNT(T2.sculptureID) DESC LIMIT 1
SELECT title FROM Paintings WHERE width_mm < 600 OR height_mm > 800
SELECT title FROM Paintings WHERE width_mm < 600 OR height_mm > 800
SELECT location FROM Paintings WHERE year < 1885 OR year > 1930
SELECT location FROM Paintings WHERE year < 1885 OR year > 1930
SELECT paintingID FROM Paintings WHERE height_mm > 500 AND height_mm < 2000
SELECT paintingID FROM Paintings WHERE height_mm > 500 AND height_mm < 2000
SELECT location FROM Paintings WHERE mediumOn = 'on panel' INTERSECT SELECT location FROM Paintings WHERE mediumOn = 'on canvas'
SELECT location FROM Paintings WHERE mediumOn = 'on panel' INTERSECT SELECT location FROM Paintings WHERE mediumOn = 'on canvas'
SELECT location FROM Paintings WHERE year < 1885 AND year > 1930
SELECT location FROM Paintings WHERE year < 1885 AND year > 1930
SELECT AVG(height_mm), AVG(width_mm) FROM Paintings WHERE mediumOn = 'oil' AND location = 'gallery 241'
SELECT AVG(height_mm), AVG(width_mm) FROM Paintings WHERE mediumOn = 'oil' AND location = 'gallery 241'
SELECT MAX(height_mm), paintingID FROM Paintings WHERE year < 1900
SELECT height_mm, paintingID FROM Paintings WHERE year < 1900 ORDER BY height_mm DESC LIMIT 1
SELECT year, MAX(height_mm) AS max_height, MAX(width_mm) AS max_width FROM Paintings GROUP BY year
SELECT year, MAX(height_mm) AS max_height, MAX(width_mm) AS max_width FROM Paintings GROUP BY year
SELECT fname, lname, AVG(height_mm), AVG(width_mm) FROM Artists INNER JOIN Paintings ON Artists.artistID = Paintings.painterID GROUP BY painterID ORDER BY fname, lname
SELECT fname, lname, AVG(height_mm), AVG(width_mm) FROM Artists INNER JOIN Paintings ON Artists.artistID = Paintings.painterID GROUP BY painterID ORDER BY fname, lname
SELECT fname, COUNT(paintingID) FROM Artists LEFT JOIN Paintings ON Artists.artistID = Paintings.painterID GROUP BY Artists.artistID HAVING COUNT(paintingID) >= 2
SELECT fname, COUNT(paintingID) FROM Artists WHERE artistID IN ( SELECT painterID FROM Paintings GROUP BY painterID HAVING COUNT(paintingID) >= 2 )
SELECT T1.deathYear FROM Artists AS T1 INNER JOIN Paintings AS T2 ON T1.artistID = T2.painterID GROUP BY T1.artistID HAVING COUNT(T2.paintingID) <= 3
SELECT T1.deathYear FROM Artists AS T1 INNER JOIN Paintings AS T2 ON T1.artistID = T2.painterID GROUP BY T1.artistID HAVING COUNT(T2.paintingID) < 4
SELECT T1.deathYear FROM Artists AS T1 INNER JOIN Sculptures AS T2 ON T1.artistID = T2.sculptorID GROUP BY T1.artistID ORDER BY COUNT(T2.sculptureID) ASC LIMIT 1
SELECT T2.deathYear FROM Sculptures AS T1 INNER JOIN Artists AS T2 ON T1.sculptorID = T2.artistID GROUP BY T2.deathYear ORDER BY COUNT(T1.sculptureID) ASC LIMIT 1
SELECT paintingID, height_mm FROM Paintings WHERE width_mm = ( SELECT MAX(width_mm) FROM Paintings WHERE location = '240' ) AND location = '240'
SELECT height_mm, paintingID FROM Paintings WHERE width_mm = ( SELECT MAX(width_mm) FROM Paintings WHERE location = 240 ) AND location = 240
SELECT paintingID FROM Paintings WHERE year < ( SELECT MIN(year) FROM Paintings WHERE location = 240 )
SELECT paintingID FROM Paintings WHERE year < ( SELECT MIN(year) FROM Paintings WHERE location = 240 )
SELECT paintingID FROM Paintings WHERE height_mm > ( SELECT AVG(height_mm) FROM Paintings WHERE year > 1900 )
SELECT paintingID FROM Paintings WHERE height_mm > ( SELECT MAX(height_mm) FROM Paintings WHERE year > 1900 )
SELECT T1.fname, T1.lname, COUNT(T2.title) FROM Artists AS T1 INNER JOIN Paintings AS T2 ON T1.artistID = T2.painterID WHERE T2.medium = 'oil' GROUP BY T1.artistID ORDER BY COUNT(T2.title) DESC LIMIT 3
SELECT T1.fname, T1.lname
SELECT T1.paintingID, T1.location, T1.title
SELECT T1.paintingID, T1.location, T1.title FROM Paintings AS T1 INNER JOIN Medium AS T2 ON T1.mediumOn = T2.mediumID WHERE T2.medium = 'oil' ORDER BY T1.year
SELECT year, location, title FROM Paintings WHERE height_mm > 1000 ORDER BY title
SELECT year, location, title FROM Paintings WHERE height_mm > 1000 ORDER BY title ASC
SELECT T1.fname, T1.lname
SELECT T1.fname, T1.lname
SELECT DISTINCT T1.location FROM Paintings AS T1 INNER JOIN Artists AS T2 ON T1.painterID = T2.artistID WHERE T1.year < 1885 AND T1.mediumOn = 0
SELECT location FROM Paintings WHERE year < 1885 AND medium!= 'canvas'
SELECT COUNT(Race_Name) FROM race
SELECT COUNT(*) FROM race
SELECT Winning_driver, Winning_team FROM race ORDER BY Winning_team ASC
SELECT Winning_driver, Winning_team FROM race ORDER BY Winning_team
SELECT Winning_driver FROM race WHERE Pole_Position!= 'Junior Strous'
SELECT Winning_driver FROM race WHERE Pole_Position!= ( SELECT Driver_ID FROM driver WHERE Driver_Name = 'Junior Strous' )
SELECT Constructor FROM driver ORDER BY Age ASC
SELECT DISTINCT Constructor FROM driver ORDER BY Age ASC
SELECT DISTINCT Entrant FROM driver WHERE Age >= 20
SELECT DISTINCT Entrant FROM driver WHERE Age >= 20
SELECT MAX(Age), MIN(Age) FROM driver
SELECT MAX(Age), MIN(Age) FROM driver
SELECT COUNT(DISTINCT Engine) FROM driver WHERE Age > 30 OR Age < 20
SELECT COUNT(DISTINCT Engine) FROM driver WHERE Age > 30 OR Age < 20
SELECT Driver_Name FROM driver ORDER BY Driver_Name DESC
SELECT Driver_Name FROM driver ORDER BY Driver_Name DESC
SELECT T1.Driver_Name, T2.Race_Name FROM driver AS T1 INNER JOIN race AS T2 ON T1.Driver_ID = T2.Driver_ID
SELECT T1.Driver_Name, T2.Race_Name FROM driver AS T1 INNER JOIN race AS T2 ON T1.Driver_ID = T2.Driver_ID
SELECT Driver_Name, COUNT(Driver_ID) FROM driver GROUP BY Driver_ID
SELECT Driver_ID, COUNT(Race_Name) FROM race GROUP BY Driver_ID
SELECT T1.Age FROM driver AS T1 INNER JOIN race AS T2 ON T1.Driver_ID = T2.Driver_ID GROUP BY T1.Driver_ID ORDER BY COUNT(T2.Race_Name) DESC LIMIT 1
SELECT T1.Age FROM driver AS T1 INNER JOIN race AS T2 ON T1.Driver_ID = T2.Driver_ID GROUP BY T1.Driver_ID ORDER BY COUNT(T2.Race_Name) DESC LIMIT 1
SELECT T1.Driver_Name, T1.Age FROM driver AS T1 INNER JOIN race AS T2 ON T1.Driver_ID = T2.Driver_ID GROUP BY T1.Driver_ID HAVING COUNT(T2.Race_Name) >= 2
SELECT T1.Driver_Name, T1.Age FROM driver AS T1 INNER JOIN race AS T2 ON T1.Driver_ID = T2.Driver_ID GROUP BY T1.Driver_ID HAVING COUNT(T2.Race_Name) >= 2
SELECT T2.Race_Name FROM driver AS T1 INNER JOIN race AS T2 ON T1.Driver_ID = T2.Driver_ID WHERE T1.Age >= 26
SELECT T2.Race_Name FROM driver AS T1 INNER JOIN race AS T2 ON T1.Driver_ID = T2.Driver_ID WHERE T1.Age >= 26
SELECT Driver_Name FROM driver WHERE Constructor!= 'Bugatti'
SELECT Driver_Name FROM driver WHERE Constructor!= 'Bugatti'
SELECT Constructor, COUNT(Driver_ID) FROM driver GROUP BY Constructor
SELECT Constructor, COUNT(Driver_ID) FROM driver GROUP BY Constructor
SELECT Engine FROM driver GROUP BY Engine ORDER BY COUNT(Engine) DESC LIMIT 1
SELECT Engine FROM driver GROUP BY Engine ORDER BY COUNT(Engine) DESC LIMIT 1
SELECT Engine FROM driver GROUP BY Engine HAVING COUNT(Engine) >= 2
SELECT Engine FROM driver GROUP BY Engine HAVING COUNT(Engine) >= 2
SELECT Driver_Name FROM driver WHERE Driver_ID NOT IN (SELECT Driver_ID FROM race)
SELECT Driver_Name FROM driver WHERE Driver_ID NOT IN (SELECT Driver_ID FROM race)
SELECT Constructor FROM driver WHERE Age < 20 INTERSECT SELECT Constructor FROM driver WHERE Age > 30
SELECT Constructor FROM driver WHERE Age < 20 INTERSECT SELECT Constructor FROM driver WHERE Age > 30
SELECT DISTINCT Winning_team FROM race WHERE Winning_driver IN ( SELECT Winning_driver FROM race GROUP BY Winning_driver HAVING COUNT(Winning_driver)  >  1 )
SELECT DISTINCT T1.Winning_team FROM race AS T1 INNER JOIN driver AS T2 ON T1.Winning_driver = T2.Driver_ID GROUP BY T1.Winning_team HAVING COUNT(T1.Race_Name) > 1
SELECT T1.Driver_Name
SELECT T1.Driver_Name FROM driver AS T1 INNER JOIN race AS T2 ON T1.Driver_ID = T2.Driver_ID WHERE T2.Pole_Position = 'James Hinchcliffe' INTERSECT SELECT T1.Driver_Name FROM driver AS T1 INNER JOIN race AS T2 ON T1.Driver_ID = T2.Driver_ID WHERE T2.Pole_Position = 'Carl Skerlong'
SELECT T1.Driver_Name FROM driver AS T1 INNER JOIN race AS T2 ON T1.Driver_ID = T2.Driver_ID WHERE T2.Pole_Position = 'James Hinchcliffe'
SELECT Driver_Name FROM driver WHERE Driver_ID NOT IN ( SELECT Driver_ID FROM race WHERE Pole_Position = 'James Hinchcliffe' )
SELECT COUNT(*) FROM languages
SELECT COUNT(*) FROM languages
SELECT name FROM languages ORDER BY name ASC
SELECT name FROM languages ORDER BY name ASC
SELECT name FROM languages WHERE name LIKE '%ish%'
SELECT name FROM languages WHERE name LIKE '%ish%'
SELECT name FROM countries ORDER BY overall_score DESC
SELECT name FROM countries ORDER BY overall_score DESC
SELECT AVG(justice_score) FROM countries
SELECT AVG(justice_score) FROM countries
SELECT MAX(health_score),  MIN(health_score) FROM countries WHERE name!= 'Norway'
SELECT MAX(health_score),  MIN(health_score) FROM countries WHERE name!= 'Norway'
SELECT COUNT(DISTINCT language_id) FROM official_languages
SELECT COUNT(DISTINCT language_id) FROM official_languages
SELECT name FROM countries ORDER BY education_score DESC
SELECT name FROM countries ORDER BY education_score DESC
SELECT name FROM countries WHERE politics_score = ( SELECT MAX(politics_score) FROM countries );
SELECT name FROM countries WHERE politics_score = ( SELECT MAX(politics_score) FROM countries );
SELECT T1.name, T3.name FROM countries AS T1 INNER JOIN official_languages AS T2 ON T1.id = T2.country_id INNER JOIN languages AS T3 ON T2.language_id = T3.id
SELECT T1.name, T3.name FROM countries AS T1 INNER JOIN official_languages AS T2 ON T1.id = T2.country_id INNER JOIN languages AS T3 ON T2.language_id = T3.id
SELECT T1.name, COUNT(T2.country_id) FROM languages AS T1 INNER JOIN official_languages AS T2 ON T1.id = T2.language_id GROUP BY T1.id
SELECT T1.name, COUNT(T2.country_id) FROM languages AS T1 INNER JOIN official_languages AS T2 ON T1.id = T2.language_id GROUP BY T1.id
SELECT l.name FROM languages l INNER JOIN official_languages ol ON l.id = ol.language_id GROUP BY ol.language_id ORDER BY COUNT(ol.country_id) DESC LIMIT 1
SELECT l.name FROM languages l INNER JOIN official_languages ol ON l.id = ol.language_id GROUP BY ol.language_id ORDER BY COUNT(ol.language_id) DESC LIMIT 1
SELECT l.name FROM languages l JOIN official_languages ol ON l.id = ol.language_id GROUP BY ol.language_id HAVING COUNT(ol.country_id) >= 2
SELECT l.name FROM languages l JOIN official_languages ol ON l.id = ol.language_id GROUP BY ol.language_id HAVING COUNT(ol.country_id) >= 2
SELECT AVG(T2.overall_score)
SELECT AVG(T2.overall_score) FROM languages AS T1 INNER JOIN countries AS T2 ON T1.id = T2.id INNER JOIN official_languages AS T3 ON T2.id = T3.country_id WHERE T1.name = 'English'
SELECT l.name FROM official_languages ol
SELECT T1.name FROM languages AS T1 INNER JOIN official_languages AS T2 ON T1.id = T2.language_id GROUP BY T2.language_id ORDER BY COUNT(T2.country_id) DESC LIMIT 3
SELECT l.name FROM official_languages ol
SELECT T1.name FROM languages AS T1 INNER JOIN official_languages AS T2 ON T1.id = T2.language_id INNER JOIN countries AS T3 ON T2.country_id = T3.id GROUP BY T2.language_id ORDER BY AVG(T3.overall_score) DESC
SELECT T2.name FROM official_languages AS T1 INNER JOIN countries AS T2 ON T1.country_id = T2.id GROUP BY T2.id ORDER BY COUNT(T1.language_id) DESC LIMIT 1
SELECT c.name FROM countries c INNER JOIN official_languages ol ON c.id = ol.country_id GROUP BY c.id ORDER BY COUNT(ol.language_id) DESC LIMIT 1
SELECT name FROM languages WHERE id NOT IN (SELECT language_id FROM official_languages)
SELECT name FROM languages WHERE id NOT IN (SELECT language_id FROM official_languages)
SELECT name FROM countries WHERE id NOT IN (SELECT country_id FROM official_languages)
SELECT name FROM countries WHERE id NOT IN (SELECT country_id FROM official_languages)
SELECT T1.name FROM languages AS T1 INNER JOIN official_languages AS T2 ON T1.id = T2.language_id INNER JOIN countries AS T3 ON T2.country_id = T3.id WHERE T3.overall_score > 95 INTERSECT SELECT T1.name FROM languages AS T1 INNER JOIN official_languages AS T2 ON T1.id = T2.language_id INNER JOIN countries AS T3 ON T2.country_id = T3.id WHERE T3.overall_score < 90
SELECT T1.name FROM languages AS T1 INNER JOIN official_languages AS T2 ON T1.id = T2.language_id INNER JOIN countries AS T3 ON T2.country_id = T3.id WHERE T3.overall_score > 95 INTERSECT SELECT T1.name FROM languages AS T1 INNER JOIN official_languages AS T2 ON T1.id = T2.language_id INNER JOIN countries AS T3 ON T2.country_id = T3.id WHERE T3.overall_score < 90
SELECT country, town_city FROM Addresses
SELECT T1.country, T1.town_city FROM Addresses AS T1
SELECT T1.town_city, T1.county_state_province FROM Addresses AS T1 INNER JOIN Properties AS T2 ON T1.address_id = T2.property_address_id
SELECT T1.property_name, T2.county_state_province
SELECT feature_description FROM Features WHERE feature_name = 'Rooftop'
SELECT feature_description FROM Features WHERE feature_name = 'rooftop'
SELECT T1.feature_name, T1.feature_description FROM Features AS T1 INNER JOIN Property_Features AS T2 ON T1.feature_id = T2.feature_id GROUP BY T2.feature_id ORDER BY COUNT(T2.feature_id) DESC LIMIT 1
SELECT T1.feature_name, T1.feature_description FROM Features AS T1 INNER JOIN Property_Features AS T2 ON T1.feature_id = T2.feature_id GROUP BY T2.feature_id ORDER BY COUNT(T2.feature_id) DESC LIMIT 1
SELECT MIN(room_size) FROM Rooms
SELECT MIN(room_count) FROM Properties
SELECT COUNT(*) FROM Properties WHERE parking_lots = 1 OR garage_yn = 1
SELECT COUNT(*) FROM Properties WHERE (parking_lots = 1 OR garage_yn = 1)
SELECT T1.age_category_code
SELECT T1.age_category_description
SELECT T1.first_name FROM Users AS T1 INNER JOIN Properties AS T2 ON T1.user_id = T2.owner_user_id GROUP BY T1.user_id ORDER BY COUNT(T2.property_id) DESC LIMIT 1
SELECT T1.first_name FROM Users AS T1 INNER JOIN Properties AS T2 ON T1.user_id = T2.owner_user_id GROUP BY T1.user_id ORDER BY COUNT(T2.property_id) DESC LIMIT 1
SELECT AVG(T2.room_count)
SELECT AVG(T2.room_count) FROM Features AS T1 INNER JOIN Property_Features AS T2 ON T1.feature_id = T2.feature_id WHERE T1.feature_name = 'Garden'
SELECT T1.town_city FROM Addresses AS T1 INNER JOIN Properties AS T2 ON T1.address_id = T2.property_address_id INNER JOIN Property_Features AS T3 ON T2.property_id = T3.property_id WHERE T3.feature_id = ( SELECT feature_id FROM Features WHERE feature_name = 'Swimming Pool' )
SELECT T1.town_city FROM Addresses AS T1 INNER JOIN Properties AS T2 ON T1.address_id = T2.property_address_id INNER JOIN Property_Features AS T3 ON T2.property_id = T3.property_id WHERE T3.feature_id = ( SELECT feature_id FROM Features WHERE feature_name = 'Swimming Pool' )
SELECT property_id, vendor_requested_price FROM Properties ORDER BY vendor_requested_price ASC LIMIT 1
SELECT property_id, vendor_requested_price FROM Properties ORDER BY vendor_requested_price ASC LIMIT 1
SELECT AVG(room_count) FROM Properties
SELECT AVG(room_count) FROM Properties
SELECT COUNT(DISTINCT room_size) FROM Rooms
SELECT COUNT(DISTINCT room_size) FROM Rooms
SELECT DISTINCT u.user_id, us.search_string
SELECT user_id, search_seq FROM User_Searches GROUP BY user_id HAVING COUNT(search_seq) >= 2
SELECT MAX(search_datetime) FROM User_Searches
SELECT MAX(search_datetime) FROM User_Searches
SELECT search_datetime, search_string FROM User_Searches ORDER BY search_string DESC
SELECT search_string, search_datetime FROM User_Searches ORDER BY search_string DESC
SELECT T1.zip_postcode FROM Addresses AS T1 INNER JOIN Properties AS T2 ON T1.address_id = T2.property_address_id INNER JOIN User_Property_History AS T3 ON T2.property_id = T3.property_id GROUP BY T2.property_address_id HAVING COUNT(T3.user_id) > 2
SELECT T1.zip_postcode
SELECT T1.user_category_code, T1.user_id FROM Users AS T1 INNER JOIN User_Searches AS T2 ON T1.user_id = T2.user_id GROUP BY T1.user_id HAVING COUNT(T2.search_seq) = 1
SELECT DISTINCT T1.user_id, T1.user_category_code
SELECT T1.age_category_description
SELECT T1.age_category_description
SELECT T1.login_name FROM Users AS T1 INNER JOIN Ref_Age_Categories AS T2 ON T1.age_category_code = T2.age_category_code WHERE T2.age_category_description = 'Senior Citizen' ORDER BY T1.first_name
SELECT login_name FROM Users WHERE age_category_code = ( SELECT age_category_code FROM Ref_Age_Categories WHERE age_category_description = 'Senior citizen' ) ORDER BY first_name
SELECT COUNT(search_seq) FROM Users AS T1 INNER JOIN User_Searches AS T2 ON T1.user_id = T2.user_id WHERE T1.is_buyer = 1
SELECT COUNT(*) FROM Users AS T1 INNER JOIN User_Searches AS T2 ON T1.user_id = T2.user_id WHERE T1.is_buyer = 1
SELECT date_registered FROM Users WHERE login_name = 'ratione'
SELECT date_registered FROM Users WHERE login_name = 'ratione'
SELECT first_name, middle_name, last_name, login_name FROM Users WHERE is_seller = 1
SELECT first_name, middle_name, last_name, login_name FROM Users WHERE is_seller = 1
SELECT T1.line_1_number_building, T1.line_2_number_street, T1.town_city
SELECT T1.line_1_number_building, T1.line_2_number_street, T1.town_city
SELECT COUNT(DISTINCT T1.property_id) FROM Property_Features AS T1 INNER JOIN Properties AS T2 ON T1.property_id = T2.property_id GROUP BY T1.property_id HAVING COUNT(T1.feature_id) >= 2
SELECT COUNT(DISTINCT p.property_id) FROM Properties p JOIN Property_Features pf ON p.property_id = pf.property_id GROUP BY p.property_id HAVING COUNT(pf.feature_id) >= 2
SELECT property_id, COUNT(property_id) FROM Property_Photos GROUP BY property_id
SELECT property_id, COUNT(property_id) FROM Property_Photos GROUP BY property_id
SELECT T1.owner_user_id, COUNT(T2.photo_seq) FROM Properties AS T1 INNER JOIN Property_Photos AS T2 ON T1.property_id = T2.property_id GROUP BY T1.owner_user_id
SELECT T1.owner_user_id, COUNT(T2.property_id) FROM Properties AS T1 INNER JOIN Property_Photos AS T2 ON T1.property_id = T2.property_id GROUP BY T1.owner_user_id
SELECT SUM(T2.price_max) FROM Users AS T1 INNER JOIN Properties AS T2 ON T1.user_id = T2.owner_user_id WHERE T1.user_category_code IN ('SM', 'ST')
SELECT MAX(T1.price_max) FROM Properties AS T1 INNER JOIN Users AS T2 ON T1.owner_user_id = T2.user_id WHERE T2.user_category_code IN ('SM', 'ST')
SELECT T1.datestamp, T2.property_name
SELECT T1.datestamp, T2.property_name
SELECT property_type_description, property_type_code FROM Ref_Property_Types ORDER BY COUNT(property_type_code) DESC LIMIT 1
SELECT property_type_description FROM Ref_Property_Types WHERE property_type_code = ( SELECT property_type_code FROM Properties GROUP BY property_type_code ORDER BY COUNT(property_type_code) DESC LIMIT 1 )
SELECT age_category_description FROM Ref_Age_Categories WHERE age_category_code = 'Over 60'
SELECT age_category_description FROM Ref_Age_Categories WHERE age_category_code = 'Over 60'
SELECT room_size, COUNT(*) FROM Rooms GROUP BY room_size
SELECT room_size, COUNT(*) FROM Rooms GROUP BY room_size
SELECT T2.country FROM Users AS T1 INNER JOIN Addresses AS T2 ON T1.user_address_id = T2.address_id WHERE T1.first_name = 'Robbie'
SELECT T2.country FROM Users AS T1 INNER JOIN Addresses AS T2 ON T1.user_address_id = T2.address_id WHERE T1.first_name = 'Robbie'
SELECT T1.first_name, T1.middle_name, T1.last_name
SELECT U.first_name, U.middle_name, U.last_name
SELECT T1.search_string FROM User_Searches AS T1 INNER JOIN Users AS T2 ON T1.user_id = T2.user_id WHERE T2.user_id NOT IN (SELECT owner_user_id FROM Properties)
SELECT DISTINCT T1.search_string
SELECT U.last_name, U.user_id
SELECT T1.last_name, T1.user_id
SELECT COUNT(*) FROM bike WHERE weight > 780
SELECT product_name, weight FROM bike ORDER BY price ASC
SELECT heat, name, nation FROM cyclist
SELECT MAX(weight), MIN(weight) FROM bike
SELECT AVG(price) FROM bike WHERE material = 'Carbon CC'
SELECT name, result FROM cyclist WHERE nation!= 'Russia'
SELECT DISTINCT T1.id, T1.product_name
SELECT T1.id, T1.product_name
SELECT T1.id, T1.name FROM cyclist AS T1 INNER JOIN cyclists_own_bikes AS T2 ON T1.id = T2.cyclist_id GROUP BY T1.id ORDER BY COUNT(T2.cyclist_id) DESC LIMIT 1
SELECT DISTINCT T1.product_name
SELECT COUNT(DISTINCT heat) FROM cyclist
SELECT COUNT(*) FROM cyclist WHERE id NOT IN ( SELECT cyclist_id FROM cyclists_own_bikes WHERE purchase_year > 2015 )
SELECT DISTINCT T1.product_name
SELECT T1.product_name, T1.price
SELECT name, nation, result FROM cyclist WHERE id NOT IN (SELECT cyclist_id FROM cyclists_own_bikes WHERE bike_id IN (SELECT id FROM bike WHERE product_name = 'racing bike'))
SELECT product_name FROM bike WHERE material LIKE '%fiber%'
SELECT cyclist_id, COUNT(bike_id) FROM cyclists_own_bikes GROUP BY cyclist_id ORDER BY cyclist_id
SELECT Flavor FROM goods WHERE Food = 'cake' ORDER BY Price DESC LIMIT 1
SELECT Id, Flavor FROM goods WHERE Food = 'cake' AND Price = ( SELECT MAX(Price) FROM goods WHERE Food = 'cake' )
SELECT Flavor FROM goods WHERE Food = 'Cookie' AND Price = ( SELECT MIN(Price) FROM goods WHERE Food = 'Cookie' )
SELECT Id, Flavor FROM goods WHERE Food = 'Cookie' AND Price = ( SELECT MIN(Price) FROM goods WHERE Food = 'Cookie' )
SELECT Id FROM goods WHERE Flavor = 'apple'
SELECT Id FROM goods WHERE Flavor = 'apple'
SELECT Id FROM goods WHERE Price < 3
SELECT Id FROM goods WHERE Price < 3
SELECT DISTINCT c.Id
SELECT DISTINCT T1.CustomerId
SELECT Food, COUNT(DISTINCT CustomerId) FROM items GROUP BY Food
SELECT T1.Food, COUNT(T2.CustomerId) FROM goods AS T1 INNER JOIN items AS T2 ON T1.Id = T2.Item GROUP BY T1.Food
SELECT c.Id FROM customers c INNER JOIN receipts r ON c.Id = r.CustomerId GROUP BY c.Id HAVING COUNT(r.ReceiptNumber) >= 15
SELECT CustomerId FROM receipts GROUP BY CustomerId HAVING COUNT(ReceiptNumber) >= 15
SELECT T1.LastName
SELECT c.LastName
SELECT COUNT(*) FROM goods WHERE Flavor = 'Cake'
SELECT COUNT(DISTINCT Flavor) FROM goods WHERE Food = 'Cake'
SELECT Flavor FROM goods WHERE Food = 'Croissant'
SELECT Flavor FROM goods WHERE Food = 'Croissant'
SELECT DISTINCT T2.Item FROM receipts AS T1 INNER JOIN items AS T2 ON T1.ReceiptNumber = T2.Receipt WHERE T1.CustomerId = 15
SELECT DISTINCT T2.Item FROM receipts AS T1 INNER JOIN items AS T2 ON T1.ReceiptNumber = T2.Receipt WHERE T1.CustomerId = 15
SELECT Food, AVG(Price) AS AveragePrice, MAX(Price) AS MaxPrice, MIN(Price) AS MinPrice FROM goods GROUP BY Food
SELECT AVG(Price), MIN(Price), MAX(Price) FROM goods GROUP BY Food
SELECT T1.ReceiptNumber
SELECT T1.ReceiptNumber
SELECT T1.ReceiptNumber
SELECT T1.ReceiptNumber
SELECT T1.ReceiptNumber, T1.Date
SELECT T1.ReceiptNumber, T1.Date
SELECT Item FROM items GROUP BY Item ORDER BY COUNT(Item) ASC LIMIT 1
SELECT Item FROM items GROUP BY Item ORDER BY COUNT(Item) ASC LIMIT 1
SELECT Food, COUNT(*) FROM goods GROUP BY Food
SELECT Food, COUNT(*) FROM goods GROUP BY Food
SELECT Food, AVG(Price) FROM goods GROUP BY Food
SELECT AVG(Price) FROM goods GROUP BY Food
SELECT Id FROM goods WHERE Flavor = 'Apricot' AND Price < 5
SELECT Id FROM goods WHERE Flavor = 'Apricot' AND Price < 5
SELECT Flavor FROM goods WHERE Price > 10 AND Food = 'Cake'
SELECT T2.Flavor FROM goods AS T1 INNER JOIN items AS T2 ON T1.Id = T2.Item INNER JOIN receipts AS T3 ON T2.Receipt = T3.ReceiptNumber WHERE T1.Food = 'Cake' AND T1.Price > 10
SELECT Id, Price FROM goods WHERE Price < ( SELECT AVG(Price) FROM goods )
SELECT DISTINCT Id, Price FROM goods WHERE Price < ( SELECT AVG(Price) FROM goods )
SELECT Id FROM goods WHERE Price < ( SELECT Price FROM goods WHERE Flavor = 'Tart' )
SELECT Id FROM goods WHERE Price < ( SELECT Price FROM goods WHERE Flavor = 'Tart' )
SELECT DISTINCT T1.ReceiptNumber
SELECT DISTINCT T1.ReceiptNumber
SELECT T2.Date
SELECT T2.Date
SELECT Id FROM goods WHERE Id LIKE '%APP%'
SELECT Id FROM goods WHERE Id LIKE '%APP%'
SELECT Price FROM goods WHERE Id = '70'
SELECT Id, Price FROM goods WHERE Id = '70'
SELECT LastName FROM customers ORDER BY LastName ASC
SELECT LastName FROM customers ORDER BY LastName ASC
SELECT Id FROM goods
SELECT DISTINCT Id FROM goods
SELECT r.ReceiptNumber
SELECT DISTINCT T1.ReceiptNumber
SELECT T1.Date, T1.ReceiptNumber FROM receipts AS T1 INNER JOIN customers AS T2 ON T1.CustomerId = T2.Id ORDER BY T1.Date DESC LIMIT 1
SELECT ReceiptNumber, Date FROM receipts ORDER BY Date DESC LIMIT 1
SELECT r.ReceiptNumber
SELECT T1.ReceiptNumber
SELECT Id FROM goods WHERE Price BETWEEN 3 AND 7 AND Flavor IN ('Cookie', 'Cake')
SELECT Id FROM goods WHERE Price BETWEEN 3 AND 7 AND Food IN ('Cookies', 'Cakes')
SELECT c.FirstName, c.LastName
SELECT c.FirstName, c.LastName FROM customers c INNER JOIN receipts r ON c.Id = r.CustomerId ORDER BY r.Date ASC LIMIT 1
SELECT AVG(Price) FROM goods WHERE Flavor = 'blackberry' OR Flavor = 'blueberry'
SELECT AVG(Price) FROM goods WHERE Flavor = 'blackberry' OR Flavor = 'blueberry'
SELECT MIN(Price) FROM goods WHERE Flavor = 'cheese'
SELECT MIN(Price) FROM goods WHERE Flavor = 'cheese'
SELECT Flavor, MAX(Price) AS highest, MIN(Price) AS lowest, AVG(Price) AS average FROM goods GROUP BY Flavor ORDER BY Flavor
SELECT Flavor, MAX(Price) AS max_price, MIN(Price) AS min_price, AVG(Price) AS avg_price FROM goods GROUP BY Flavor ORDER BY Flavor
SELECT MIN(Price), MAX(Price) FROM goods GROUP BY Food ORDER BY Food
SELECT MIN(Price), MAX(Price) FROM goods WHERE Food = 'food'
SELECT Date FROM receipts GROUP BY Date ORDER BY COUNT(ReceiptNumber) DESC LIMIT 3
SELECT Date FROM receipts GROUP BY Date ORDER BY COUNT(ReceiptNumber) DESC LIMIT 3
SELECT c.FirstName, c.LastName, COUNT(r.ReceiptNumber) FROM customers c JOIN receipts r ON c.Id = r.CustomerId GROUP BY c.Id ORDER BY COUNT(r.ReceiptNumber) DESC LIMIT 1
SELECT T1.CustomerId, COUNT(T2.Receipt) FROM customers AS T1 INNER JOIN receipts AS T2 ON T1.Id = T2.CustomerId GROUP BY T1.CustomerId ORDER BY COUNT(T2.Receipt) DESC LIMIT 1
SELECT COUNT(DISTINCT T2.CustomerId),  T1.Date
SELECT Date, COUNT(CustomerId) FROM receipts GROUP BY Date
SELECT T1.FirstName, T1.LastName
SELECT c.FirstName, c.LastName
SELECT Id FROM goods WHERE Price < ( SELECT MIN(Price) FROM goods WHERE Flavor = 'Croissant' ) AND Flavor = 'Cookie'
SELECT Id FROM goods WHERE Price < ( SELECT Price FROM goods WHERE Flavor = 'Croissant' ) AND Food = 'Cookie'
SELECT Id FROM goods WHERE Price >= ( SELECT AVG(Price) FROM goods WHERE Flavor = 'Tart' ) AND Flavor = 'Cake'
SELECT Id FROM goods WHERE Price >= ( SELECT AVG(Price) FROM goods WHERE Flavor = 'Tart' ) AND Flavor = 'Cake'
SELECT Id FROM goods WHERE Price > (SELECT AVG(Price) * 2 FROM goods)
SELECT Id FROM goods WHERE Price > ( SELECT AVG(Price) * 2 FROM goods )
SELECT Id, Flavor, Food FROM goods ORDER BY Price
SELECT Id, Flavor, Food FROM goods ORDER BY Price
SELECT T1.Id, T2.Flavor
SELECT Id, Flavor FROM goods WHERE Food = 'Cake' ORDER BY Flavor
SELECT i.Item
SELECT i.Item FROM items AS i INNER JOIN goods AS g ON i.Item = g.Id WHERE g.Flavor = 'chocolate' GROUP BY i.Item HAVING COUNT(i.Item) <= 10
SELECT Flavor FROM goods WHERE Food = 'Cake' EXCEPT SELECT Flavor FROM goods WHERE Food = 'Tart'
SELECT Flavor FROM goods WHERE Food = 'Cake' AND Id NOT IN (SELECT Id FROM goods WHERE Food = 'Tart')
SELECT Flavor FROM goods ORDER BY COUNT(Flavor) DESC LIMIT 3
SELECT Item FROM items GROUP BY Item ORDER BY COUNT(Item) DESC LIMIT 3
SELECT c.Id FROM customers c JOIN receipts r ON c.Id = r.CustomerId GROUP BY c.Id HAVING SUM(g.Price) > 150
SELECT c.Id FROM customers c JOIN receipts r ON c.Id = r.CustomerId GROUP BY c.Id HAVING SUM(g.Price) > 150
SELECT c.Id FROM customers c JOIN receipts r ON c.Id = r.CustomerId JOIN items i ON r.ReceiptNumber = i.Receipt JOIN goods g ON i.Item = g.Id GROUP BY c.Id HAVING AVG(g.Price) > 5
SELECT c.Id FROM customers c JOIN receipts r ON c.Id = r.CustomerId JOIN items i ON r.ReceiptNumber = i.Receipt JOIN goods g ON i.Item = g.Id GROUP BY c.Id HAVING AVG(g.Price) > 5
SELECT Date FROM receipts WHERE ReceiptNumber IN ( SELECT Receipt FROM items WHERE Price * Ordinal > 100 GROUP BY Receipt )
SELECT T2.Date FROM items AS T1 INNER JOIN receipts AS T2 ON T1.Receipt = T2.ReceiptNumber INNER JOIN goods AS T3 ON T1.Item = T3.Id GROUP BY T2.Date HAVING SUM(T3.Price) > 100
SELECT COUNT(Driver_ID) FROM driver
SELECT COUNT(Driver_ID) FROM driver
SELECT Make, COUNT(Driver_ID) FROM driver WHERE Points > 150 GROUP BY Make
SELECT Make, COUNT(Driver_ID) FROM driver WHERE Points > 150 GROUP BY Make
SELECT Make, AVG(Age) FROM driver GROUP BY Make
SELECT AVG(Age), Make FROM driver GROUP BY Make
SELECT AVG(Laps) FROM driver WHERE Age < 20
SELECT AVG(Laps) FROM driver WHERE Age < 20
SELECT T1.Manager, T1.Sponsor, T2.Car_Owner FROM team AS T1 INNER JOIN team_driver AS T2 ON T1.Team_ID = T2.Team_ID INNER JOIN driver AS T3 ON T2.Driver_ID = T3.Driver_ID ORDER BY T3.Car_Owner
SELECT T1.Manager, T1.Sponsor, T2.Car_Owner FROM team AS T1 INNER JOIN team_driver AS T2 ON T1.Team_ID = T2.Team_ID INNER JOIN driver AS T3 ON T2.Driver_ID = T3.Driver_ID GROUP BY T2.Car_Owner ORDER BY T2.Car_Owner
SELECT Make FROM team GROUP BY Make HAVING COUNT(Team_ID) > 1
SELECT Make FROM team GROUP BY Make HAVING COUNT(Team_ID) > 1
SELECT T2.Make FROM team_driver AS T1 INNER JOIN team AS T2 ON T1.Team_ID = T2.Team_ID INNER JOIN driver AS T3 ON T1.Driver_ID = T3.Driver_ID WHERE T3.Car_Owner = 'Buddy Arrington'
SELECT T2.Make FROM team_driver AS T1 INNER JOIN team AS T2 ON T1.Team_ID = T2.Team_ID INNER JOIN driver AS T3 ON T1.Driver_ID = T3.Driver_ID WHERE T3.Car_Owner = 'Buddy Arrington'
SELECT MAX(Points), MIN(Points) FROM driver
SELECT MAX(Points),  MIN(Points) FROM driver
SELECT COUNT(Driver_ID) FROM driver WHERE Points < 150
SELECT COUNT(Driver_ID) FROM driver WHERE Points < 150
SELECT Driver FROM driver ORDER BY Age ASC
SELECT Driver FROM driver ORDER BY Age ASC
SELECT Driver FROM driver ORDER BY Points DESC
SELECT Driver FROM driver ORDER BY Points DESC
SELECT Driver, Country FROM driver
SELECT Driver, Country FROM driver
SELECT MAX(Points) FROM driver WHERE Country IN ( SELECT Country FROM country WHERE Capital = 'Dublin' )
SELECT MAX(T2.Points) FROM country AS T1 INNER JOIN driver AS T2 ON T1.Country = T2.Country WHERE T1.Capital = 'Dublin'
SELECT AVG(Age) FROM driver WHERE Country IN ( SELECT Country FROM country WHERE Official_native_language = 'English' )
SELECT AVG(Age) FROM driver AS T1 INNER JOIN country AS T2 ON T1.Country = T2.Country WHERE T2.Official_native_language = 'English'
SELECT T1.Country FROM driver AS T1 INNER JOIN country AS T2 ON T1.Country = T2.Country WHERE T1.Points > 150
SELECT T1.Country FROM driver AS T1 INNER JOIN country AS T2 ON T1.Country = T2.Country WHERE T1.Points > 150
SELECT T1.Capital FROM country AS T1 INNER JOIN driver AS T2 ON T1.Country_Id = T2.Country ORDER BY T2.Points DESC LIMIT 1
SELECT T1.Capital FROM country AS T1 INNER JOIN driver AS T2 ON T1.Country = T2.Country ORDER BY T2.Points DESC LIMIT 1
SELECT Make, COUNT(Driver_ID) FROM driver GROUP BY Make
SELECT Make, COUNT(Driver_ID) FROM driver GROUP BY Make
SELECT Make FROM driver GROUP BY Make ORDER BY COUNT(Make) DESC LIMIT 1
SELECT Make FROM driver GROUP BY Make ORDER BY COUNT(Make) DESC LIMIT 1
SELECT T1.Make FROM driver AS T1 INNER JOIN team_driver AS T2 ON T1.Driver_ID = T2.Driver_ID GROUP BY T1.Make HAVING COUNT(T1.Driver_ID) >= 3
SELECT Make FROM driver GROUP BY Make HAVING COUNT(Make) >= 3
SELECT Team FROM team WHERE Team_ID NOT IN (SELECT Team_ID FROM team_driver)
SELECT Team FROM team WHERE Team_ID NOT IN (SELECT Team_ID FROM team_driver)
SELECT T1.Country FROM driver AS T1 INNER JOIN team_driver AS T2 ON T1.Driver_ID = T2.Driver_ID INNER JOIN team AS T3 ON T2.Team_ID = T3.Team_ID WHERE T1.Make = 'Dodge' INTERSECT SELECT T1.Country FROM driver AS T1 INNER JOIN team_driver AS T2 ON T1.Driver_ID = T2.Driver_ID INNER JOIN team AS T3 ON T2.Team_ID = T3.Team_ID WHERE T1.Make = 'Chevrolet'
SELECT Country FROM driver WHERE Make = 'Dodge' INTERSECT SELECT Country FROM driver WHERE Make = 'Chevrolet'
SELECT SUM(Points) AS Total_Points, AVG(Points) AS Average_Points FROM driver
SELECT SUM(Points) AS Total_Points, AVG(Points) AS Average_Points FROM driver
SELECT Country FROM country WHERE Country_Id NOT IN (SELECT Country_Id FROM driver)
SELECT Country FROM country WHERE Country_Id NOT IN (SELECT Country_Id FROM driver)
SELECT T1.Manager, T1.Sponsor FROM team AS T1 INNER JOIN team_driver AS T2 ON T1.Team_ID = T2.Team_ID GROUP BY T1.Team_ID ORDER BY COUNT(T2.Driver_ID) DESC LIMIT 1
SELECT T1.Manager, T1.Sponsor FROM team AS T1 INNER JOIN team_driver AS T2 ON T1.Team_ID = T2.Team_ID GROUP BY T1.Team_ID ORDER BY COUNT(T2.Driver_ID) DESC LIMIT 1
SELECT T1.Manager, T1.Car_Owner FROM team AS T1 INNER JOIN team_driver AS T2 ON T1.Team_ID = T2.Team_ID GROUP BY T1.Team_ID HAVING COUNT(T2.Driver_ID) >= 2
SELECT T1.Manager, T1.Car_Owner
SELECT COUNT(Institution_ID) FROM institution
SELECT COUNT(Institution_ID) FROM institution
SELECT Name FROM institution ORDER BY Name ASC
SELECT Name FROM institution ORDER BY Name ASC
SELECT Name FROM institution ORDER BY Founded ASC
SELECT Name FROM institution ORDER BY Founded
SELECT City, Province FROM institution
SELECT City, Province FROM institution
SELECT MAX(Enrollment),  MIN(Enrollment) FROM institution
SELECT MAX(Enrollment),  MIN(Enrollment) FROM institution
SELECT Affiliation FROM institution WHERE City!= 'Vancouver'
SELECT DISTINCT Affiliation FROM institution WHERE City!= 'Vancouver'
SELECT Stadium FROM institution ORDER BY Capacity DESC
SELECT Stadium FROM institution ORDER BY Capacity DESC
SELECT Stadium FROM institution ORDER BY Enrollment DESC LIMIT 1
SELECT Stadium FROM institution ORDER BY Enrollment DESC LIMIT 1
SELECT Name, Nickname FROM institution INNER JOIN Championship ON institution.Institution_ID = Championship.Institution_ID
SELECT Name, Nickname FROM institution INNER JOIN Championship ON institution.Institution_ID = Championship.Institution_ID
SELECT T2.Nickname FROM institution AS T1 INNER JOIN Championship AS T2 ON T1.Institution_ID = T2.Institution_ID ORDER BY T1.Enrollment ASC LIMIT 1
SELECT T2.Nickname FROM institution AS T1 INNER JOIN Championship AS T2 ON T1.Institution_ID = T2.Institution_ID ORDER BY T1.Enrollment LIMIT 1
SELECT T1.Name FROM institution AS T1 INNER JOIN Championship AS T2 ON T1.Institution_ID = T2.Institution_ID ORDER BY T2.Number_of_Championships DESC
SELECT T1.Name FROM institution AS T1 INNER JOIN Championship AS T2 ON T1.Institution_ID = T2.Institution_ID ORDER BY T2.Number_of_Championships DESC
SELECT Name FROM institution WHERE Institution_ID IN (SELECT Institution_ID FROM Championship)
SELECT T1.Name FROM institution AS T1 INNER JOIN Championship AS T2 ON T1.Institution_ID = T2.Institution_ID GROUP BY T1.Name HAVING COUNT(T2.Institution_ID) >= 1
SELECT COUNT(T2.Number_of_Championships)
SELECT SUM(Number_of_Championships) FROM Championship WHERE Institution_ID IN ( SELECT Institution_ID FROM institution WHERE Affiliation = 'Public' )
SELECT Affiliation, COUNT(Institution_ID) FROM institution GROUP BY Affiliation
SELECT Affiliation, COUNT(Institution_ID) FROM institution GROUP BY Affiliation
SELECT Affiliation FROM institution GROUP BY Affiliation ORDER BY COUNT(Institution_ID) DESC LIMIT 1
SELECT Affiliation FROM institution GROUP BY Affiliation ORDER BY COUNT(Affiliation) DESC LIMIT 1
SELECT Founded FROM institution GROUP BY Founded HAVING COUNT(Institution_ID) > 1
SELECT Founded, COUNT(Institution_ID) FROM institution GROUP BY Founded HAVING COUNT(Institution_ID) > 1
SELECT T2.Nickname FROM institution AS T1 INNER JOIN Championship AS T2 ON T1.Institution_ID = T2.Institution_ID ORDER BY T1.Capacity DESC
SELECT T2.Nickname FROM institution AS T1 INNER JOIN Championship AS T2 ON T1.Institution_ID = T2.Institution_ID ORDER BY T1.Capacity DESC
SELECT SUM(Enrollment) FROM institution WHERE City IN ('Vancouver', 'Calgary')
SELECT Enrollment FROM institution WHERE City = 'Vancouver' OR City = 'Calgary'
SELECT Province FROM institution WHERE Founded < 1920 INTERSECT SELECT Province FROM institution WHERE Founded > 1950
SELECT Province FROM institution WHERE Founded < 1920 INTERSECT SELECT Province FROM institution WHERE Founded > 1950
SELECT COUNT(DISTINCT Province) FROM institution
SELECT COUNT(DISTINCT Province) FROM institution
SELECT * FROM Warehouses
SELECT * FROM Warehouses
SELECT DISTINCT T2.Contents FROM Warehouses AS T1 INNER JOIN Boxes AS T2 ON T1.Code = T2.Warehouse WHERE T1.Location = 'New York'
SELECT DISTINCT T2.Contents
SELECT Contents FROM Boxes WHERE Value > 150
SELECT Contents FROM Boxes WHERE Value > 150
SELECT T1.Code, AVG(T2.Value) FROM Warehouses AS T1 INNER JOIN Boxes AS T2 ON T1.Code = T2.Warehouse GROUP BY T1.Code
SELECT T1.Location, AVG(T2.Value) FROM Warehouses AS T1 INNER JOIN Boxes AS T2 ON T1.Code = T2.Warehouse GROUP BY T1.Location
SELECT AVG(Value), SUM(Value) FROM Boxes
SELECT AVG(Value), SUM(Value) FROM Boxes
SELECT AVG(Capacity), SUM(Capacity) FROM Warehouses
SELECT AVG(Capacity), SUM(Capacity) FROM Warehouses
SELECT Contents, AVG(Value) AS Average_Value, MAX(Value) AS Max_Value FROM Boxes GROUP BY Contents
SELECT Contents, AVG(Value) AS Average_Value, MAX(Value) AS Max_Value FROM Boxes GROUP BY Contents
SELECT Contents FROM Boxes GROUP BY Contents ORDER BY SUM(Value) DESC LIMIT 1
SELECT Contents FROM Boxes ORDER BY Value DESC LIMIT 1
SELECT AVG(Value) FROM Boxes
SELECT AVG(Value) FROM Boxes
SELECT DISTINCT Contents FROM Boxes
SELECT DISTINCT Contents FROM Boxes
SELECT COUNT(DISTINCT Contents) FROM Boxes
SELECT COUNT(DISTINCT Contents) FROM Boxes
SELECT DISTINCT Location FROM Warehouses
SELECT DISTINCT Location FROM Warehouses
SELECT B.Code
SELECT T2.Code
SELECT SUM(T2.Value) FROM Warehouses AS T1 INNER JOIN Boxes AS T2 ON T1.Code = T2.Warehouse WHERE T1.Location IN ('Chicago', 'New York')
SELECT SUM(T2.Value) FROM Warehouses AS T1 INNER JOIN Boxes AS T2 ON T1.Code = T2.Warehouse WHERE T1.Location IN ('Chicago', 'New York')
SELECT DISTINCT Contents FROM Boxes WHERE Warehouse IN (SELECT Code FROM Warehouses WHERE Location = 'Chicago') OR Warehouse IN (SELECT Code FROM Warehouses WHERE Location = 'New York')
SELECT Contents FROM Boxes WHERE Warehouse IN (SELECT Code FROM Warehouses WHERE Location = 'Chicago') INTERSECT SELECT Contents FROM Boxes WHERE Warehouse IN (SELECT Code FROM Warehouses WHERE Location = 'New York')
SELECT Contents FROM Boxes WHERE Contents NOT IN ( SELECT Contents FROM Boxes WHERE Location = 'New York' )
SELECT Contents FROM Boxes WHERE Location = 'New York' EXCEPT SELECT Contents FROM Boxes
SELECT T2.Location
SELECT T1.Location FROM Warehouses AS T1 INNER JOIN Boxes AS T2 ON T1.Code = T2.Warehouse WHERE T2.Contents = 'Rocks' AND T2.Contents!= 'Scissors'
SELECT T1.Code FROM Warehouses AS T1 INNER JOIN Boxes AS T2 ON T1.Code = T2.Warehouse WHERE T2.Contents IN ('Rocks', 'Scissors')
SELECT DISTINCT T1.Code
SELECT T2.Location
SELECT T2.Location
SELECT Code, Contents FROM Boxes ORDER BY Value
SELECT Code, Contents FROM Boxes ORDER BY Value
SELECT Code, Contents FROM Boxes ORDER BY Value ASC LIMIT 1
SELECT Code, Contents FROM Boxes WHERE Value = ( SELECT MIN(Value) FROM Boxes )
SELECT DISTINCT Contents FROM Boxes WHERE Value > ( SELECT AVG(Value) FROM Boxes )
SELECT DISTINCT Contents FROM Boxes WHERE Value > ( SELECT AVG(Value) FROM Boxes )
SELECT DISTINCT Contents FROM Boxes ORDER BY Contents
SELECT DISTINCT Contents FROM Boxes ORDER BY Contents ASC
SELECT Code FROM Boxes WHERE Value > ( SELECT Value FROM Boxes WHERE Contents = 'Rocks' )
SELECT Code FROM Boxes WHERE Value > ( SELECT MAX(Value) FROM Boxes WHERE Contents = 'Rocks' )
SELECT Code, Contents
SELECT T2.Code, T2.Contents
SELECT SUM(T2.Value) FROM Warehouses AS T1 INNER JOIN Boxes AS T2 ON T1.Code = T2.Warehouse WHERE T1.Capacity = ( SELECT MAX(Capacity) FROM Warehouses )
SELECT SUM(T2.Value) FROM Warehouses AS T1 INNER JOIN Boxes AS T2 ON T1.Code = T2.Warehouse WHERE T1.Capacity = ( SELECT MAX(Capacity) FROM Warehouses )
SELECT T1.Code, AVG(T2.Value) FROM Warehouses AS T1 INNER JOIN Boxes AS T2 ON T1.Code = T2.Warehouse GROUP BY T1.Code HAVING AVG(T2.Value) > 150
SELECT AVG(T2.Value) FROM Warehouses AS T1 INNER JOIN Boxes AS T2 ON T1.Code = T2.Warehouse GROUP BY T1.Code HAVING AVG(T2.Value) > 150
SELECT Contents, SUM(Value) AS TotalValue, COUNT(Code) AS NumberOfBoxes FROM Boxes GROUP BY Contents
SELECT Contents, SUM(Value) AS TotalValue, COUNT(Code) AS NumBoxes FROM Boxes GROUP BY Contents
SELECT Location, SUM(Capacity) AS TotalCapacity, AVG(Capacity) AS AverageCapacity, MAX(Capacity) AS MaxCapacity FROM Warehouses GROUP BY Location
SELECT Location, SUM(Capacity) AS TotalCapacity, AVG(Capacity) AS AverageCapacity, MAX(Capacity) AS MaxCapacity FROM Warehouses GROUP BY Location
SELECT SUM(Capacity) FROM Warehouses
SELECT SUM(Capacity) FROM Warehouses
SELECT T2.Value FROM Warehouses AS T1 INNER JOIN Boxes AS T2 ON T1.Code = T2.Warehouse GROUP BY T1.Location ORDER BY SUM(T2.Value) DESC LIMIT 1
SELECT T2.Location, MAX(T1.Value) FROM Boxes AS T1 INNER JOIN Warehouses AS T2 ON T1.Warehouse = T2.Code
SELECT T1.Code, COUNT(T2.Code) FROM Warehouses AS T1 INNER JOIN Boxes AS T2 ON T1.Code = T2.Warehouse GROUP BY T1.Code
SELECT T1.Location, COUNT(T2.Code) FROM Warehouses AS T1 INNER JOIN Boxes AS T2 ON T1.Code = T2.Warehouse GROUP BY T1.Location
SELECT COUNT(DISTINCT T2.Location) FROM Boxes AS T1 INNER JOIN Warehouses AS T2 ON T1.Warehouse = T2.Code WHERE T1.Contents = 'Rocks'
SELECT COUNT(DISTINCT T2.Warehouse) FROM Boxes AS T1 INNER JOIN Warehouses AS T2 ON T1.Warehouse = T2.Code WHERE T1.Contents = 'Rocks'
SELECT T2.Code, T1.Location
SELECT T2.Code, T1.Location FROM Warehouses AS T1 INNER JOIN Boxes AS T2 ON T1.Code = T2.Warehouse
SELECT T2.Code
SELECT T2.Code FROM Warehouses AS T1 INNER JOIN Boxes AS T2 ON T1.Code = T2.Warehouse WHERE T1.Location = 'Chicago'
SELECT T1.Location, COUNT(T2.Code) FROM Warehouses AS T1 INNER JOIN Boxes AS T2 ON T1.Code = T2.Warehouse GROUP BY T1.Location
SELECT T1.Location, COUNT(T2.Code) FROM Warehouses AS T1 INNER JOIN Boxes AS T2 ON T1.Code = T2.Warehouse GROUP BY T1.Location
SELECT T1.Location, COUNT(DISTINCT T2.Contents) FROM Warehouses AS T1 INNER JOIN Boxes AS T2 ON T1.Code = T2.Warehouse GROUP BY T1.Location
SELECT T1.Location, COUNT(DISTINCT T2.Contents) FROM Warehouses AS T1 INNER JOIN Boxes AS T2 ON T1.Code = T2.Warehouse GROUP BY T1.Location
SELECT Code FROM Warehouses WHERE Capacity < ( SELECT SUM(Value) FROM Boxes WHERE Warehouse = Code )
SELECT T1.Code FROM Warehouses AS T1 INNER JOIN Boxes AS T2 ON T1.Code = T2.Warehouse GROUP BY T1.Code HAVING COUNT(T2.Code) > T1.Capacity
SELECT SUM(T2.Value) FROM Warehouses AS T1 INNER JOIN Boxes AS T2 ON T1.Code = T2.Warehouse WHERE T1.Location!= 'Chicago'
SELECT SUM(T2.Value) FROM Warehouses AS T1 INNER JOIN Boxes AS T2 ON T1.Code = T2.Warehouse WHERE T1.Location!= 'Chicago'
SELECT University_Name, City, State FROM university ORDER BY University_Name ASC
SELECT University_Name, City, State FROM university ORDER BY University_Name ASC
SELECT COUNT(University_ID) FROM university WHERE State = 'IL' OR State = 'OH'
SELECT COUNT(University_ID) FROM university WHERE State = 'IL' OR State = 'OH'
SELECT MAX(Enrollment),  AVG(Enrollment),  MIN(Enrollment) FROM university
SELECT MAX(Enrollment),  AVG(Enrollment),  MIN(Enrollment) FROM university
SELECT Team_Name FROM university WHERE Enrollment > ( SELECT AVG(Enrollment) FROM university )
SELECT T2.Team_Name FROM university AS T1 INNER JOIN overall_ranking AS T2 ON T1.University_ID = T2.University_ID INNER JOIN university AS T3 ON T2.University_ID = T3.University_ID WHERE T1.Enrollment > ( SELECT AVG(Enrollment) FROM university )
SELECT Home_Conference FROM university
SELECT DISTINCT Home_Conference FROM university
SELECT Home_Conference, COUNT(University_ID) FROM university GROUP BY Home_Conference
SELECT COUNT(DISTINCT University_ID), Home_Conference FROM university GROUP BY Home_Conference
SELECT State FROM university GROUP BY State ORDER BY COUNT(University_ID) DESC LIMIT 1
SELECT State FROM university GROUP BY State ORDER BY COUNT(University_ID) DESC LIMIT 1
SELECT Home_Conference FROM university WHERE Enrollment > 2000 GROUP BY Home_Conference
SELECT Home_Conference FROM university WHERE Enrollment > 2000 GROUP BY Home_Conference
SELECT Home_Conference FROM university ORDER BY Enrollment ASC LIMIT 1
SELECT Home_Conference FROM university ORDER BY Enrollment ASC LIMIT 1
SELECT Major_Name, Major_Code FROM major ORDER BY Major_Code
SELECT Major_Name, Major_Code FROM major ORDER BY Major_Code
SELECT m.Major_Name, mr.Rank
SELECT T2.Major_Name, T1.Rank FROM major_ranking AS T1 INNER JOIN major AS T2 ON T1.Major_ID = T2.Major_ID WHERE T2.Major_Name = 'Augustana College'
SELECT T1.University_Name, T1.City, T1.State
SELECT T1.University_Name, T1.City, T1.State
SELECT T2.University_Name FROM major_ranking AS T1 INNER JOIN university AS T2 ON T1.University_ID = T2.University_ID WHERE T1.Rank = 1 GROUP BY T2.University_Name ORDER BY COUNT(T1.Major_ID) DESC LIMIT 1
SELECT T2.University_Name FROM major_ranking AS T1 INNER JOIN university AS T2 ON T1.University_ID = T2.University_ID WHERE T1.Rank = 1 GROUP BY T2.University_Name ORDER BY COUNT(T1.Major_ID) DESC LIMIT 1
SELECT T1.University_Name
SELECT T1.University_Name FROM university AS T1 INNER JOIN major_ranking AS T2 ON T1.University_ID = T2.University_ID WHERE T2.Rank!= 1
SELECT T1.University_Name
SELECT T1.University_Name
SELECT T1.University_Name, T2.Rank FROM university AS T1 INNER JOIN overall_ranking AS T2 ON T1.University_ID = T2.University_ID WHERE T1.State = 'Wisconsin'
SELECT T1.University_Name, T2.Rank FROM university AS T1 INNER JOIN overall_ranking AS T2 ON T1.University_ID = T2.University_ID WHERE T1.State = 'Wisconsin'
SELECT T2.University_Name FROM overall_ranking AS T1 INNER JOIN university AS T2 ON T1.University_ID = T2.University_ID ORDER BY T1.Research_point DESC LIMIT 1
SELECT T2.University_Name FROM overall_ranking AS T1 INNER JOIN university AS T2 ON T1.University_ID = T2.University_ID ORDER BY T1.Research_point DESC LIMIT 1
SELECT T2.University_Name FROM overall_ranking AS T1 INNER JOIN university AS T2 ON T1.University_ID = T2.University_ID ORDER BY T1.Reputation_point ASC
SELECT T2.University_Name FROM overall_ranking AS T1 INNER JOIN university AS T2 ON T1.University_ID = T2.University_ID ORDER BY T1.Reputation_point ASC
SELECT T2.University_Name
SELECT T2.University_Name
SELECT SUM(T2.Enrollment) FROM overall_ranking AS T1 INNER JOIN university AS T2 ON T1.University_ID = T2.University_ID WHERE T1.Rank <= 5
SELECT COUNT(Enrollment) FROM university AS T1 INNER JOIN overall_ranking AS T2 ON T1.University_ID = T2.University_ID WHERE T2.Rank <= 5
SELECT T2.University_Name, T1.Citation_point
SELECT T1.University_Name, T2.Citation_point FROM university AS T1 INNER JOIN overall_ranking AS T2 ON T1.University_ID = T2.University_ID ORDER BY T2.Reputation_point DESC LIMIT 3
SELECT State FROM university WHERE Enrollment < 3000 GROUP BY State HAVING COUNT(University_ID) > 2
SELECT State FROM university GROUP BY State HAVING COUNT(University_ID) > 2 AND Enrollment < 3000
SELECT Title FROM Movies WHERE Rating IS NULL
SELECT Title FROM Movies WHERE Code NOT IN ( SELECT Code FROM MovieTheaters )
SELECT T2.Title FROM MovieTheaters AS T1 INNER JOIN Movies AS T2 ON T1.Code = T2.Code WHERE T2.Rating = 'G'
SELECT T2.Title FROM MovieTheaters AS T1 INNER JOIN Movies AS T2 ON T1.Code = T2.Code WHERE T2.Rating = 'G'
SELECT T2.Title FROM MovieTheaters AS T1 INNER JOIN Movies AS T2 ON T1.Code = T2.Code WHERE T1.Name = 'Odeon'
SELECT T2.Title FROM MovieTheaters AS T1 INNER JOIN Movies AS T2 ON T1.Code = T2.Code WHERE T1.Name = 'Odeon'
SELECT T1.Name, T2.Title FROM MovieTheaters AS T1 INNER JOIN Movies AS T2 ON T1.Code = T2.Code
SELECT T1.Title, T2.Name FROM Movies AS T1 INNER JOIN MovieTheaters AS T2 ON T1.Code = T2.Code
SELECT COUNT(*) FROM Movies WHERE Rating = 'G'
SELECT COUNT(T1.Code) FROM Movies AS T1 INNER JOIN MovieTheaters AS T2 ON T1.Code = T2.Code WHERE T1.Rating = 'G'
SELECT COUNT(*) FROM MovieTheaters
SELECT COUNT(*) FROM MovieTheaters
SELECT COUNT(DISTINCT T2.Title) FROM MovieTheaters AS T1 INNER JOIN Movies AS T2 ON T1.Code = T2.Code
SELECT COUNT(DISTINCT Title) FROM Movies
SELECT COUNT(DISTINCT Name) FROM MovieTheaters
SELECT COUNT(DISTINCT Name) FROM MovieTheaters
SELECT T1.Rating FROM Movies AS T1 INNER JOIN MovieTheaters AS T2 ON T1.Code = T2.Code WHERE T2.Name LIKE '%Citizen%'
SELECT T1.Rating FROM Movies AS T1 INNER JOIN MovieTheaters AS T2 ON T1.Code = T2.Movie WHERE T2.Name LIKE '%Citizen%'
SELECT T2.Name FROM Movies AS T1 INNER JOIN MovieTheaters AS T2 ON T1.Code = T2.Code WHERE T1.Rating IN ('G', 'PG')
SELECT T2.Name FROM Movies AS T1 INNER JOIN MovieTheaters AS T2 ON T1.Code = T2.Code WHERE T1.Rating IN ('G', 'PG')
SELECT T2.Title FROM MovieTheaters AS T1 INNER JOIN Movies AS T2 ON T1.Code = T2.Code WHERE T1.Name = 'Odeon' OR T1.Name = 'Imperial'
SELECT T2.Title FROM MovieTheaters AS T1 INNER JOIN Movies AS T2 ON T1.Code = T2.Code WHERE T1.Name = 'Odeon' OR T1.Name = 'Imperial'
SELECT T2.Title FROM MovieTheaters AS T1 INNER JOIN Movies AS T2 ON T1.Code = T2.Code WHERE T1.Name = 'Odeon' INTERSECT SELECT T2.Title FROM MovieTheaters AS T1 INNER JOIN Movies AS T2 ON T1.Code = T2.Code WHERE T1.Name = 'Imperial'
SELECT T1.Title FROM Movies AS T1 INNER JOIN MovieTheaters AS T2 ON T1.Code = T2.Movie WHERE T2.Name = 'Odeon' INTERSECT SELECT T1.Title FROM Movies AS T1 INNER JOIN MovieTheaters AS T2 ON T1.Code = T2.Movie WHERE T2.Name = 'Imperial'
SELECT T2.Title FROM MovieTheaters AS T1 INNER JOIN Movies AS T2 ON T1.Code = T2.Code WHERE T1.Name!= 'Odeon'
SELECT T2.Title FROM MovieTheaters AS T1 INNER JOIN Movies AS T2 ON T1.Code = T2.Code WHERE T1.Name!= 'Odeon'
SELECT Title FROM Movies ORDER BY Title ASC
SELECT Title FROM Movies ORDER BY Title ASC
SELECT Title FROM Movies ORDER BY Rating
SELECT T2.Title FROM MovieTheaters AS T1 INNER JOIN Movies AS T2 ON T1.Code = T2.Code ORDER BY T2.Rating
SELECT Name FROM MovieTheaters WHERE Code IN ( SELECT Code FROM Movie GROUP BY Code ORDER BY COUNT(Code) DESC LIMIT 1 )
SELECT Name FROM MovieTheaters WHERE Code IN ( SELECT Code FROM MovieTheaters GROUP BY Code ORDER BY COUNT(Code) DESC LIMIT 1 )
SELECT T2.Title FROM MovieTheaters AS T1 INNER JOIN Movies AS T2 ON T1.Code = T2.Code GROUP BY T2.Title ORDER BY COUNT(T1.Code) DESC LIMIT 1
SELECT T2.Title FROM MovieTheaters AS T1 INNER JOIN Movies AS T2 ON T1.Code = T2.Code GROUP BY T2.Title ORDER BY COUNT(T1.Code) DESC LIMIT 1
SELECT Rating, COUNT(*) FROM Movies GROUP BY Rating
SELECT Rating, COUNT(*) FROM Movies GROUP BY Rating
SELECT COUNT(Code) FROM Movies WHERE Rating IS NOT NULL
SELECT COUNT(*) FROM Movies WHERE Rating IS NOT NULL
SELECT T2.Name FROM MovieTheaters AS T1 INNER JOIN Movies AS T2 ON T1.Code = T2.Code
SELECT T2.Name FROM MovieTheaters AS T1 INNER JOIN Movies AS T2 ON T1.Code = T2.Code
SELECT T2.Name FROM Movies AS T1 INNER JOIN MovieTheaters AS T2 ON T1.Code = T2.Code WHERE T1.Code IS NULL
SELECT Name FROM MovieTheaters WHERE Code NOT IN (SELECT Code FROM Movie)
SELECT T2.Name FROM Movies AS T1 INNER JOIN MovieTheaters AS T2 ON T1.Code = T2.Code WHERE T1.Rating = 'G'
SELECT T2.Name FROM Movies AS T1 INNER JOIN MovieTheaters AS T2 ON T1.Code = T2.Code WHERE T1.Rating = 'G'
SELECT Title FROM Movies
SELECT Title FROM Movies
SELECT DISTINCT Rating FROM Movies
SELECT DISTINCT Rating FROM Movies
SELECT * FROM Movies WHERE Rating IS NULL
SELECT * FROM Movies WHERE Rating = 'Unrated'
SELECT Title FROM Movies WHERE Code NOT IN (SELECT Movie FROM MovieTheaters)
SELECT Title FROM Movies WHERE Code NOT IN (SELECT Code FROM MovieTheaters)
SELECT T2.Recipient FROM Package AS T1 INNER JOIN Client AS T2 ON T1.Sender = T2.AccountNumber ORDER BY T1.Weight DESC LIMIT 1
SELECT T1.Name FROM Client AS T1 INNER JOIN Package AS T2 ON T1.AccountNumber = T2.Sender INNER JOIN Shipment AS T3 ON T2.Shipment = T3.ShipmentID ORDER BY T2.Weight DESC LIMIT 1
SELECT SUM(T2.Weight) FROM Client AS T1 INNER JOIN Package AS T2 ON T1.AccountNumber = T2.Sender WHERE T1.Name = 'Leo Wong'
SELECT SUM(T2.Weight) FROM Employee AS T1 INNER JOIN Package AS T2 ON T1.EmployeeID = T2.Sender WHERE T1.Name = 'Leo Wong'
SELECT Position FROM Employee WHERE Name = 'Amy Wong'
SELECT Position FROM Employee WHERE Name = 'Amy Wong'
SELECT Salary, Position FROM Employee WHERE Name = 'Turanga Leela'
SELECT Salary, Position FROM Employee WHERE Name = 'Turanga Leela'
SELECT AVG(Salary) FROM Employee WHERE Position = 'Intern'
SELECT AVG(Salary) FROM Employee WHERE Position = 'Intern'
SELECT Level FROM Has_Clearance WHERE Employee = ( SELECT EmployeeID FROM Employee WHERE Name = 'Physician' )
SELECT Level FROM Has_Clearance AS T1 INNER JOIN Employee AS T2 ON T1.Employee = T2.EmployeeID WHERE T2.Position = 'Physician'
SELECT T2.PackageNumber FROM Employee AS T1 INNER JOIN Package AS T2 ON T1.EmployeeID = T2.Sender WHERE T1.Name = 'Leo Wong'
SELECT COUNT(*) FROM Package WHERE Sender = 'Leo Wong'
SELECT T2.PackageNumber
SELECT T2.PackageNumber
SELECT PackageNumber FROM Package WHERE Sender = (SELECT EmployeeID FROM Employee WHERE Name = 'Leo Wong') OR Recipient = (SELECT EmployeeID FROM Employee WHERE Name = 'Leo Wong')
SELECT DISTINCT T1.PackageNumber FROM Package AS T1 INNER JOIN Recipient ON T1.Recipient = Recipient.AccountNumber INNER JOIN Sender ON T1.Sender = Sender.AccountNumber WHERE Sender.Name = 'Leo Wong' OR Recipient.Name = 'Leo Wong'
SELECT COUNT(T1.PackageNumber)
SELECT COUNT(*) FROM Package AS T1 INNER JOIN Employee AS T2 ON T1.Sender = T2.Name INNER JOIN Employee AS T3 ON T1.Recipient = T3.Name WHERE T2.Name = 'Ogden Wernstrom' AND T3.Name = 'Leo Wong'
SELECT T2.Contents
SELECT Contents FROM Package WHERE Sender = (SELECT EmployeeID FROM Employee WHERE Name = 'John Zoidfarb')
SELECT T2.PackageNumber, T2.Weight FROM Client AS T1 INNER JOIN Package AS T2 ON T1.AccountNumber = T2.Sender INNER JOIN Shipment AS T3 ON T2.Shipment = T3.ShipmentID WHERE T1.Name LIKE '%John%' ORDER BY T2.Weight DESC LIMIT 1
SELECT T2.PackageNumber, T2.Weight FROM Client AS T1 INNER JOIN Package AS T2 ON T1.AccountNumber = T2.Sender WHERE T1.Name LIKE 'John%' ORDER BY T2.Weight DESC LIMIT 1
SELECT PackageNumber, Weight FROM Package ORDER BY Weight ASC LIMIT 3
SELECT PackageNumber, Weight FROM Package ORDER BY Weight ASC LIMIT 3
SELECT T1.Name, COUNT(T2.PackageNumber) FROM Client AS T1 INNER JOIN Package AS T2 ON T1.AccountNumber = T2.Sender GROUP BY T1.AccountNumber ORDER BY COUNT(T2.PackageNumber) DESC LIMIT 1
SELECT T1.Name, COUNT(T2.PackageNumber) FROM Client AS T1 INNER JOIN Package AS T2 ON T1.AccountNumber = T2.Sender GROUP BY T1.Name ORDER BY COUNT(T2.PackageNumber) DESC LIMIT 1
SELECT T1.Name, COUNT(T2.Recipient) FROM Client AS T1 INNER JOIN Package AS T2 ON T1.AccountNumber = T2.Recipient GROUP BY T1.AccountNumber ORDER BY COUNT(T2.Recipient) ASC LIMIT 1
SELECT T1.Recipient, COUNT(T1.Recipient) FROM Package AS T1 INNER JOIN Shipment AS T2 ON T1.Shipment = T2.ShipmentID GROUP BY T1.Recipient ORDER BY COUNT(T1.Recipient) ASC LIMIT 1
SELECT T2.Name FROM Package AS T1 INNER JOIN Client AS T2 ON T1.Sender = T2.AccountNumber GROUP BY T1.Sender HAVING COUNT(T1.Sender) > 1
SELECT T1.Name FROM Client AS T1 INNER JOIN Package AS T2 ON T1.AccountNumber = T2.Sender GROUP BY T2.Sender HAVING COUNT(T2.Sender) > 1
SELECT Coordinates FROM Planet WHERE Name = 'Mars'
SELECT Coordinates FROM Planet WHERE Name = 'Mars'
SELECT Name, Coordinates FROM Planet ORDER BY Name ASC
SELECT Name, Coordinates FROM Planet ORDER BY Name
SELECT ShipmentID FROM Shipment WHERE Manager = 'Phillip J. Fry'
SELECT ShipmentID FROM Shipment WHERE Manager = 'Phillip J Fry'
SELECT Date FROM Shipment
SELECT Date FROM Shipment
SELECT T1.ShipmentID FROM Shipment AS T1 INNER JOIN Planet AS T2 ON T1.Planet = T2.Name WHERE T2.Name = 'Mars'
SELECT T1.ShipmentID FROM Shipment AS T1 INNER JOIN Planet AS T2 ON T1.Planet = T2.Name WHERE T2.Name = 'Mars'
SELECT S.ShipmentID FROM Shipment S INNER JOIN Planet P ON S.Planet = P.PlanetID WHERE P.Name = 'Mars' AND S.Manager = 'Turanga Leela'
SELECT T1.ShipmentID FROM Shipment AS T1 INNER JOIN Planet AS T2 ON T1.Planet = T2.Name WHERE T2.Name = 'Mars' AND T1.Manager = 'Turanga Leela'
SELECT ShipmentID FROM Shipment WHERE Planet = 'Mars' OR Manager = 'Turanga Leela'
SELECT T1.ShipmentID FROM Shipment AS T1 INNER JOIN Planet AS T2 ON T1.Planet = T2.Name WHERE T2.Name = 'Mars' AND T1.Manager = 'Turanga Leela'
SELECT T1.Name, COUNT(T2.ShipmentID) FROM Planet AS T1 INNER JOIN Shipment AS T2 ON T1.PlanetID = T2.Planet GROUP BY T1.Name
SELECT T1.Name, COUNT(T2.ShipmentID) FROM Planet AS T1 INNER JOIN Shipment AS T2 ON T1.PlanetID = T2.Planet GROUP BY T1.Name
SELECT T3.Name FROM Shipment AS T1 INNER JOIN Planet AS T2 ON T1.Planet = T2.PlanetID INNER JOIN Planet AS T3 ON T2.PlanetID = T3.PlanetID GROUP BY T3.Name ORDER BY COUNT(T1.ShipmentID) DESC LIMIT 1
SELECT T2.Name FROM Shipment AS T1 INNER JOIN Planet AS T2 ON T1.Planet = T2.PlanetID GROUP BY T2.PlanetID ORDER BY COUNT(T1.ShipmentID) DESC LIMIT 1
SELECT T1.Manager, COUNT(T1.ShipmentID) FROM Shipment AS T1 GROUP BY T1.Manager
SELECT COUNT(*),  Manager FROM Shipment GROUP BY Manager
SELECT SUM(T2.Weight)
SELECT SUM(T2.Weight)
SELECT T2.Name, SUM(T1.Weight) FROM Package AS T1 INNER JOIN Shipment AS T2 ON T1.Shipment = T2.ShipmentID INNER JOIN Planet AS T3 ON T2.Planet = T3.PlanetID GROUP BY T3.PlanetID
SELECT T1.Name, SUM(T2.Weight) FROM Planet AS T1 INNER JOIN Package AS T2 ON T2.Planet = T1.PlanetID
SELECT T3.Name
SELECT T2.Name FROM Package AS T1 INNER JOIN Shipment AS T2 ON T1.Shipment = T2.ShipmentID INNER JOIN Planet AS T3 ON T2.Planet = T3.PlanetID GROUP BY T2.Planet HAVING SUM(T1.Weight) > 30
SELECT T2.PackageNumber
SELECT COUNT(T2.PackageNumber)
SELECT T2.PackageNumber
SELECT COUNT(T1.PackageNumber) FROM Package AS T1 INNER JOIN Shipment AS T2 ON T1.Shipment = T2.ShipmentID INNER JOIN Planet AS T3 ON T2.Planet = T3.PlanetID WHERE T3.Name = 'Omicron Persei 8' OR T1.Sender = 'Zapp Brannigan'
SELECT PackageNumber, Weight FROM Package WHERE Weight BETWEEN 10 AND 30
SELECT PackageNumber, Weight FROM Package WHERE Weight BETWEEN 10 AND 30
SELECT T1.Name FROM Employee AS T1 INNER JOIN Has_Clearance AS T2 ON T1.EmployeeID = T2.Employee WHERE T2.Level = 0 AND T2.Planet = ( SELECT PlanetID FROM Planet WHERE Name = 'Mars' )
SELECT Name FROM Employee WHERE EmployeeID NOT IN (SELECT Employee FROM Has_Clearance WHERE Planet = (SELECT PlanetID FROM Planet WHERE Name = 'Mars'))
SELECT T1.Name FROM Employee AS T1 INNER JOIN Has_Clearance AS T2 ON T1.EmployeeID = T2.Employee INNER JOIN Planet AS T3 ON T2.Planet = T3.PlanetID WHERE T3.Name = 'Omega III'
SELECT T1.Name FROM Employee AS T1 INNER JOIN Has_Clearance AS T2 ON T1.EmployeeID = T2.Employee INNER JOIN Planet AS T3 ON T3.PlanetID = T2.Planet WHERE T3.Name = 'Omega III'
SELECT T2.Name FROM Has_Clearance AS T1 INNER JOIN Planet AS T2 ON T1.Planet = T2.Planet GROUP BY T1.Planet HAVING COUNT(T1.Employee) = 1
SELECT T2.Name FROM Has_Clearance AS T1 INNER JOIN Planet AS T2 ON T1.Planet = T2.Planet GROUP BY T2.Name HAVING COUNT(T1.Employee) = 1
SELECT Name FROM Employee WHERE Salary BETWEEN 5000 AND 10000
SELECT Name FROM Employee WHERE Salary BETWEEN 5000 AND 10000
SELECT Name FROM Employee WHERE Salary > ( SELECT AVG(Salary) FROM Employee ) OR Salary > 5000
SELECT Name FROM Employee WHERE Salary > ( SELECT AVG(Salary) FROM Employee ) OR Salary > 5000
SELECT COUNT(T1.EmployeeID) FROM Employee AS T1 LEFT JOIN Has_Clearance AS T2 ON T1.EmployeeID = T2.Employee WHERE T2.EmployeeID IS NULL AND T1.Name = 'Mars'
SELECT COUNT(T1.EmployeeID) FROM Employee AS T1 INNER JOIN Has_Clearance AS T2 ON T1.EmployeeID = T2.Employee WHERE T2.Level = 0 AND T2.Planet = ( SELECT PlanetID FROM Planet WHERE Name = 'Mars' )
SELECT COUNT(*) FROM game
SELECT COUNT(Game_ID) FROM game
SELECT Title, Developers FROM game ORDER BY Units_sold_Millions DESC
SELECT Title, Developers FROM game ORDER BY Units_sold_Millions DESC
SELECT AVG(Units_sold_Millions) FROM game WHERE Developers!= 'Nintendo'
SELECT AVG(Units_sold_Millions) FROM game WHERE Developers!= 'Nintendo'
SELECT Platform_name, Market_district FROM platform
SELECT Platform_name, Market_district FROM platform
SELECT Platform_ID, Platform_name FROM platform WHERE Download_rank = 1
SELECT Platform_ID, Platform_name FROM platform WHERE Download_rank = 1
SELECT MAX(Rank_of_the_year), MIN(Rank_of_the_year) FROM player
SELECT MAX(Rank_of_the_year), MIN(Rank_of_the_year) FROM player
SELECT COUNT(Player_ID) FROM player WHERE Rank_of_the_year < 3
SELECT COUNT(Player_ID) FROM player WHERE Rank_of_the_year <= 3
SELECT Player_name FROM player ORDER BY Player_name ASC
SELECT Player_name FROM player ORDER BY Player_name ASC
SELECT Player_name, College FROM player ORDER BY Rank_of_the_year DESC
SELECT Player_name, College FROM player ORDER BY Rank_of_the_year DESC
SELECT T2.Player_name, T2.Rank_of_the_year
SELECT T2.Player_name, T2.Rank_of_the_year
SELECT DISTINCT T1.Developers
SELECT DISTINCT T1.Developers
SELECT AVG(T2.Units_sold_Millions)
SELECT AVG(T2.Units_sold_Millions)
SELECT T1.Title, T2.Platform_name FROM game AS T1 INNER JOIN platform AS T2 ON T1.Platform_ID = T2.Platform_ID
SELECT T1.Title, T2.Platform_name FROM game AS T1 INNER JOIN platform AS T2 ON T1.Platform_ID = T2.Platform_ID
SELECT T2.Title FROM platform AS T1 INNER JOIN game AS T2 ON T1.Platform_ID = T2.Platform_ID WHERE T1.Market_district IN ('Asia', 'USA')
SELECT T1.Title FROM game AS T1 INNER JOIN platform AS T2 ON T1.Platform_ID = T2.Platform_ID WHERE T2.Market_district IN ('Asia', 'USA')
SELECT Franchise, COUNT(*) FROM game GROUP BY Franchise
SELECT Franchise, COUNT(*) FROM game GROUP BY Franchise
SELECT Franchise FROM game GROUP BY Franchise ORDER BY COUNT(Game_ID) DESC LIMIT 1
SELECT Franchise FROM game GROUP BY Franchise ORDER BY COUNT(Game_ID) DESC LIMIT 1
SELECT Franchise FROM game GROUP BY Franchise HAVING COUNT(Game_ID) >= 2
SELECT Franchise FROM game GROUP BY Franchise HAVING COUNT(Game_ID) >= 2
SELECT Player_name FROM player WHERE Player_ID NOT IN (SELECT Player_ID FROM game_player)
SELECT Player_name FROM player WHERE Player_ID NOT IN (SELECT Player_ID FROM game_player)
SELECT T1.Title FROM game AS T1 INNER JOIN game_player AS T2 ON T1.Game_ID = T2.Game_ID INNER JOIN player AS T3 ON T2.Player_ID = T3.Player_ID WHERE T3.College = 'Oklahoma' INTERSECT SELECT T1.Title FROM game AS T1 INNER JOIN game_player AS T2 ON T1.Game_ID = T2.Game_ID INNER JOIN player AS T3 ON T2.Player_ID = T3.Player_ID WHERE T3.College = 'Auburn'
SELECT T2.Title FROM player AS T1 INNER JOIN game_player AS T2 ON T1.Player_ID = T2.Player_ID INNER JOIN game AS T3 ON T2.Game_ID = T3.Game_ID INNER JOIN platform AS T4 ON T3.Platform_ID = T4.Platform_ID WHERE T1.College = 'Oklahoma' OR T1.College = 'Auburn'
SELECT DISTINCT Franchise FROM game
SELECT DISTINCT Franchise FROM game
SELECT T1.Title FROM game AS T1 INNER JOIN game_player AS T2 ON T1.Game_ID = T2.Game_ID INNER JOIN player AS T3 ON T2.Player_ID = T3.Player_ID WHERE T3.Position!= 'Guard'
SELECT Title FROM game WHERE Game_ID NOT IN ( SELECT Game_ID FROM game_player WHERE Player_ID IN ( SELECT Player_ID FROM player WHERE Position = 'Guard' ) );
SELECT Name FROM press ORDER BY Year_Profits_billion DESC
SELECT Name FROM press ORDER BY Year_Profits_billion DESC
SELECT Name FROM press WHERE Year_Profits_billion > 15 OR Month_Profits_billion > 1
SELECT Name FROM press WHERE Year_Profits_billion > 15 OR Month_Profits_billion > 1
SELECT AVG(Years_Profits_billion), MAX(Years_Profits_billion) FROM press
SELECT Press_ID, AVG(Year_Profits_billion) AS avg_yearly_profit, MAX(Year_Profits_billion) AS max_yearly_profit FROM press GROUP BY Press_ID
SELECT Name FROM press ORDER BY Month_Profits_billion DESC LIMIT 1
SELECT Name FROM press WHERE Month_Profits_billion = ( SELECT MAX(Month_Profits_billion ) FROM press )
SELECT Name FROM press ORDER BY Month_Profits_billion DESC LIMIT 1 UNION SELECT Name FROM press ORDER BY Month_Profits_billion ASC LIMIT 1
SELECT Name FROM press ORDER BY Month_Profits_billion DESC LIMIT 1 UNION SELECT Name FROM press ORDER BY Month_Profits_billion ASC LIMIT 1
SELECT COUNT(Author_ID) FROM author WHERE Age < 30
SELECT COUNT(Author_ID) FROM author WHERE Age < 30
SELECT AVG(Age),  Gender FROM author GROUP BY Gender
SELECT Gender, AVG(Age) FROM author GROUP BY Gender
SELECT Gender, COUNT(*) FROM author WHERE Age > 30 GROUP BY Gender
SELECT Gender, COUNT(*) FROM author WHERE Age > 30 GROUP BY Gender
SELECT Title FROM book ORDER BY Release_date DESC
SELECT Title FROM book ORDER BY Release_date DESC
SELECT Book_Series, COUNT(Book_ID) FROM book GROUP BY Book_Series
SELECT Book_Series, COUNT(Book_ID) FROM book GROUP BY Book_Series
SELECT Title, Release_date FROM book ORDER BY Sale_Amount DESC LIMIT 5
SELECT Title, Release_date FROM book ORDER BY Sale_Amount DESC LIMIT 5
SELECT Book_Series FROM book WHERE Sale_Amount > 1000 INTERSECT SELECT Book_Series FROM book WHERE Sale_Amount < 500
SELECT Book_Series FROM book WHERE Sale_Amount > 1000 INTERSECT SELECT Book_Series FROM book WHERE Sale_Amount < 500
SELECT T1.Name FROM author AS T1 INNER JOIN book AS T2 ON T1.Author_ID = T2.Author_ID WHERE T2.Book_Series = 'MM' INTERSECT SELECT T1.Name FROM author AS T1 INNER JOIN book AS T2 ON T1.Author_ID = T2.Author_ID WHERE T2.Book_Series = 'LT'
SELECT T1.Name FROM author AS T1 INNER JOIN book AS T2 ON T1.Author_ID = T2.Author_ID WHERE T2.Book_Series = 'MM' INTERSECT SELECT T1.Name FROM author AS T1 INNER JOIN book AS T2 ON T1.Author_ID = T2.Author_ID WHERE T2.Book_Series = 'LT'
SELECT Name, Age FROM author WHERE Author_ID NOT IN (SELECT Author_ID FROM book)
SELECT Name FROM author WHERE Author_ID NOT IN (SELECT Author_ID FROM book)
SELECT T1.Name FROM author AS T1 INNER JOIN book AS T2 ON T1.Author_ID = T2.Author_ID GROUP BY T1.Author_ID HAVING COUNT(T2.Author_ID) > 1
SELECT T1.Name FROM author AS T1 INNER JOIN book AS T2 ON T1.Author_ID = T2.Author_ID GROUP BY T1.Author_ID HAVING COUNT(T2.Author_ID) > 1
SELECT T1.Title, T2.Name, T3.Name FROM book AS T1 INNER JOIN author AS T2 ON T1.Author_ID = T2.Author_ID INNER JOIN press AS T3 ON T1.Press_ID = T3.Press_ID ORDER BY T1.Sale_Amount DESC LIMIT 3
SELECT T1.Title, T3.Name AS Author_Name, T2.Name AS Press_Name FROM book AS T1 INNER JOIN author AS T3 ON T1.Author_ID = T3.Author_ID INNER JOIN press AS T2 ON T1.Press_ID = T2.Press_ID ORDER BY T1.Sale_Amount DESC LIMIT 3
SELECT T2.Name, SUM(T1.Sale_Amount) FROM book AS T1 INNER JOIN press AS T2 ON T1.Press_ID = T2.Press_ID GROUP BY T2.Press_ID
SELECT T2.Name, SUM(T1.Sale_Amount) FROM book AS T1 INNER JOIN press AS T2 ON T1.Press_ID = T2.Press_ID GROUP BY T2.Press_ID
SELECT T2.Name, COUNT(T1.Book_ID) FROM book AS T1 INNER JOIN press AS T2 ON T1.Press_ID = T2.Press_ID WHERE T1.Sale_Amount > 1000 GROUP BY T2.Press_ID
SELECT T2.Name, COUNT(*) FROM book AS T1 INNER JOIN press AS T2 ON T1.Press_ID = T2.Press_ID WHERE T1.Sale_Amount > 1000 GROUP BY T2.Press_ID
SELECT T1.Name FROM author AS T1 INNER JOIN book AS T2 ON T1.Author_ID = T2.Author_ID ORDER BY T2.Sale_Amount DESC LIMIT 1
SELECT T1.Name FROM author AS T1 INNER JOIN book AS T2 ON T1.Author_ID = T2.Author_ID ORDER BY T2.Sale_Amount DESC LIMIT 1
SELECT T1.Name, T1.Gender
SELECT T1.Name, T1.Gender FROM author AS T1 INNER JOIN book AS T2 ON T1.Author_ID = T2.Author_ID GROUP BY T1.Author_ID ORDER BY COUNT(T2.Book_ID) DESC LIMIT 1
SELECT Name FROM author WHERE Author_ID NOT IN (SELECT Author_ID FROM book WHERE Press_ID = (SELECT Press_ID FROM press WHERE Name = 'Accor'))
SELECT Name FROM author WHERE Author_ID NOT IN (SELECT Author_ID FROM book WHERE Press_ID IN (SELECT Press_ID FROM press WHERE Name = 'Accor'))
SELECT T2.Name, T2.Year_Profits_billion
SELECT T2.Name, T2.Year_Profits_billion
SELECT COUNT(author_name) FROM Authors
SELECT author_name FROM Authors
SELECT author_name, other_details FROM Authors
SELECT other_details FROM Authors WHERE author_name = 'Addison Denesik'
SELECT COUNT(document_id) FROM Documents
SELECT author_name FROM Documents WHERE document_id = 4
SELECT author_name FROM Documents WHERE document_name = 'Travel to Brazil'
SELECT COUNT(document_id) FROM Documents WHERE author_name = 'Era Kerluke'
SELECT author_name, document_name, document_description FROM Documents
SELECT document_id, document_name FROM Documents WHERE author_name = 'Bianka Cummings'
SELECT author_name, other_details FROM Documents WHERE document_name = 'Travel to China'
SELECT author_name, COUNT(document_id) FROM Documents GROUP BY author_name
SELECT T2.author_name FROM Documents AS T1 INNER JOIN Authors AS T2 ON T1.author_name = T2.author_name GROUP BY T2.author_name ORDER BY COUNT(T1.document_id) DESC LIMIT 1
SELECT T2.author_name FROM Documents AS T1 INNER JOIN Authors AS T2 ON T1.author_name = T2.author_name GROUP BY T2.author_name HAVING COUNT(T2.author_name) >= 2
SELECT COUNT(process_id) FROM Business_Processes
SELECT next_process_id, process_name, process_description FROM Business_Processes WHERE process_id = 9
SELECT T2.process_name FROM Business_Processes AS T1 INNER JOIN Documents_Processes AS T3 ON T1.process_id = T3.process_id INNER JOIN Business_Processes AS T2 ON T1.next_process_id = T2.process_id WHERE T1.process_id = 9
SELECT COUNT(process_outcome_code) FROM Process_Outcomes
SELECT process_outcome_code, process_outcome_description FROM Process_Outcomes
SELECT process_outcome_description FROM Process_Outcomes WHERE process_outcome_code = 'working'
SELECT COUNT(process_status_code) FROM Process_Status
SELECT process_status_code, process_status_description FROM Process_Status
SELECT process_status_description FROM Process_Status WHERE process_status_code = 'ct'
SELECT COUNT(staff_id) FROM Staff
SELECT staff_id, staff_details FROM Staff
SELECT staff_details FROM Staff WHERE staff_id = 100
SELECT COUNT(staff_role_code) FROM Ref_Staff_Roles
SELECT staff_role_code, staff_role_description FROM Ref_Staff_Roles
SELECT staff_role_description FROM Ref_Staff_Roles WHERE staff_role_code = 'HR'
SELECT COUNT(DISTINCT document_id) FROM Documents_Processes
SELECT DISTINCT T2.process_id
SELECT document_id FROM Documents WHERE document_id NOT IN (SELECT document_id FROM Documents_Processes)
SELECT process_id FROM Business_Processes WHERE process_id NOT IN (SELECT process_id FROM Documents_Processes)
SELECT T1.process_outcome_description, T2.process_status_description
SELECT T2.process_name
SELECT T1.process_id, COUNT(T2.document_id) FROM Business_Processes AS T1 INNER JOIN Documents_Processes AS T2 ON T1.process_id = T2.process_id GROUP BY T1.process_id
SELECT COUNT(DISTINCT T1.staff_id) FROM Staff_in_Processes AS T1 INNER JOIN Documents_Processes AS T2 ON T1.document_id = T2.document_id WHERE T2.document_id = 0 AND T2.process_id = 9
SELECT T1.staff_id, COUNT(T2.document_id) FROM Staff AS T1 INNER JOIN Staff_in_Processes AS T2 ON T1.staff_id = T2.staff_id GROUP BY T1.staff_id
SELECT T1.staff_role_code, COUNT(T2.document_id)
SELECT COUNT(DISTINCT staff_role_code) FROM Staff_in_Processes WHERE staff_id = 3
SELECT COUNT(agency_id) FROM Agencies
SELECT COUNT(agency_id) FROM Agencies
SELECT agency_id, agency_details FROM Agencies
SELECT agency_id, agency_details FROM Agencies
SELECT COUNT(client_id) FROM Clients
SELECT COUNT(client_id) FROM Clients
SELECT client_id, client_details FROM Clients
SELECT client_id, client_details FROM Clients
SELECT agency_id, COUNT(client_id) FROM Clients GROUP BY agency_id
SELECT T1.agency_id, COUNT(T2.client_id) FROM Agencies AS T1 INNER JOIN Clients AS T2 ON T1.agency_id = T2.agency_id GROUP BY T1.agency_id
SELECT agency_id, agency_details FROM Agencies WHERE agency_id = ( SELECT agency_id FROM Clients GROUP BY agency_id ORDER BY COUNT(client_id) DESC LIMIT 1 )
SELECT T1.agency_id, T1.agency_details
SELECT agency_id, agency_details FROM Agencies WHERE agency_id IN ( SELECT agency_id FROM Clients GROUP BY agency_id HAVING COUNT(client_id) >= 2 )
SELECT agency_id, agency_details FROM Agencies WHERE agency_id IN ( SELECT agency_id FROM Clients GROUP BY agency_id HAVING COUNT(client_id) >= 2 )
SELECT T1.agency_details
SELECT T1.agency_details
SELECT T1.client_details, T2.staff_details
SELECT T1.client_details, T2.agency_details
SELECT sic_code, COUNT(client_id) FROM Clients GROUP BY sic_code
SELECT sic_code, COUNT(client_id) FROM Clients GROUP BY sic_code
SELECT client_id, client_details FROM Clients WHERE sic_code = 'Bad'
SELECT client_details FROM Clients WHERE sic_code = 'Bad'
SELECT T1.agency_id, T1.agency_details
SELECT T1.agency_id, T1.agency_details
SELECT agency_id FROM Clients WHERE client_id IS NULL
SELECT agency_id FROM Agencies WHERE agency_id NOT IN (SELECT agency_id FROM Clients)
SELECT COUNT(invoice_id) FROM Invoices
SELECT COUNT(invoice_id) FROM Invoices
SELECT client_id, invoice_status, invoice_details FROM Invoices
SELECT invoice_id, invoice_status, invoice_details FROM Invoices
SELECT client_id, COUNT(invoice_id) FROM Invoices GROUP BY client_id
SELECT client_id, COUNT(invoice_id) FROM Invoices GROUP BY client_id
SELECT client_id, client_details FROM Clients WHERE client_id = ( SELECT client_id FROM Invoices GROUP BY client_id ORDER BY COUNT(invoice_id) DESC LIMIT 1 )
SELECT T1.client_id, T1.client_details
SELECT client_id FROM Invoices GROUP BY client_id HAVING COUNT(invoice_id) >= 2
SELECT client_id FROM Invoices GROUP BY client_id HAVING COUNT(invoice_id) >= 2
SELECT invoice_status, COUNT(*) FROM Invoices GROUP BY invoice_status
SELECT invoice_status, COUNT(*) FROM Invoices GROUP BY invoice_status
SELECT invoice_status FROM Invoices GROUP BY invoice_status ORDER BY COUNT(invoice_status) DESC LIMIT 1
SELECT invoice_status FROM Invoices GROUP BY invoice_status ORDER BY COUNT(invoice_status) DESC LIMIT 1
SELECT T1.invoice_status, T1.invoice_details, T2.client_id, T2.client_details, T3.agency_id, T3.agency_details
SELECT T1.invoice_status, T1.invoice_details, T2.client_id, T2.client_details, T2.agency_id, T2.agency_details
SELECT meeting_type, other_details FROM Meetings
SELECT meeting_type, other_details FROM Meetings
SELECT meeting_outcome, purpose_of_meeting FROM Meetings
SELECT meeting_outcome, purpose_of_meeting FROM Meetings
SELECT T2.payment_id, T2.payment_details
SELECT payment_id, payment_details FROM Payments WHERE invoice_id IN ( SELECT invoice_id FROM Invoices WHERE invoice_status = 'Working' );
SELECT invoice_id, invoice_status FROM Invoices WHERE invoice_id NOT IN (SELECT invoice_id FROM Payments)
SELECT invoice_id, invoice_status FROM Invoices WHERE invoice_id NOT IN (SELECT invoice_id FROM Payments)
SELECT COUNT(payment_id) FROM Payments
SELECT COUNT(payment_id) FROM Payments
SELECT payment_id, invoice_id, payment_details FROM Payments
SELECT payment_id, invoice_id, payment_details FROM Payments
SELECT DISTINCT T1.invoice_id, T2.invoice_status
SELECT DISTINCT T1.invoice_id, T1.invoice_status
SELECT T1.invoice_id, COUNT(T2.payment_id) FROM Invoices AS T1 LEFT JOIN Payments AS T2 ON T1.invoice_id = T2.invoice_id GROUP BY T1.invoice_id
SELECT invoice_id, COUNT(payment_id) FROM Payments GROUP BY invoice_id
SELECT T1.invoice_id, T1.invoice_status, T1.invoice_details
SELECT T1.invoice_id, T1.invoice_status, T1.invoice_details
SELECT COUNT(staff_id) FROM Staff
SELECT COUNT(staff_id) FROM Staff
SELECT agency_id, COUNT(staff_id) FROM Staff GROUP BY agency_id
SELECT agency_id, COUNT(staff_id) FROM Staff GROUP BY agency_id
SELECT agency_id, agency_details FROM Agencies ORDER BY (SELECT COUNT(staff_id) FROM Staff WHERE Staff.agency_id = Agencies.agency_id) DESC LIMIT 1
SELECT agency_id, agency_details FROM Agencies ORDER BY (SELECT COUNT(staff_id) FROM Staff WHERE agency_id = Agencies.agency_id) DESC LIMIT 1
SELECT meeting_outcome, COUNT(meeting_id) FROM Meetings GROUP BY meeting_outcome
SELECT meeting_outcome, COUNT(*) FROM Meetings GROUP BY meeting_outcome
SELECT client_id, COUNT(meeting_id) FROM Meetings GROUP BY client_id
SELECT client_id, COUNT(meeting_id) FROM Meetings GROUP BY client_id
SELECT T1.meeting_type, COUNT(T1.meeting_id) FROM Meetings AS T1 INNER JOIN Clients AS T2 ON T1.client_id = T2.client_id GROUP BY T1.meeting_type
SELECT meeting_type, COUNT(meeting_id) FROM Meetings GROUP BY meeting_type
SELECT M.meeting_id, M.meeting_outcome, M.meeting_type, C.client_details
SELECT meeting_id, meeting_outcome, meeting_type, client_details FROM Meetings
SELECT meeting_id, COUNT(staff_id) FROM Staff_in_Meetings GROUP BY meeting_id
SELECT meeting_id, COUNT(staff_id) FROM Staff_in_Meetings GROUP BY meeting_id
SELECT staff_id, COUNT(meeting_id)
SELECT staff_id FROM Staff_in_Meetings GROUP BY staff_id ORDER BY COUNT(meeting_id) ASC LIMIT 1
SELECT COUNT(DISTINCT staff_id) FROM Staff_in_Meetings
SELECT COUNT(DISTINCT staff_id) FROM Staff_in_Meetings
SELECT COUNT(staff_id) FROM Staff WHERE staff_id NOT IN (SELECT staff_id FROM Staff_in_Meetings)
SELECT COUNT(DISTINCT staff_id) FROM Staff WHERE staff_id NOT IN (SELECT staff_id FROM Staff_in_Meetings)
SELECT T1.client_id, T1.client_details
SELECT T1.client_id, T1.client_details
SELECT T1.staff_id, T1.staff_details
SELECT staff_id, staff_details
SELECT T1.client_id, T1.sic_code, T1.agency_id
SELECT T1.client_id, T1.sic_code, T1.agency_id
SELECT T1.start_date_time, T1.end_date_time, T2.client_details, T3.staff_details
SELECT T1.start_date_time, T1.end_date_time, T2.client_details, T3.staff_details
