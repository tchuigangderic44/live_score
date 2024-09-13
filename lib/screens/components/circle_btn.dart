import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../utils/app_color.dart';

class CircleButton extends StatefulWidget {
  final String icon;
  final String? title;
  final Color? color;
  final double? radius;
  final void Function()? onTap;

  const CircleButton(
      {super.key, required this.icon, this.color, this.title, this.onTap, this.radius});

  @override
  State<CircleButton> createState() => _CircleButtonState();
}

class _CircleButtonState extends State<CircleButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(
            radius: widget.radius ?? 28,
            backgroundColor: Theme.of(context).highlightColor,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SvgPicture.asset(
                widget.icon,
                color: widget.color ?? Theme.of(context).primaryColorLight,
              ),
            ),
          ),
          if (widget.title != null)
            Container(
              margin: const EdgeInsets.all(2),
              child: Text(
                widget.title!,
                style: const TextStyle(
                  color: AppColors.textBlack,
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
            )
        ],
      ),
    );
  }
}
