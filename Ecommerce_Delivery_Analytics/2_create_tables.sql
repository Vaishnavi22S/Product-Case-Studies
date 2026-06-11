-- 1. Create Ecommerce_Delivery_Analytics table (No foreign key dependencies)
CREATE TABLE public.Ecommerce_Delivery_Analytics



(
  Order_ID VARCHAR(50),
  Customer_ID VARCHAR(50),
  Platform	VARCHAR(100),
  Order_Date_Time TIME,
  Delivery_Time_Minutes INT,
  Product_Category VARCHAR(100),
  Order_Value INT,
  Customer_Feedback VARCHAR(255),
  Service_Rating INT,
  Delivery_Delay VARCHAR(5),
  Refund_Requested  VARCHAR(5)
);

-- 6. Set ownership of the tables to the postgres user
ALTER TABLE public.Ecommerce_Delivery_Analytics OWNER to postgres;