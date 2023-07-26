import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:rxdart/rxdart.dart';

import '../../model/productmodel.dart';
import '../../../model/productmodel.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../widget/error_message.dart';

 class ProductBloc {
  final _productController = StreamController<Detectproductapiresp>.broadcast();
  Stream<Detectproductapiresp> get productStream => _productController.stream;

  // final _activityIndicatorStreamController =
  //     BehaviorSubject<bool>.seeded(false);
  // Stream<bool> get activityIndicatorStream =>
  //     _activityIndicatorStreamController.stream;
  // Function(bool)? get _setActivityIndicatorStream =>
  //     _activityIndicatorStreamController.isClosed
  //         ? null
  //         : _activityIndicatorStreamController.sink.add;
  //
  // final _profileDeleteStreamController =
  //     BehaviorSubject<Detectproductapiresp>.seeded(
  //         Detectproductapiresp.fromJson({}));
  // Stream<Detectproductapiresp> get profileDeleteStream =>
  //     _profileDeleteStreamController.stream;
  // Function(Detectproductapiresp)? get setProfileDeleteStreamStream =>
  //     _profileDeleteStreamController.isClosed
  //         ? null
  //         : _profileDeleteStreamController.sink.add;

  // Future<void> deleteProfile(BuildContext context) async {
  //   try {
  //     _setActivityIndicatorStream!(true);
  //     final result =
  //         await RestApiClientService.shared.deleteProfile(customerId);
  //     if (!result.status!) throw GeneralException(message: result.message!);
  //     setProfileDeleteStreamStream!(result!);
  //     _setActivityIndicatorStream!(false);
  //     // FlutterToastWidget.show(
  //     //     message: result.message.toString(), context: context);
  //   } catch (error) {
  //     _setActivityIndicatorStream!(false);
  //     ErrorAlertSimpleDialog.show(message: error.toString(), context: context);
  //   }
  // }


  //
  //
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

  // void fetchData() async {
  //   try {
  //     final response = await http.get(Uri.parse('http://192.168.0.105:3000/products'));
  //     if (response.statusCode == 200) {
  //       final Map<String, dynamic> responseData = json.decode(response.body);
  //       final productApiResponse = Detectproductapiresp.fromJson(responseData);
  //       _productController.sink.add(productApiResponse);
  //     } else {
  //       throw Exception('Failed to fetch data');
  //     }
  //   } catch (e) {
  //     debugPrint('Error fetching data: $e');
  //     _productController.sink.addError(e);
  //   }
  // }
  //
  // void dispose() {
  //   _productController.close();
  // }


  void fetchData() async {
    try {
      final response = await http.get(Uri.parse('http://192.168.0.105:3000/products'));
      if (response.statusCode == 200) {
        final List<dynamic> responseData = json.decode(response.body);
        for (final productData in responseData) {
          final product = Detectproductapiresp.fromJson(productData);
          _productController.sink.add(product);
        }
      } else {
        throw Exception('Failed to fetch data');
      }
    } catch (e) {
      debugPrint('Error fetching data: $e');
      _productController.sink.addError(e);
    }
  }

  void dispose() {
    _productController.close();
  }
}
