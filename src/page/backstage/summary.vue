<template>
    <div>
       <div class="featureTitle">
          默认首页
        </div>
       <div class="meterContentClass">
           
          <div class="newestList" > 
          
        </div>
       </div>

    </div>
</template>

<script>
import {getMeter} from '../../store/manageService'

    export default {
        data: function(){
            return {
                meter:{}
            }
        },
        async mounted(){
            if(!getStore('m_token')){
                this.$router.replace('/managelogin')
                return
            }
            let res = await getMeter()
            if(res.code != 0){
                toast(this,res.cMsg)
            }
            this.meter = res.data
        },
        methods:{
            toArticle(article){
                this.$router.push('/manage/article/' + article.article_id);
            },
            formatData(time){
                 return formatTime(new Date(time))
            }
        },
        
    }
</script>

<style >
 .meterContentClass{
    margin-top: 40px;
 }
 .articleStatus{
     background: deepskyblue;
     padding: 20px;
     color: white;
     display: flex;
     min-width: 200px;
     margin-right: 20px;
 }
.articleStatus div{
    width: 50%;
    margin-left: 30px;
}
.articleStatus div span{
    display:  block;
    text-align: right
}
.meterMenuCount{
    font-size: 18px;
    color: wheat
}
 .meterMenu{
     display: flex;
     font-size: 12px;
     justify-content: flex-start;
 }
 .meterMenu div img{
     width: 60px;
     height: 60px;
     margin-right: 10px;
 }
 .newestList{
     font-size: 14px;
     display: flex;
     margin-top: 80px;
     justify-content: space-between
 }
 .newestTitle{
    background: #eee;
    padding: 10px;
 }
 .newestArticleTitle{

 }
 .newestArticleTitle div{
     border-left: 1px solid #ddd;
     border-right: 1px solid #ddd;
     border-top: 1px solid #ddd;
     padding: 10px;
     color: dodgerblue;
 }
  .newestArticleTitle:last-child{
      border-bottom: 1px solid #ddd;
  }
  .newestArticleTitle div a:hover{
      cursor: pointer;
  }
</style>