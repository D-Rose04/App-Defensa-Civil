import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YoutubeVideo extends StatefulWidget {
  YoutubeVideo({Key? key, required this.url}) : super(key: key);
  final String url;
  @override
  _YoutubeVideoState createState() => _YoutubeVideoState();
}

class _YoutubeVideoState extends State<YoutubeVideo> {
  late YoutubePlayerController videoController;
  late String url;
  final String base_url = "https://www.youtube.com/watch?v=";

  @override
  void initState() {
    url = base_url + widget.url;
    videoController = YoutubePlayerController(
        initialVideoId: YoutubePlayer.convertUrlToId(url)!,
        flags: const YoutubePlayerFlags(mute: false, autoPlay: false));

    super.initState();
  }

  @override
  Widget build(BuildContext context) => YoutubePlayerBuilder(
      player: YoutubePlayer(
        controller: videoController,
        showVideoProgressIndicator: true,
      ),
      builder: (context, player) {
        return Container(
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.all(10),
          child: player,
        );     
      });
}
