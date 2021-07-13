import 'package:flutter/foundation.dart';

class News with ChangeNotifier {
  final String id;
  final String title;
  final String published;
  final String link;
  final String summary;
  News(this.id, this.link, this.published, this.title,this.summary);
}
