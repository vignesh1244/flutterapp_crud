import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
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
        title: Center(child: Text('A_N_J_A_N_E_Y_A')),
      ),
      body: /*ListView.builder(
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
      ),*/

      // StreamBuilder<List<Detectproductapiresp>>(
      //   stream: _productBloc.productStream,
      //   builder: (context, snapshot) {
      //     if (snapshot.hasData) {
      //       final List<Detectproductapiresp> products = snapshot.data!;
      //       return ListView.builder(
      //         itemCount: products.length,
      //         itemBuilder: (BuildContext context, int index) {
      //           final product = products[index];
      //           final productId = product.sId;
      //
      //           return GestureDetector(
      //             onTap: () {
      //               Navigator.push(
      //                 context,
      //                 MaterialPageRoute(
      //                   builder: (context) =>
      //                       ProductDetailsPage(productId: productId.toString()),
      //                 ),
      //               );
      //             },
      //             child: ListTile(
      //               leading: Image.network(product.image.toString()),
      //               title: Text(product.name.toString()),
      //               subtitle: Text('Quantity: ${product.quantity}'),
      //               trailing: Text('Price: \$${product.price}'),
      //             ),
      //           );
      //         },
      //       );
      //     } else if (snapshot.hasError) {
      //       return Center(
      //         child: Text('Error: ${snapshot.error}'),
      //       );
      //     } else {
      //       return Center(
      //         child: CircularProgressIndicator(),
      //       );
      //     }
      //   },
      // ),

      // StreamBuilder<Detectproductapiresp>(
      //   stream: _productBloc.productStream,
      //   builder: (context, snapshot) {
      //     if (snapshot.hasData) {
      //       final productApiResponse = snapshot.data;
      //       return Center(
      //         child: Text('Product Name: ${productApiResponse!.name}'),
      //       );
      //     } else if (snapshot.hasError) {
      //       return Center(
      //         child: Text('Error: ${snapshot.error}'),
      //       );
      //     } else {
      //       return const Center(
      //         child: CircularProgressIndicator(),
      //       );
      //     }
      //   },
      // ),
      StreamBuilder<Detectproductapiresp>(
        stream: _productBloc.productStream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final Detectproductapiresp product = snapshot.data!;
            final productId = product.sId; // Assuming 'sId' is the field for product ID

            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductDetailsPage(productId: productId!),
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
      )
    );

  }
}
