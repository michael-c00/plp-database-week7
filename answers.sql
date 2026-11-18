-- ============================================================================
-- PLP Academy: Database Systems
-- Week 7 Assignment: Database Design and Normalization
-- Student: Michael Myeko
-- ============================================================================

-- ============================================================================
-- Question 1: Achieving First Normal Form (1NF)
-- ============================================================================
-- Task: Transform the ProductDetail table (which has multi-valued cells) into 1NF 
-- by ensuring each row represents only one product per order.

-- Step 1: Create the normalized 1NF table structure
CREATE TABLE OrderProducts_1NF (
    OrderID INT,
    CustomerName VARCHAR(100),
    Product VARCHAR(100),
    PRIMARY KEY (OrderID, Product)
);

-- Step 2: Insert the normalized records into the new table
INSERT INTO OrderProducts_1NF (OrderID, CustomerName, Product) VALUES
(101, 'John Doe', 'Laptop'),
(101, 'John Doe', 'Mouse'),
(102, 'Jane Smith', 'Tablet'),
(102, 'Jane Smith', 'Keyboard'),
(102, 'Jane Smith', 'Mouse'),
(103, 'Emily Clark', 'Phone');


-- ============================================================================
-- Question 2: Achieving Second Normal Form (2NF)
-- ============================================================================
-- Task: Remove partial dependencies by splitting OrderDetails into separate 
-- Orders and OrderItems tables.

-- Step 1: Create the parent Orders table (dependent only on OrderID)
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerName VARCHAR(100)
);

-- Step 2: Create the child OrderItems table (depends on the composite key OrderID, Product)
CREATE TABLE OrderItems (
    OrderID INT,
    Product VARCHAR(100),
    Quantity INT,
    PRIMARY KEY (OrderID, Product),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

-- Step 3: Insert normalized data into the Orders table
INSERT INTO Orders (OrderID, CustomerName) VALUES
(101, 'John Doe'),
(102, 'Jane Smith'),
(103, 'Emily Clark');

-- Step 4: Insert normalized data into the OrderItems table
INSERT INTO OrderItems (OrderID, Product, Quantity) VALUES
(101, 'Laptop', 2),
(101, 'Mouse', 1),
(102, 'Tablet', 3),
(102, 'Keyboard', 1),
(102, 'Mouse', 2),
(103, 'Phone', 1);
