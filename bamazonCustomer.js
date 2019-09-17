var mysql = require('mysql');

// mysql -u root -p
var connection = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: 'root',
    database: 'bamazon_db',
    port: 3306
});

connection.connect();

connection.query('SELECT * FROM products', function (error, results, fields) {
    if (error) throw error;
    //  console.log(results);
    for (var i = 0; i < results.length; i++) {
        console.log(
            results[i].item_id,
            results[i].product_name,
            "$" + results[i].price
        );
    }
    const readline = require('readline').createInterface({
        input: process.stdin,
        output: process.stdout
    })
    readline.question(`Which item would you like to buy? `, (item_id) => {
        readline.question(`How many units? `, (quantity) => {
            readline.close();
            connection.query('SELECT * FROM products where item_id = '+item_id, function (error, results, fields) {
                if (error) throw error;
                if(results[0].stock_quantity < quantity){
                    console.log('Insufficient quantity');
                    connection.end();
                    return;
                }
                connection.query('UPDATE products set stock_quantity = stock_quantity - ?',[quantity], function(error){
                    console.log('Total cost = $'+quantity*results[0].price)
                    connection.end();
                })
            })
        })
    })

});

//connection.end();