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
        console.log("获取的数据是:")
        console.log(JSON.stringify(ctx.params));
        let result0 = await Check.checkToken(ctx)
        if (result0.code != 0) {
            ctx.rest(result0)
            return
        }
        return false;
        let id = ctx.params.userId
        let token = ctx.params.token
        let t = ctx.request.body

        if (!t.articalTitle || !t.articalTitle.trim()) {
            ctx.rest(Result.create(10, { msg: 'miss articalTitle' }))
            return
        }
        if (!t.articalSort || !t.articalSort.trim()) {
            ctx.rest(Result.create(10, { msg: 'miss articalSort' }))
            return
        }

        if (!t.articalContent) {
            ctx.rest(Result.create(10, { msg: 'miss articalContent' }))
            return
        }
        // if(t.articalContent.match(/^data:image\/\w+;base64,/))
        //使用正则来取出里面的图片也不是好办法
        //大一点点的图片都无法直接保存在数据库了
        let m = new Article(t.articalTitle, Tool.handleHtmlImg(t.articalContent))
        m.ip = ctx.request.ip
        m.category = t.articalSort
        m.userId = id
        m.articalStatus = 1
        m.articleBrief = t.articleBrief
        m.articleMainImage = ''
        let imgTag = m.content.match(/<img.*?(?:>|\/>)/gi)
        if (imgTag && imgTag.length > 0) {
            let url = imgTag[0].match(/src=[\'\"]?([^\'\"]*)[\'\"]?/i)
            if (url && url.length > 0) {
                m.articleMainImage = url[0].replace("src=\"", "").replace("\"", "")
            }
        }
        let resultArticle = {}
        let articleId = 0
        if (t.articleId && !isNaN(t.articleId) && t.articleId != 0) {
            m.article_id = t.articleId
            resultArticle = await Article.updateAtricle(m)
            articleId = m.article_id
        } else {
            resultArticle = await Article.save(m)
            articleId = resultArticle.data.id
        }
        if (resultArticle.code != 0) {
            ctx.rest(resultArticle)
            return
        }
        await Tag.deleteTagByArticleId(m.article_id)
        if (t.articalTags && Tool.getType(t.articalTags) == "Array") {
            let result3 = await Tag.saveArticalMap(articleId, t.articalTags)
        }
        let dynamic = new Dynamic(id, articleId, 0, 1, 0, 1)
        await Dynamic.save(dynamic)
        ctx.rest(Result.create(0, { id: articleId }))
    },
}