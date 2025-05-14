import 'package:flutter/material.dart';

import '../constants/colors.dart';

class VButtons {
  VButtons._();

  // Elevated Button
  static Widget elevated({
    required String label,
    required VoidCallback onPressed,
    IconData? icon,
    Color? color,
    double? width,
    double? height,
    double radius = 8,
    TextStyle? textStyle,
  }) {
    return SizedBox(
        width: width,
        height: height,
        child: ElevatedButton.icon(
            onPressed: onPressed,
            label: Text(label, style: textStyle),
            icon: icon != null ? Icon(icon) : const SizedBox.shrink(),
            style: ElevatedButton.styleFrom(
                backgroundColor: color,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(radius),
                ))));
  }

  // outlined Button
  static Widget outlined({
    required String label,
    required VoidCallback onPressed,
    IconData? icon,
    Color? color,
    double? width,
    double? height,
    double radius = 8,
    TextStyle? textStyle,
  }) {
    return SizedBox(
        width: width,
        height: height,
        child: OutlinedButton.icon(
            onPressed: onPressed,
            label: Text(label, style: textStyle?.copyWith(color: color)),
            icon: icon != null
                ? Icon(icon, color: color)
                : const SizedBox.shrink(),
            style: OutlinedButton.styleFrom(
                side: BorderSide(color: color ?? VColors.primary),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(radius),
                ))));
  }

  // text button
  static Widget text({
    required String label,
    required VoidCallback onPressed,
    IconData? icon,
    Color? color,
    TextStyle? textStyle,
  }) {
    return TextButton.icon(
      icon: icon != null ? Icon(icon, color: color) : const SizedBox.shrink(),
      label: Text(label, style: textStyle?.copyWith(color: color)),
      onPressed: onPressed,
      style: TextButton.styleFrom(foregroundColor: color),
    );
  }

  // round button
  static Widget circleIcon({
    required IconData icon,
    required VoidCallback onPressed,
    Color? color,
    double size = 24,
    double radius = 30,
    Color? backgroundColor,
  }) {
    return Material(
      shape: const CircleBorder(),
      color: backgroundColor ?? Colors.transparent,
      child: IconButton(
        onPressed: onPressed,
        icon: Icon(icon, size: size, color: color),
        splashRadius: radius / 2 + size / 4,
      ),
    );
  }

  // square button
  static Widget squareIcon({
    required IconData icon,
    required VoidCallback onPressed,
    Color? color,
    double size = 24,
    double dimension = 48,
    double radius = 8,
    Color? backgroundColor,
  }) {
    return Material(
      borderRadius: BorderRadius.circular(radius),
      color: backgroundColor ?? Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(radius),
        onTap: onPressed,
        child: SizedBox(
          width: dimension,
          height: dimension,
          child: Center(child: Icon(icon, size: size, color: color)),
        ),
      ),
    );
  }

  // rounded button
  static Widget roundedIcon({
    required IconData icon,
    required VoidCallback onPressed,
    Color? color,
    double size = 24,
    double height = 40,
    double width = 56,
    double radius = 16,
    Color? backgroundColor,
  }) {
    return Material(
      borderRadius: BorderRadius.circular(radius),
      color: backgroundColor ?? Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(radius),
        onTap: onPressed,
        child: SizedBox(
          width: width,
          height: height,
          child: Center(
            child: Icon(icon, size: size, color: color),
          ),
        ),
      ),
    );
  }

  // fab button
  static Widget fab({
    required VoidCallback onPressed,
    IconData? icon = Icons.add,
    String? label,
    Color? color,
    bool mini = false,
  }) {
    if (label != null) {
      return FloatingActionButton.extended(
        onPressed: onPressed,
        label: Text(label),
        icon: Icon(icon),
        backgroundColor: color,
        isExtended: true,
      );
    }
    return FloatingActionButton(
      onPressed: onPressed,
      mini: mini,
      backgroundColor: color,
      child: Icon(icon),
    );
  }

  // custom shape button
  static Widget customShape({
    required VoidCallback onPressed,
    required Widget child,
    ShapeBorder shape = const CircleBorder(),
    Color? backgroundColor,
    EdgeInsets padding = const EdgeInsets.all(8),
  }) {
    return Material(
        shape: shape,
        color: backgroundColor ?? Colors.transparent,
        child: InkWell(
            customBorder: shape,
            onTap: onPressed,
            child: Padding(padding: padding, child: child)));
  }

  // toggle button single
  static Widget toggle({
    required bool isActive,
    required IconData icon,
    required VoidCallback onPressed,
    Color activeColor = Colors.blue,
    Color inactiveColor = Colors.grey,
    double size = 28,
  }) {
    return IconButton(
      icon:
          Icon(icon, color: isActive ? activeColor : inactiveColor, size: size),
      onPressed: onPressed,
    );
  }

  // toggle button group
  static Widget toggleGroup({
    required List<String> labels,
    required List<bool> isSelected,
    required void Function(int index) onPressed,
    Color selectedColor = Colors.blue,
    Color color = Colors.black54,
  }) {
    return ToggleButtons(
      isSelected: isSelected,
      onPressed: onPressed,
      selectedColor: selectedColor,
      color: color,
      borderRadius: BorderRadius.circular(8),
      children: labels
          .map((label) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(label),
              ))
          .toList(),
    );
  }

  // gradiant
  static Widget gradiant({
    required String label,
    required VoidCallback onPressed,
    required List<Color> gradiantColors,
    IconData? icon,
    double radius = 8,
    double? width,
    double? height,
    TextStyle? textStyle,
  }) {
    return SizedBox(
      width: width,
      height: height,
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: gradiantColors),
          borderRadius: BorderRadius.circular(radius),
        ),
        child: ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
            elevation: 0,
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(radius)),
          ),
          icon: icon != null
              ? Icon(icon, color: Colors.white)
              : const SizedBox.shrink(),
          label: Text(label,
              style: textStyle ?? const TextStyle(color: Colors.white)),
          onPressed: onPressed,
        ),
      ),
    );
  }

  // icon ripple
  static Widget iconRipple({
    required IconData icon,
    required VoidCallback onTap,
    Color? iconColor,
    Color? rippleColor,
    double size = 28,
    ShapeBorder shape = const CircleBorder(),
    EdgeInsets padding = const EdgeInsets.all(12),
  }) {
    return Material(
      color: Colors.transparent,
      shape: shape,
      child: InkWell(
        splashColor: rippleColor ?? Colors.blue.withValues(alpha: 0.2),
        customBorder: shape,
        onTap: onTap,
        child: Padding(
          padding: padding,
          child: Icon(icon, color: iconColor, size: size),
        ),
      ),
    );
  }

  // social button
  static Widget social({
    required String label,
    required VoidCallback onPressed,
    required IconData icon,
    Color? color,
    Color? backgroundColor,
    double radius = 8.0,
  }) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor ?? Colors.white,
          foregroundColor: color ?? Colors.black54,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius)),
          elevation: 2),
      icon: Icon(icon),
      label: Text(label),
    );
  }

  // loading
  static Widget loading({
    required bool loading,
    required String label,
    required VoidCallback onPressed,
    IconData? icon,
    Color? color,
    double? width,
    double? height,
    double radius = 8,
  }) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: loading ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: loading ? Colors.grey : color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius),
          ),
        ),
        child: loading
            ? const SizedBox(
                width: 24,
                height: 24,
                child: CircularProgressIndicator(
                    strokeWidth: 2, color: Colors.white))
            : Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (icon != null) ...[Icon(icon), const SizedBox(width: 8)],
                  Text(label),
                ],
              ),
      ),
    );
  }
}
