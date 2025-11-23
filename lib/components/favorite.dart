import 'package:event_details/util/event_model.dart';
import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/widgets.dart';

class FavButton extends StatefulWidget {
  const FavButton(this.event, {this.onFavoriteChanged, super.key});

  final ElevationEvent event;
  final void Function(ElevationEvent updatedEvent)? onFavoriteChanged;

  @override
  State<FavButton> createState() => _FavButtonState();
}

class _FavButtonState extends State<FavButton> {
  late bool isFavorite;

  @override
  void initState() {
    super.initState();
    isFavorite = widget.event.isFavorite; // use model value
  }

  @override
  Widget build(context) {
    return FavoriteButton(
      iconColor: const Color.fromARGB(255, 250, 129, 16),
      iconSize: 40,
      isFavorite: isFavorite,
      valueChanged: (value) {
        setState(() {
          isFavorite = value;
        });
        // Notify parent with updated event
        if (widget.onFavoriteChanged != null) {
          final updatedEvent = widget.event.copyWith(isFavorite: value);
          widget.onFavoriteChanged!(updatedEvent);
        }
      },
    );
  }
}
