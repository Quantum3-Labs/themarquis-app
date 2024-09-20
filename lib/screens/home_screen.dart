import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:marquis_v2/dialog/deposit_dialog.dart';
import 'package:marquis_v2/providers/app_state.dart';
import 'package:marquis_v2/providers/user.dart';
import 'package:marquis_v2/router/route_path.dart';
import 'package:marquis_v2/dialog/auth_dialog.dart';

class HomePath extends AppRoutePath {
  @override
  String getRouteInformation() {
    return '/';
  }
}

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final user = ref.read(userProvider);
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: user == null
                  ? () {
                      showDialog(
                          context: context, builder: (c) => const AuthDialog());
                    }
                  : () {
                      //go to profile page
                    },
              child: Row(
                children: [
                  user == null
                      ? Icon(
                          Icons.account_circle,
                          size: 25,
                        )
                      : const CircleAvatar(
                          radius: 15,
                          backgroundImage: AssetImage(
                            'assets/images/avatar.png',
                          ), // Add your avatar image in assets folder
                          backgroundColor: Colors.transparent,
                        ),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    user == null ? "LOGIN" : "user.email",
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall!
                        .copyWith(fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 18,
                  child: Image.asset('assets/images/member.png'),
                ),
                const SizedBox(width: 5),
                const Text(
                  "300",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(width: 15),
                SvgPicture.asset(
                  "assets/svg/STRK_logo.svg",
                  width: 19,
                ),
                const SizedBox(width: 5),
                Text(
                  "300",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(width: 10),
                GestureDetector(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (c) {
                          return const DepositDialog();
                        });
                  },
                  child: Icon(
                    Icons.add,
                    size: 24,
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ],
        ),
        actions: [],
      ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 230.0,
            flexibleSpace: FlexibleSpaceBar(
              expandedTitleScale: 1.5,
              centerTitle: false,
              titlePadding:
                  const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
              title: const Text(
                'Games',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset('assets/images/banner.png',
                      fit: BoxFit.cover), // Replace with the actual asset
                  Container(color: Colors.black54),
                ],
              ),
            ),
            pinned: true,
            floating: true,
          ),
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'New Release',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              child: SingleChildScrollView(
                child: Row(
                  children: [
                    GameCard(
                      title: 'Ludo',
                      gameType: 'Dice Game',
                      subtitle: 'Best Ludo game ever...',
                      imagePath:
                          'assets/images/ludo.png', // Replace with the actual asset
                      isActive: true,
                      isPopular: true,
                      onPlay: () {
                        if (!ref.read(appStateProvider).isAuth) {
                          showDialog(
                              context: context,
                              builder: (ctx) => const AuthDialog());
                          return;
                        }
                        ref.read(appStateProvider.notifier).selectGame("ludo");
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Coming Soon',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            sliver: SliverToBoxAdapter(
              child: SizedBox(
                height: 320,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    if (index == 0) {
                      return const GameCard(
                        title: 'Yahtzee',
                        subtitle: 'Interesting game comming soom...',
                        gameType: 'Dice game',
                        imagePath: 'assets/images/yahtzee.png',
                        isActive: false,
                        isPopular: false,
                      );
                    } else {
                      return const GameCard(
                        title: '6 nimmt',
                        subtitle: 'Interesting game comming soom...',
                        gameType: 'Card Game',
                        imagePath:
                            'assets/images/6nimmt.png', // Replace with the actual asset
                        isActive: false,
                        isPopular: false,
                      );
                    }
                  },
                  itemCount: 2,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class GameCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String gameType;
  final String imagePath;
  final bool isActive;
  final bool isPopular;
  final Function()? onPlay;

  const GameCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.gameType,
    required this.imagePath,
    required this.isActive,
    required this.isPopular,
    this.onPlay,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Card(
        elevation: 8,
        child: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
          width: 220,
          clipBehavior: Clip.hardEdge,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              FittedBox(
                clipBehavior: Clip.hardEdge,
                child: Image.asset(
                  imagePath,
                  width: 220,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ), // Replace with the actual asset
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: MyChip(
                          title: gameType,
                          icon: FontAwesomeIcons.dice,
                          isLightColor: true,
                          color: Theme.of(context).colorScheme.primary,
                          iconPadding: 8,
                        ),
                      ),
                      if (isPopular)
                        const Padding(
                          padding: EdgeInsets.all(4.0),
                          child: MyChip(
                            title: 'Hot',
                            icon: Icons.local_fire_department,
                            isLightColor: false,
                            color: Colors.red,
                          ),
                        ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            title,
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(fontWeight: FontWeight.w800),
                          ),
                        ),
                        if (isActive)
                          const Padding(
                            padding: EdgeInsets.only(left: 8.0),
                            child: MyChip(
                              title: '300+ Players',
                              icon: Icons.people,
                              isLightColor: false,
                              color: Colors.transparent,
                            ),
                          ),
                      ],
                    ),
                  ),
                ],
              ),
              if (isActive)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(
                        width: 1.8,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7.5),
                      ),
                    ),
                    onPressed: () {
                      if (onPlay != null) {
                        onPlay!();
                      }
                    },
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'PLAY',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class MyChip extends StatelessWidget {
  const MyChip({
    super.key,
    required this.title,
    required this.icon,
    required this.color,
    required this.isLightColor,
    this.iconPadding = 4,
  });
  final IconData icon;
  final String title;
  final Color color;
  final bool isLightColor;
  final double iconPadding;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(8)),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(0, 0, iconPadding, 0),
            child: Icon(
              icon,
              color: isLightColor
                  ? Theme.of(context).colorScheme.onPrimary
                  : Theme.of(context).colorScheme.onSurface,
              size: 15,
            ),
          ),
          Text(
            title,
            style: TextStyle(
              color: isLightColor
                  ? Theme.of(context).colorScheme.onPrimary
                  : Theme.of(context).colorScheme.onSurface,
              fontSize: 11,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
