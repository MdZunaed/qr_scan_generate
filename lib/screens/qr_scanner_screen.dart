import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:qr_scangen/screens/qr_generate_screen.dart';
import 'package:qr_scangen/screens/scan_result_screen.dart';

class QrScannerScreen extends StatefulWidget {
  const QrScannerScreen({super.key});

  @override
  State<QrScannerScreen> createState() => _QrScannerScreenState();
}

class _QrScannerScreenState extends State<QrScannerScreen> {
  bool isScanComplete = false;
  bool isFlashOn = false;
  String? code;
  MobileScannerController controller = MobileScannerController();
  void cancelScanner() {
    isScanComplete = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("QR ScanGen"),
        leading: IconButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (c) => const QrGenerateScreen()));
          },
          icon: const Icon(CupertinoIcons.add_circled),
        ),
        actions: [
          IconButton(
              onPressed: () {
                isFlashOn = !isFlashOn;
                controller.toggleTorch();
                setState(() {});
              },
              icon:
                  Icon(isFlashOn ? Icons.flash_on : Icons.flash_off, color: isFlashOn ? Colors.amber : null))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
              height: MediaQuery.sizeOf(context).height / 2,
              width: double.infinity,
              child: MobileScanner(
                controller: controller,
                onDetect: (barcode, args) {
                  //if (!isScanComplete) {
                  //String code = barcode.rawValue ?? '---';
                  code = barcode.rawValue ?? '---';
                  //isScanComplete = true;
                  //cancelScanner();
                  Navigator.push(context, MaterialPageRoute(builder: (c) => ScanResultScreen(code: code!)));
                  //cancelScanner();
                  //}
                },
              ),
            ),
            const SizedBox(height: 20),
            const Text("Place The QR Code Here"),
          ],
        ),
      ),
    );
  }
}
