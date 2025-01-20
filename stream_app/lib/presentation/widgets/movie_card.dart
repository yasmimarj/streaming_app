import 'package:flutter/material.dart';
import 'package:untold/core/utils/date_utils.dart';
import 'package:untold/presentation/widgets/custom_button.dart';
import 'package:untold/presentation/widgets/rate_widget.dart';
import 'package:untold/presentation/widgets/share_button.dart';
import 'package:untold/state/movie/rating_store.dart';

class MovieCard extends StatelessWidget {
  final String title;
  final String category;
  final String description;
  final String imageUrl;
  final int commentsCount;
  final String availableUntil;

  const MovieCard({
    Key? key,
    required this.title,
    required this.category,
    required this.description,
    required this.imageUrl,
    required this.commentsCount,
    required this.availableUntil,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    final ratingStore = RatingStore();

    return Center(
      child: Container(
        width: screenWidth,
        height: screenHeight * 0.77,
        margin: EdgeInsets.symmetric(
          horizontal: screenWidth * 0.04,
          vertical: screenHeight * 0.01,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          image: DecorationImage(
            image: NetworkImage(imageUrl),
            fit: BoxFit.cover,
          ),
          border:
              Border.all(color: Colors.white.withAlpha((0.2 * 255).toInt())),
        ),
        child: Container(
          padding: EdgeInsets.all(screenWidth * 0.04),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: LinearGradient(
              colors: [
                Colors.black.withAlpha(230),
                Colors.black.withAlpha(102),
                Colors.black.withAlpha(26),
                Colors.transparent,
              ],
              stops: [0.1, 0.4, 0.7, 1.0],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                category,
                style: TextStyle(
                  color: Colors.white70,
                  fontFamily: "Epilogue",
                  fontSize: screenWidth * 0.03,
                  letterSpacing: (screenWidth * 0.03) * 0.005,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: screenHeight * 0.005),
              Text(
                title,
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: "Epilogue",
                  fontSize: screenWidth * 0.065,
                  letterSpacing: 14 * 0.045,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: screenHeight * 0.01),
              Text(
                description,
                style: TextStyle(
                  color: Colors.white70,
                  fontFamily: "Epilogue",
                  fontSize: screenWidth * 0.03,
                  letterSpacing: (screenWidth * 0.03) * 0.045,
                  fontWeight: FontWeight.w400,
                ),
                maxLines: 4,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.start,
              ),
              SizedBox(height: screenHeight * 0.01),
              Row(
                children: [
                  Icon(Icons.comment,
                      color: Colors.white70, size: screenWidth * 0.035),
                  SizedBox(width: screenWidth * 0.01),
                  Text(
                    '$commentsCount Comments',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: screenWidth * 0.025,
                    ),
                  ),
                ],
              ),
              SizedBox(height: screenHeight * 0.02),
              Center(
                  child: CustomButton(
                label: "Watch",
                onPressed: () {},
              )),
              SizedBox(height: screenHeight * 0.02),
              Divider(
                color: Colors.white.withAlpha((0.3 * 255).toInt()),
              ),
              SizedBox(height: screenHeight * 0.01),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      RateWidget(
                        store: ratingStore,
                        onRateSelected: (rating) {
                          print("Você avaliou como: $rating");
                        },
                      ),
                      SizedBox(width: screenWidth * 0.05),
                      ShareButton(
                        title: title,
                        category: category,
                        description: description,
                        availableUntil: formatDate(availableUntil),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text('Available until',
                          style: TextStyle(
                            fontFamily: "Epilogue",
                            color: Colors.white70,
                            fontSize: screenWidth * 0.025,
                            fontWeight: FontWeight.w500,
                          )),
                      Text(
                        formatDate(availableUntil),
                        style: TextStyle(
                          fontFamily: "Epilogue",
                          color: Color.fromRGBO(170, 115, 240, 1),
                          fontSize: screenWidth * 0.03,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
