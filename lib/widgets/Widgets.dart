import 'package:flutter/material.dart';

class Brands {
  final String name;
  final String logo;
  Brands({required this.name, required this.logo});
}

final List<Brands> brand = [
  Brands(name: 'Nile', logo: 'logo'),
  Brands(name: 'Addidas', logo: 'logo'),
  Brands(name: 'Puma', logo: 'logo'),
  Brands(name: 'Corolla', logo: 'logo'),
];

Widget BrandsList(BuildContext context, List<Brands> brand) {
  return ListView.builder(
    itemCount: brand.length,
    itemBuilder: (context, index) {
      return ListTile(
        leading: Image.asset(
          brand[index].logo,
          width: 50,
          height: 50,
        ),
        title: Text(brand[index].name),
        onTap: () {
          print("Selected brand: ${brand[index].name}");
        },
      );
    },
  );
}
