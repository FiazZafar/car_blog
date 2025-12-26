import 'package:car_blog/widgets/app_colors.dart';
import 'package:flutter/material.dart';

class MobileMenu extends StatelessWidget {
  final bool show;
  final VoidCallback onHome;
  final VoidCallback onBlog;
  final VoidCallback onAbout;
  final VoidCallback onContact;

  const MobileMenu({
    super.key,
    required this.show,
    required this.onHome,
    required this.onBlog,
    required this.onAbout,
    required this.onContact,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // duration: Duration(seconds: 1),
      color: AppColors.darkBlue,
      height: show ? 200 : 0,
      child: show
          ? Column(
              children: [
                _item('Home', onHome),
                _item('Blog', onBlog),
                _item('About', onAbout),
                _item('Contact', onContact),
              ],
            )
          : const SizedBox.shrink(),
    );
  }

  Widget _item(String text, VoidCallback onTap) {
    return ListTile(
      title: Text(text, style: const TextStyle(color: Colors.white)),
      onTap: onTap,
    );
  }
}
