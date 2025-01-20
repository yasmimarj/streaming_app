import 'package:flutter/material.dart';
import 'gradient_image_card.dart';

class HorizontalCarousel extends StatelessWidget {
  final List<Map<String, String>> items;

  const HorizontalCarousel({
    Key? key,
    required this.items,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.25,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: items.length,
        separatorBuilder: (context, index) => SizedBox(
          width: MediaQuery.of(context).size.width * 0.04,
        ),
        itemBuilder: (context, index) {
          final item = items[index];
          return GradientImageCard(
            imagePath: item['imagePath'] ?? '',
            title: item['title'] ?? '',
          );
        },
      ),
    );
  }
}
