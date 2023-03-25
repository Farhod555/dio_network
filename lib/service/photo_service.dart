import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:dio_network/config/dio_config.dart';
import 'package:dio_network/models/post_model.dart';
import 'package:dio_network/models/photos_model.dart';
import '../network/api.dart';
import 'log_service.dart';

class PhotosService {
  static final PhotosService _inheritance = PhotosService._init();
  static PhotosService get inheritance => _inheritance;
  PhotosService._init();

  static Future<List<Photos>?> getPhotos() async {
    try {
      Response res =
          await DioConfig.inheritentce.createRequest().get(Urls.getPosts);
      Log.i(res.data.toString());
      Log.i(res.statusCode.toString());

      if (res.statusCode == 200) {
        List<Photos> userList = [];
        for (var e in (res.data as List)) {
          userList.add(Photos.fromJson(e));
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
}

//   static Future<bool> createUser(Photos newPost) async {
//     try {
//       Response res = await DioConfig.inheritentce
//           .createRequest()
//           .post(Urls.addPosts, data: {
//         'userId': newPost.userId,
//         'title': newPost.title,
//         'body': newPost.body
//       });
//       Log.i(res.data.toString());
//       Log.i(res.statusCode.toString());

//       if (res.statusCode == 200 || res.statusCode == 201) {
//         return true;
//       } else {
//         Log.e('${res.statusCode} ${res.statusCode}');
//         return false;
//       }
//     } on DioError catch (e) {
//       if (e.response != null) {
//         Log.e(e.response!.toString());
//         return false;
//       } else {
//         rethrow;
//       }
//     } catch (e) {
//       Log.e(e.toString());
//       return false;
//     }
//   }
  

//   static Future<bool> editUser(Photos newPost) async {
//     try {
//       Response res = await DioConfig.inheritentce
//           .createRequest()
//           .put(Urls.updatePosts + newPost.id.toString(), data: {
//         'userId': newPost.userId,
//         'title': newPost.title,
//         'body': newPost.body
//       });
//       Log.i(res.data.toString());
//       Log.i(res.statusCode.toString());

//       if (res.statusCode == 200 || res.statusCode == 201) {
//         return true;
//       } else {
//         Log.e('${res.statusCode} ${res.statusCode}');
//         return false;
//       }
//     } on DioError catch (e) {
//       if (e.response != null) {
//         Log.e(e.response!.toString());
//         return false;
//       } else {
//         rethrow;
//       }
//     } catch (e) {
//       Log.e(e.toString());
//       return false;
//     }
//   }

//   static Future<bool> deleteUser(int id) async {
//     try {
//       Response res = await DioConfig.inheritentce.createRequest().delete(
//             Urls.deletePosts + id.toString(),
//           );
//       Log.i(res.data.toString());
//       Log.i(res.statusCode.toString());

//       if (res.statusCode == 200 || res.statusCode == 201) {
//         return true;
//       } else {
//         Log.e('${res.statusCode} ${res.statusCode}');
//         return false;
//       }
//     } on DioError catch (e) {
//       if (e.response != null) {
//         Log.e(e.response!.toString());
//         return false;
//       } else {
//         rethrow;
//       }
//     } catch (e) {
//       Log.e(e.toString());
//       return false;
//     }
//   }
// }
