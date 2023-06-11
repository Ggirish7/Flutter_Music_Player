import 'package:flutter/material.dart';
import 'package:flutter_music_player/constants/app_color.dart';
import 'package:flutter_music_player/model/music_model.dart';
import 'package:flutter_music_player/screens/music_list_screen.dart';
import 'package:flutter_music_player/widgets/player_buttons.dart';

class PlayerScreen extends StatefulWidget {
  const PlayerScreen({super.key});

  @override
  State<PlayerScreen> createState() => _PlayerScreenState();
}

class _PlayerScreenState extends State<PlayerScreen> {
  int _currentPlayingItem = 0;
  double _currentPlayback = 0;

  int get currentPlayingItem {
    return _currentPlayingItem;
  }

  String secToMinConv(double time) {
    final min = time ~/ 60;
    final sec = time % 60;
    return "$min:${sec.toStringAsFixed(0)}";
  }

  @override
  Widget build(BuildContext context) {
    // SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
    //     overlays: [SystemUiOverlay.top]);
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColor.bgColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  PlayerButtons(
                    size: size.width * 0.15,
                    child: Icon(
                      musicList[_currentPlayingItem].isFav
                          ? Icons.favorite
                          : Icons.favorite_border,
                      color: AppColor.secondaryTextColor,
                    ),
                  ),
                  const Text(
                    "PLAYING NOW",
                    style: TextStyle(
                        color: AppColor.secondaryTextColor,
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                  ),
                  PlayerButtons(
                    size: size.width * 0.15,
                    child: const Icon(
                      Icons.menu,
                      color: AppColor.secondaryTextColor,
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const MusicListScreen(),
                        ),
                      );
                    },
                  ),
                ],
              ),
              PlayerButtons(
                size: size.width * 0.8,
                padding: 10,
                distance: 20,
                imageUrl: musicList[_currentPlayingItem].imageUrl,
              ),
              Column(
                children: [
                  Text(
                    musicList[_currentPlayingItem].name,
                    style: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: AppColor.primaryTextColor),
                  ),
                  Text(
                    musicList[_currentPlayingItem].artist,
                    style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: AppColor.primaryTextColor),
                  ),
                ],
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 22.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          secToMinConv(_currentPlayback),
                          style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: AppColor.primaryTextColor),
                        ),
                        Text(
                          secToMinConv(musicList[_currentPlayingItem].length),
                          style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: AppColor.primaryTextColor),
                        ),
                      ],
                    ),
                  ),
                  Slider(
                    value: _currentPlayback,
                    max: musicList[_currentPlayingItem].length,
                    onChanged: (value) {
                      setState(() {
                        _currentPlayback = value;
                      });
                    },
                    activeColor: AppColor.blue,
                    thumbColor: AppColor.blue,
                    inactiveColor: AppColor.bgDark,
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.only(bottom: size.height * 0.05),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    PlayerButtons(
                      size: size.width * 0.2,
                      child: const Icon(
                        Icons.skip_previous_rounded,
                        color: AppColor.secondaryTextColor,
                        size: 30,
                      ),
                    ),
                    PlayerButtons(
                      size: size.width * 0.2,
                      color: const [AppColor.blueTopDark, AppColor.blue],
                      child: const Icon(
                        Icons.pause_rounded,
                        color: AppColor.white,
                        size: 30,
                      ),
                    ),
                    PlayerButtons(
                      size: size.width * 0.2,
                      child: const Icon(
                        Icons.skip_next_rounded,
                        color: AppColor.secondaryTextColor,
                        size: 30,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
