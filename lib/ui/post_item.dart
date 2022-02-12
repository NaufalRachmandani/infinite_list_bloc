import 'package:flutter/material.dart';

import '../model/post.dart';

class PostItem extends StatelessWidget {
  final Post post;

  const PostItem({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 8, bottom: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(post.id),
          SizedBox(
            width: (MediaQuery.of(context).size.width - 40) * 7/8,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(post.title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                const SizedBox(height: 5,),
                Text(post.body),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
