import 'package:flutter/material.dart';

import '../main.dart';
import '../models/user.dart';
import '../styles/app_styles.dart';
import '../widgets/user_avatar.dart';
import 'home_page.dart';
import 'profile_screen.dart';
import 'template_page.dart';

/// Pantalla principal
class HomeScreen extends StatefulWidget {
  static const String title = FitnessTimeApp.title;

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static const int _initialPageIndex = 0;

  final User user = templateUser;

  /// Controlador per canviar de pàgina amb [PageView] i [BottomNavigationBar]
  final PageController _pageController =
      PageController(initialPage: _initialPageIndex, keepPage: true);

  /// Vista actual
  int _currentPageIndex = _initialPageIndex;

  void _changeView(int pageIndex) {
    setState(() {
      _currentPageIndex = pageIndex;
    });
  }

  void _navigateToProfile(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProfileScreen(user: user),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(HomeScreen.title),
        centerTitle: true,
        actions: [
          // Icona del perfil
          IconButton(
            tooltip: ProfileScreen.title,
            icon: UserAvatar(imageUrl: user.imageUrl),
            onPressed: () => _navigateToProfile(context),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: PageView(
          controller: _pageController,
          onPageChanged: _changeView,
          children: [
            HomePage(user: user),
            const TemplatePage(icon: Icons.search),
            const TemplatePage(icon: Icons.shopping_cart),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            label: 'Inici',
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            label: 'Cercar',
            icon: Icon(Icons.search),
          ),
          BottomNavigationBarItem(
            label: 'Botiga',
            icon: Icon(Icons.shopping_cart),
          ),
        ],
        selectedItemColor: AppStyles.color.darkAccent,
        currentIndex: _currentPageIndex,
        onTap: (int pageIndex) {
          // Canvia a la vista seleccionada
          _pageController.animateToPage(
            pageIndex,
            duration: const Duration(milliseconds: 250),
            curve: Curves.ease,
          );
          _changeView(pageIndex);
        },
      ),
      // Menú lateral
      drawer: Drawer(
        child: Column(
          children: [
            SizedBox(
              width: double.infinity, // expandeix en amplada
              child: DrawerHeader(
                decoration: BoxDecoration(color: AppStyles.color.primary),
                child: Text(
                  FitnessTimeApp.title,
                  style: AppStyles.text.big.copyWith(
                    color: AppStyles.color.white,
                  ),
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.person_2),
              title: const Text(ProfileScreen.title),
              onTap: () {
                // Tanca el menú
                Navigator.of(context).pop();
                // Canvia a la pantalla de perfil
                _navigateToProfile(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
