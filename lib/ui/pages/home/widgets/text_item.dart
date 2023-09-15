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
                onTapDown: (details) => _showPopUpMenu(details.globalPosition),
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

  Future<void> _showPopUpMenu(Offset offset) async {
    final left = offset.dx;
    final top = offset.dy;
    await showMenu(
      context: context,
      position: RelativeRect.fromLTRB(left, top, left + 1, top + 1),
      items: [
        PopupMenuItem<String>(
          child: const Text('Doge'),
          //value: 'Doge',
        ),
        PopupMenuItem<String>(
          child: const Text('Lion'),
          //value: 'Lion',
        ),
      ],
      elevation: 8.0,
    );
  }
}
