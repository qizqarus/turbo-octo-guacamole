import 'package:flutter/material.dart';

class ProfileItem extends StatelessWidget {
  final String title;
  final IconData? leadingIcon;
  final Widget Function() destinationPageBuilder;

  const ProfileItem({
    super.key,
    required this.title,
    required this.destinationPageBuilder,
    this.leadingIcon,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading:
          leadingIcon != null ? Icon(leadingIcon, color: Colors.black) : null,
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 16,
          color: Colors.black,
          fontWeight: FontWeight.w400,
        ),
      ),
      trailing: Icon(Icons.chevron_right, color: Colors.grey[400]),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => destinationPageBuilder()),
        );
      },
    );
  }
}
