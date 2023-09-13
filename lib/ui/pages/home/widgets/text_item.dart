import 'package:flutter/material.dart';

class TextItem extends StatefulWidget {
  final String text;
  final String? author;
  final Color textColor;

  const TextItem({
    required this.text,
    required this.textColor,
    this.author,
  });

  @override
  State<TextItem> createState() => _TextItemState();
}

class _TextItemState extends State<TextItem> {
  bool _isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 60.0),
      height: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 40),
          Text(
            widget.text,
            style: TextStyle(
              color: widget.textColor,
              fontSize: 28.0,
            ),
            textAlign: TextAlign.center,
          ),
          if (widget.author != null)
            Column(
              children: [
                SizedBox(height: 16),
                Text(
                  widget.author!,
                  style: TextStyle(
                    color: widget.textColor,
                    fontSize: 24.0,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () => setState(() => _isFavorite = !_isFavorite),
                child: Icon(
                  _isFavorite ? Icons.favorite_rounded : Icons.favorite_border_rounded,
                  size: 32.0,
                  color: widget.textColor,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              GestureDetector(
                onTap: () {},
                child: Icon(
                  Icons.pending_outlined,
                  size: 32.0,
                  color: widget.textColor,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
