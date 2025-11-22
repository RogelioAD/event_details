import 'package:event_details/models/event_model.dart';
import 'package:flutter/widgets.dart';
import 'package:favorite_button/favorite_button.dart';

class FavButton extends StatefulWidget {
  const FavButton(this.isFavorite, this.event, {super.key});

  final bool isFavorite;
  final ElevationEvent event;

  @override
  State<FavButton> createState() {
    return _FavButton();
  }
}

class _FavButton extends State<FavButton> {
  @override
  Widget build(context) {
    return FavoriteButton(
      valueChanged: (isFavorite) {
        print('Is Favorite $isFavorite');
      },
    );
  }
}
