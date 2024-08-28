import 'package:flutter/material.dart';
import 'package:flutter_singin_ui/login.dart';
import 'package:flutter_singin_ui/widget/my_sizedbox.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const Image(
          image: AssetImage("assets/back_ui.png"),
          width: double.infinity,
          height: double.infinity,
        ),
        Center(
          child: Container(
            width: 340,
            height: 510,
            decoration: BoxDecoration(
                color: const Color.fromARGB(255, 217, 223, 204),
                borderRadius: BorderRadius.circular(30),
                boxShadow: const [
                  BoxShadow(
                    color: Color.fromARGB(195, 0, 0, 0),
                    spreadRadius: 12,
                    blurRadius: 12,
                  ),
                ]),
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Scaffold(
                resizeToAvoidBottomInset: false,
                backgroundColor: Colors.transparent,
                body: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset("assets/logo_ui.png"),
                        Text(
                          "Welcome",
                          style: GoogleFonts.jomolhari(fontSize: 20),
                        ),
                        mySizedBox(width: 32),
                      ],
                    ),
                    mySizedBox(height: 50),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return const Login();
                          }));
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromARGB(230, 0, 0, 0),
                          fixedSize: const Size(200, 50),
                        ),
                        child: Text(
                          "Log out",
                          style: GoogleFonts.jomolhari(
                              color: Colors.white, fontSize: 18),
                        ))
                  ],
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}



//another way to add background image

// home: Scaffold(
//   appBar: AppBar(
//       title: Text('Set Background Image'),
//   ),
//   body: DecoratedBox(
//           decoration: BoxDecoration(
//             image: DecorationImage(
//                 image: AssetImage("images/img.png"), fit: BoxFit.cover),
//           ),
//           child: Center(
//               child: FlutterLogo(
//             size: 200,
//           )),
//         ),
// ),