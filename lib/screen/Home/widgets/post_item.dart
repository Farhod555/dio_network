import 'package:dio_network/models/post_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget postItem(BuildContext context, PostModel post, void Function() delete) {
  return SizedBox(
    height: 250,
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                post.title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 24,
                    color: Colors.black),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          post.body,
          maxLines: 6,
          style: const TextStyle(
              fontWeight: FontWeight.w400, fontSize: 16, color: Colors.black38),
        ),
        IconButton(onPressed: delete, icon: const Icon(Icons.delete)),
        SizedBox(
          width: 5,
        ),
        const Divider(
          thickness: 3,
        )
      ],
    ),
  );
}
