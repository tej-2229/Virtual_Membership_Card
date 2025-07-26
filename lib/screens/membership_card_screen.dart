import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/qr_code_provider.dart';
import '../models/user_model.dart';
import '../widgets/membership_card_widget.dart';
import '../widgets/refresh_button_widget.dart';

class MembershipCardScreen extends ConsumerWidget {
  const MembershipCardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const UserModel sampleUser = UserModel(
      name: "Alex Ray",
      membershipLevel: "Platinum Member",
      profileImageUrl: "", 
    );

    final qrData = ref.watch(qrCodeProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Virtual Membership Card",
          style: TextStyle(fontWeight: FontWeight.w600, color: Colors.white),
        ),
        backgroundColor: const Color(0xFF6A1B9A),
        elevation: 0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            // Membership Card
            MembershipCardWidget(user: sampleUser, qrData: qrData),
            const SizedBox(height: 30),
            // Refresh Button
            RefreshButtonWidget(
              onPressed: () {
                ref.read(qrCodeProvider.notifier).refreshQRCode();

                // Show feedback
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: const Row(
                      children: [
                        Icon(Icons.check_circle, color: Colors.white),
                        SizedBox(width: 8),
                        Text("QR Code refreshed successfully!"),
                      ],
                    ),
                    backgroundColor: const Color(0xFF6A1B9A),
                    behavior: SnackBarBehavior.floating,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    duration: const Duration(seconds: 2),
                  ),
                );
              },
            ),
            const SizedBox(height: 30),
            // Info Card
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                children: [
                  const Icon(
                    Icons.info_outline,
                    color: Color(0xFF6A1B9A),
                    size: 24,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Present this QR code at partner locations for easy check-in and verification.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[600],
                      height: 1.4,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
