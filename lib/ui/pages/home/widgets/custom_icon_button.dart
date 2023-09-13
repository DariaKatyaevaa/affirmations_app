import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  final VoidCallback onTap;
  final IconData iconData;
  final String? text;

  const CustomIconButton({
    super.key,
    required this.onTap,
    required this.iconData,
    this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.black38,
        borderRadius: BorderRadius.all(Radius.circular(24.0)),
      ),
      child: GestureDetector(
        onTap: onTap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              iconData,
              color: Colors.white,
              size: 28.0,
            ),
            if (text != null)
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  text!,
                  style: TextStyle(color: Colors.white, fontSize: 18.0),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
