import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:dio_network/config/dio_config.dart';
import 'package:dio_network/models/comments_model.dart';
import 'package:dio_network/models/post_model.dart';
import '../network/api.dart';
import 'log_service.dart';

class GetPostService {
  static final GetPostService _inheritance = GetPostService._init();
  static GetPostService get inheritance => _inheritance;
  GetPostService._init();

  static Future<List<Comment>?> getComment() async {
    try {
      Response res =
          await DioConfig.inheritentce.createRequest().get(Urls.getPosts);
      Log.i(res.data.toString());
      Log.i(res.statusCode.toString());

      if (res.statusCode == 200) {
        List<Comment> userList = [];
        for (var e in (res.data as List)) {
          userList.add(Comment.fromJson(e));
        }

        return userList;
      } else {
        Log.e('${res.statusMessage} ${res.statusCode}');
      }
    } on DioError catch (e) {
      if (e.response != null) {
        Log.e(e.response!.toString());
      } else {
        rethrow;
      }
    } catch (e) {
      Log.e(e.toString());
    }
    return null;
  }

  static Future<bool> createComment(Comment newComment) async {
    try {
      Response res = await DioConfig.inheritentce
          .createRequest()
          .post(Urls.addPosts, data: {
        'postId': newComment.postId,
        'Id': newComment.id,
        'Name': newComment.name,
        'Email': newComment.email,
        'Body': newComment.body,
      });
      Log.i(res.data.toString());
      Log.i(res.statusCode.toString());

      if (res.statusCode == 200 || res.statusCode == 201) {
        return true;
      } else {
        Log.e('${res.statusCode} ${res.statusCode}');
        return false;
      }
    } on DioError catch (e) {
      if (e.response != null) {
        Log.e(e.response!.toString());
        return false;
      } else {
        rethrow;
      }
    } catch (e) {
      Log.e(e.toString());
      return false;
    }
  }

  static Future<bool> editComment(Comment newComment) async {
    try {
      Response res = await DioConfig.inheritentce
          .createRequest()
          .put(Urls.updatePosts + newComment.id.toString(), data: {
        'postId': newComment.postId,
        'Id': newComment.id,
        'Name': newComment.name,
        'Email': newComment.email,
        'Body': newComment.body,
      });
      Log.i(res.data.toString());
      Log.i(res.statusCode.toString());

      if (res.statusCode == 200 || res.statusCode == 201) {
        return true;
      } else {
        Log.e('${res.statusCode} ${res.statusCode}');
        return false;
      }
    } on DioError catch (e) {
      if (e.response != null) {
        Log.e(e.response!.toString());
        return false;
      } else {
        rethrow;
      }
    } catch (e) {
      Log.e(e.toString());
      return false;
    }
  }

  static Future<bool> deleteComment(int id) async {
    try {
      Response res = await DioConfig.inheritentce.createRequest().delete(
            Urls.deletePosts + id.toString(),
          );
      Log.i(res.data.toString());
      Log.i(res.statusCode.toString());

      if (res.statusCode == 200 || res.statusCode == 201) {
        return true;
      } else {
        Log.e('${res.statusCode} ${res.statusCode}');
        return false;
      }
    } on DioError catch (e) {
      if (e.response != null) {
        Log.e(e.response!.toString());
        return false;
      } else {
        rethrow;
      }
    } catch (e) {
      Log.e(e.toString());
      return false;
    }
  }
}
