import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ScanResultScreen extends StatelessWidget {
  final String code;
  const ScanResultScreen({super.key, required this.code});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Scan Result"),
        // leading: IconButton(
        //   onPressed: () {
        //     Navigator.pop(context);
        //     closeScreen();
        //   },
        //   icon: const Icon(Icons.arrow_back),
        // ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text("Scan Result", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
            const SizedBox(height: 30),
            Text(code),
            const SizedBox(height: 50),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Clipboard.setData(ClipboardData(text: code));
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 50).copyWith(top: 10),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                      content: const Text("Text Copied"),
                    ),
                  );
                },
                child: const Text("Copy Result"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
