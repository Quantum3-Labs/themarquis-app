import 'package:flame/game.dart';
import 'package:flame/sprite.dart';
import 'package:flutter/material.dart';
import 'package:marquis_v2/games/ludo/components/player_avatar.dart';

class WaitingRoomScreen extends StatelessWidget {
  const WaitingRoomScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // Top section with title and room ID
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: Column(
              children: [
                Text(
                  'WAITING ROOM',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 60,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 50),
                Text(
                  'Room ID',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 45,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'A028',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 70,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      width: 35,
                    ),
                    Icon(
                      Icons.copy,
                      size: 45,
                    )
                  ],
                ),
              ],
            ),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // _buildPlayerCard(
              //     'Yi Xuan', '100', 'assets/yi_xuan.png'), // Add your own asset
              //main profile
              Column(
                children: [
                  playerAvatarCard(
                    index: 0,
                    size: 350,
                    isSelf: true,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    'VS',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 90,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  //3 other profile

                  Row(
                    children: [
                      playerAvatarCard(
                        index: 1,
                        size: 210,
                        isSelf: false,
                      ),
                      const SizedBox(
                        width: 50,
                      ),
                      playerAvatarCard(
                        index: 2,
                        size: 210,
                        isSelf: false,
                      ),
                      const SizedBox(
                        width: 50,
                      ),
                      playerAvatarCard(
                        index: 3,
                        size: 210,
                        isSelf: false,
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
          // Invite Button
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              // primary: Colors.cyan, // background color
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10),
              child: Text(
                'Invite',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            ),
          ),
          // Bottom Timer Section
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Container(
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.grey[900],
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.arrow_right,
                    color: Colors.white,
                    size: 70,
                  ),
                  Text(
                    '00:30:16',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 45,
                    ),
                  ),
                  Icon(
                    Icons.arrow_left,
                    color: Colors.white,
                    size: 70,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget playerAvatarCard({
    required int index,
    required double size,
    required bool isSelf,
  }) {
    const playerColors = [
      // Add this const
      Color(0xffd04c2f),
      Color(0xff2fa9d0),
      Color(0xffb0d02f),
      Color(0xff2fd06f),
    ];
    List<String> playerNames = [
      "Carlos",
      "Mohdi",
      "Yixuan",
      "Jupeng",
    ];
    return Column(
      children: [
        Container(
          width: size, // Width of the displayed sprite
          height: size, // Height of the displayed sprite
          decoration: BoxDecoration(
            color: playerColors[index], // Background color
            borderRadius: BorderRadius.circular(
                size / 8), // Rounded corners with radius 24
          ),
          child: FittedBox(
            fit: BoxFit.fill,
            child: ClipRect(
              child: Align(
                alignment: index == 1
                    ? Alignment.topLeft
                    : index == 2
                        ? Alignment.topRight
                        : index == 3
                            ? Alignment.bottomLeft
                            : Alignment.bottomRight,
                // widthFactor: 2160 / 4324,
                // heightFactor: 2160 / 4324,
                widthFactor: 0.5,
                heightFactor: 0.5,
                child: Image.asset(
                  'assets/images/avatar_spritesheet.png', // Path to your spritesheet
                  width: 4324, // Full width of the sprite sheet
                  height: 4324, // Full height of the sprite sheet
                  fit: BoxFit.none, // Ensure no scaling occurs
                ),
              ),
            ),
          ),
        ),
        Text(
          playerNames[index],
          style: TextStyle(
            color: Colors.white,
            fontSize: isSelf ? 55 : 40,
          ),
        ),
      ],
    );
  }
}
