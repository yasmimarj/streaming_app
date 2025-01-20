import 'package:flutter/material.dart';
import 'package:untold/core/utils/navigation_utils.dart';
import 'package:untold/presentation/pages/change_password.dart';
import 'package:untold/presentation/pages/edit_profile.dart';
import 'package:untold/presentation/widgets/custom_list_tile.dart';
import 'package:untold/presentation/widgets/horizontal_carousel.dart';
import 'package:untold/presentation/widgets/simple_button.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: screenHeight * 0.05),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: const Icon(
                    Icons.arrow_back_ios_sharp,
                    color: Color.fromRGBO(170, 115, 240, 1),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                SimpleButton(
                  text: "Edit Profile",
                  onPressed: () {
                    navigateWithFade(
                      context,
                      EditProfilePage(),
                    );
                  },
                  borderColor: const Color.fromRGBO(170, 115, 240, 1),
                ),
              ],
            ),
            SizedBox(height: screenHeight * 0.02),
            Row(
              children: [
                CircleAvatar(
                  radius: screenWidth * 0.1,
                  backgroundImage: AssetImage('assets/eva.png'),
                ),
                SizedBox(width: screenWidth * 0.04),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Hello,",
                      style: TextStyle(
                        fontFamily: "Epilogue",
                        color: Colors.white54,
                        fontSize: screenWidth * 0.04,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      "Eva Mendes",
                      style: TextStyle(
                        fontFamily: "Epilogue",
                        color: Colors.white,
                        fontSize: screenWidth * 0.06,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: screenHeight * 0.04),
            CustomListTile(
              iconPath: 'assets/shield.svg',
              isSvg: true,
              title: "Change Password",
              trailingIcon: Icons.arrow_forward_ios,
              onTap: () {
                navigateWithFade(
                  context,
                  ChangePasswordPage(),
                );
              },
            ),
            CustomListTile(
              iconPath: 'assets/trash.svg',
              isSvg: true,
              title: "Delete my account",
              trailingIcon: Icons.arrow_forward_ios,
              onTap: () {
                // Ação ao clicar
              },
            ),
            SizedBox(height: screenHeight * 0.04),
            Text(
              "Subscriptions",
              style: TextStyle(
                fontFamily: "Epilogue",
                color: Colors.white,
                fontSize: screenWidth * 0.05,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: screenHeight * 0.02),
            CustomListTile(
              iconPath: 'assets/stream_premium.png',
              isSvg: false,
              title: "STREAM Premium",
              subtitle: "Jan 22, 2023",
              trailingText: "Coming soon",
              onTap: () {},
            ),
            SizedBox(height: screenHeight * 0.04),
            Text(
              "History",
              style: TextStyle(
                fontFamily: "Epilogue",
                color: Colors.white,
                fontSize: screenWidth * 0.05,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: screenHeight * 0.02),
            const HorizontalCarousel(
              items: [
                {
                  'imagePath': 'assets/barbie.png',
                  'title': 'Barbie • 2023',
                },
                {
                  'imagePath': 'assets/everything.png',
                  'title': 'Everything • 2022',
                },
                {
                  'imagePath': 'assets/avatar.jpg',
                  'title': 'Avatar • 2023',
                },
                {
                  'imagePath': 'assets/jurassic.jpg',
                  'title': 'Jurassic World • 2022',
                },
              ],
            ),
            SizedBox(height: screenHeight * 0.04),
            Center(
              child: Padding(
                padding: EdgeInsets.all(screenHeight * 0.01),
                child: SimpleButton(
                  text: "Log out",
                  onPressed: () {},
                  borderColor: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
