import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:nodeflutter/view/productdetailpage.dart';
//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

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List<dynamic> products = [];

  Future<void> fetchData() async {
    final response =
        await http.get(Uri.parse('http://192.168.0.105:3000/products'));
    print('product...response..' + response.body.toString());
    print('rrrr' + response.statusCode.toString());
    if (response.statusCode == 200) {
      setState(() {
        products = json.decode(response.body);
      });
    } else {
      print('Failed to fetch data');
    }
  }

  @override
  void initState() {
    print('init print');
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    print('hello');
    return Scaffold(
        appBar: AppBar(
          title: Text('Product List'),
        ),
        body: ListView.builder(
          itemCount: products.length,
          itemBuilder: (BuildContext context, int index) {
            final product = products[index];
            final productId = product['_id'];
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        ProductDetailsPage(productId: productId),
                  ),
                );
              },
              child: ListTile(
                leading: Image.network(product['image']),
                title: Text(product['name']),
                subtitle: Text('Quantity: ${product['quantity']}'),
                trailing: Text('Price: \$${product['price']}'),
              ),
            );
          },
        ));
  }
}
