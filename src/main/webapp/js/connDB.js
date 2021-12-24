let mysql = require('mysql');//调用mysql模块
//创建一个connection数据库连接对象
let connection = mysql.createConnection({
    host: '180.76.232.1',//主机
    user: 'root',//mysql认证的用户名
    password: 'maxax123456:',//mysql用户密码
    database: 'wechat',//数据库名
    port: '3306'//端口号
});
connection.connect();

