--Script for Question 1 tables!

--Product table that has ProductID as a primary key, and ProductDescription as an attribute
CREATE TABLE Product(
  ProductID INT, 
  ProductDescription VARCHAR(200),
  CONSTRAINT ProductPK PRIMARY KEY (ProductID),
);

--Junction table for Product and Item tables, contains foreign keys from their respective table's
--primary keys. Also contains the attribute QuantityUsed.
CREATE TABLE Product_Item(
  ProductID INT,
  ItemNum INT,
  QuantityUsed INT,
  CONSTRAINT CheckQuantityUsedCHECK (QuantityUsed >= 0),
  CONSTRAINT ProductFK
          FOREIGN KEY(ProductID) 
              References Product(ProductID)
                    ON DELETE CASCADE,    --Here to keep the database consistent.
    CONSTRAINT ItemFK
          FOREIGN KEY(ItemNum) 
                References Item(ItemNUm)
                    ON DELETE CASCADE,    --Here to keep the database consistent.
);

--Item table that has a primary key of ItemNum and contains the attribute ItemDescription
CREATE TABLE Item(
  ItemNum INT,  --Did not include the NULL constraint as primary keys are inheriently NULL             
  ItemDescription VARCHAR(200),
  CONSTRAINT ItemPK PRIMARY KEY (ItemNum), 
);

--Junction Table for Product and Receipt tables! It contains foreign keys from their respective tables 
--primary keys. Also contains the attribute QuantitySold
CREATE TABLE Sale(
  ProductID INT,
  ReceiptNumber INT,
  QuantitySold INT,
  CONSTRAINT CheckQuantitySoldCHECK (QuantitySold >= 0),
  CONSTRAINT ProductFK
          FOREIGN KEY(ProductID) 
              References Product(ProductID)
                    ON DELETE CASCADE,    --Here to keep the database consistent.
    CONSTRAINT ReceiptFK
          FOREIGN KEY(ReceiptNumber) 
                References Receipt(ReceiptNumber)
                    ON DELETE CASCADE,    --Here to keep the database consistent.
);

--Receipt table that has a primary key of ReceiptNumber and the attribute SalesDate
CREATE TABLE Receipt(
  ReceiptNumber INT, --Did not include the NULL constraint as primary keys are inheriently NULL
  SalesDate DATE,
  CONSTRAINT ItemPK PRIMARY KEY (ItemNum),
);
