import 'package:flutter/material.dart';
import 'package:spotify/constants/colors.dart';
import 'package:spotify/data/data.dart';
import 'package:spotify/view/top_hits/top_hits.dart';
import 'package:spotify/view/tab/widgets/custom_title.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(16),
        color: const Color(0x00000326),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 54),
            const WelcomeTitle(title: 'Discover', fontSize: 50),
            const SizedBox(height: 32),
            Row(
              children: [
                Icon(Icons.electric_bolt_outlined, color: ColorConstants.primaryColor),
                const SizedBox(width: 18),
                RichText(
                  text: TextSpan(
                    text: 'Weakly ',
                    style: TextStyle(color: ColorConstants.primaryColor, fontSize: 18, fontWeight: FontWeight.w600),
                    children: const [
                      TextSpan(
                        text: ' Music',
                        style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            SizedBox(
              height: 160,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: slider.length,
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, int index) {
                  final slid = slider[index];
                  return Column(
                    children: [
                      Container(
                        height: 125,
                        width: 240,
                        margin: const EdgeInsets.symmetric(horizontal: 8),
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(15),
                          image: DecorationImage(
                            image: AssetImage(slid['image']),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        slid['title'],
                        style: TextStyle(
                          color: ColorConstants.starterWhite,
                          fontSize: 11,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            const SizedBox(height: 16),
            const CustomTitle(title: 'Featured Playlists'),
            const SizedBox(height: 12),
            SizedBox(
              height: 220,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: topMixes.length,
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, int index) {
                  final topMix = topMixes[index];
                  return GestureDetector(
                    onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const TopHits())),
                    child: Container(
                      decoration: BoxDecoration(
                        color: ColorConstants.cardBackGroundColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: const EdgeInsets.only(right: 15, left: 15, top: 15, bottom: 0),
                      margin: const EdgeInsets.all(4),
                      width: 160,
                      height: 195,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 113,
                            width: 125,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              image: DecorationImage(
                                image: AssetImage(topMix['image']),
                                fit: BoxFit.cover,
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 7,
                                  height: 24,
                                  decoration: BoxDecoration(
                                    color: hexToColor(topMix['color']),
                                  ),
                                ),
                                const SizedBox(height: 12),
                                Container(
                                  height: 8,
                                  decoration: BoxDecoration(
                                    color: hexToColor(topMix['color']),
                                    borderRadius: const BorderRadius.only(
                                      bottomLeft: Radius.circular(15),
                                      bottomRight: Radius.circular(15),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            topMix['title'],
                            style: TextStyle(
                              color: ColorConstants.starterWhite,
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            topMix['description'],
                            style: TextStyle(
                              color: ColorConstants.starterWhite,
                              fontSize: 11,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 12),
            const CustomTitle(title: 'Artists'),
            const SizedBox(height: 12),
            SizedBox(
              height: 100,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: artists.length,
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, int index) {
                  final artist = artists[index];
                  return Column(
                    children: [
                      CircleAvatar(
                        radius: 40,
                        backgroundImage: AssetImage(artist['image']),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        artist['name'],
                        style: TextStyle(
                          color: ColorConstants.starterWhite,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            const SizedBox(height: 12),
            const CustomTitle(title: 'Top Charts'),
            const SizedBox(height: 24),
            SizedBox(
              height: 195,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: topCharts.length,
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, int index) {
                  final chart = topCharts[index];
                  return Container(
                    width: 155,
                    padding: const EdgeInsets.only(right: 15, left: 15, top: 15, bottom: 0),
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    decoration: BoxDecoration(
                      color: ColorConstants.cardBackGroundColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 125,
                          width: 125,
                          child: Image.asset(chart['image']),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          chart['title'],
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          chart['artist'],
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: ColorConstants.starterWhite,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 12),
            const CustomTitle(title: 'New Releases'),
            const SizedBox(height: 24),
            SizedBox(
              height: 195,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: newReleases.length,
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, int index) {
                  final release = newReleases[index];
                  return Container(
                    width: 155,
                    padding: const EdgeInsets.only(right: 15, left: 15, top: 15, bottom: 0),
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    decoration: BoxDecoration(
                      color: ColorConstants.cardBackGroundColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 125,
                          width: 125,
                          child: Image.asset(release['image']),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          release['title'],
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          release['artist'],
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: ColorConstants.starterWhite,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 12),
            const CustomTitle(title: 'Recommended for You'),
            const SizedBox(height: 24),
            SizedBox(
              height: 195,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: recommendations.length,
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, int index) {
                  final recommendation = recommendations[index];
                  return Container(
                    width: 155,
                    padding: const EdgeInsets.only(right: 15, left: 15, top: 15, bottom: 0),
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    decoration: BoxDecoration(
                      color: ColorConstants.cardBackGroundColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 125,
                          width: 125,
                          child: Image.asset(recommendation['image']),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          recommendation['title'],
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          recommendation['artist'],
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: ColorConstants.starterWhite,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 12),
            const CustomTitle(title: 'Recently Played'),
            const SizedBox(height: 24),
            SizedBox(
              height: 195,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: recentlyPlayed.length,
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, int index) {
                  final track = recentlyPlayed[index];
                  return Container(
                    width: 155,
                    padding: const EdgeInsets.only(right: 15, left: 15, top: 15, bottom: 0),
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    decoration: BoxDecoration(
                      color: ColorConstants.cardBackGroundColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 125,
                          width: 125,
                          child: Image.asset(track['image']),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          track['title'],
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          track['artist'],
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: ColorConstants.starterWhite,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class WelcomeTitle extends StatelessWidget {
  final String title;
  final double fontSize;

  const WelcomeTitle({
    super.key,
    required this.title,
    this.fontSize = 24,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        color: Colors.white,
        fontSize: fontSize,
        fontWeight: FontWeight.w700,
      ),
    );
  }
}