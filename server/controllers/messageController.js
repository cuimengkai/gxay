const Message = require('../model/message')
const Result = require('../model/result.js')
const Tool = require('../tool/tool')
const fs = require('fs')
const path = require('path')
const Check = require('../tool/check')
const DB = require('../sqlhelp/mysql')
const imgPath = require('../../config/pathConfig')

module.exports = {
    'POST /api/message/:token': async(ctx, next) => {
        let token = ctx.params.token
        let message = new Message();
        message.title = ctx.request.body.title;
        message.describe = ctx.request.body.describe;
        message.issuer = ctx.request.body.issuer;
        message.sort = ctx.request.body.sort;
        console.info("信息管理中的文件上传 未处理")
        message.fileList = '';
        message.fileList = ctx.request.body.fileList;
        message.type = ctx.request.body.type;
        message.dateIssure = ctx.request.body.dateIssure;
        message.isIssure = ctx.request.body.isIssure;
        message.content = ctx.request.body.content;

        await Message.save(message);
    },
}