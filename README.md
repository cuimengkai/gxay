

## gxay地址和使用
http://127.0.0.1:8088/
后台
账号： admin  密码: 123qwe


## 如何使用
+ 1.Clone项目 `git clone https://github.com/cuimengkai/gxay.git。
+ 2.进入项目根目录使用npm安装模块 `cd ~/gxay 后再   npm install`。
+ 3.在`server/sqlhelp/mysql.js`文件里面配置数据库连接
```
var pool  = mysql.createPool({  
  connectionLimit : 10,  
  host            : 'localhost',   //主机
  user            : 'username',          /用户名
  password        : 'password', // 密码
  database        : 'blog' , //数据库名
});  
```
注意，配置好后要在Mysql数据库里新建一个叫blog的数据库，如果你觉得用命令操作数据库麻烦可以使用MySQL Workbench来管理Mysql还是非常方便的。
+ 4.如果你是使用Visual Studio Code来写代码的话，那么直接使用按F5就能启动server端，如果是其他IDE，可以用命令来启动`node start.js`来启动服务器端，启动后，Node程序会在你的数据库里新建Blog所需要的表格和视图。
+ 6.再用命令启动前端即可，在项目根目录里使用命令`npm run dev`。
+ 7.浏览器会自动启动并打开`localhiost:8088`并打开Blog主页面。
+ 8.如果想发布，使用命令`npm run build`即可，生成的文件在dist目录下，然后就能直接会使用了。
