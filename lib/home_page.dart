import 'package:car_blog/about_us_section.dart';
import 'package:car_blog/blog_section.dart';
import 'package:car_blog/category_section.dart';
import 'package:car_blog/footer_section.dart';
import 'package:car_blog/hero_section.dart';
import 'package:car_blog/items_section.dart';
import 'package:car_blog/mobile_menu.dart';
import 'package:car_blog/top_bar.dart';
import 'package:car_blog/widgets/textview.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isSubscribed = false;
  bool _showMobileMenu = false;

  late ScrollController _controller;
  late final GlobalKey _homeKey;
  late final GlobalKey _blogKey;
  late final GlobalKey _footerKey;
  late final GlobalKey _itemSecionKey;
  late final GlobalKey _aboutKey;
  late final GlobalKey _categoryKey;

  @override
  void initState() {
    _controller = ScrollController();
    _homeKey = GlobalKey();
    _blogKey = GlobalKey();
    _footerKey = GlobalKey();
    _itemSecionKey = GlobalKey();
    _aboutKey = GlobalKey();
    _categoryKey = GlobalKey();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void toggleMenu() {
    setState(() {
      _showMobileMenu = !_showMobileMenu;
    });
  }

  void scrollTo(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: Duration(milliseconds: 300),
        curve: Curves.bounceOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.heightOf(context),
        child: Column(
          children: [
            NavsBar(
              onHome: () => scrollTo(_homeKey),
              onAbout: () => scrollTo(_aboutKey),
              onContact: () => scrollTo(_footerKey),
              onBlog: () => scrollTo(_blogKey),
              onMenuToggle: () => toggleMenu(),
              showMenu: _showMobileMenu,
            ),
            MobileMenu(
              show: _showMobileMenu,
              onHome: () {
                toggleMenu();
                scrollTo(_homeKey);
              },
              onBlog: () {
                toggleMenu();
                scrollTo(_blogKey);
              },
              onAbout: () {
                toggleMenu();
                scrollTo(_aboutKey);
              },
              onContact: () {
                toggleMenu();
                scrollTo(_footerKey);
              },
            ),

            Expanded(
              child: SingleChildScrollView(
                controller: _controller,

                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    HeroSection(key: _homeKey),
                    BlogSection(key: _blogKey),
                    ItemsSection(key: _itemSecionKey),
                    CategorySection(key: _categoryKey),
                    AboutUs(key: _aboutKey),
                    ItemsSection(),
                    FooterSection(
                      key: _footerKey,
                      onHome: () => scrollTo(_homeKey),
                      onAbout: () => scrollTo(_aboutKey),
                      onContact: () => scrollTo(_footerKey),
                      onBlog: () => scrollTo(_blogKey),
                      onMenuToggle: () => toggleMenu(),
                      showMenu: _showMobileMenu,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
