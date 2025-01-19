import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? userPhotoURL;
  final bool showUserAvatar;
  final bool showLeadingIcon;

  const CustomAppBar({
    Key? key,
    this.userPhotoURL,
    this.showUserAvatar = false,
    this.showLeadingIcon = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final appBarHeight = screenHeight * 0.1;

    return PreferredSize(
      preferredSize: Size.fromHeight(appBarHeight),
      child: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: showLeadingIcon,
        toolbarHeight: appBarHeight,
        centerTitle: true,
        title: SvgPicture.asset(
          'assets/subtract.svg',
          width: appBarHeight * 0.5,
          height: appBarHeight * 0.5,
        ),
        actions: showUserAvatar
            ? [
                Padding(
                  padding: EdgeInsets.only(right: appBarHeight * 0.2),
                  child: CircleAvatar(
                    radius: appBarHeight * 0.25,
                    backgroundImage: userPhotoURL != null
                        ? NetworkImage(userPhotoURL!)
                        : null,
                    child: userPhotoURL == null
                        ? const Icon(Icons.person,
                            size: 30, color: Colors.white)
                        : null,
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
