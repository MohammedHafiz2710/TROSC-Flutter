import 'package:flutter/material.dart';
    
class Test extends StatelessWidget {

  const Test({ Key? key }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            print("Menu clicked");
          },
          icon: Icon(Icons.menu),
        ),
        shadowColor: Colors.black,
        elevation: 10,
        title: Center(
          child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              text: "Fantasy",
              style: TextStyle(fontSize: 24, color: Colors.white),
              children: <TextSpan>[
                TextSpan(
                  text: " PL",
                  style: TextStyle(
                    fontSize: 26,
                    color: const Color.fromARGB(255, 28, 2, 70),
                  ),
                ),
              ],
            ),
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 32, 169, 75),
      ),
      body: Container(
        color: Colors.white,
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Center(
              child: Image(
                image: AssetImage("assets/images-removebg-preview.png"),
                height: 250,
                width: 350,
              ),
            ),
            SizedBox(height: 20), // Spacing between the image and text fields
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter Text',
              ),
            ),
            SizedBox(height: 20),
            TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter Form Text',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
