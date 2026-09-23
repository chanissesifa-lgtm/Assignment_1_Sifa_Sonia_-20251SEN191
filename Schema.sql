
-- PLSQL Assignment One - Sunrise Supermarket
-- Name: Sifa Sonia Chanisse | Student ID: 20251SEN191
-- schema.sql : drops (if they exist) and recreates the four tables


-- Drop in child-to-parent order, ignoring "table does not exist" errors
-- so this script can be re-run safely from scratch.
BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE order_items PURGE';
EXCEPTION WHEN OTHERS THEN
   IF SQLCODE != -942 THEN RAISE; END IF;
END;
/

BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE orders PURGE';
EXCEPTION WHEN OTHERS THEN
   IF SQLCODE != -942 THEN RAISE; END IF;
END;
/

BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE products PURGE';
EXCEPTION WHEN OTHERS THEN
   IF SQLCODE != -942 THEN RAISE; END IF;
END;
/

BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE customers PURGE';
EXCEPTION WHEN OTHERS THEN
   IF SQLCODE != -942 THEN RAISE; END IF;
END;
/

CREATE TABLE customers (
  customer_id NUMBER PRIMARY KEY,
  customer_name VARCHAR2(100),
  email VARCHAR2(100),
  city VARCHAR2(50)
);

CREATE TABLE products (
  product_id NUMBER PRIMARY KEY,
  product_name VARCHAR2(100),
  category VARCHAR2(50),
  price NUMBER(10,2)
);

CREATE TABLE orders (
  order_id NUMBER PRIMARY KEY,
  customer_id NUMBER REFERENCES customers(customer_id),
  order_date DATE
);

CREATE TABLE order_items (
  order_item_id NUMBER PRIMARY KEY,
  order_id NUMBER REFERENCES orders(order_id),
  product_id NUMBER REFERENCES products(product_id),
  quantity NUMBER
);
