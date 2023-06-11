import 'package:flutter/material.dart';
import 'package:flutter_music_player/constants/app_color.dart';
import 'package:flutter_music_player/model/music_model.dart';
import 'package:flutter_music_player/screens/player_screen.dart';
import 'package:flutter_music_player/widgets/player_buttons.dart';

class MusicListScreen extends StatelessWidget {
  const MusicListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColor.bgColor,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "PLAYING NOW",
              style: TextStyle(
                  color: AppColor.secondaryTextColor,
                  fontSize: 14,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: size.height * 0.07,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                PlayerButtons(
                  size: size.width * 0.15,
                  child: const Icon(
                    Icons.menu,
                    color: AppColor.secondaryTextColor,
                  ),
                ),
                PlayerButtons(
                  size: size.width * 0.35,
                  padding: 5,
                  distance: 15,
                  imageUrl: musicList[0].imageUrl,
                ),
                PlayerButtons(
                  size: size.width * 0.15,
                  child: const Icon(
                    Icons.menu,
                    color: AppColor.secondaryTextColor,
                  ),
                ),
              ],
            ),
          ],
        ),
      )),
    );
  }
}
