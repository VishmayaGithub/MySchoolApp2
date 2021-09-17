import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_school_app/helpers/colors.dart';
import '../calendar2.dart';

class EnterHomework extends StatefulWidget {
  const EnterHomework({Key? key}) : super(key: key);

  @override
  _EnterHomeworkState createState() => _EnterHomeworkState();
}

class _EnterHomeworkState extends State<EnterHomework> {

  @override


  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title : Text("Enter Homework",
        style: GoogleFonts.nunito(
        color: bg,
        fontSize: 26,
        fontWeight: FontWeight.w600,
        decoration: TextDecoration.underline,
      )
      ),
        backgroundColor: button,
      ),
        backgroundColor:bg,
        body: Container(
          child: status != "student"
              ? SafeArea(
                  child: Container(


                      child : Calendar()



                  ),
                )
              : Text("boo"),
        ));
  }
}

//children: [
//   //This code does not work right now
//   // Scaffold(
//   //drawer: Drawer(child: Text("hello")),
//   // ),
//
//   // Padding(
//   //   padding:
//   //       const EdgeInsets.only(top: 30.0, bottom: 12),
//   //   child: Text("Enter Homework",
//   //       style: GoogleFonts.poppins(
//   //         color: texting,
//   //         fontSize: 30,
//   //         fontWeight: FontWeight.w600,
//   //         decoration: TextDecoration.underline,
//   //       )),
//   // ),
//   Padding(
//     padding: const EdgeInsets.only(
//         top: 30.0, right: 8, left: 8),
//     child: DropdownButton<String>(
//       focusColor: Colors.white,
//       value: value,
//       //elevation: 5,
//       style: TextStyle(color: pink),
//       iconEnabledColor: Colors.black,
//       items: <String>[
//         "Select Grade",
//         "6th Grade",
//         "7th Grade",
//         "8th Grade"
//       ].map<DropdownMenuItem<String>>((String value) {
//         return DropdownMenuItem<String>(
//           value: value,
//           child: Text(value,
//               style: GoogleFonts.poppins(
//                 color: texting,
//                 fontSize: 20,
//                 //fontWeight: FontWeight.bold,
//                 //decoration: TextDecoration.underline,
//               )),
//         );
//       }).toList(),
//       hint: Text(
//         "Please choose a language",
//         style: TextStyle(
//             color: Colors.black,
//             fontSize: 14,
//             fontWeight: FontWeight.w500),
//       ),
//       onChanged: (text) {
//         setState(() {
//           value = text!;
//           grade = text;
//         });
//       },
//     ),
//   ),
//   Padding(
//     padding:
//         const EdgeInsets.only(top: 30.0, bottom: 15),
//     child: DropdownButton<String>(
//       focusColor: Colors.white,
//       value: value2,
//       //elevation: 5,
//       style: TextStyle(color: pink),
//       iconEnabledColor: Colors.black,
//       items: <String>[
//         "Select Subject",
//         "Mathematics",
//         "Biology",
//         "Literature",
//         "Physics",
//         "Chemistry"
//       ].map<DropdownMenuItem<String>>((String value) {
//         return DropdownMenuItem<String>(
//           value: value,
//           child: Text(value,
//               style: GoogleFonts.poppins(
//                 color: texting,
//                 fontSize: 20,
//                 //fontWeight: FontWeight.bold,
//                 //decoration: TextDecoration.underline,
//               )),
//         );
//       }).toList(),
//       hint: Text(
//         "Please choose a language",
//         style: TextStyle(
//             color: Colors.black,
//             fontSize: 14,
//             fontWeight: FontWeight.w500),
//       ),
//       onChanged: (text) {
//         setState(() {
//           value2 = text!;
//           grade = text;
//         });
//       },
//     ),
//   ),
//   Padding(
//     padding: const EdgeInsets.only(
//         right: 30.0, left: 30, top: 12),
//     child: TextFormField(
//       onChanged: (test) {
//         homework = test;
//       },
//       decoration: InputDecoration(
//           hintText: "Enter homework",
//           fillColor: bg,
//           hintStyle: TextStyle(color: texting),
//           enabledBorder: UnderlineInputBorder(
//               borderSide: new BorderSide(color: texting))
//       ),
//     ),
//   ),
//   Padding(
//     padding: const EdgeInsets.only(
//         right: 30.0, left: 30, top: 12),
//     child: TextFormField(
//       onChanged: (test) {
//         deadline = test;
//       },
//       decoration: InputDecoration(
//           hintText: "Enter Deadline",
//           hintStyle: TextStyle(color: texting),
//           fillColor: bg,
//           enabledBorder: UnderlineInputBorder(
//               borderSide: new BorderSide(color: texting))
//       ),
//
//     ),
//   ),
//
//   Padding(
//     padding: const EdgeInsets.only(
//         right: 30.0, left: 30, top: 12),
//     child: GestureDetector(
//         onTap: () {
//           if (homework != "") {
//             final snackBar = SnackBar(
//                 content: Text('Sent Homework!!'));
//
//             ScaffoldMessenger.of(context)
//                 .showSnackBar(snackBar);
//           }
//
//           //call firebase function here
//         },
//         child: Padding(
//           padding: const EdgeInsets.only(
//               top: 8.0, bottom: 20),
//           child: Container(
//             padding: EdgeInsets.all(13),
//             width: 200,
//             decoration: BoxDecoration(
//                 color: button,
//                 borderRadius: BorderRadius.circular(35),
//                 border: Border.all(
//                   color: texting,
//                 )),
//             child: Text(
//               "Finish",
//               style: GoogleFonts.nunito(
//                   color: texting,
//                   fontSize: 18,
//                   fontWeight: FontWeight.w500),
//               textAlign: TextAlign.center,
//             ),
//           ),
//         )),
//   )
// ],
