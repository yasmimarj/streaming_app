import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:untold/presentation/widgets/action_button.dart';

class ShareButton extends StatelessWidget {
  final String title;
  final String category;
  final String description;
  final String availableUntil;

  const ShareButton({
    Key? key,
    required this.title,
    required this.category,
    required this.description,
    required this.availableUntil,
  }) : super(key: key);

  void _shareMovieDetails() {
    final String shareContent =
        "Check out this movie!\n\nTitle: $title\nCategory: $category\nDescription: $description\nAvailable until: $availableUntil";
    Share.share(shareContent);
  }

  @override
  Widget build(BuildContext context) {
    return ActionButton(
      assetPath: "assets/share.svg",
      label: "Gift to someone?",
      onTap: _shareMovieDetails,
    );
  }
}
