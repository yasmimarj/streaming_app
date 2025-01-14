import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomePage extends StatelessWidget {
  final User? user;

  const HomePage({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (user != null) ...[
              Text(
                'Welcome, ${user!.displayName ?? "User"}!',
                style: const TextStyle(fontSize: 24),
              ),
              const SizedBox(height: 16),
              CircleAvatar(
                radius: 50,
                backgroundImage: user!.photoURL != null
                    ? NetworkImage(user!.photoURL!)
                    : null,
                child: user!.photoURL == null
                    ? const Icon(Icons.person, size: 50)
                    : null,
              ),
            ] else
              const Text(
                'No user logged in.',
                style: TextStyle(fontSize: 18),
              ),
          ],
        ),
      ),
    );
  }
}
