import 'package:flutter/material.dart';
import 'package:souq_mazad/features/home/data/models/product_model.dart';

class ProductImage extends StatelessWidget {
  const ProductImage({super.key, required this.products});
  final Products products;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: 400,
          width: double.infinity,
          child: Image.network(
            products.thumbnail ?? '',
            fit: BoxFit.fill,
          ),
        ),
        Positioned(
          child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.black,
              )),
        )
      ],
    );
  }
}

