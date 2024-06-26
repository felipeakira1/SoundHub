import 'package:flutter/material.dart';

class HomePageAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title = "SoundHub";

  HomePageAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: const TextStyle(color: Colors.white)
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class ReturnAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title = "SoundHub";

  const ReturnAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Expanded(
        child: Row(
          children: [
            IconButton(
              padding: const EdgeInsets.only(left: 8.0),
              onPressed: () => Navigator.of(context).pop(), 
              icon: const Icon(Icons.arrow_back, color: Colors.white,))
          ],
        ),
      ),
      title: Text(
        title,
        style: const TextStyle(color: Colors.white)
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}