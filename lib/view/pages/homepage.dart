import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:sharefair/view_model/services/upload_and_id_services.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

String ID = '';
List selectedFiles = [];
List<String> fetchedID = [];

class _HomePageState extends State<HomePage> {
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
        SizedBox(height: 35),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Any ', style: TextStyle(fontSize: 22)),
            Text('unwanted ',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            Text('modification can\'t be', style: TextStyle(fontSize: 22))
          ],
        ),
        SizedBox(height: 7),
        ShaderMask(
          shaderCallback: (bounds) => LinearGradient(colors: [
            Colors.blue.shade800,
            Colors.deepPurple.shade800,
          ]).createShader(bounds),
          child: Text('UNSEEN',
              style: TextStyle(
                  color: Colors.white,
                  leadingDistribution: null,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 18)),
        ),
        SizedBox(height: 30),
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
                    Text('Select File\n To  Check',
                        style: TextStyle(
                            fontSize: 28, fontWeight: FontWeight.w500)),
                    SizedBox(height: 40),
                    GestureDetector(
                      onTap: () async {
                        FilePickerResult result1 =
                            (await FilePicker.platform.pickFiles())!;
                        PlatformFile file1 = result1.files.first;
                        ID = await UploadAndGetId().getId(file1);
                        showAdaptiveDialog(
                            context: context,
                            builder: (context) {
                              selectedFiles.add(file1.name);
                              fetchedID.add(ID);
                              return AlertDialog.adaptive(
                                title: Text('Selected File'),
                                content: Text(
                                  'File Selected Successfully!\n'
                                  'File Name: ${file1.name}\n'
                                  'Generated ID : ${ID}',
                                  // 'Size : ${(file.size / 1024).toStringAsFixed(2)} KB\n'
                                  // 'Extension: \'${file.extension}\'\n\n'
                                  // 'Path: \'.${file.path}\'',
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
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
