SELECT *
FROM vehicle ORDER BY hour_rent_price;
SELECT *
FROM client ORDER BY id;

CREATE TABLE IF NOT EXISTS vehicle (
    id              SERIAL PRIMARY KEY,
    type            VARCHAR(255) NOT NULL,
    brand           VARCHAR(255) NOT NULL,
    model           VARCHAR(255) NOT NULL,
    color           CHAR(7)      NOT NULL,
    hour_rent_price MONEY        NOT NULL
);

CREATE TABLE IF NOT EXISTS client (
    id         SERIAL PRIMARY KEY,
    first_name VARCHAR(255) NOT NULL,
    last_name  VARCHAR(255) NOT NULL,
    email      VARCHAR(255) NOT NULL,
    phone      CHAR(11)     NOT NULL
);

CREATE TABLE IF NOT EXISTS payment_methods (
    id     SERIAL PRIMARY KEY,
    method VARCHAR(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS rent (
    id               SERIAL PRIMARY KEY,
    vehicle_id       INT       NOT NULL,
    client_id        INT       NOT NULL,
    affirmation_date TIMESTAMP NOT NULL,
    start_date       TIMESTAMP NOT NULL,
    end_date         TIMESTAMP NOT NULL,
    total_cost       MONEY     NOT NULL,
    payment_method   INT       NOT NULL,
    FOREIGN KEY (vehicle_id) REFERENCES vehicle (id),
    FOREIGN KEY (client_id) REFERENCES client (id)
);

INSERT INTO vehicle (type, brand, model, color, hour_rent_price)
VALUES ('Truck', 'Ford', 'F-150', '#00FF00', 30.00),
       ('Truck', 'Chevrolet', 'Silverado', '#FFA500', 28.00),
       ('Bike', 'Yamaha', 'YZF-R3', '#FF0000', 15.00),
       ('Bike', 'Kawasaki', 'Ninja 400', '#008000', 18.00),
       ('Car', 'Ford', 'Mustang', '#0000FF', 25.00),
       ('Car', 'Lamborghini', 'Aventador', '#FFFF00', 50.00);

INSERT INTO client (first_name, last_name, email, phone)
VALUES ('John', 'Doe', 'john.doe@example.com', '12345678901'),
       ('Jane', 'Smith', 'jane.smith@example.com', '10987654321'),
       ('Alice', 'Johnson', 'alice.johnson@example.com', '11223344556'),
       ('Bob', 'Brown', 'bob.brown@example.com', '66554433221'),
       ('Kirill', 'Vasilev', 'kir_vas@example.com', '22010029318');

