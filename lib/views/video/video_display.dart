import 'package:defensa_civil/layout/navbar.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoDisplay extends StatefulWidget {
  const VideoDisplay({ Key? key, required this.title, required this.url }) : super(key: key);
  final String title;
  final String url;
  @override
  _VideoDisplayState createState() => _VideoDisplayState();
}

class _VideoDisplayState extends State<VideoDisplay> {
  late YoutubePlayerController videoController;
  final String baseUrl = "";

  @override
  void initState() {
    videoController = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(baseUrl+widget.url)!,
      flags: const YoutubePlayerFlags(mute: false, autoPlay: true)
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayerBuilder(
        player: YoutubePlayer(
          controller: videoController,
          showVideoProgressIndicator: true, 
        ),
        builder: (context, player) {
          return Container(child: player,);
      },);
  }
}