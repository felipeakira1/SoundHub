import 'package:flutter/material.dart';
import '../screens/login_screen.dart';

class HomePageAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title = "SoundHub";

  HomePageAppBar({super.key});

  final Widget leading = Builder(
    builder: (BuildContext context) {
      return IconButton(
        icon: const Icon(Icons.menu, color: Colors.white),
        onPressed: () { Scaffold.of(context).openDrawer(); },
        tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
      );
    }
  );

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: leading,
      title: Text(
        title,
        style: const TextStyle(color: Colors.white)
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const LoginPage()),
            );
            
          },
          child: const Text(
            'Login',
            style: TextStyle(color: Colors.white)
          ),
        )
      ],
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