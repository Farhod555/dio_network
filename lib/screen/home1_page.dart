// import 'package:dio_network/service/post_service.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';

// class Home1Page extends StatefulWidget {
//   const Home1Page({super.key});

//   @override
//   State<Home1Page> createState() => _Home1PageState();
// }

// class _Home1PageState extends State<Home1Page> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.black,
//         title: Text(
//           'Comment',
//           style: TextStyle(color: Colors.white),
//         ),
//         actions: [
//           IconButton(
//               onPressed: () {
//                 _showBottomSheet(context);
//               },
//               icon: Icon(Icons.add)),
//         ],
//       ),
//          body: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: FutureBuilder(
//               future: GetPostService.getUser(),
//               builder: (context, snapshot) {
//                 if (snapshot.hasData) {
//                   return ListView.builder(
//                       itemCount: snapshot.data!.length,
//                       itemBuilder: (context, index) {
//                         return postItem(context, snapshot.data![index],
//                             () async {
//                           bool result = await GetPostService.deleteUser(
//                               snapshot.data![index].id);
//                           if (result != 'success') {
//                             Utils.snackBarSuccess(
//                                 'Delete successfunny', context);
//                           } else {
//                             Utils.snackBarError('Someting is wrong', context);
//                           }
//                         });
//                       });
//                 } else {
//                   return const Center(
//                     child: Text('No data'),
//                   );
//                 }
//               })),
//     );
//   }
// }






//  void _showBottomSheet(BuildContext context) {
//     showModalBottomSheet(
//         context: context,
//         isScrollControlled: true,
//         builder: (BuildContext context) {
//           return SingleChildScrollView(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.stretch,
//               children: <Widget>[
//                 const Text(
//                   'Add new post',
//                   textAlign : TextAlign.center,
//                   style: TextStyle(fontSize: 20.0),
//                 ),
//                 TextFormField(
//                   controller: userIdCtr,
//                   decoration: InputDecoration(labelText: 'User Id'),
//                 ),
//                 TextFormField(
//                   controller: titleCtr,
//                   decoration: InputDecoration(labelText: 'Title'),
//                 ),
//                 TextFormField(
//                   controller: bodyCtr,
//                   decoration: InputDecoration(labelText: 'Body'),
//                 ),
//                 ElevatedButton(
//                   onPressed: () async {
//                     if (userIdCtr.text.isNotEmpty &&
//                         titleCtr.text.isNotEmpty &&
//                         bodyCtr.text.isNotEmpty) {
//                       PostModel newPost = PostModel(
//                           userId: int.parse(userIdCtr.text),
//                           id: 1,
//                           title: titleCtr.text,
//                           body: bodyCtr.text);
//                       bool result = await GetPostService.createUser(newPost);
//                       if (result) {
//                         Utils.snackBarSuccess('Added successfully', context);
//                         Navigator.pop(context);
//                       } else {
//                         Utils.snackBarError('Someting is wrong', context);
//                       }
//                     } else {
//                       Utils.snackBarError('Please fill all fields', context);
//                     }
//                   },
//                   child: Text('Add'),
//                 ),
//                 const SizedBox(
//                   height: 350,
//                 )
//               ],
//             ),
//           );
//         });
//   }

