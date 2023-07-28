import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:nodeflutter/view/addproduct.dart';
import 'dart:convert';
import 'package:nodeflutter/view/productdetailpage.dart';
import '../controller/block/productblock.dart';
import '../model/productmodel.dart';

//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

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List<dynamic> products = [];

  final ProductBloc _productBloc = ProductBloc();

  @override
  void initState() {
    super.initState();
    _productBloc.fetchData();
  }

  @override
  void dispose() {
    _productBloc.dispose();
    super.dispose();
  }

  // Future<void> fetchData() async {
  //   final response = await http.get(Uri.parse('http://192.168.0.105:3000/products'));
  //   print('product...response..' + response.body.toString());
  //   print('rrrr' + response.statusCode.toString());
  //   if (response.statusCode == 200) {
  //     setState(() {
  //       products = json.decode(response.body);
  //     });
  //   } else {
  //     print('Failed to fetch data');
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    print('hello');
    return Scaffold(
      appBar: AppBar(
        // title: Center(child: Text('A_N_J_A_N_E_Y_A')),
        title: Center(child: Text('b_lock app')),
      ),
      body: Column(
        children: [
          TextButton(
            style: TextButton.styleFrom(
              foregroundColor: Colors.white,
              padding: const EdgeInsets.all(16.0),
              textStyle: const TextStyle(fontSize: 20),
            ),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => MyApp()));
            },
            child: const Text('Add',style: TextStyle(color: Colors.blue),),
          ),
          Expanded(
            child: StreamBuilder<List<Detectproductapiresp>>(
              stream: _productBloc.productStream,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final List<Detectproductapiresp> productList = snapshot.data!;

                  return ListView.builder(
                    itemCount: productList.length,
                    itemBuilder: (context, index) {
                      final product = productList[index];
                      final productId = product
                          .sId; // Assuming 'sId' is the field for product ID

                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  ProductDetailsPage(productId: productId!),
                            ),
                          );
                        },
                        child: ListTile(
                          leading: Image.network(product.image!),
                          title: Text(product.name!),
                          subtitle: Text('Quantity: ${product.quantity}'),
                          trailing: Text('Price: \$${product.price}'),
                        ),
                      );
                    },
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text('Error: ${snapshot.error}'),
                  );
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

// child: ListTile(
// leading: Image.network(product['image']),
// title: Text(product['name']),
// subtitle: Text('Quantity: ${product['quantity']}'),
// trailing: Text('Price: \$${product['price']}'),
// ),
