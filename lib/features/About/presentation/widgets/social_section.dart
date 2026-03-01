import 'package:flutter/material.dart';
import '../../../../generated/l10n.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SocialSection extends StatelessWidget {
  const SocialSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerRight,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 15),
            child: Text(
              S.of(context).contactUs,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                fontFamily: 'Cairo',
              ),
            ),
          ),
        ),
        Center(
          child: Container(
            width: 230,
            height: 58,
            decoration: BoxDecoration(
              color: const Color(0xffF9F9F9),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.grey.withOpacity(0.1)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildIconButton(FontAwesomeIcons.facebook),
                _buildIconButton(FontAwesomeIcons.twitter),
                _buildIconButton(FontAwesomeIcons.instagram),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildIconButton(IconData icon) {
    return IconButton(
      icon: Icon(icon, color: const Color(0xff27AE60), size: 24),
      onPressed: () {},
    );
  }
}
