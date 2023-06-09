import 'package:flutter/material.dart';
import 'package:flutter_music_player/constants/app_color.dart';

class PlayerButtons extends StatelessWidget {
  const PlayerButtons({
    super.key,
    required this.size,
    this.child,
    this.imageUrl,
    this.padding = 3,
    this.distance = 10,
  });
  final double size;
  final Widget? child;
  final String? imageUrl;
  final double padding;
  final double distance;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      padding: EdgeInsets.all(padding),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: BoxDecoration(
        color: AppColor.bgColor,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: AppColor.white,
            blurRadius: 20,
            offset: Offset(-distance, -distance),
          ),
          BoxShadow(
            color: AppColor.bgDark,
            blurRadius: 20,
            offset: Offset(distance, distance),
          ),
        ],
      ),
      child: imageUrl != null
          ? CircleAvatar(
              backgroundImage: AssetImage(imageUrl!),
            )
          : Container(
              width: 60,
              height: 60,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppColor.bgColor,
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [AppColor.white, AppColor.bgDark],
                ),
              ),
              child: child,
            ),
    );
  }
}
