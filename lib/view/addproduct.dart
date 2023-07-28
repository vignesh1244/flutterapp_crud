import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _quantityController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();

  Future<void> _postProduct() async {
    final String name = _nameController.text.toString();
    final int quantity = int.parse(_quantityController.text);
    final double price = double.parse(_priceController.text);
    final String image =
        "https://images.pexels.com/photos/17466121/pexels-photo-17466121/free-photo-of-transformative-makeup-for-the-bold-and-beautiful.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1";

    final String apiUrl = "http://192.168.0.105:3000/product";

    final Map<String, dynamic> requestBody = {
      "name": name,
      "quantity": quantity,
      "price": price,
      "image": image,
    };

    try {
      final http.Response response = await http.post(
        Uri.parse(apiUrl),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(requestBody),
      );

      if (response.statusCode == 200) {
        print("Product posted successfully!");
        print(response.body);
        // You can add additional actions here after the successful POST request.
      } else {
        print("Failed to post product. Error: ${response.statusCode}");
        // You can handle error scenarios here.
      }
    } catch (error) {
      print("Error while posting product: $error");
      // You can handle any errors that occur during the POST request.
    }
  }

/*  final String postUrl = 'http://localhost:3000/product';
  Future<void> postProduct() async {
    try {
      // Data to be posted
      Map<String, dynamic> productData = {
        "name": "Sample Product",
        "price": 10.99,
        // Add other product data as needed
      };

      // Convert the productData to JSON
      String jsonData = jsonEncode(productData);

      // Make the POST request
      final response = await http.post(
        Uri.parse(postUrl),
        headers: {"Content-Type": "application/json"},
        body: jsonData,
      );

      // Check if the request was successful (status code 200)
      if (response.statusCode == 200) {
        print("Product posted successfully!");
      } else {
        print("Error while posting product. Status code: ${response.statusCode}");
        print("Response: ${response.body}");
      }
    } catch (e) {
      // Handle any exceptions or connection errors
      print("Error: $e");
    }
  }*/
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Post API Example"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: "Product Name"),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _quantityController,
              decoration: InputDecoration(labelText: "Quantity"),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 10),
            TextField(
              controller: _priceController,
              decoration: InputDecoration(labelText: "Price"),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _postProduct,
              child: Text("Post Product"),
            ),
            // TextButton(
            //   onPressed: () {
            //     _postProduct();
            //     print("111......" + _nameController.text.toString());
            //     print("111......" + _quantityController.text.toString());
            //     print("111......" + _priceController.text.toString());
            //   },
            //   child: Text("Post Product"),
            // ),
          ],
        ),
      ),
    );
  }
}
