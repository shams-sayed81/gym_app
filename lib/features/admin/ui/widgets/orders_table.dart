import 'package:flutter/material.dart';

class OrdersTable extends StatelessWidget {
  const OrdersTable({super.key});

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
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Orders',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
          const SizedBox(height: 16),

          Expanded(
            child: ListView(
              children: const [
                OrderRow(
                  orderId: '#1024',
                  status: 'Completed',
                  customer: 'Alex Miller',
                  total: '\$120.00',
                ),
                OrderRow(
                  orderId: '#1025',
                  status: 'Pending',
                  customer: 'John Smith',
                  total: '\$75.50',
                ),
                OrderRow(
                  orderId: '#1026',
                  status: 'Canceled',
                  customer: 'Emily Blunt',
                  total: '\$40.00',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class OrderRow extends StatelessWidget {
  final String orderId;
  final String status;
  final String customer;
  final String total;

  const OrderRow({
    super.key,
    required this.orderId,
    required this.status,
    required this.customer,
    required this.total,
  });

  Color get statusColor {
    switch (status) {
      case 'Completed':
        return Colors.green;
      case 'Pending':
        return Colors.orange;
      default:
        return Colors.red;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Expanded(
            child: Text(orderId, style: const TextStyle(color: Colors.white)),
          ),
          Expanded(
            child: Chip(
              label: Text(status),
              backgroundColor: statusColor.withOpacity(.2),
              labelStyle: TextStyle(color: statusColor),
            ),
          ),
          Expanded(
            child:
            Text(customer, style: const TextStyle(color: Colors.white)),
          ),
          Expanded(
            child: Text(total, style: const TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }
}