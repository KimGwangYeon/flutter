class WebtoonModel {
  final String title, id;
  final void thumb;

  WebtoonModel.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        thumb = json['thunmb'],
        id = json['id'];
}
