import 'package:flutter/material.dart';

class ProductsTable extends StatelessWidget {
  const ProductsTable({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF111A2E),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          /// Header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Inventory',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.add, size: 16),
                label: const Text('Add Product'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),

          /// Table
          Expanded(
            child: ListView(
              children: const [
                ProductRow(
                  name: 'Whey Protein Isolate',
                  stock: '45 units',
                  price: '\$49.99',
                ),
                ProductRow(
                  name: 'Pre-Workout Ignite',
                  stock: '20 units',
                  price: '\$34.5',
                ),
                ProductRow(
                  name: 'Gym Shark T-Shirt',
                  stock: '50 units',
                  price: '\$25',
                ),
                ProductRow(
                  name: 'Lifting Straps',
                  stock: '15 units',
                  price: '\$15.99',
                ),
                ProductRow(
                  name: 'Creatine Monohydrate',
                  stock: '30 units',
                  price: '\$29.99',
                ),
                ProductRow(
                  name: 'Shaker Bottle',
                  stock: '100 units',
                  price: '\$9.99',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ProductRow extends StatelessWidget {
  final String name;
  final String stock;
  final String price;

  const ProductRow({
    super.key,
    required this.name,
    required this.stock,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Text(name, style: const TextStyle(color: Colors.white)),
          ),
          Expanded(
            child: Chip(label: Text(stock)),
          ),
          Expanded(
            child: Text(price, style: const TextStyle(color: Colors.white)),
          ),
          const Icon(Icons.edit, color: Colors.grey),
        ],
      ),
    );
  }
}