class Tags {
  String? id;
  String? title;



  Tags({
    required this.id,
    required this.title,


  });

  Tags.fromJson(Map<String, dynamic> element) {
    id=element['id'];
    title=element['title'];



  }
}