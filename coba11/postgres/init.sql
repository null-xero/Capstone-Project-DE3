CREATE TABLE orders (
  order_id VARCHAR PRIMARY KEY,
  customer_id VARCHAR,
  order_status VARCHAR,
  order_purchase_timestamp TIMESTAMP,
  order_approved_at TIMESTAMP,
  order_delivered_carrier_date TIMESTAMP,
  order_delivered_customer_date TIMESTAMP,
  order_estimated_delivery_date TIMESTAMP
);
-- Add other tables for different datasets similarly
