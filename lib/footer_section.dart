// ignore_for_file: deprecated_member_use

import 'package:car_blog/top_bar.dart';
import 'package:car_blog/widgets/app_colors.dart';
import 'package:car_blog/widgets/textview.dart';
import 'package:flutter/material.dart';

class FooterSection extends StatefulWidget {
  final VoidCallback? onHome;
  final VoidCallback? onAbout;
  final VoidCallback? onContact;
  final VoidCallback? onBlog;
  final VoidCallback? onMenuToggle;
  final bool? showMenu;

  const FooterSection({
    super.key,
    this.onHome,
    this.onAbout,
    this.onContact,
    this.onBlog,
    this.onMenuToggle,
    this.showMenu,
  });

  @override
  State<FooterSection> createState() => _FooterSectionState();
}

class _FooterSectionState extends State<FooterSection> {
  late TextEditingController _emailController;
  @override
  void initState() {
    _emailController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.widthOf(context);
    final bool isMobile = width < 768;

    return Container(
      constraints: BoxConstraints(minHeight: isMobile ? 400 : 330),
      padding: EdgeInsets.symmetric(horizontal: 0, vertical: 16),

      color: AppColors.darkBlue,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          NavsBar(
            onHome: widget.onHome!,
            onAbout: widget.onAbout!,
            onContact: widget.onContact!,
            onBlog: widget.onBlog!,
            onMenuToggle: widget.onMenuToggle!,
            showMenu: widget.showMenu!,
          ),
          SizedBox(height: 20,),
          Container(
            padding: EdgeInsets.symmetric(
              vertical: isMobile ? 8 : 32,
              horizontal: isMobile ? 16 : 32,
            ),
            decoration: BoxDecoration(
              color: isMobile
                  ? AppColors.darkBlue.withOpacity(0.1)
                  : Colors.black38.withOpacity(0.1),
            ),
            child: isMobile
                ? Column(
                  mainAxisSize: MainAxisSize.min,
                
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Textview(
                      text:
                          'Subscribe to our news letter to get latest updates and news',
                      color: AppColors.whiteColor,
                      isBold: true,
                      size: isMobile ? 16 : 24,
                    ),
                    SizedBox(height: 20),
                
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Enter your email address',
                        hintText: 'you@example.com',
                        filled: true,
                        fillColor: AppColors.whiteColor,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      textAlignVertical: TextAlignVertical.center,
                      cursorColor: AppColors.redColor,
                    ),
                
                    SizedBox(width: 20),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 16),
                      width: 150,
                      padding: EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.redColor,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Center(
                        child: Textview(
                          text: "Subscribe Now",
                          color: AppColors.whiteColor,
                        ),
                      ),
                    ),
                  ],
                )
                : Row(
                    mainAxisSize: MainAxisSize.min,

                    children: [
                      SizedBox(
                        width: MediaQuery.widthOf(context) * 0.28,
                        child: Textview(
                          text:
                              'Subscribe to our news letter to get latest updates and news',
                          color: AppColors.whiteColor,
                          isBold: true,
                          size: 24,
                        ),
                      ),
                      SizedBox(width: 20),

                      Expanded(
                        child: TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Enter your email address',
                            hintText: 'you@example.com',
                            filled: true,
                            fillColor: AppColors.whiteColor,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),

                          controller: _emailController,
                          keyboardType: TextInputType.emailAddress,
                          textAlignVertical: TextAlignVertical.center,
                          cursorColor: AppColors.redColor,
                        ),
                      ),

                      SizedBox(width: 20),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 16),
                        width: 150,
                        padding: EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.redColor,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Center(
                          child: Textview(
                            text: "Subscribe Now",
                            color: AppColors.whiteColor,
                          ),
                        ),
                      ),
                    ],
                  ),
          ),
          SizedBox(height: 10),
          // Spacer(),
          isMobile
              ? Padding(
                padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
              
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Textview(
                      text:
                          'Finestreet 118 2561 abctown\nexample@femail.com 001 21345 442',
                      size: 14,
                      color: AppColors.offWhite,
                    ),
                    SizedBox(height: 10),
              
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.facebook),
                          color: AppColors.offWhite,
                        ),
                        SizedBox(width: 10),
              
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.shopify),
                          color: AppColors.offWhite,
                        ),
                        SizedBox(width: 10),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.whatshot_sharp),
                          color: AppColors.offWhite,
                        ),
                        SizedBox(width: 10),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.airplane_ticket),
                          color: AppColors.offWhite,
                        ),
                      ],
                    ),
                  ],
                ),
              )
              : Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,

                    children: [
                      Textview(
                        text:
                            'Finestreet 118 2561 abctown\nexample@femail.com 001 21345 442',
                        size: 14,
                        color: AppColors.offWhite,
                      ),
                      Spacer(),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.facebook),
                        color: AppColors.offWhite,
                      ),
                      SizedBox(width: 10),

                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.shopify),
                        color: AppColors.offWhite,
                      ),
                      SizedBox(width: 10),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.whatshot_sharp),
                        color: AppColors.offWhite,
                      ),
                      SizedBox(width: 10),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.airplane_ticket),
                        color: AppColors.offWhite,
                      ),
                      SizedBox(width: 10),
                    ],
                  ),
                ),
        ],
      ),
    );
  }
}
