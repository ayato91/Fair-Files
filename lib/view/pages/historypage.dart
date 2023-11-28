import 'package:flutter/material.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return FittedBox(
        child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: ListView.builder(
        itemCount: 3,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(''),
          );
        },
      ),
    ));
  }
}
