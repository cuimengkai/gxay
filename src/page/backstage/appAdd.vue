<template>
    <div style="height: 100%">
      <div class="featureTitle">
      </div>
      <div style="font-size: 20px;height: 30%;width:60%;margin-left:15%;">
          <el-form :model="article" :rules="rules" ref="article" label-width="0px" style="height: 60%"  >
                <el-form-item prop="title">
                    <el-input v-model="article.title" placeholder="应用名称" ></el-input>
                </el-form-item>
                <el-form-item prop="title">
                    <el-input v-model="article.title" placeholder="软件大小" ></el-input>
                </el-form-item>
                <el-form-item>
                    <el-upload
                      class="upload-demo"
                      action="https://jsonplaceholder.typicode.com/posts/"
                      :on-preview="handlePreview"
                      :on-remove="handleRemove"
                      :file-list="fileList2"
                      list-type="picture">
                      <el-button size="small" type="primary">点击上传</el-button>
                      <div slot="tip" class="el-upload__tip">只能上传.apk/.ipa应用包</div>
                    </el-upload>
                </el-form-item>
                <el-form-item prop="title">
                    <el-input v-model="article.title" placeholder="软件URL" ></el-input>
                </el-form-item>
                <el-form-item prop="title">
                    <el-input v-model="article.title" placeholder="排序号" ></el-input>
                </el-form-item>
            <el-form-item prop="title">
                <template>
                  <el-radio class="radio" v-model="radio" label="1">显示</el-radio>
                  <el-radio class="radio" v-model="radio" label="2">不显示</el-radio>
                </template>
            </el-form-item>
            <el-form-item prop="title">
                 <el-date-picker
                  v-model="value1"
                  type="date"
                  placeholder="发布日期"
                  :picker-options="pickerOptions0">
            </el-date-picker>
            </el-form-item>
                <vue-html5-editor :content="content" @change="updateData" ></vue-html5-editor>
                <div class="handleArticleClass" >
                    
                    <el-button class="editor-btn" type="primary" @click="save('article',1)">发布</el-button>
                    <el-button v-if="articleId>0" class="editor-btn" type="primary" @click="cancle">取消</el-button>
                </div>
            </el-form>
      </div>
    </div>
</template>
<script>
import {getTags,getSorts,saveArticle} from '../../store/service'
import {articleById} from '../../store/manageService'
//wait to do auto save feature

    export default {
        data: function(){
            return {
                article: {
                    title: '',
                },
                rules: {
                    title: [
                        { required: true, message: '请输入文章标题', trigger: 'blur' }
                    ],
                },
                tags: [],
                selectedTags:[],
                tag:'',
                articleSort:[],
                selectedSortId:0,
                content: '',
                editorOption: {
                    // something config
                    placeholder:'从这里开始写你的文章'
                },
                mainImage:'',
                articleId:0,
                isEdit:true,
                needAutoSave:false,
                radio: '1',
                value1: '',
            }
        },
        async mounted(){
            this.articleId = this.$route.params.id
            let self = this
            let res = await articleById(this.articleId)
            if(res.code == 0){
                 let articleDetail = res.data
                 this.article.title = articleDetail.article_name
                 this.selectedTags = articleDetail.tags
                 this.selectedSortId = articleDetail.article_sort_id
                 this.content = articleDetail.article_content
                 let userId = articleDetail.user_id
                 res = await getTags(userId)
                 if(res.code == 0){
                      this.tags = res.data
                 }
                 res = await getSorts(userId)
                 if(res.code == 0){
                    this.articleSort = res.data
                 }
            }
            else{
                toast(this,res.cMsg)
            }
            
            setGlobalVue(this)
        },
        methods:{
            selectTag(tag){
                let index = this.selectedTags.findIndex(s=>{
                    return s.tag_id == tag.tag_id
                })
                if(index < 0 ){
                    this.selectedTags.push(tag)
                }
                else{
                    this.selectedTags.splice(index,1)
                }
            },
            isTagContain(tag){
                let index = this.selectedTags.findIndex(s=>{
                    return s.tag_id == tag.tag_id
                })
                return index >= 0
            },
            selectSort(sort) {
                this.selectedSortId = sort.sort_article_id
            },


            updateData(data){
                this.content = data
            },
            imgCallBack(result){
                if(result.code == 0){
                    if(this.mainImage == ''){
                        this.mainImage = result.data
                    }
                    this.content = this.content +  "<div style='text-align:center'><img style='max-width:100%;height:auto' src="+ result.data +" ></img></div>"
                }
                else{
                    toast(this,result.cMsg)
                }
            },
            save(formName,mode){
                let self = this;
                if(self.selectedTags.length <= 0){
                    toast(self,'你没有选择文章标签')
                    return
                }
                if(self.selectedSortId <= 0){
                    toast(self,'你没有选择文章类型')
                    return
                }
                self.$refs[formName].validate((valid) => {
                    if (valid) {
                        let filterContent  = self.content.replace(/<(?:.|\s)*?>/g,'').replace(/\s/g,'').substr(0,200)
                        let article = {
                            articalTitle:self.article.title,
                            articalSort:self.selectedSortId,
                            articalTags:self.selectedTags.map((s=>{
                                            return s.tag_id
                                        })),
                            articalContent:self.content,
                            articleStatus:mode,
                            articleId:self.articleId,
                            articelImage:self.mainImage,
                            articleBrief:filterContent,
                        }
                        saveArticle(article).then(function(data){
                            if(data.code == 0){
                               removeStore('tempArticleId')

                                toast(self,'保存成功')
                                self.$router.push('/manage/article/' + data.data.id);
                            }
                            else{
                                toast(self,err.cMsg)
                            }
                        },function(err){
                            toast(self,err.cMsg)   
                        })
                    }
                });
            },
            cancle(){
                this.$router.replace('/manage/manageArticle');
            },
            handleRemove(file, fileList) {
                console.log(file, fileList);
              },
            handlePreview(file) {
                console.log(file);
              }
          
        },

        computed:{
            editStatus(){
                return this.isEdit?'发布文章':'预览文章'
            }
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