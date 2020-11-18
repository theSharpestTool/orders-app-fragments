import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:orders_app/constants/colors.dart';
import 'package:orders_app/icons/orders_app_icons_icons.dart';

class GKRatingBar extends StatelessWidget {
  final int initialRating;
  final Function(int) onRatingUpdate;

  GKRatingBar({
    @required this.initialRating,
    this.onRatingUpdate,
  });

  @override
  Widget build(BuildContext context) {
    return RatingBar(
      ignoreGestures: onRatingUpdate == null,
      initialRating: initialRating.toDouble(),
      onRatingUpdate: (rate) => onRatingUpdate(rate.toInt()),
      itemSize: 30,
      itemPadding: EdgeInsets.symmetric(horizontal: 8),
      ratingWidget: RatingWidget(
        empty: Icon(
          OrdersAppIcons.star,
          color: GKColors.gold,
        ),
        full: Icon(
          OrdersAppIcons.full,
          color: GKColors.gold,
        ),
        half: Icon(
          OrdersAppIcons.full,
          color: GKColors.gold,
        ),
      ),
    );
  }
}