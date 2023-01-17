import 'package:bank/shared/theme.dart';
import 'package:bank/ui/widgets/buttons.dart';
import 'package:bank/ui/widgets/forms.dart';
import 'package:flutter/material.dart';

class ProfileEditPage extends StatelessWidget {
  const ProfileEditPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profile'),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        children: [
          const SizedBox(height: 100),
          Container(
            padding: const EdgeInsets.all(22),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: warnaGrey,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomFormField(title: 'Username'),
                const SizedBox(height: 16),
                const CustomFormField(title: 'Fullname'),
                const SizedBox(height: 16),
                const CustomFormField(title: 'Email Address'),
                const SizedBox(height: 16),
                const CustomFormField(title: 'Password', obscureText: true),
                const SizedBox(height: 30),
                CustomFilledButton(
                  title: 'Update',
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(
                        context, '/profile-edit-success', (route) => false);
                  },
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
