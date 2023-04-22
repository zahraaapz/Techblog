class Poster {
  String? id;
  String? title;
  String? image;


  Poster({
    required this.id,
    required this.title,
    required this.image,

  });

  Poster.fromJson(Map<String, dynamic> element) {
    id=element['id'];
    title=element['title'];
    image=element['image'];


  }
}