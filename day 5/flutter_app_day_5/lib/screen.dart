import 'package:flutter/material.dart';

class Screen extends StatelessWidget {
  const Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 60, 31, 66),
        shadowColor: Colors.black,
        elevation: 8,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.menu,
            color: Colors.white,
          ),
        ),
        title: const Center(
          child: Text(
            "Log in",
            style: TextStyle(color: Colors.white, fontSize: 26),
          ),
        ),
      ),
      body: Column(
        children: [
          const Center(
            child: Image(
              image: AssetImage(
                "assets/computer-icons-user-profile-password-login-png-favpng-a5KCGVCAsuair5v9BArYfpjLK-removebg.png",
              ),
              width: 150,
              height: 150,
            ),
          ),
          const SizedBox(height: 28),
          SizedBox(
            width: 300,
            child: TextFormField(
              decoration: InputDecoration(
                label: const Text("User Name"),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              style: const TextStyle(fontSize: 24),
            ),
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: 300,
            child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                  label: const Text("Password"),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                style: const TextStyle(fontSize: 24)),
          ),
        ],
      ),
    );
  }
}
