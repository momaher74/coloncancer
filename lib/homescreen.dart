import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

String? fileName;

File? file;

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var myWidth = MediaQuery.of(context).size.width;
    var myHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: const [
                Image(
                  width: double.infinity,
                  height: 400,
                  fit: BoxFit.cover,
                  image: AssetImage('assets/images/ftxt.png'),
                )
              ],
            ),
            Stack(
              children: [
                const Image(
                  width: double.infinity,
                  height: 700,
                  image: AssetImage(
                    "assets/images/sec.png",
                  ),
                  fit: BoxFit.cover,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 120,
                    ),
                    Center(
                      child: Container(
                        decoration: BoxDecoration(
                            color: HexColor('#1B3851'),
                            borderRadius: BorderRadius.circular(15)),
                        width: 812,
                        height: 370,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 50,
                            ),
                            const Text(
                              'Please verify your identity',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 28),
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            const Text(
                              'Select relevant documents to complete your kyc',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15),
                            ),
                            const SizedBox(
                              height: 50,
                            ),
                            Container(
                              height: 75,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              width: 600,
                              child: Center(
                                child: DottedBorder(
                                  padding: const EdgeInsets.all(25),
                                  borderType: BorderType.RRect,
                                  // radius: Radius.circular(50),
                                  color: Colors.white,
                                  strokeWidth: 2,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      const Icon(
                                        Icons.cloud_upload_rounded,
                                        color: Colors.white,
                                        size: 30,
                                      ),
                                      const SizedBox(
                                        width: 40,
                                      ),
                                      if (file != null && fileName!.length > 20)
                                        Text(
                                          ' ' +
                                              fileName!
                                                  .substring(0, 20)
                                                  .toString() +
                                              '..',
                                          style: const TextStyle(
                                              fontSize: 20,
                                              // fontWeight: FontWeight.bold,
                                              overflow: TextOverflow.ellipsis,
                                              color: Colors.white),
                                          maxLines: 1,
                                        ),
                                      if (file != null &&
                                          fileName!.length <= 20)
                                        Text(
                                          '  ' + fileName.toString(),
                                          style: const TextStyle(
                                              fontSize: 18,
                                              // fontWeight: FontWeight.bold,
                                              overflow: TextOverflow.ellipsis,
                                              color: Colors.white),
                                          maxLines: 1,
                                        ),
                                      if (file == null)
                                        const Text(
                                          'select a CSV file  ',
                                          style: TextStyle(
                                            fontSize: 18,
                                            color: Colors.white,
                                          ),
                                        ),
                                      const Spacer(),
                                      SizedBox(
                                        height: 70,
                                        child: ElevatedButton(
                                          style: ButtonStyle(
                                              backgroundColor:
                                                  MaterialStateProperty.all(
                                                      HexColor('#018CA3'))),
                                          onPressed: () async {
                                            FilePickerResult? result =
                                                await FilePicker.platform
                                                    .pickFiles(
                                              type: FileType.custom,
                                              allowedExtensions: ['csv'],
                                            );

                                            if (result != null) {
                                              file = File(
                                                result.files.single.path!,
                                              );
                                            } else {}
                                            setState(() {
                                              fileName =
                                                  result?.files.single.name;
                                            });
                                          },
                                          child: const Text('Select'),
                                        ),
                                      ), // if (file != null)
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            file = null;
                                          });
                                        },
                                        child: Container(
                                          width: 50,
                                          height: 50,
                                          decoration: const BoxDecoration(
                                              color: Colors.red,
                                              shape: BoxShape.circle),
                                          child: const Center(
                                            child: Icon(
                                              Icons.close,
                                              color: Colors.white,
                                              size: 20,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: 200,
                                  height: 50,
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(60)),
                                    child: ElevatedButton(
                                      style: ButtonStyle(
                                        elevation:
                                            MaterialStateProperty.all(50),
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                HexColor('#018CA3')),
                                      ),
                                      onPressed: () {},
                                      child: const Text('upload'),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 80,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 240,
                          height: 57,
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(60)),
                            child: ElevatedButton(
                              style: ButtonStyle(
                                elevation: MaterialStateProperty.all(50),
                                backgroundColor: MaterialStateProperty.all(
                                    HexColor('#1B3851')),
                              ),
                              onPressed: () {},
                              child: const Text(
                                'Get Results',
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
// Container(
//   margin: const EdgeInsets.symmetric(horizontal: 50),
//   decoration: BoxDecoration(
//     color: Colors.deepPurple,
//     borderRadius: BorderRadius.circular(25),
//   ),
//   child: Padding(
//     padding: const EdgeInsets.symmetric(horizontal: 25),
//     child: Row(
//       mainAxisAlignment: MainAxisAlignment.start,
//       children: [
//         const Text(
//           'to convert file as a CSV file',
//           style: TextStyle(fontSize: 20, color: Colors.white),
//         ),
//         const Spacer(),
//         TextButton(
//           onPressed: () {
//             launchUrl(Uri.parse(
//                 'https://www.zamzar.com/convert/xls-to-csv/'));
//           },
//           child: const Text(
//             'click here',
//             style: TextStyle(fontSize: 20),
//           ),
//         ),
//       ],
//     ),
//   ),
// ),

///////////////////////
// Container(
//   padding: const EdgeInsets.all(20),
//   decoration: BoxDecoration(
//       borderRadius: BorderRadius.circular(22),
//       boxShadow: [
//         BoxShadow(
//           color: Colors.black.withOpacity(0.7),
//           spreadRadius: 12,
//           blurRadius: 8,
//           offset: Offset(0, 5), // changes position of shadow
//         ),
//       ],
//       color: Colors.cyanAccent.withOpacity(.3)),
//   child: const Text(
//     "Colon cancer detection",
//     style: TextStyle(
//       fontSize: 35,
//       color: Colors.white,
//       fontWeight: FontWeight.bold,
//       letterSpacing: 3,
//       wordSpacing: 2,
//
//     ),
//   ),
// ),

// appBar: AppBar(
//   backgroundColor: Colors.black.withOpacity(.9),
//   elevation: 20,
//   title: const Text(
//     'Colon Cancer Detection',
//     style: TextStyle(
//       fontSize: 35,
//       color: Colors.white,
//       fontWeight: FontWeight.bold,
//       letterSpacing: 3,
//       wordSpacing: 2,
//     ),
//   ),
//   centerTitle: true,
// ),

// RichText(
// text: const TextSpan(
// //style: DefaultTextStyle.of(context).style,
// children: <TextSpan>[
// TextSpan(
// text: 'C',
// style: TextStyle(
// fontWeight: FontWeight.bold,
// color: Colors.cyanAccent,
// fontSize: 60,
// letterSpacing: 5),
// ),
// TextSpan(
// text: 'o',
// style: TextStyle(
// fontWeight: FontWeight.bold,
// color: Colors.white,
// fontSize: 60,
// letterSpacing: 5),
// ),
// TextSpan(
// text: 'l',
// style: TextStyle(
// fontWeight: FontWeight.bold,
// color: Colors.cyanAccent,
// fontSize: 60,
// letterSpacing: 5)),
// TextSpan(
// text: 'o',
// style: TextStyle(
// fontWeight: FontWeight.bold,
// color: Colors.white,
// fontSize: 60,
// letterSpacing: 5)),
// TextSpan(
// text: 'n',
// style: TextStyle(
// fontWeight: FontWeight.bold,
// color: Colors.cyanAccent,
// fontSize: 60,
// letterSpacing: 5)),
// ],
// ),
// ),
