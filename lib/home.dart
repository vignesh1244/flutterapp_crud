import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
//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


class MyWidget extends StatefulWidget {
  @override
  _MyWidgetState createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  List<dynamic> products = [];

  Future<void> fetchData() async {

    print('hello how are you');
    final response = await http.get(Uri.parse('http://192.168.0.105:3000/product'));
    print('rrrr'+response.statusCode.toString());
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
      body:/* Text('hhhh'),*/ListView.builder(
        itemCount: products.length,
        itemBuilder: (BuildContext context, int index) {
          final product = products[index];
          return ListTile(
            leading: Image.network(product['image']),
            title: Text(product['name']),
            subtitle: Text('Quantity: ${product['quantity']}'),
            trailing: Text('Price: \$${product['price']}'),
          );
        },
      ),
    );
  }
}
