class RadioModel {
  int id;
  String name;
  String url;
  String recentDate;

  RadioModel(
      {required this.id,
        required this.name,
        required this.url,
        required this.recentDate});

  factory RadioModel.fromJson(Map<String, dynamic> json) => RadioModel(
    id: json['id'] as int,
    name: json['name'] as String,
    url: json['url'] as String,
    recentDate: json['recent_date'] as String,
  );
}