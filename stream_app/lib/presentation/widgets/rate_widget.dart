import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:untold/presentation/widgets/action_button.dart';
import 'package:untold/state/movie/rating_store.dart';

class RateWidget extends StatefulWidget {
  final RatingStore store;
  final Function(String)? onRateSelected;

  const RateWidget({
    Key? key,
    required this.store,
    this.onRateSelected,
  }) : super(key: key);

  @override
  _RateWidgetState createState() => _RateWidgetState();
}

class _RateWidgetState extends State<RateWidget> {
  bool _isRatingOptionsVisible = false;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.bottomCenter,
      children: [
        Observer(
          builder: (_) => GestureDetector(
            onTap: () {
              setState(() {
                _isRatingOptionsVisible = !_isRatingOptionsVisible;
              });
            },
            child: ActionButton(
              assetPath: _getRatingIconPath(widget.store.selectedRating),
              label: "Rate",
              onTap: () {
                setState(() {
                  _isRatingOptionsVisible = !_isRatingOptionsVisible;
                });
              },
            ),
          ),
        ),
        if (_isRatingOptionsVisible)
          Positioned.fill(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _isRatingOptionsVisible = false;
                });
              },
              child: Container(
                color: Colors.black.withOpacity(0.5),
              ),
            ),
          ),
        if (_isRatingOptionsVisible)
          Positioned(
            child: Material(
              color: Colors.transparent,
              child: Container(
                width: screenWidth * 0.8,
                padding: EdgeInsets.symmetric(
                    vertical: screenHeight * 0.02,
                    horizontal: screenWidth * 0.04),
                decoration: BoxDecoration(
                  color: Colors.black87,
                  borderRadius: BorderRadius.circular(screenWidth * 0.05),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _ratingOption(
                      "assets/not_like.svg",
                      "not_like",
                      "It's not for me",
                      screenWidth,
                    ),
                    _ratingOption(
                        "assets/like.svg", "like", "I Like it", screenWidth),
                    _ratingOption(
                      "assets/super_like.svg",
                      "super_like",
                      "I love it!",
                      screenWidth,
                    ),
                    _ratingOption(
                      "assets/square_close.svg",
                      null,
                      "",
                      screenWidth,
                      isCloseButton: true,
                    ),
                  ],
                ),
              ),
            ),
          ),
      ],
    );
  }

  Widget _ratingOption(
    String assetPath,
    String? value,
    String label,
    double screenWidth, {
    bool isCloseButton = false,
  }) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: value == null
          ? () {
              print("Botão de fechar clicado");
              setState(() {
                _isRatingOptionsVisible = false;
              });
            }
          : () {
              print("Avaliação selecionada: $value");
              widget.store.setRating(value);
              if (widget.onRateSelected != null) {
                widget.onRateSelected!(value);
              }
              setState(() {
                _isRatingOptionsVisible = false;
              });
            },
      child: Column(
        children: [
          SvgPicture.asset(
            assetPath,
            width: screenWidth * 0.04,
            height: screenWidth * 0.04,
            color: isCloseButton
                ? const Color.fromRGBO(170, 115, 240, 1)
                : Colors.white,
          ),
          const SizedBox(height: 4),
          if (label.isNotEmpty)
            Text(
              label,
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 12,
              ),
            ),
        ],
      ),
    );
  }

  String _getRatingIconPath(String? value) {
    switch (value) {
      case "like":
        return "assets/like_fill.svg";
      case "not_like":
        return "assets/not_like_fill.svg";
      case "super_like":
        return "assets/super_like_fill.svg";
      default:
        return "assets/like.svg";
    }
  }
}
