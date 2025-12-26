import 'package:car_blog/widgets/asset_path.dart';
import 'package:car_blog/widgets/textview.dart';
import 'package:flutter/material.dart';

class ArticalSection extends StatelessWidget {
  const ArticalSection({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.widthOf(context);
    final bool isMobile = width < 768;
    final bool isTablet = width >= 768 && width < 1200;
    return Container(
      padding: EdgeInsets.symmetric(vertical: 24, horizontal: isMobile ? 16 : 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Textview(
            text:
                'Classic Revival: Revisiting Iconic Cars Through Modern Reviews',
            size: isMobile ? 22 : 48,
            isBold: true,
          ),
          SizedBox(height: 10),
          Row(
            children: [
              CircleAvatar(backgroundImage: AssetImage(AssetPath.heroImg)),
              SizedBox(width: 20),
              Textview(text: 'Dasteen', size: isMobile ? 16 : 18, isBold: true),
              SizedBox(width: 20),
              Textview(text: 'Jan 10, 2024 ∙ 3 min read', size: isMobile ? 16 : 18),
            ],
          ),
          SizedBox(height: 10),

          Textview(
            text:
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod.',
            isBold: true,
            size: isMobile ? 18 : 24,
          ),
          SizedBox(height: 5),

          Textview(
            size: isMobile ? 16 : 18,
            text:
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Non blandit massa enim nec. Scelerisque viverra mauris in aliquam sem. At risus viverra adipiscing at in tellus. Sociis natoque penatibus et magnis dis parturient montes. Ridiculus mus mauris vitae ultricies leo. Neque egestas congue quisque egestas diam. Risus in hendrerit gravida rutrum quisque non.\n\nLorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Non blandit massa enim nec. Scelerisque viverra mauris in aliquam sem. At risus viverra adipiscing at in tellus. Sociis natoque penatibus et magnis dis parturient montes. Ridiculus mus mauris vitae ultricies leo. Neque egestas congue quisque egestas diam. Risus in hendrerit gravida rutrum quisque non.',
          ),
        ],
      ),
    );
  }
}
