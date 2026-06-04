-- 1. Create ecommerce_customer_churn_dataset table (No foreign key dependencies)
CREATE TABLE public.ecommerce_customer_churn_dataset

(
    Age REAL,
    Gender VARCHAR(20),
    Country VARCHAR(50),
    City VARCHAR(50),
    Membership_Years REAL,
    Login_Frequency REAL,
    Session_Duration_Avg REAL,
    Pages_Per_Session REAL,
    Cart_Abandonment_Rate NUMERIC(5,2),
    Wishlist_Items REAL,
    Total_Purchases REAL,
    Average_Order_Value NUMERIC(10,2),
    Days_Since_Last_Purchase REAL,
    Discount_Usage_Rate NUMERIC(5,2),
    Returns_Rate NUMERIC(5,2),
    Email_Open_Rate NUMERIC(5,2),
    Customer_Service_Calls REAL,
    Product_Reviews_Written REAL,
    Social_Media_Engagement_Score REAL,
    Mobile_App_Usage REAL,
    Payment_Method_Diversity REAL,
    Lifetime_Value NUMERIC(12,2),
    Credit_Balance NUMERIC(12,2),
    Churned INT,
    Signup_Quarter VARCHAR(10)
);

-- Set ownership of the tables to the postgres user
ALTER TABLE public.ecommerce_customer_churn_dataset OWNER to postgres;
