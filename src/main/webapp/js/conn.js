let mysql = require("mysql");
let connection = mysql.createConnection({
    host: "52.148.66.228",
    user: "root",
    password: "max101312",
    database: "wechat"
});
connection.connect();
console.log("js connMySQL is ok.");

