import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:video_player/video_player.dart';

import '../widgets/base_screen.dart';

class VideosScreen extends StatefulWidget {
  @override
  _VideosScreenState createState() => _VideosScreenState();
}

class _VideosScreenState extends State<VideosScreen> {
  final List<String> videoPaths = [
    'assets/videos/video1.mp4',
   // 'assets/videos/video2.mp4',
    'assets/videos/video3.mp4',
/*
    'assets/videos/video4.mp4',
    'assets/videos/video5.mp4',
    'assets/videos/video6.mp4',
    'assets/videos/video7.mp4',
    'assets/videos/video8.mp4',
    'assets/videos/video9.mp4',
    'assets/videos/video10.mp4',
    'assets/videos/video11.mp4',
    'assets/videos/video12.mp4',

 */

  ];

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Project Meeting Videos Title
              Text(
                'Project Meeting Videos',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20), // Space between heading and videos

              // Dynamic Rows
              ..._buildDynamicRows(),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _buildDynamicRows() {
    List<Widget> rows = [];
    for (int i = 0; i < videoPaths.length; i += 3) {
      rows.add(_buildVideoRow(i, i + 1, i + 2));
      rows.add(const SizedBox(height: 20));
    }
    return rows;
  }

  // Helper function to build a row of three video cards
  Widget _buildVideoRow(int index1, int index2, int index3) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        if (index1 < videoPaths.length) _buildVideoCard(videoPaths[index1]),
        if (index2 < videoPaths.length) _buildVideoCard(videoPaths[index2]),
        if (index3 < videoPaths.length) _buildVideoCard(videoPaths[index3]),
      ],
    );
  }

  // Helper function to build a video card
  Widget _buildVideoCard(String videoPath) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          _showFullScreenVideo(videoPath);
        },
        child: Card(
          elevation: 5,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Container(
            height: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: VideoPlayerWidget(videoPath: videoPath),
            ),
          ),
        ),
      ),
    );
  }

  void _showFullScreenVideo(String videoPath) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => FullScreenVideoPage(videoPath: videoPath),
      ),
    );
  }
}

// VideoPlayerWidget to preview video
class VideoPlayerWidget extends StatefulWidget {
  final String videoPath;

  VideoPlayerWidget({required this.videoPath});

  @override
  _VideoPlayerWidgetState createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  late VideoPlayerController _controller;
  bool _isPlaying = false;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(widget.videoPath)
      ..initialize().then((_) {
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return _controller.value.isInitialized
        ? GestureDetector(
      onTap: () {
        setState(() {
          _isPlaying = !_isPlaying;
          _isPlaying ? _controller.play() : _controller.pause();
        });
      },
      child: Stack(
        fit: StackFit.expand,
        children: [
          VideoPlayer(_controller),
          if (!_isPlaying)
            Center(
              child: Icon(
                Icons.play_circle_outline,
                size: 50,
                color: Colors.white,
              ),
            ),
        ],
      ),
    )
        : Center(child: CircularProgressIndicator());
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

// Full-screen video page with Chewie controls
class FullScreenVideoPage extends StatefulWidget {
  final String videoPath;

  FullScreenVideoPage({required this.videoPath});

  @override
  _FullScreenVideoPageState createState() => _FullScreenVideoPageState();
}

class _FullScreenVideoPageState extends State<FullScreenVideoPage> {
  late VideoPlayerController _videoPlayerController;
  ChewieController? _chewieController;

  @override
  void initState() {
    super.initState();
    _videoPlayerController = VideoPlayerController.asset(widget.videoPath);
    _videoPlayerController.initialize().then((_) {
      setState(() {
        _chewieController = ChewieController(
          videoPlayerController: _videoPlayerController,
          autoPlay: true,
          looping: false,
          allowFullScreen: true,
          allowMuting: true,
          showControls: true,
          aspectRatio: _videoPlayerController.value.aspectRatio > 0
              ? _videoPlayerController.value.aspectRatio
              : 16 / 9, // fallback aspect ratio
        );
      });
    });
  }

  @override
  void dispose() {
    _chewieController?.dispose();
    _videoPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Center(
        child: _chewieController != null &&
            _chewieController!.videoPlayerController.value.isInitialized
            ? Chewie(controller: _chewieController!)
            : const CircularProgressIndicator(),
      ),
    );
  }
}
