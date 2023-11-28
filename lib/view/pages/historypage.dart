import 'package:flutter/material.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: ListView.builder(
        itemCount: 3,
        itemBuilder: (context, index) {
          return ListTile(
            subtitle:
                Text((MediaQuery.sizeOf(context).width * 0.75).toString()),
            title: Text(MediaQuery.sizeOf(context).height.toString()),
          );
        },
      ),
    ));
  }
}
