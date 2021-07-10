import 'package:falcon106/core/models/product.dart';
import 'package:flutter/material.dart';

class CartItemCard extends StatelessWidget {
  const CartItemCard(this.product, this.quantity);

  final Product product;
  final int quantity;

  List<Widget> _getProductDetails(BuildContext context) {
    return [
      Text(product.name,
          maxLines: 2, style: Theme.of(context).textTheme.subtitle),
      Text('\$${product.price.toString()}.00',
          style: Theme.of(context).textTheme.title),
      Text('\Qty: ${quantity.toString()}',
          style: Theme.of(context).textTheme.subtitle)
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      // margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 6.0),
      child: Row(
        children: [
          SizedBox(
            width: 88,
            child: AspectRatio(
              aspectRatio: 0.88,
              child: Container(
                padding: EdgeInsets.all((10)),
                decoration: BoxDecoration(
                  color: Color(0xFFF5F6F9),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Image.network(
                  product.imageUrl,
                  height: 125.0,
                  width: 135.0,
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
          ),
          SizedBox(width: 20),
          Expanded(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name,
                  style: TextStyle(color: Colors.black, fontSize: 16),
                  maxLines: 3,
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  "\$${product.price}",
                  style: TextStyle(
                      fontWeight: FontWeight.w600, color: Color(0xFF757575)),
                  maxLines: 3,
                ),
                SizedBox(
                  height: 8,
                ),
                Text("Qty: $quantity",
                    style: Theme.of(context).textTheme.bodyText1),
              ],
            ),
          )
        ],
      ),
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   return Card(
  //     elevation: 4.0,
  //     margin: new EdgeInsets.symmetric(horizontal: 20.0, vertical: 6.0),
  //     child: Container(
  //       height: 150.0,
  //       decoration: BoxDecoration(color: Colors.white),
  //       child: ListTile(
  //         title: Row(
  //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //           children: <Widget>[
  //             Expanded(
  //               flex: 1,
  //               child: Padding(
  //                 padding: const EdgeInsets.only(left: 8.0),
  //                 child: Column(
  //                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //                   crossAxisAlignment: CrossAxisAlignment.start,
  //                   children: _getProductDetails(context),
  //                 ),
  //               ),
  //             ),
  //             VerticalDivider(),
  //             ProductImage(product.imageUrl),
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }
}
