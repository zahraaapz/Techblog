import 'package:tech_blog/component/constant/api_constant.dart';

class ArticleInfoModel{

 String ?id;
 String ?title;
 String ?content;
 String ?image;
 String ?catId;
 String ?catName;
 String ?author;
 String ?view;
 String ?status;
 String ?createdAt;
 bool ?  isFavorite;
ArticleInfoModel(


  this.id,
   this.image,
   this.title,



   
   
   
   
   );

ArticleInfoModel.fromJson(Map<String,dynamic> element){

 id=element['info']['id'];
 title=element['info']['title'];
 content=element['info']['content'];
 image=ApiCons.imageBaseUrl+element['info']['image'];
 catId=element['info']['cat_id'];
 catName=element['info']['cat_name'];
 author=element['info']['author'];
 view=element['info']['view'];
 status=element['info']['status'];
 createdAt=element['info']['created_at'];
 isFavorite=element['isFavorite'];

}

}