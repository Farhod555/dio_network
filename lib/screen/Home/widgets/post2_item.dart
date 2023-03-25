import 'package:dio_network/models/comments_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget post2Item(BuildContext context, Comment post2, void Function() delete) {
  return SizedBox(
    height: 250,
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                post2.name,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(
              width: 5,
              child: Text(
                post2.email,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                  color: Color.fromARGB(255, 255, 0, 0),
                ),
              ),
            )
          ],
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          post2.body,
          maxLines: 6,
          style: TextStyle(
              fontWeight: FontWeight.w400, fontSize: 16, color: Colors.black38),
        ),
        IconButton(onPressed: delete, icon: const Icon(Icons.delete)),
        const Divider(
          thickness: 3,
        )
      ],
    ),
  );
}
