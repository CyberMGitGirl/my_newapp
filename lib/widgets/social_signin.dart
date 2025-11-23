import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_newapp/pages/provider/user_notifier.dart';
import 'package:provider/provider.dart';

class SocialSignIn extends StatelessWidget {
  const SocialSignIn({super.key});

   @override
  Widget build(BuildContext context) {
    var userP = Provider.of<UserNotifier>(context);
    return Column(
      children: [
        Row(
          spacing: 8,
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(child: Divider()),
            Text("Sign in with"),
            Expanded(child: Divider()),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 16,
          children: [
            // Google (multicolored mail icon)
            InkWell(
              onTap: () {},
              borderRadius: BorderRadius.circular(50),
              child: Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey.withValues(alpha: 0.1), //updated from withOpacity Color.withOpacity() is not truly deprecated, but some Flutter SDK versions (especially the latest ones) show a lint warning suggesting Color.withValues() instead — not because withOpacity() is broken, but because Flutter’s color API is being modernized to handle wider color spaces and HDR.
                ),
                child: const FaIcon(
                  FontAwesomeIcons.google,
                  color: Colors.redAccent,
                  size: 28,
                ),
              ),
            ),

            // Facebook icon
            InkWell(
              onTap: () {},
              borderRadius: BorderRadius.circular(50),
              child: Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey.withValues(alpha: 0.1), 
                ),
                child: FaIcon(
                  FontAwesomeIcons.facebookF,
                  color: Colors.blue[800],
                  size: 28,
                ),
              ),
            ),

            // LinkedIn icon
            InkWell(
              onTap: () {},
              borderRadius: BorderRadius.circular(50),
              child: Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey.withValues(alpha: 0.1), 
                ),
                child: FaIcon(
                  FontAwesomeIcons.linkedinIn,
                  color: Colors.blue[700],
                  size: 28,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}