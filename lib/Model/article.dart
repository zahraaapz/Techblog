import 'package:tech_blog/component/constant/api_constant.dart';

class ArticleModel{
String? id;
String? image;
String? title; 
String? catId;
String? catName;
String? author;
String? view;
String? status;
String? createdAt;//shift+alt

ArticleModel(

  this.id,
   this.image,
   this.title,


);

ArticleModel.fromJson(Map<String,dynamic>element){

 id=element['id'];
 image=ApiCons.imageBaseUrl+element['image'];
 title=element['title'];
 catId=element['cat_id'];
 catName=element['cat_name'];
 author=element['author'];
 view=element['view'];
 status=element['status'];
 createdAt=element['created_at'];
}
}