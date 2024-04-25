import 'dart:ffi';

import 'package:crypto_view/features/home/presentation/widgets/chart_price_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Crypto Wallet'),
        actions: [
          IconButton(
            onPressed: () {

            },
            icon: const Icon(Icons.logout),
          )
        ],
      ),
      body:    const Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [

                Text('Bienvenido:', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                SizedBox(width: 10),
                Text('ing.rodriguez.selvi@gmail.com')
              ],
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Text('Saldo:', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                SizedBox(width: 10),
                Text('\$ 0.00')
              ],
            ),
            SizedBox(height: 20),
            Text('Mercado', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            MoneyDetails(
              title: 'Bitcoin',
              value: 0.00
            ),
            SizedBox(height: 10),
            MoneyDetails(
              title: 'Ethereum',
              value: 0.00
            ),
            SizedBox(height: 10),
            MoneyDetails(
              title: 'Litecoin',
              value: 0.00
            ),
            SizedBox(height: 10),
            MoneyDetails(
              title: 'Ripple',
              value: 0.00
            ),
          ],
        ),
      ),
    );
  }
}

class MoneyDetails extends StatelessWidget {
  final String title;
  final double value;
  const MoneyDetails({
    super.key, required this.title, required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(80),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ], 
      ),
      child:  Row(
        children:[
          Image.network('https://cdn.pixabay.com/photo/2021/04/30/16/47/btc-logo-6219386_1280.png'),
          const SizedBox(width: 10),
           Text(title, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          const SizedBox(width: 10),
           Text('\$$value', style: const TextStyle(fontSize: 20)),
        ]
      ),
    );
  }
}
