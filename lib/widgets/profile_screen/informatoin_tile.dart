import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class InformationTile extends StatelessWidget {
  const InformationTile({
    Key? key,
    required this.title,
    required this.leading,
    required this.onTap,
  }) : super(key: key);

  final String title;
  final String leading;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text(
        leading,
        style: const TextStyle(fontSize: 19.5, fontWeight: FontWeight.w500),
      ),
      title: Text(
        title,
        textAlign: TextAlign.end,
        style: const TextStyle(
            fontSize: 19.5,
            fontWeight: FontWeight.w500,
            color: Color(0xFFC95A2B)),
      ),
      trailing: const FaIcon(
        Icons.arrow_forward_ios,
        size: 15,
      ),
      onTap: () {
        onTap();
      },
    );
  }
}
