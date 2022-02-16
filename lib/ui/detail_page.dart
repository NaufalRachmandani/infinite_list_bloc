import 'package:flutter/material.dart';

import '../model/post.dart';

class DetailPage extends StatelessWidget {
  final Post post;

  const DetailPage({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(post.title),
      ),
      body: Center(
        child: Text(post.body),
      ),
    );
  }
}
