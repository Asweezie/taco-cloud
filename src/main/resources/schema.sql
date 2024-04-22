-- Drop existing tables if needed
DROP TABLE IF EXISTS Ingredient_Ref;
DROP TABLE IF EXISTS Taco;
DROP TABLE IF EXISTS Taco_Order;
DROP TABLE IF EXISTS Ingredient;

-- Create Ingredient table with 'id' as primary key
CREATE TABLE Ingredient (
                            id VARCHAR(4) PRIMARY KEY,
                            name VARCHAR(25) NOT NULL,
                            type VARCHAR(10) NOT NULL
);

-- Insert data into Ingredient table
INSERT INTO Ingredient (id, name, type)
VALUES
    ('FLTO', 'Flour Tortilla', 'WRAP'),
    ('COTO', 'Corn Tortilla', 'WRAP'),
    ('GRBF', 'Ground Beef', 'PROTEIN'),
    ('CARN', 'Carnitas', 'PROTEIN'),
    ('TMTO', 'Diced Tomatoes', 'VEGGIES'),
    ('LETC', 'Lettuce', 'VEGGIES'),
    ('CHED', 'Cheddar', 'CHEESE'),
    ('JACK', 'Monterrey Jack', 'CHEESE'),
    ('SLSA', 'Salsa', 'SAUCE'),
    ('SRCR', 'Sour Cream', 'SAUCE');

-- Create other tables
CREATE TABLE Taco_Order (
                            id IDENTITY PRIMARY KEY,
                            delivery_Name VARCHAR(50) NOT NULL,
                            delivery_Street VARCHAR(50) NOT NULL,
                            delivery_City VARCHAR(50) NOT NULL,
                            delivery_State VARCHAR(2) NOT NULL,
                            delivery_Zip VARCHAR(10) NOT NULL,
                            cc_number VARCHAR(16) NOT NULL,
                            cc_expiration VARCHAR(5) NOT NULL,
                            cc_cvv VARCHAR(3) NOT NULL,
                            placed_at TIMESTAMP NOT NULL
);

CREATE TABLE Taco (
                      id IDENTITY PRIMARY KEY,
                      name VARCHAR(50) NOT NULL,
                      taco_order BIGINT NOT NULL,
                      taco_order_key BIGINT NOT NULL,
                      created_at TIMESTAMP NOT NULL,
                      FOREIGN KEY (taco_order) REFERENCES Taco_Order(id)
);

CREATE TABLE Ingredient_Ref (
                                ingredient VARCHAR(4) NOT NULL,
                                taco BIGINT NOT NULL,
                                taco_key BIGINT NOT NULL,
                                FOREIGN KEY (ingredient) REFERENCES Ingredient(id)
);

-- Add other constraints or indexes as needed
