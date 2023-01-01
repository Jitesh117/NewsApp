
class NewsData {
  String? category;
  List<Data>? data;
  bool? success;

  NewsData({this.category, this.data, this.success});

  NewsData.fromJson(Map<String, dynamic> json) {
    category = json["category"];
    data = json["data"] == null ? null : (json["data"] as List).map((e) => Data.fromJson(e)).toList();
    success = json["success"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["category"] = category;
    if(data != null) {
      _data["data"] = data?.map((e) => e.toJson()).toList();
    }
    _data["success"] = success;
    return _data;
  }
}

class Data {
  String? author;
  String? content;
  String? date;
  String? id;
  String? imageUrl;
  String? readMoreUrl;
  String? time;
  String? title;
  String? url;

  Data({this.author, this.content, this.date, this.id, this.imageUrl, this.readMoreUrl, this.time, this.title, this.url});

  Data.fromJson(Map<String, dynamic> json) {
    author = json["author"];
    content = json["content"];
    date = json["date"];
    id = json["id"];
    imageUrl = json["imageUrl"];
    readMoreUrl = json["readMoreUrl"];
    time = json["time"];
    title = json["title"];
    url = json["url"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["author"] = author;
    _data["content"] = content;
    _data["date"] = date;
    _data["id"] = id;
    _data["imageUrl"] = imageUrl;
    _data["readMoreUrl"] = readMoreUrl;
    _data["time"] = time;
    _data["title"] = title;
    _data["url"] = url;
    return _data;
  }
}