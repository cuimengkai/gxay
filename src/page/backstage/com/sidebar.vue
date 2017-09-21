<template>
    <div class="sidebar">
            <el-menu default-active="1" class="el-menu-vertical-demo" @open="handleOpen" @close="handleClose" @select = "selectMenu" >
                <el-submenu index="1" >
                    <template slot="title"><i class="el-icon-menu"></i>信息管理</template>
                    <el-menu-item index="messageAdd"><i class="el-icon-setting"></i>添加信息</el-menu-item>
                    <el-menu-item index="news"><i class="el-icon-setting"></i>安邮新闻列表</el-menu-item>
                    <el-menu-item index="industry"><i class="el-icon-setting"></i>业界动态列表</el-menu-item>
                    <el-menu-item index="casebook"><i class="el-icon-setting"></i>成功案例列表</el-menu-item>
                    <el-menu-item index="aboutwe"><i class="el-icon-setting"></i>关于我们列表</el-menu-item>
                </el-submenu>
                <el-submenu index="2" >
                    <template slot="title"><i class="el-icon-menu"></i>软件管理</template>
                    <el-menu-item index="appList"><i class="el-icon-setting"></i>软件列表</el-menu-item>
                    <el-menu-item index="appAdd"><i class="el-icon-setting"></i>添加软件</el-menu-item>
                </el-submenu>
                <el-submenu index="3" unique-opened=true>
                    <template slot="title"><i class="el-icon-menu"></i>申请管理</template>
                    <el-menu-item index="apply"><i class="el-icon-setting"></i>云端申请</el-menu-item>
                </el-submenu>
                <el-submenu index="4">
                    <template slot="title"><i class="el-icon-menu"></i></i>账户管理</template>
                    <el-menu-item index="userList"><i class="el-icon-setting"></i>账户列表</el-menu-item>
                    <el-menu-item index="user"><i class="el-icon-setting"></i>添加账户</el-menu-item>
                </el-submenu>
                <el-submenu index="5">
                    <template slot="title"><i class="el-icon-menu"></i></i>日志管理</template>
                    <el-menu-item index="logList"><i class="el-icon-setting"></i>管理日志</el-menu-item>
                </el-submenu>
                <el-submenu index="6">
                    <template slot="title"><i class="el-icon-menu"></i></i>资源管理</template>
                    <el-menu  class="el-menu-vertical-demo" style="margin-left:7%;" @select = "selectMenu">
                        <el-submenu index="1" >
                        <template slot="title"><i class="el-icon-menu"></i></i>静态资源</template>
                        <el-menu-item index="imgFile"><i class="el-icon-menu"></i>图片</el-menu-item>
                        <el-menu-item index="videoFile"><i class="el-icon-menu"></i>视频</el-menu-item>
                    </el-submenu>
                    </el-menu>
                    <el-menu  class="el-menu-vertical-demo" style="margin-left:7%;" @select = "selectMenu">
                         <el-submenu index="1" >
                        <template slot="title"><i class="el-icon-menu"></i></i>招聘资源</template>
                        <el-menu-item index="jobAdd"><i class="el-icon-menu"></i>新增招聘</el-menu-item>
                        <el-menu-item index="jobList"><i class="el-icon-menu"></i>招聘列表</el-menu-item>
                    </el-submenu>
                    </el-menu>
                    <el-menu  class="el-menu-vertical-demo" style="margin-left:7%;" @select = "selectMenu">
                         <el-submenu index="1" >
                        <template slot="title"><i class="el-icon-menu"></i></i>奖彰资源</template>
                        <el-menu-item index="awardsAdd"><i class="el-icon-menu"></i>新增奖彰</el-menu-item>
                        <el-menu-item index="awardsList"><i class="el-icon-menu"></i>奖彰列表</el-menu-item>
                    </el-submenu>
                    </el-menu>
                    <!-- <el-menu-item-group title="静态资源">
                    <el-menu-item index="imgList"><i class="el-icon-message">图片管理</i></el-menu-item>
                    <el-menu-item index="imgList"><i class="el-icon-message">视频管理</i></el-menu-item>
                  </el-menu-item-group>
                  <el-menu-item-group title="招聘资源">
                    <el-menu-item index="3"><i class="el-icon-message"></i>新增招聘</el-menu-item>
                    <el-menu-item index="4"><i class="el-icon-message"></i>招聘列表</el-menu-item>
                  </el-menu-item-group>
                  <el-menu-item-group title="奖励表彰">
                    <el-menu-item index="3"><i class="el-icon-message"></i>新增</el-menu-item>
                    <el-menu-item index="4"><i class="el-icon-message"></i>列表</el-menu-item>
                  </el-menu-item-group> -->
                </el-submenu>
            </el-menu>
    </div>
</template>
<script>
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
                }
        }
    }
</script>
<style scoped>
    .sidebar{
        display: block;
        position: absolute;
        width: 16%;
        left: 0;
        top: 70px;
        bottom:0;
        background: #2E363F;
    }
    .sidebar > ul {
        height:100%;
    }
</style>
