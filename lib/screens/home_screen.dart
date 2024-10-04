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

  /// Pàgines de la pantalla principal
  static const _pages = <PageScreen>[
    PageScreen.inici,
    PageScreen.cercar,
    PageScreen.botiga,
  ];

  /// Persona per defecte
  final User _user = templateUser;

  /// Controlador per canviar de pàgina amb [PageView] i [BottomNavigationBar]
  final PageController _pageController =
      PageController(initialPage: _initialPageIndex, keepPage: true);

  /// Pàgina actual
  int _currentPageIndex = _initialPageIndex;

  void _onDrawerSelect(
    BuildContext context,
    void Function(BuildContext)? navigate,
  ) {
    // Tanca el menú
    Navigator.of(context).pop();
    // Navega a la pantalla seleccionada
    navigate?.call(context);
  }

  void _navigateToProfile(BuildContext context) {
    // Canvia a la pantalla del perfil
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProfileScreen(user: _user),
      ),
    );
  }

  void _navigateToPage(int pageIndex) {
    // Canvia a la pàgina seleccionada
    _pageController.animateToPage(
      pageIndex,
      duration: const Duration(milliseconds: 250),
      curve: Curves.ease,
    );
    _pageChanged(pageIndex);
  }

  void _pageChanged(int pageIndex) {
    setState(() {
      _currentPageIndex = pageIndex;
    });
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
            icon: UserAvatar(imageUrl: _user.imageUrl),
            onPressed: () => _navigateToProfile(context),
          )
        ],
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: _pageChanged,
        children: [
          // Pàgina principal (Inici)
          HomePage(user: _user),
          // Altres pàgines (Cercar, Botiga)
          ..._pages.sublist(1).map((page) => TemplatePage(icon: page.icon)),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          for (PageScreen page in _pages)
            BottomNavigationBarItem(
              icon: Icon(page.icon),
              label: page.label,
            ),
        ],
        currentIndex: _currentPageIndex,
        onTap: _navigateToPage,
      ),
      // Menú lateral
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
              ),
              child: Text(
                FitnessTimeApp.title,
                style: AppStyles.text.big.copyWith(
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.person_2),
              title: const Text(ProfileScreen.title),
              onTap: () {
                // Canvia a la pantalla de perfil
                _onDrawerSelect(context, _navigateToProfile);
              },
            ),
            for (var (int pageIndex, PageScreen page) in _pages.indexed)
              ListTile(
                leading: Icon(page.icon),
                title: Text(page.label),
                selected: pageIndex == _currentPageIndex,
                onTap: () {
                  // Canvia a la pàgina corresponent
                  _onDrawerSelect(context, (_) => _navigateToPage(pageIndex));
                },
              ),
          ],
        ),
      ),
    );
  }
}

/// Pàgina per al PageView
final class PageScreen {
  static const inici = PageScreen(label: 'Inici', icon: Icons.home);
  static const cercar = PageScreen(label: 'Cercar', icon: Icons.search);
  static const botiga = PageScreen(label: 'Botiga', icon: Icons.shopping_cart);

  final String label;

  final IconData icon;

  const PageScreen({required this.label, required this.icon});
}
