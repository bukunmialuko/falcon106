import 'package:falcon106/core/models/product.dart';
import 'package:flutter/material.dart';

class CartItemCard extends StatelessWidget {
  const CartItemCard(this.product, this.quantity);

  final Product product;
  final int quantity;

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
}
