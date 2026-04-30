drop database ola;
create database ola;
Use ola;

	


-- 1. Retrieve all successful bookings:
Select * from bookings where Booking_Status='Success';


-- 2. Find the average ride distance for each vehicle type:

Select Vehicle_Type,Round(Avg(Ride_Distance),2) From bookings group by Vehicle_Type;


-- 3. Get the total number of cancelled rides by customers:
Create view  Total_rides_cnl_cus as
Select count(*) as Total_cancel_by_cus from Bookings Where Booking_Status='Canceled by Customer';

Select * from Total_rides_cnl_cus;


-- 4. List the top 5 customers who booked the highest number of rides:

Create view  Top_Customers as
Select 	Customer_ID,count(*) AS Count from Bookings group by Customer_ID ORDER BY Count Desc Limit 5;

select * from Top_Customers;

-- 5. Get the number of rides cancelled by drivers due to personal and car-related issues:
Select * from bookings;

create view  Canceled_Rides_by_Driver_P_C AS 
Select count(*),Canceled_Rides_by_Driver from bookings where Canceled_Rides_by_Driver='Personal & Car related issue';


Select * from Canceled_Rides_by_Driver_P_C;
-- 6. Find the maximum and minimum driver ratings for Prime Sedan bookings:

create view max_min_D_R_PS AS
Select max(Driver_Ratings),Min(Driver_Ratings) FROM bookings Where Vehicle_Type='Prime Sedan';

select * from max_min_D_R_PS ;

-- 7. Retrieve all rides where payment was made using UPI:
create view Payment_Upi as
Select * from bookings where Payment_Method='UPI';

Select * from Payment_Upi;

-- 8. Find the average customer rating per vehicle type:
create view Avg_C_R as
Select Vehicle_Type,Round(AVG(Customer_Rating),2) from bookings group by Vehicle_Type;

Select * from Avg_C_R;

-- 9. Calculate the total booking value of rides completed successfully:
create view Total_Sum as
Select SUM(Booking_Value) From bookings where Booking_Status='Success';

Select * from Total_Sum;

-- 10. List all incomplete rides along with the reason:
Create view incomplete_rides as
Select Booking_ID,Incomplete_Rides_Reason from bookings where Incomplete_Rides='Yes';

Select * from incomplete_rides;
