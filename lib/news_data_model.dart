import 'dart:convert';

class NewsDataModel {
  late String status;
  late int statusCode;
  late String version;
  late String lastModified;
  late String access;
  late int total;
  late int limit;
  late int offset;
  late List<Data> data;

  NewsDataModel(
      {required this.status,
        required this.statusCode,
        required this.version,
        required this.lastModified,
        required this.access,
        required this.total,
        required this.limit,
        required this.offset,
        required this.data});

   NewsDataModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    statusCode = json['status-code'];
    version = json['version'];
    lastModified = json['last-modified'];
    access = json['access'];
    total = json['total'];
    limit = json['limit'];
    offset = json['offset'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['status-code'] = this.statusCode;
    data['version'] = this.version;
    data['last-modified'] = this.lastModified;
    data['access'] = this.access;
    data['total'] = this.total;
    data['limit'] = this.limit;
    data['offset'] = this.offset;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  late  int id;
  late String title;
  late String link;
  late String published;
  late String summary;
  late  String image;

   Data(
      {required this.id,
        required this.title,
        required this.link,
        required this.published,
        required this.summary,
        required this.image});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    link = json['link'];
    published = json['published'];
    summary = json['summary'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['link'] = this.link;
    data['published'] = this.published;
    data['summary'] = this.summary;
    data['image'] = this.image;
    return data;
  }
  @override
  String toString() {
    // TODO: implement toString
    return json.toString();
  }
}