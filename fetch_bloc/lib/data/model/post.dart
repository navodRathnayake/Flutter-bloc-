library post_model;

import 'package:equatable/equatable.dart';

class Post extends Equatable {
  final int id;
  final String title;
  final String body;

  const Post({required this.id, required this.title, required this.body});
  @override
  List<Object?> get props => [id, title, body];

  Post copyWith({int? postId, String? postTitle, String? postBody}) {
    return Post(
        id: postId ??= id, title: postTitle ??= title, body: postBody ??= body);
  }

  Post.fromJson({required Map<String, dynamic> json})
      : id = json['id']!,
        title = json['title']!,
        body = json['body']!;

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'body': body,
    };
  }

  @override
  String toString() {
    return """
{
  id : $id,
  title : $title,
  body : $body,
}""";
  }
}
