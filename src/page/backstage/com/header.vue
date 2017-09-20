
<template>
    <div class="header">
        <div class="logo">
            <img :src="logoImage">
        </div>
        <div class="user-info">
            <el-dropdown trigger="click" @command="handleCommand">
                <span class="el-dropdown-link"><i class="el-icon-setting"></i>
                    <!-- <img class="user-logo" :src="userImage"> -->
                     {{username}}
                </span>
                <el-dropdown-menu slot="dropdown">
                    <!-- <el-dropdown-item command="clearCache">清空缓存</el-dropdown-item> -->
                    <el-dropdown-item command="loginout"><i class="el-icon-document"></i> 修改</el-dropdown-item>
                    <el-dropdown-item command="loginout"><i class="el-icon-upload2"></i> 注销</el-dropdown-item>
                </el-dropdown-menu>
            </el-dropdown>
        </div>
    </div>
</template>

<script>
    export default {
        data() {
            return{}
        },
        props:{
            username: {
               type: String,
               default:''
            },
           userImage:{
               type: String,
               default:''
           },
           logoImage:{
            type:String,
            default:'http://127.0.0.1:3000/static/img/logo.png'
           }
        },
        computed:{
          
        },
        methods:{
            handleCommand(command) {
                if(command == 'loginout'){
                    // clearStore()
                    this.$router.replace('/managelogin');
                }
                // else if(command == 'clearCache'){
                //     clearStoreExcept('m_token')
                //     toast(this,'缓存清除成功')
                // }
            }
        }
    }
</script>
<style scoped>
    .header {
        position: relative;
        box-sizing: border-box;
        width: 100%;
        height: 70px;
        font-size: 22px;
        line-height: 70px;
        color: #fff;
        background: #324157;
    }
    .header .logo{
        float: left;
        width:250px;
        text-align: center;
    }
    .user-info {
        float: right;
        padding-right: 50px;
        font-size: 16px;
        color: #fff;
    }
    .user-info .el-dropdown-link{
        position: relative;
        display: inline-block;
        padding-left: 50px;
        color: #fff;
        cursor: pointer;
        vertical-align: middle;
    }
    .user-info .user-logo{
        position: absolute;
        left:0;
        top:15px;
        width:40px;
        height:40px;
        border-radius: 50%;
    }
    .el-dropdown-menu__item{
        text-align: center;
        font-size: 16px;
    }
</style>
