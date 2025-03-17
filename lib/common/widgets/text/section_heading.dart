import 'package:flutter/material.dart';

class VSectionHeading extends StatelessWidget {
  const VSectionHeading({
    super.key,
    this.textColor,
    this.showActionButton = true,
    required this.title,
    this.buttonTitle = 'View All',
    this.onPressed,
    this.textUnderline = false,
  });

  final Color? textColor;
  final bool showActionButton;
  final bool textUnderline;
  final String title, buttonTitle;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title,
            style: Theme.of(context).textTheme.headlineSmall!.apply(
                  color: textColor,
                  decoration: textUnderline
                      ? TextDecoration.underline
                      : TextDecoration.none,
                ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis),
        if (showActionButton)
          TextButton(
            onPressed: onPressed,
            child: Text(
              buttonTitle,
              style: TextStyle(color: textColor),
            ),
          ),
      ],
    );
  }
}
