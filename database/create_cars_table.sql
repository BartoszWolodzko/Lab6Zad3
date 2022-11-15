CREATE TABLE cars (
    id INT NOT NULL AUTO_INCREMENT,
    model VARCHAR(255) NOT NULL,
    year INT NOT NULL,
    details TEXT NOT NULL,
    PRIMARY KEY (id)
);

INSERT INTO cars (model, year, details) VALUES
('Audi', 2012, 'Audi A4 is a great car'),
('BMW', 2015, 'BMW 3 Series is a great car'),
('Mercedes', 2013, 'Mercedes C Class is a great car'),
('Volkswagen', 2014, 'Volkswagen Passat is a great car');