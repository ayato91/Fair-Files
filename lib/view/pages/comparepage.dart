import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:sharefair/view_model/services/compare_service.dart';

class ComparePage extends StatefulWidget {
  const ComparePage({super.key});

  @override
  State<ComparePage> createState() => _ComparePageState();
}

TextEditingController idController = TextEditingController();

class _ComparePageState extends State<ComparePage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 30),
        Center(
          child: Container(
            height: kIsWeb ? 60 : MediaQuery.sizeOf(context).height * 0.06,
            width: kIsWeb ? 420 : MediaQuery.sizeOf(context).width * 0.75,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black45),
                borderRadius: BorderRadius.circular(25)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(width: kIsWeb ? 20 : 0),
                Icon(Icons.lock_outline_rounded),
                SizedBox(width: kIsWeb ? 20 : 10),
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
              controller: idController,
              onTapOutside: (event) => FocusScope.of(context).unfocus(),
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
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
                        onTap: idController.text.length != 6
                            ? () {
                                showAdaptiveDialog(
                                    context: context,
                                    builder: (context) => AlertDialog.adaptive(
                                          icon: Icon(Icons.warning_outlined,
                                              size: 50,
                                              color: Colors.deepPurpleAccent),
                                          backgroundColor: Color(0xFFDBECEE),
                                          content: Text(
                                              idController.text.isEmpty
                                                  ? 'Please Enter The ID'
                                                  : 'Please Enter Valid ID',
                                              style: TextStyle(fontSize: 30)),
                                        ));
                                ;
                              }
                            : () async {
                                FilePickerResult result2 =
                                    (await FilePicker.platform.pickFiles())!;
                                PlatformFile file2 = result2.files.first;
                                String message = await CompareResult()
                                    .getResult(file2, idController.text);
                                showAdaptiveDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog.adaptive(
                                        backgroundColor: message == '0'
                                            ? Colors.green.shade200
                                            : message == '1'
                                                ? Colors.red.shade200
                                                : Colors.yellow.shade200,
                                        title: Text(
                                          message == '2'
                                              ? 'Verification Error!!'
                                              : 'Verification Complete!',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        icon: Icon(
                                          message == '0'
                                              ? Icons.check
                                              : message == '1'
                                                  ? Icons.close
                                                  : Icons.warning_amber,
                                          color: message == '0'
                                              ? Colors.green
                                              : message == '1'
                                                  ? Colors.red
                                                  : Colors.amber,
                                          size: 50,
                                        ),
                                        content: Text(
                                          message == '0'
                                              ? 'Hashes Matched Successfully!\n'
                                                  'File Name: ${file2.name}\n'
                                                  'The File Received is Secure!!'
                                              : message == '1'
                                                  ? 'Hashes DO NOT Match!\n'
                                                      'File Name: ${file2.name}\n'
                                                      'Please Check the received file,'
                                                      ' it may have been tampered with!!'
                                                  : 'ID Not Found',
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
