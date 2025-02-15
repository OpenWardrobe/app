import 'package:flutter/material.dart';
import 'package:openwardrobe/brick/models/brand.model.dart';

class BrandComponent extends StatelessWidget {
  final Brand brand;

  const BrandComponent({super.key, required this.brand});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Text(
        brand.name,
        style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
    );
  }
}
