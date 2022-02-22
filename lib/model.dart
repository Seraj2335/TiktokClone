class Model {
  String display_image;
  String link;
  String published;
  String source_page;
  int timestamp;
  String title;
  Model(
      {required this.display_image,
      required this.link,
      required this.published,
      required this.source_page,
      required this.timestamp,
      required this.title});
  factory Model.fromJson(Map<String, dynamic> json) {
    return Model(
        display_image: json['display_image'] as String,
        link: json['link'] as String,
        published: json['published'] as String,
        source_page: json['source_page'] as String,
        timestamp: json['timestamp'],
        title: json['title']);
  }
}
