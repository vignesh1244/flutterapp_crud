import '../../../model/productmodel.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
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

///////
// Future<Detectproductapiresp> fetchData() async {
//   final response = await http.get(Uri.parse('http://192.168.0.105:3000/products'));
//   print('hello world..' + response.body.toString());
//   print('rrrr' + response.statusCode.toString());
//
//   if (response.statusCode == 200) {
//     // Parse the JSON string into a Map
//     final Map<String, dynamic> responseData = json.decode(response.body);
//
//     // Now, use the fromJson method to convert the Map into your desired object
//     return Detectproductapiresp.fromJson(responseData);
//   } else {
//     throw Exception('Failed to fetch data');
//   }
// }
