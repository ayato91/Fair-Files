// ignore_for_file: dead_code

import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';

class ComparePage extends StatefulWidget {
  const ComparePage({super.key});

  @override
  State<ComparePage> createState() => _ComparePageState();
}

class _ComparePageState extends State<ComparePage> {
  @override
  Widget build(BuildContext context) {
    bool isSecure = true;
    return Column(
      children: [
        SizedBox(height: 30),
        Center(
          child: Container(
            height: MediaQuery.sizeOf(context).height * 0.06,
            width: MediaQuery.sizeOf(context).width * 0.75,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black45),
                borderRadius: BorderRadius.circular(25)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(Icons.lock_outline_rounded),
                RichText(
                    text: TextSpan(
                        text: 'We Care About ',
                        style: TextStyle(color: Colors.black, fontSize: 20),
                        children: [
                      TextSpan(
                          text: 'File Integrity',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20))
                    ]))
              ],
            ),
          ),
        ),
        SizedBox(height: 40),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Check Files ',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
            ),
            ShaderMask(
                shaderCallback: (bounds) => LinearGradient(colors: [
                      Colors.blue.shade800,
                      Colors.deepPurple,
                    ]).createShader(bounds),
                child: Text(
                  'Integrity',
                  style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                )),
          ],
        ),
        SizedBox(height: 25),
        ShaderMask(
          shaderCallback: (bounds) => LinearGradient(colors: [
            Colors.blue.shade800,
            Colors.deepPurple.shade800,
          ]).createShader(bounds),
          child: Text('Enter the Generated ID :',
              style: TextStyle(
                  color: Colors.white,
                  leadingDistribution: null,
                  fontSize: 26,
                  fontWeight: FontWeight.bold)),
        ),
        Container(
          margin: EdgeInsets.only(top: 7),
          padding: EdgeInsets.symmetric(horizontal: 35),
          height: 55,
          child: TextFormField(
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderSide: BorderSide(width: 2),
                      borderRadius: BorderRadius.circular(10)))),
        ),
        SizedBox(height: 22),
        Stack(
          alignment: Alignment.center,
          children: [
            DottedBorder(
                dashPattern: [12, 12],
                color: Color(0xB299B5C8),
                borderType: BorderType.Circle,
                child: SizedBox(width: 340, height: 340)),
            DottedBorder(
                dashPattern: [12, 12],
                color: Color(0xCF7BA7C5),
                borderType: BorderType.Circle,
                child: SizedBox(width: 310, height: 310)),
            DottedBorder(
              dashPattern: [12, 12],
              padding: EdgeInsets.all(0.5),
              color: Color(0xFF729BB6),
              borderType: BorderType.Circle,
              child: Container(
                  height: 280,
                  width: 280,
                  decoration: BoxDecoration(
                    color: Color(0xFFDBECEE),
                    shape: BoxShape.circle,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Select File\n  To Verify',
                          style: TextStyle(
                              fontSize: 28, fontWeight: FontWeight.w500)),
                      SizedBox(height: 40),
                      GestureDetector(
                        onTap: () async {
                          FilePickerResult? result =
                              await FilePicker.platform.pickFiles();
                          if (result == null) return;
                          final file = result.files.first;
                          showAdaptiveDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog.adaptive(
                                  backgroundColor: Colors.red.shade200,
                                  title: Text(
                                    'Verification Complete!',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  icon: Icon(
                                    isSecure ? Icons.check : Icons.close,
                                    size: 50,
                                    color: isSecure ? Colors.green : Colors.red,
                                  ),
                                  content: Text(
                                    isSecure
                                        ? 'Hashes Matched Successfully!\n'
                                            'File Name: ${file.name}\n'
                                            'The File Received is Secure!!'
                                        : 'Hashes DO NOT Match!\n'
                                            'File Name: ${file.name}\n'
                                            'Please Check the received file, it may have been tampered with!!',
                                    style: TextStyle(fontSize: 22),
                                  ),
                                );
                              });
                        },
                        child: Container(
                            height: 50,
                            width: 150,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                gradient: LinearGradient(colors: [
                                  Colors.blue.shade800,
                                  Colors.deepPurple,
                                ])),
                            child: Center(
                              child: Text('Select File',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 24,
                                      fontWeight: FontWeight.w500)),
                            )),
                      )
                    ],
                  )),
            ),
          ],
        ),
      ],
    );
  }
}
