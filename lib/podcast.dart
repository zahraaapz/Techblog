class PodcastModel {
  String? id;
  String? title;
  String? poster;
  String? publisher;
  String? view;
  String? createdAt;

  PodcastModel({
    required this.id,
    required this.title,
    required this.poster,
    required this.publisher,
    required this.view,
    required this.createdAt,
  });
}

List<PodcastModel> podcastlist = [
  PodcastModel(
      id: '1',
      title: 'lll',
      poster: 'poster',
      publisher: 'publisher',
      view: 'view',
      createdAt: 'created At'),
];
