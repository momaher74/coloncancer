import 'dart:io';

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
      appBar: AppBar(
        backgroundColor: Colors.black.withOpacity(.9),
        elevation: 20,
        title: const Text(
          'Colon Cancer Detection',
          style: TextStyle(
            fontSize: 35,
            color: Colors.white,
            fontWeight: FontWeight.bold,
            letterSpacing: 3,
            wordSpacing: 2,
          ),
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Image(
            width: myWidth,
            height: myHeight,
            image: const AssetImage(
              "assets/images/g.jpg",
            ),
            fit: BoxFit.cover,
          ),
          SafeArea(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 30,
                  ),
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
                  SizedBox(
                    height: (myHeight / 3) - 90,
                  ),
                  Center(
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.black.withOpacity(.65),
                          borderRadius: BorderRadius.circular(15)),
                      width: 550,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 30,
                          ),
                          RichText(
                            text: const TextSpan(
                              //style: DefaultTextStyle.of(context).style,
                              children: <TextSpan>[
                                TextSpan(
                                  text: 'C',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.cyanAccent,
                                      fontSize: 60,
                                      letterSpacing: 5),
                                ),
                                TextSpan(
                                  text: 'o',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontSize: 60,
                                      letterSpacing: 5),
                                ),
                                TextSpan(
                                    text: 'l',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.cyanAccent,
                                        fontSize: 60,
                                        letterSpacing: 5)),
                                TextSpan(
                                    text: 'o',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        fontSize: 60,
                                        letterSpacing: 5)),
                                TextSpan(
                                    text: 'n',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.cyanAccent,
                                        fontSize: 60,
                                        letterSpacing: 5)),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Container(
                            height: 50,
                            width: 450,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                    width: 1.5, color: Colors.white70)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const SizedBox(
                                  width: 22,
                                ),
                                if (file != null)
                                  const Icon(
                                    Icons.file_copy_sharp,
                                    color: Colors.deepPurple,
                                  ),
                                if (file != null && fileName!.length > 20)
                                  Text(
                                    ' ' +
                                        fileName!.substring(0, 20).toString() +
                                        '..',
                                    style: const TextStyle(
                                        fontSize: 20,
                                        // fontWeight: FontWeight.bold,
                                        overflow: TextOverflow.ellipsis,
                                        color: Colors.white),
                                    maxLines: 1,
                                  ),
                                if (file != null && fileName!.length <= 20)
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
                                    'select your file  ',
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.white,
                                    ),
                                  ),
                                const Spacer(),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 5),
                                  child: SizedBox(
                                    height: 60,
                                    child: IconButton(
                                      onPressed: () async {
                                        FilePickerResult? result =
                                            await FilePicker.platform.pickFiles(
                                          type: FileType.custom,
                                          allowedExtensions: ['csv'],
                                        );

                                        if (result != null) {
                                          file = File(
                                            result.files.single.path!,
                                          );
                                        } else {}
                                        setState(() {
                                          fileName = result?.files.single.name;
                                        });
                                      },
                                      icon: const Icon(
                                        Icons.upload_rounded,
                                        color: Colors.cyanAccent,
                                        size: 25,
                                      ),
                                    ),
                                  ),
                                ),
                                if (file != null)
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 0),
                                    child: SizedBox(
                                      height: 60,
                                      child: IconButton(
                                        onPressed: () async {
                                          setState(() {
                                            file = null;
                                          });
                                        },
                                        icon: const Icon(
                                          Icons.close,
                                          color: Colors.white,
                                          size: 25,
                                        ),
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 22,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 200,
                                height: 50,
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(60)),
                                  child: ElevatedButton(
                                    style: ButtonStyle(
                                      elevation: MaterialStateProperty.all(50),
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              HexColor('#018CA3')),
                                    ),
                                    onPressed: () {},
                                    child: const Text('result'),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 30,
                          ),
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
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
