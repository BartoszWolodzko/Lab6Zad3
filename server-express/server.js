const express = require('express');
const app = express();
const mysql = require('mysql');
const port = 8082;

const connection = mysql.createConnection({
    host: 'database',
    user: 'root',
    password: 'root',
    database: 'cars'
});

connection.connect();

app.get('/cars', (req, res) => {
    connection.query('SELECT * FROM cars', (err, rows) => {
        if (err) throw err;
        res.send(rows);
    });
});

app.post('/addCar', (req, res) => {
    connection.query('INSERT INTO cars (model, year, details) VALUES ("BMW", 2010, "hjfghcduy")', (err, rows) => {
        if (err) throw err;
        res.send(rows);
    });
});

app.get('/', (req, res) => {
    res.send('Hello World form js!');
});

app.listen(port, () => console.log(`Example app listening on port ${port}!`));