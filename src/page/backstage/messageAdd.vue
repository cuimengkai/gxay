<template>
    <div style="height: 100%">
      <div class="featureTitle">
      </div>
      <div style="font-size: 20px;height: 30%;width:60%;margin-left:15%;">
          <el-form :model="message" :rules="rules" ref="message" label-width="15%" style="height: 80%"  >
                <el-form-item prop="title" label="标题">
                    <el-input v-model="message.title" placeholder="标题" ></el-input>
                </el-form-item>
                <el-form-item prop="describe" label="简要描述">
                    <el-input v-model="message.describe" placeholder="简要描述" ></el-input>
                </el-form-item>
                <el-form-item prop="issuer" label="发布者">
                    <el-input v-model="message.issuer" placeholder="发布者" ></el-input>
                </el-form-item>
                <el-form-item prop="sort" label="排序号" :rules="[{ required: true, message: '排序号不能为空'},{ type: 'number', message: '排序号必须为数字值'}]">
                  <el-input type="sort" v-model.number="message.sort" auto-complete="off"></el-input>
                </el-form-item>
                <el-form-item prop="file" label="上传图片">
                   <el-upload class="upload-demo"
                    action="https://jsonplaceholder.typicode.com/posts/"
                    :on-preview="handlePreview"
                    :on-remove="handleRemove"
                    :file-list="message.fileList"
                    list-type="picture">
                    <el-button size="small" type="primary">点击上传</el-button>
                    <div slot="tip" class="el-upload__tip">只能上传jpg/png文件，且不超过500kb</div>
                  </el-upload>
                </el-form-item>
                <el-form-item prop="type" label="信息分类">
                <template>
                  <el-select v-model="message.type"  placeholder="请选择">
                    <el-option
                      v-for="item in options"
                      :key="item.value"
                      :label="item.label"
                      :value="item.value">
                    </el-option>
                  </el-select>
                </template>
            </el-form-item>
            <el-form-item prop="isIssure" label="是否显示">
                <template>
                  <el-radio class="radio" v-model="message.isIssure" label="1">显示</el-radio>
                  <el-radio class="radio" v-model="message.isIssure" label="2">不显示</el-radio>
                </template>
            </el-form-item>
            <el-form-item label="内容" prop="content">
                <vue-html5-editor :content="message.content" @change="updateData" ></vue-html5-editor>
            </el-form-item>
            <div class="handleArticleClass" >
                    <el-button class="editor-btn" type="primary" @click="saveForm('message')">发布</el-button>
                    <el-button class="editor-btn" type="primary" @click="resetForm('message')">重置</el-button>
                </div>
            </el-form>
      </div>
    </div>
</template>
<script>
 import {saveMessage} from '../../store/service'
// import {articleById} from '../../store/manageService'
    export default {
        data: function(){
            return {
                rules:{
                  title:[
                          { required: true, message: '请输入标题!', trigger: 'blur' },
                          { min: 5, max: 20, message: '长度在 5 到 20 个字符', trigger: 'blur' }
                  ],
                  describe:[
                          { required: true, message: '请输入简要描述!', trigger: 'blur' },
                          { min: 5, max: 20, message: '长度在 5 到 20 个字符', trigger: 'blur' }
                  ],
                  issuer:[
                          { required: true, message: '请输入发布者!', trigger: 'blur' },
                  ]

                },
                message:{
                  title:'',
                  describe: '',
                  issuer: '',
                  sort: '',
                  fileList:[],
                  type: '1',
                  dateIssure: new Date(),
                  isIssure: '1',
                  content: '',
                },
                options: [{
                      value: '1',
                      label: '安邮新闻'
                    }, {
                      value: '2',
                      label: '业界动态'
                    }, {
                      value: '3',
                      label: '成功案例'
                    }, {
                      value: '4',
                      label: '关于我们'
                    }],
              
            }
        },
        methods:{
            updateData(data){
                this.message.content = data
            },
            saveForm(formName){
              this.$refs[formName].validate((valid) => {
                if (valid){
                  saveMessage(this.message).then(function(data){
                                         console.info("添加成功")
                                      },function(err){
                                        console.info("添加失败")
                                      });
                } else {
                  return false;
                }
              });
            },
            resetForm(formName) {
              this.$refs[formName].resetFields();
            },
            handlePreview(file) {
                console.log(file);
              },
            handleRemove(file, fileList) {
                console.log(file, fileList);
              },
           
            // save(formName,mode){
            //     self.$refs[formName].validate((valid) => {
            //         if (valid) {
            //             let filterContent  = self.content.replace(/<(?:.|\s)*?>/g,'').replace(/\s/g,'').substr(0,200)
            //             saveArticle(article).then(function(data){
            //                 if(data.code == 0){
            //                    removeStore('tempArticleId')

            //                     toast(self,'保存成功')
            //                     self.$router.push('/manage/article/' + data.data.id);
            //                 }
            //                 else{
            //                     toast(self,err.cMsg)
            //                 }
            //             },function(err){
            //                 toast(self,err.cMsg)   
            //             })
            //         }
            //     });
            // },
        },

        computed:{
            // editStatus(){
            //     return this.isEdit?'发布文章':'预览文章'
            // }
        },
        components:{
            
        }
    }
</script>

<style scoped>


 .tagClass{
    cursor: pointer;
    margin-right: 0.15rem;
    margin-top: 10px;
 }
 .selectedTag{
    background: #20a0ff;
    color: white;
 }

.handleArticleClass{
    margin-top: 20px;
}
.editor-btn{
    float: right;
    margin-left: 20px;
}
</style>