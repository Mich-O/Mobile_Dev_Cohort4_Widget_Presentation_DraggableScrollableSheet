
import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PlaylistPage(),
    ),
  );
}

class PlaylistPage extends StatefulWidget {
  const PlaylistPage({super.key});

  @override
  State<PlaylistPage> createState() => _PlaylistPageState();
}

class _PlaylistPageState extends State<PlaylistPage> {
  final DraggableScrollableController sheetController =
  DraggableScrollableController();

  final List<String> songs = const [
    'King Of The Fall',
    'Golden Hour',
    'Lost in the City',
    'Ocean Lights',
    'After the Rain',
    'Summer Nights',
    'Quiet Roads',
    'Last Dance',
    'Falling Stars',
    'Echoes of Yesterday',
    'Running Wild',
    'Silent Waves',
    'Distant Memories',
    'Blue Horizon',
    'The Long Way Home',
    'Northern Lights',
    'Paper Planes',
    'Endless Summer',
    'Broken Records',
    'Dreaming Again',
  ];

  double dragStartSize = 0.30;
  double dragStartY = 0.0;

  void startHandleDrag(DragStartDetails details) {
    if (!sheetController.isAttached) return;

    dragStartSize = sheetController.size;
    dragStartY = details.globalPosition.dy;
  }

  void updateHandleDrag(DragUpdateDetails details) {
    if (!sheetController.isAttached) return;

    final screenHeight = MediaQuery.of(context).size.height;
    final dragDistance = dragStartY - details.globalPosition.dy;

    final newSize = (dragStartSize + dragDistance / screenHeight)
        .clamp(0.20, 0.50);

    sheetController.jumpTo(newSize);
  }

  @override
  void dispose() {
    sheetController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF512DA8),
              Color(0xFF311B70),
              Color(0xFF170D3D),
            ],
          ),
        ),
        child: Stack(
          fit: StackFit.expand,
          children: [
            // Background music player
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 12,
                ),
                child: Column(
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                          size: 28,
                        ),
                        Icon(
                          Icons.favorite_border,
                          color: Colors.white,
                          size: 28,
                        ),
                      ],
                    ),
                    const SizedBox(height: 22),

                    // Album artwork
                    Container(
                      width: 175,
                      height: 175,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24),
                        gradient: const LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Color(0xFFE1BEE7),
                            Color(0xFF9575CD),
                            Color(0xFF4527A0),
                          ],
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withAlpha(70),
                            blurRadius: 20,
                            offset: const Offset(0, 8),
                          ),
                        ],
                      ),
                      child: const Icon(
                        Icons.nights_stay,
                        size: 90,
                        color: Colors.white,
                      ),
                    ),

                    const SizedBox(height: 16),
                    const Text(
                      'King Of The Fall',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 5),
                    const Text(
                      'The Weeknd',
                      style: TextStyle(
                        fontSize: 17,
                        color: Color(0xFFD1C4E9),
                      ),
                    ),

                    const SizedBox(height: 12),

                    // Song progress
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        activeTrackColor: const Color(0xFFCE93D8),
                        inactiveTrackColor: Colors.white24,
                        thumbColor: Colors.white,
                        trackHeight: 4,
                        thumbShape: const RoundSliderThumbShape(
                          enabledThumbRadius: 6,
                        ),
                      ),
                      child: Slider(
                        value: 0.4,
                        onChanged: (value) {},
                      ),
                    ),

                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '1:48',
                          style: TextStyle(color: Colors.white70),
                        ),
                        Text(
                          '3:56',
                          style: TextStyle(color: Colors.white70),
                        ),
                      ],
                    ),

                    const SizedBox(height: 10),

                    // Playback controls
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(
                          Icons.shuffle,
                          color: Color(0xFFD1C4E9),
                          size: 25,
                        ),
                        Icon(
                          Icons.skip_previous,
                          color: Colors.white,
                          size: 38,
                        ),
                        CircleAvatar(
                          radius: 30,
                          backgroundColor: Color(0xFF9575CD),
                          child: Icon(
                            Icons.pause,
                            color: Colors.white,
                            size: 35,
                          ),
                        ),
                        Icon(
                          Icons.skip_next,
                          color: Colors.white,
                          size: 38,
                        ),
                        Icon(
                          Icons.repeat,
                          color: Color(0xFFD1C4E9),
                          size: 25,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            // Expandable and scrollable song list
            DraggableScrollableSheet(
              controller: sheetController,
              initialChildSize: 0.30,
              minChildSize: 0.20,
              maxChildSize: 0.50,
              builder: (context, scrollController) {
                return Container(
                  decoration: const BoxDecoration(
                    color: Color(0xFFF0E8FF),
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(30),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 15,
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      const SizedBox(height: 12),

                      // Drag handle
                      GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onVerticalDragStart: startHandleDrag,
                        onVerticalDragUpdate: updateHandleDrag,
                        child: SizedBox(
                          width: double.infinity,
                          height: 18,
                          child: Center(
                            child: Container(
                              width: 45,
                              height: 5,
                              decoration: BoxDecoration(
                                color: const Color(0xFF9575CD),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ),
                      ),

                      const Padding(
                        padding: EdgeInsets.fromLTRB(22, 14, 22, 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Song List',
                              style: TextStyle(
                                fontSize: 23,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF311B70),
                              ),
                            ),
                            Icon(
                              Icons.search,
                              color: Color(0xFF512DA8),
                              size: 28,
                            ),
                          ],
                        ),
                      ),

                      // The list scrolls independently of the handle.
                      Expanded(
                        child: ListView.builder(
                          controller: scrollController,
                          itemCount: songs.length,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 14,
                          ),
                          itemBuilder: (context, index) {
                            return Container(
                              margin: const EdgeInsets.only(bottom: 5),
                              decoration: BoxDecoration(
                                color: index == 0
                                    ? const Color(0xFFD8C5FA)
                                    : Colors.transparent,
                                borderRadius: BorderRadius.circular(14),
                              ),
                              child: ListTile(
                                leading: Container(
                                  width: 48,
                                  height: 48,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    gradient: const LinearGradient(
                                      colors: [
                                        Color(0xFFB39DDB),
                                        Color(0xFF512DA8),
                                      ],
                                    ),
                                  ),
                                  child: const Icon(
                                    Icons.music_note,
                                    color: Colors.white,
                                  ),
                                ),
                                title: Text(
                                  songs[index],
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xFF311B70),
                                  ),
                                ),
                                subtitle: const Text(
                                  'The Weeknd',
                                  style: TextStyle(
                                    color: Color(0xFF7E65B5),
                                  ),
                                ),
                                trailing: Icon(
                                  index == 0
                                      ? Icons.equalizer
                                      : Icons.more_vert,
                                  color: const Color(0xFF7652B5),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
