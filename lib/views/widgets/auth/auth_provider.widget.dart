import 'package:flutter/material.dart';
import 'package:kweshtion_basic/viewmodels/auth.viewmodel.dart';
import 'package:provider/provider.dart';

class AuthProviderWidget extends StatelessWidget {
  const AuthProviderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AuthViewModel authViewModel = Provider.of<AuthViewModel>(context);
    return Column(
      children: [
        Text("Welcome",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        Text("Get started with", style: TextStyle(fontSize: 16)),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {},
              // Oveflow hidden
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 0, vertical: 15),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32)),
              ),
              child: Image.asset(
                'assets/logo/google.png',
                width: 30,
                height: 30,
              ),
            ),
            const SizedBox(width: 60),
            ElevatedButton(
              onPressed: () {},
              // Oveflow hidden
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 0, vertical: 15),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32)),
              ),
              child: Image.asset(
                'assets/logo/apple.png',
                width: 30,
                height: 30,
              ),
            ),
          ],
        ),

        // Or line
        const SizedBox(height: 20),
        Row(
          children: [
            Expanded(
              child: Container(
                height: 1,
                color: Colors.grey.shade300,
              ),
            ),
            const SizedBox(width: 10),
            Text("Or", style: TextStyle(color: Colors.grey.shade400)),
            const SizedBox(width: 10),
            Expanded(
              child: Container(
                height: 1,
                color: Colors.grey.shade300,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
