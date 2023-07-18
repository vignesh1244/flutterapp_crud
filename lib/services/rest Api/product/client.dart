// import '../../../model/productmodel.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
//
// Future<Detectproductapiresp> deleteProfile(String customerId) async {
//   try {
//     final response = await dio
//         .post("api/v1/customer/delete-account", data: {"id": customerId});
//     return Detectproductapiresp.fromJson(response.data);
//   } catch (error) {
//     return Future.error(getException(error));
//   }
// }
//
// // class RestApiClientCartService extends RestApiCartService {
//
// Future<Detectproductapiresp> fetchData() async {
//   final response =
//       await http.get(Uri.parse('http://192.168.0.105:3000/products'));
//   print('product...response..' + response.body.toString());
//   print('rrrr' + response.statusCode.toString());
//   return Detectproductapiresp.fromJson(response.body);
//   // if (response.statusCode == 200) {
//   //   setState(() {
//   //     products = json.decode(response.body);
//   //   });
//   // } else {
//   //   print('Failed to fetch data');
//   // }
// }
