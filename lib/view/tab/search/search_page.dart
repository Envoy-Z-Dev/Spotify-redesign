import 'package:flutter/material.dart';
import 'package:spotify/constants/colors.dart';
import 'package:spotify/data/data.dart';
import 'package:spotify/view/tab/widgets/custom_title.dart';
import 'package:spotify/view/tab/widgets/welcome_title.dart';

class BrowseCard extends StatelessWidget {
  const BrowseCard({
    super.key, required this.title, required this.color1, required this.color2,
  });

  final String title;
  final String color1;
  final String color2;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      width: size.width / 2.25,
      height: 90,
      padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: LinearGradient(
          colors: [
            hexToColor(color1),
            hexToColor(color2),
          ]
        )
      ),
      child: Text(title, style: const TextStyle(
        color: Colors.white,
        fontSize: 16,
        fontWeight: FontWeight.w700
      )),
    );
  }
}

class PodCast extends StatelessWidget {
  const PodCast({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: podCast.length,
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, int index) {
          final podcast = podCast[index];

          return Container(
            decoration: BoxDecoration(
              color: ColorConstants.cardBackGroundColor,
              borderRadius: BorderRadius.circular(10)
            ),
            padding: const EdgeInsets.only(right: 15, left: 15, top: 15, bottom: 0),
            margin: const EdgeInsets.all(4),
            width: 155,
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
                      image: AssetImage(podcast['image']),
                      fit: BoxFit.cover
                    )
                  ),
                ),
                const SizedBox(height: 8,),
                Text(podcast['title'], style: TextStyle(
                  color: ColorConstants.starterWhite,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                )),
                const SizedBox(height: 8,),
                Text(podcast['description'], style: TextStyle(
                  color: ColorConstants.starterWhite,
                  fontSize: 11,
                  fontWeight: FontWeight.w400,
                ))
              ],
            ),
          );
      }),
    );
  }
}

class SearchInput extends StatelessWidget {
  const SearchInput({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: const TextStyle(
        color: Colors.white,
        fontSize: 11
      ),
      decoration: InputDecoration(
        filled: true,
        fillColor: ColorConstants.cardBackGroundColor,
        hintText: 'Search',
        hintStyle: TextStyle(
          color: ColorConstants.inputHintColor,
          fontSize: 11
        ),
        prefixIcon: Icon(Icons.search, color: !FocusScope.of(context).isFirstFocus ? Colors.white : ColorConstants.primaryColor),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: ColorConstants.primaryColor
          )
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 54,),
              const WelcomeTitle(title: 'Search'),
              const SizedBox(height: 32,),
              const SearchInput(),
              const SizedBox(height: 13,),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: searchList.map((search) => Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: ColorConstants.cardBackGroundColor,
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: Text(search, style: const TextStyle(
                    color: Colors.white,
                    fontSize: 11,
                    fontWeight: FontWeight.w400
                  ),)
                ),).toList()
              ),
              const SizedBox(height: 24,),
              const CustomTitle(title: 'Podcast\'s'),
              const SizedBox(height: 13,),
              const PodCast(),
              const SizedBox(height: 12,),
              const CustomTitle(title: 'Browse all'),
              const SizedBox(height: 13,),
              const Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  BrowseCard(
                    title: 'Made For You',
                    color1: '#E02FCF',
                    color2: '#00C188'
                  ),
                  BrowseCard(
                    title: 'Charts',
                    color1: '#0A3CEC',
                    color2: '#4DD4AC'
                  ),
                  BrowseCard(
                    title: 'Discover',
                    color1: '#0A3CEC',
                    color2: '#D9DD01'
                  ),
                  BrowseCard(
                    title: 'New Release',
                    color1: '#0E31AE',
                    color2: '#DD1010'
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}