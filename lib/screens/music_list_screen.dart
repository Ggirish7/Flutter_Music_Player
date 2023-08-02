import 'package:flutter/material.dart';
import 'package:flutter_music_player/constants/app_color.dart';
import 'package:flutter_music_player/model/music_model.dart';
import 'package:flutter_music_player/widgets/player_buttons.dart';

class MusicListScreen extends StatefulWidget {
  final int selectedIndex;
  const MusicListScreen({super.key, required this.selectedIndex});

  @override
  State<MusicListScreen> createState() => _MusicListScreenState();
}

class _MusicListScreenState extends State<MusicListScreen> {
  late int selectedIndex;

  @override
  void initState() {
    selectedIndex = widget.selectedIndex;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColor.bgColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 20),
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
                      Icons.arrow_back_rounded,
                      color: AppColor.secondaryTextColor,
                    ),
                    onTap: () {
                      Navigator.pop(context, selectedIndex);
                    },
                  ),
                  PlayerButtons(
                    size: size.width * 0.40,
                    padding: 5,
                    distance: 15,
                    imageUrl: musicList[selectedIndex].imageUrl,
                  ),
                  PlayerButtons(
                    size: size.width * 0.15,
                    child: Icon(
                      musicList[selectedIndex].isFav
                          ? Icons.favorite
                          : Icons.favorite_border,
                      color: AppColor.secondaryTextColor,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: size.height * 0.05,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: musicList.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        setState(() {
                          selectedIndex = index;
                        });
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 15),
                        decoration: selectedIndex == index
                            ? BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: AppColor.secondaryTextColor
                                    .withOpacity(0.3),
                              )
                            : null,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    musicList[index].name,
                                    style: const TextStyle(
                                        color: AppColor.primaryTextColor,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    musicList[index].artist,
                                    style: const TextStyle(
                                        color: AppColor.secondaryTextColor,
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                              selectedIndex == index
                                  ? const PlayerButtons(
                                      size: 50,
                                      color: [
                                        AppColor.blueTopDark,
                                        AppColor.blue
                                      ],
                                      child: Icon(
                                        Icons.pause_rounded,
                                        color: AppColor.white,
                                      ),
                                    )
                                  : const PlayerButtons(
                                      size: 50,
                                      child: Icon(
                                        Icons.play_arrow_rounded,
                                        color: AppColor.secondaryTextColor,
                                      ),
                                    ),
                            ]),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
