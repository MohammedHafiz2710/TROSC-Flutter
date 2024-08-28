import 'package:flutter/material.dart';
import 'package:flutter_singin_ui/login.dart';
import 'package:flutter_singin_ui/widget/my_sizedbox.dart';
import 'package:google_fonts/google_fonts.dart';

class Singup extends StatefulWidget {
  const Singup({super.key});

  @override
  State<Singup> createState() => _LoginState();
}

class _LoginState extends State<Singup> {
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
                          "Sign up",
                          style: GoogleFonts.jomolhari(fontSize: 32),
                        ),
                        mySizedBox(width: 32),
                      ],
                    ),
                    mySizedBox(height: 40),
                    TextFormField(
                      style: const TextStyle(fontSize: 20),
                      decoration: const InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                        border: OutlineInputBorder(),
                        labelText: "user name",
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: Form(
                        key: formStateEmail,
                        child: TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) return "Email is required";
                            final regExp = RegExp(
                                r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
                            if (!regExp.hasMatch(value)) {
                              return "Invalid email";
                            }
                            return null;
                          },
                          style: const TextStyle(fontSize: 20),
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "email",
                          ),
                        ),
                      ),
                    ),
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
                    Padding(
                      padding: const EdgeInsets.only(left: 180, top: 8),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) {
                              return const Login();
                            }),
                          );
                        },
                        child: Text(
                          "have Account?",
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
                              formStatepassword.currentState!.validate()) {}
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromARGB(230, 0, 0, 0),
                          fixedSize: const Size(150, 50),
                        ),
                        child: Text(
                          "sing up",
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