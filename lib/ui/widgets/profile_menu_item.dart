import 'package:bank/shared/theme.dart';
import 'package:flutter/material.dart';

class ProfileMenuItem extends StatelessWidget {
  final String iconUrl;
  final String title;
  final VoidCallback? onTap;

  const ProfileMenuItem({
    Key? key,
    required this.iconUrl,
    required this.title,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(
          bottom: 30,
        ),
        child: Row(
          children: [
            Image.asset(iconUrl, width: 24),
            const SizedBox(width: 18),
            Text(
              title,
              style: whiteTextStyle.copyWith(
                fontWeight: medium,
              ),
            )
          ],
        ),
      ),
    );
  }
}
