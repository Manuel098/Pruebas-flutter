import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YoutubePlayerView extends StatefulWidget {
  YoutubePlayerView({Key key}) : super(key: key);

  @override
  _YoutubePlayerStateView createState() => _YoutubePlayerStateView();
}

class _YoutubePlayerStateView extends State<YoutubePlayerView> {
  YoutubePlayerController _controller = YoutubePlayerController(
        initialVideoId: 'Ma1arYS5hEc',
        flags: YoutubePlayerFlags(
            autoPlay: true,
            mute: true,
        ),
    );
  @override
  Widget build(BuildContext context) {
    return Container(
        
        // videoProgressIndicatorColor: Colors.amber,
        // progressColors: ProgressColors(
        //     playedColor: Colors.amber,
        //     handleColor: Colors.amberAccent,
        // ),
        // onReady () {
        //     _controller.addListener(listener);
        // },
    );
  }
}