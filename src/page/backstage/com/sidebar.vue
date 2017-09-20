<template>
    <div class="sidebar">
            <el-menu default-active="1" class="el-menu-vertical-demo" @open="handleOpen" @close="handleClose" @select = "selectMenu" >
                <el-submenu index="1" >
                    <template slot="title"><i class="el-icon-menu"></i>信息管理</template>
                    <el-menu-item index="summary"><i class="el-icon-setting"></i>添加信息</el-menu-item>
                    <el-menu-item index="manageUser"><i class="el-icon-setting"></i>安邮新闻列表</el-menu-item>
                    <el-menu-item index="manageArticle"><i class="el-icon-setting"></i>业界动态列表</el-menu-item>
                    <el-menu-item index="manageComment"><i class="el-icon-setting"></i>成功案例列表</el-menu-item>
                    <el-menu-item index="manageFile"><i class="el-icon-setting"></i>关于我们列表</el-menu-item>
                </el-submenu>
                <el-submenu index="2" >
                    <template slot="title"><i class="el-icon-menu"></i>软件管理</template>
                    <el-menu-item index="systemSetting"><i class="el-icon-setting"></i>软件列表</el-menu-item>
                    <el-menu-item index="manageFile"><i class="el-icon-setting"></i>添加软件</el-menu-item>
                </el-submenu>
                <el-submenu index="3" unique-opened=true>
                    <template slot="title"><i class="el-icon-menu"></i>云端申请管理</template>
                    <el-menu-item index="systemSetting"><i class="el-icon-setting"></i>云端申请</el-menu-item>
                </el-submenu>
                <el-submenu index="4">
                    <template slot="title"><i class="el-icon-menu"></i></i>账户管理</template>
                    <el-menu-item index="manageFile"><i class="el-icon-setting"></i>账户列表</el-menu-item>
                    <el-menu-item index="manageUser"><i class="el-icon-setting"></i>添加账户</el-menu-item>
                </el-submenu>
                <el-submenu index="5">
                    <template slot="title"><i class="el-icon-menu"></i></i>日志管理</template>
                    <el-menu-item index="managerSetting"><i class="el-icon-setting"></i>管理日志</el-menu-item>
                </el-submenu>
            </el-menu>
        <copyRight></copyRight>
    </div>
</template>
<script>
import copyRight from './copyRight'
    export default {
        computed:{
            onRoutes(){
                return this.$route.path.replace('/','');
            }
        },

        methods:{
            selectMenu(index,path){
                if(index == 'editArticle')
                {
                    this.$router.replace("/manage/" + index + '/0')
                }
                else{
                     this.$router.replace("/manage/" + index)
                }
               
                },
                handleOpen(key, keyPath) {
                },
               handleClose(key, keyPath) {
                },
        },
        components:{
            copyRight
        }
    }
</script>
<style scoped>
    .sidebar{
        display: block;
        position: absolute;
        width: 250px;
        left: 0;
        top: 70px;
        bottom:0;
        background: #2E363F;
    }
    .sidebar > ul {
        height:100%;
    }
</style>
