const db = require('../sqlhelp/mysql')
const Tool = require('../tool/tool')

const sqls = {
    insertMessage:` insert into message (title,describes,issuers,sort,fileList,type,dateIssure,isIssure,content) values(?,?,?,?,?,?,?,?,?) `
}


// 创建信息的实体类
class Message {
    constructor() {
        this.title = '';
        this.describe = '';
        this.issuer = '';
        this.sort = '';
        this.fileList = '';
        this.type = '1';
        this.dateIssure = '';
        this.isIssure = '1';
        this.content = '';

    }

    static save(message){

        return db.exec(sqls.insertMessage,[message.title,message.describe,message.issuer,message.sort,message.fileList,message.type,message.dateIssure,message.isIssure,message.content]);
    }
}


module.exports = Message