import 'package:flutter/material.dart';

class StarButton extends StatefulWidget {
  const StarButton({super.key});

  @override
  State<StarButton> createState() => _StarButtonState();
}

class _StarButtonState extends State<StarButton> {
  bool _isFavorited = false;
  int _favoriteCount = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
          child: Column(
            children: const <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(vertical: 5.0),
                child: Text(
                  "Nuestros clientes siempre obtienen la mejor calidad",
                  style: TextStyle(fontSize: 18.0),
                ),
              ),
            ],
          ),
          // ignore: todo
          //TODO: dinamico.
        ),
        Padding(
          padding: const EdgeInsets.all(0.0),
          child: Column(
            children: <Widget>[
              IconButton(
                icon: (_isFavorited
                    ? const Icon(Icons.star)
                    : const Icon(Icons.star_border)),
                onPressed: () {
                  setState(
                    () {
                      if (_isFavorited) {
                        _isFavorited = !_isFavorited;
                        _favoriteCount--;
                      } else {
                        _isFavorited = !_isFavorited;
                        _favoriteCount++;
                      }
                    },
                  );
                },
              ),
              Text(
                "$_favoriteCount",
                style: const TextStyle(fontSize: 16.0),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
