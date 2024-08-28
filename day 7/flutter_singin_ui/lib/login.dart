import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_singin_ui/forget_pass.dart';
import 'package:flutter_singin_ui/singup.dart';
import 'package:flutter_singin_ui/welcome_page.dart';
import 'package:flutter_singin_ui/widget/my_sizedbox.dart';
import 'package:google_fonts/google_fonts.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool obscureText = true;
  GlobalKey<FormState> formStateEmail = GlobalKey();
  GlobalKey<FormState> formStatepassword = GlobalKey();
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
                          "Sign in",
                          style: GoogleFonts.jomolhari(fontSize: 32),
                        ),
                        mySizedBox(width: 32),
                      ],
                    ),
                    mySizedBox(height: 80),
                    Form(
                      key: formStateEmail,
                      child: TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value!.isEmpty) return "Email is required";
                          final regExp = RegExp(
                              r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
                          if (!regExp.hasMatch(value)) return "Invalid email";
                          return null;
                        },
                        style: const TextStyle(fontSize: 20),
                        decoration: const InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 15, horizontal: 15),
                            border: OutlineInputBorder(),
                            labelText: "email",
                            hintText: "Mo.Hafiz@example.com"),
                      ),
                    ),
                    mySizedBox(height: 28),
                    Form(
                      key: formStatepassword,
                      child: TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) return "Password is required";
                          if (value.length < 8) {
                            return "Password should be at least 8 characters";
                          }
                          return null;
                        },
                        style: const TextStyle(fontSize: 20),
                        obscureText: obscureText,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 15),
                          border: const OutlineInputBorder(),
                          labelText: "password",
                          suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  obscureText = !obscureText;
                                });
                              },
                              icon: Icon(obscureText
                                  ? Icons.visibility
                                  : Icons.visibility_off)),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) {
                            return const ForgetPass();
                          }),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(left: 185, top: 10),
                        child: Text(
                          textAlign: TextAlign.right,
                          "forget password",
                          style: GoogleFonts.jomolhari(
                            fontWeight: FontWeight.w600,
                            color: const Color.fromARGB(195, 0, 0, 0),
                          ),
                        ),
                      ),
                    ),
                    mySizedBox(height: 20),
                    ElevatedButton(
                        onPressed: () {
                          if (formStateEmail.currentState!.validate() &&
                              formStatepassword.currentState!.validate()) {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return const WelcomePage();
                            }));
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromARGB(240, 0, 0, 0),
                          fixedSize: const Size(150, 50),
                        ),
                        child: Text(
                          "sing in",
                          style: GoogleFonts.jomolhari(
                              color: Colors.white, fontSize: 18),
                        )),
                    mySizedBox(height: 16),
                    RichText(
                        text: TextSpan(
                            text: "create account",
                            style: GoogleFonts.jomolhari(
                                fontSize: 16,
                                color: const Color.fromARGB(230, 0, 0, 0),
                                fontWeight: FontWeight.w400),
                            children: <TextSpan>[
                          TextSpan(
                              text: " sing up",
                              style: GoogleFonts.jomolhari(
                                  color: const Color.fromARGB(230, 0, 0, 0),
                                  fontWeight: FontWeight.w600),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) {
                                      return const Singup();
                                    }),
                                  );
                                })
                        ]))
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