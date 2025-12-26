import 'package:car_blog/widgets/app_colors.dart';
import 'package:car_blog/widgets/textview.dart';
import 'package:flutter/material.dart';

class NavsBar extends StatefulWidget {
  final VoidCallback onHome;
  final VoidCallback onBlog;
  final VoidCallback onAbout;
  final VoidCallback onContact;
  final VoidCallback onMenuToggle;
  final bool showMenu;

  const NavsBar({
    super.key,
    required this.onHome,
    required this.onBlog,
    required this.onAbout,
    required this.onContact,
    required this.onMenuToggle,
    required this.showMenu,
  });

  @override
  State<NavsBar> createState() => _NavsBarState();
}

class _NavsBarState extends State<NavsBar> {
  bool isSubscribed = false;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.widthOf(context);
    final bool isMobile = width < 768;
    final bool isTablet = width >= 768 && width < 1200;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      decoration: BoxDecoration(color: AppColors.darkBlue),
      child: Row(
        children: [
          InkWell(
            onTap: widget.onHome,
            child: Container(
              height: 40,
              width: 70,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                image: DecorationImage(
                  image: NetworkImage(
                    'https://plus.unsplash.com/premium_photo-1734105446651-19e95360e796?q=80&w=812&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),

          SizedBox(width: 10),
          Textview(
            text: 'CarsBlog',
            color: AppColors.whiteColor,
            isBold: true,
            size: 16,
          ),
          Spacer(),

          isMobile
              ? IconButton(
                  icon: Icon(
                    widget.showMenu ? Icons.close : Icons.menu,
                    color: AppColors.whiteColor,
                  ),
                  onPressed: widget.onMenuToggle,
                )
              : Row(
                  children: [
                    TextButton(
                      onPressed: widget.onHome,
                      child: Textview(
                        text: 'Home',
                        color: AppColors.whiteColor,
                        isBold: true,
                        size: 16,
                      ),
                    ),
                    TextButton(
                      onPressed: widget.onBlog,
                      child: Textview(
                        text: 'Blog',
                        color: AppColors.whiteColor,
                        isBold: false,
                        size: 14,
                      ),
                    ),
                    TextButton(
                      onPressed: widget.onAbout,
                      child: Textview(
                        text: 'About',
                        color: AppColors.whiteColor,
                        isBold: false,
                        size: 14,
                      ),
                    ),
                    TextButton(
                      onPressed: widget.onContact,
                      child: Textview(
                        text: 'Contact Us',
                        color: AppColors.whiteColor,
                        isBold: false,
                        size: 14,
                      ),
                    ),
                    SizedBox(width: 20),
                    InkWell(
                      onTap: () => setState(() {
                        isSubscribed = !isSubscribed;
                      }),
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          color: isSubscribed
                              ? AppColors.redColor
                              : AppColors.whiteColor,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Center(
                          child: Textview(
                            text: isSubscribed ? "Subscribed" : "Subscribe",
                            color: isSubscribed
                                ? AppColors.whiteColor
                                : AppColors.blackColor,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
        ],
      ),
    );
  }

  Widget _mobileTab(String text, VoidCallback onTap) {
    return ListTile(
      title: Text(text, style: const TextStyle(fontSize: 16)),
      onTap: onTap,
    );
  }
}
