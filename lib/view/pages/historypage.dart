import 'package:flutter/material.dart';
import 'package:fair_files/view/pages/homepage.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return fetchedID.isNotEmpty
        ? Container(
            child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: ListView.builder(
              itemCount: fetchedID.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text('File Name -> ${selectedFiles[index]}',
                      style: TextStyle(fontSize: 18)),
                  subtitle: Text('Generated ID -> ${fetchedID[index]}',
                      style: TextStyle(fontSize: 20, color: Colors.black)),
                  onTap: () {},
                );
              },
            ),
          ))
        : Container(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ShaderMask(
                  shaderCallback: (bounds) => LinearGradient(
                          transform: GradientRotation(0.9),
                          colors: [Colors.blue, Colors.deepPurple.shade300])
                      .createShader(bounds),
                  child: Icon(Icons.delete_forever_outlined,
                      size: 100, color: Colors.white),
                ),
                SizedBox(height: 40),
                Text('Nothing Here to Show', style: TextStyle(fontSize: 26)),
              ],
            ),
          );
  }
}
