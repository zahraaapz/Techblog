import 'package:tech_blog/component/api_constant.dart';

class ArticleModel{
String? id;
String? image;
String? title;
String? catId;
String? catName;
String? author;
String? view;
String? status;
String? createdAt;

ArticleModel({

  required this.id,
  required this.image,
  required this.title,
  required this.catId,
  required this.catName,
  required this.author,
  required this.view,
  required this.status,
  required this.createdAt,


});

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