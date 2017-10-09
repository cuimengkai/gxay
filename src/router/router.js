const demo = r => require.ensure([], () => r(require('../page/demo')), 'demo')

const index = r => require.ensure([], () => r(require('../page/blog/index')), 'index')

const search = r => require.ensure([], () => r(require('../page/blog/searchResult')), 'search')

const login = r => require.ensure([], () => r(require('../page/blog/login')), 'login')

const register = r => require.ensure([], () => r(require('../page/blog/register')), 'register')
const resetPassword = r => require.ensure([], () => r(require('../page/blog/resetPassword')), 'resetPassword')
const active = r => require.ensure([], () => r(require('../page/blog/active')), 'active')
const atricleInfo = r => require.ensure([], () => r(require('../page/blog/article')), 'atricleInfo')
const userInfo = r => require.ensure([], () => r(require('../page/blog/userInfo/userInfo')), 'userInfo')

const myTag = r => require.ensure([], () => r(require('../page/blog/userInfo/myTag')), 'myTag')
const mySetting = r => require.ensure([], () => r(require('../page/blog/userInfo/myInfoSetting')), 'mySetting')
const sortArticleList = r => require.ensure([], () => r(require('../page/blog/sortArticleList')), 'sortArticleList')

const writeArticle = r => require.ensure([], () => r(require('../page/blog/writeArticle')), 'writeArticle')

const aboutVue = r => require.ensure([], () => r(require('../page/blog/aboutVue')), 'aboutVue')

const notFoundPage = r => require.ensure([], () => r(require('../page/blog/404')), 'notFoundPage')

const manage = r => require.ensure([], () => r(require('../page/backstage/com/home')), 'manage')
const manageLogin = r => require.ensure([], () => r(require('../page/backstage/manageLogin')), 'manageLogin')
const blogSummary = r => require.ensure([], () => r(require('../page/backstage/summary')), 'blogSummary')

const editArticle = r => require.ensure([], () => r(require('../page/backstage/editArticle')), 'editArticle')

const manageUser = r => require.ensure([], () => r(require('../page/backstage/manageUser')), 'manageUser')

const manageUserInfo = r => require.ensure([], () => r(require('../page/backstage/manageUserInfo')), 'manageUserInfo')

const manageArticle = r => require.ensure([], () => r(require('../page/backstage/manageArticle')), 'manageArticle')

const manageArticleDetail = r => require.ensure([], () => r(require('../page/backstage/detailArticle')), 'manageArticleDetail')

const manageComment = r => require.ensure([], () => r(require('../page/backstage/manageComment')), 'manageComment')

const manageCommentInfo = r => require.ensure([], () => r(require('../page/backstage/manageCommentInfo')), 'manageCommentInfo')

const manageFile = r => require.ensure([], () => r(require('../page/backstage/manageFile')), 'manageFile')

const systemSetting = r => require.ensure([], () => r(require('../page/backstage/systemSetting')), 'systemSetting')

const managerSetting = r => require.ensure([], () => r(require('../page/backstage/managerSetting')), 'managerSetting')

const managerSettingInfo = r => require.ensure([], () => r(require('../page/backstage/managerSettingInfo')), 'managerSettingInfo')

const messageAdd = r => require.ensure([], () => r(require('../page/backstage/messageAdd')), 'messageAdd')

const news = r => require.ensure([], () => r(require('../page/backstage/news')), 'news')

const industry = r => require.ensure([], () => r(require('../page/backstage/industry')), 'industry')

const casebook = r => require.ensure([], () => r(require('../page/backstage/casebook')), 'casebook')

const aboutwe = r => require.ensure([], () => r(require('../page/backstage/aboutwe')), 'aboutwe')

const appAdd = r => require.ensure([], () => r(require('../page/backstage/appAdd')), 'appAdd')

const appList = r => require.ensure([], () => r(require('../page/backstage/appList')), 'appList')

const apply = r => require.ensure([], () => r(require('../page/backstage/apply')), 'apply')

const userList = r => require.ensure([], () => r(require('../page/backstage/userList')), 'userList')

const user = r => require.ensure([], () => r(require('../page/backstage/user')), 'user')

const logList = r => require.ensure([], () => r(require('../page/backstage/logList')), 'logList')

const imgFile = r => require.ensure([], () => r(require('../page/backstage/imgFile')), 'imgFile')

const videoFile = r => require.ensure([], () => r(require('../page/backstage/videoFile')), 'videoFile')

const jobAdd = r => require.ensure([], () => r(require('../page/backstage/jobAdd')), 'jobAdd')

const jobList = r => require.ensure([], () => r(require('../page/backstage/jobList')), 'jobList')

const awardsAdd = r => require.ensure([], () => r(require('../page/backstage/awardsAdd')), 'awardsAdd')

const awardsList = r => require.ensure([], () => r(require('../page/backstage/awardsList')), 'awardslist')

export default [{
        path: '/',
        component: manage, //顶层路由，对应index.html

    },
    {
        path: '/login',
        component: login, //顶层路由，对应index.html
        name: 'login'
    },
    {
        path: '/register',
        component: register,
    },
    {
        path: '/resetpassword',
        component: resetPassword,
    },
    {
        path: '/search/:keyword',
        component: search,
    },
    {
        path: '/active/:userid/:code',
        component: active,
    },

    {
        path: '/article/:articleId',
        component: atricleInfo,

    },
    {
        path: '/userInfo/:userId',
        component: userInfo,
    },
    {
        path: '/mytag/:userId',
        component: myTag,
    },

    {
        path: '/mysetting/:userId',
        component: mySetting,
    },
    {
        path: '/sortArticleList/:userId',
        component: sortArticleList,
    },
    {
        path: '/writeArticle/:id',
        component: writeArticle,
    },

    {
        path: '/managelogin',
        component: manageLogin
    },
    {
        path: '/aboutVue',
        component: aboutVue
    },

    {
        path: '*',
        component: notFoundPage,
        name: 'notfound'
    },
    {
        path: '/manage',
        component: manage,
        children: [{
                path: '/',
                component: blogSummary
            },
            {
                path: 'summary',
                component: blogSummary
            },
            {
                path: 'editArticle/:id',
                component: editArticle
            },
            {
                path: 'manageUser',
                component: manageUser
            },
            {
                path: 'manageUserInfo/:id',
                component: manageUserInfo
            },
            {
                path: 'manageArticle',
                component: manageArticle
            },
            {
                path: 'article/:id',
                component: manageArticleDetail
            },
            {
                path: 'manageComment',
                component: manageComment
            },
            {
                path: 'manageCommentInfo/:articleId',
                component: manageCommentInfo
            },
            {
                path: 'manageFile',
                component: manageFile
            },
            {
                path: 'systemSetting',
                component: systemSetting
            },
            {
                path: 'managerSetting',
                component: managerSetting
            },
            {
                path: 'managerSettingInfo/:id',
                component: managerSettingInfo
            },
            {
                path: 'messageAdd',
                component: messageAdd
            },
            {
                path: 'news',
                component: news
            },
            {
                path: 'industry',
                component: industry
            },
            {
                path: 'casebook',
                component: casebook
            },
            {
                path: 'aboutwe',
                component: aboutwe
            },
            {
                path: 'appAdd',
                component: appAdd
            },
            {
                path: 'appList',
                component: appList
            },
            {
                path: 'apply',
                component: apply
            },
            {
                path: 'user',
                component: user
            },
            {
                path: 'userList',
                component: userList
            },
            {
                path: 'logList',
                component: logList
            },
            {
                path: 'imgFile',
                component: imgFile
            },
            {
                path: 'videoFile',
                component: videoFile
            },
            {
                path: 'jobAdd',
                component: jobAdd
            },
            {
                path: 'jobList',
                component: jobList
            },
            {
                path: 'awardsAdd',
                component: awardsAdd
            },
            {
                path: 'awardsList',
                component: awardsList
            },
        ]
    },



    {
        path: '/demo',
        component: demo,
        name: 'demo'
    },


]