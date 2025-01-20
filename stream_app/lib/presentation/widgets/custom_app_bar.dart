import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? userPhotoURL;
  final bool showUserAvatar;
  final bool showLeadingIcon;
  final VoidCallback? onAvatarTap;

  const CustomAppBar({
    Key? key,
    this.userPhotoURL,
    this.showUserAvatar = false,
    this.showLeadingIcon = false,
    this.onAvatarTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width * 0.1;

    return PreferredSize(
      preferredSize: Size.fromHeight(screenWidth),
      child: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: showLeadingIcon,
        toolbarHeight: screenWidth,
        centerTitle: true,
        title: SvgPicture.asset(
          'assets/subtract.svg',
          width: screenWidth * 0.5,
          height: screenWidth * 0.5,
        ),
        actions: showUserAvatar
            ? [
                Padding(
                  padding: EdgeInsets.only(right: screenWidth * 0.4),
                  child: GestureDetector(
                    onTap: onAvatarTap,
                    child: CircleAvatar(
                      radius: screenWidth * 0.25,
                      backgroundImage: userPhotoURL != null
                          ? NetworkImage(userPhotoURL!)
                          : null,
                      child: userPhotoURL == null
                          ? Icon(Icons.person,
                              size: (screenWidth * 0.02), color: Colors.white)
                          : null,
                    ),
                  ),
                ),
              ]
            : null,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(80);
}
