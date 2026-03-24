import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SlideInfo {
  final String title;
  final String caption;
  final String imageUrl;

  const SlideInfo({
    required this.title,
    required this.caption,
    required this.imageUrl,
  });
}

final slides = <SlideInfo>[
  SlideInfo(
    title: "Look for the food",
    caption:
        "Mollit laboris eiusmod quis enim velit culpa eu ipsum irure laborum Lorem ex laborum.",
    imageUrl: "assets/images/1.png",
  ),
  SlideInfo(
    title: "We deliver the food",
    caption: "Proident nisi mollit duis officia in non Lorem ipsum.",
    imageUrl: "assets/images/2.png",
  ),
  SlideInfo(
    title: "Enjoy the food",
    caption: "Ullamco amet et dolor irure qui anim.",
    imageUrl: "assets/images/3.png",
  ),
];

class AppTutorialScreen extends StatefulWidget {
  static const String name = 'tutorial_screen';

  const AppTutorialScreen({super.key});

  @override
  State<AppTutorialScreen> createState() => _AppTutorialScreenState();
}

class _AppTutorialScreenState extends State<AppTutorialScreen> {

  final PageController pageViewController = PageController();
  bool endReached = false;

  @override
  void initState() {
    super.initState();
    pageViewController.addListener(() {
      final page = pageViewController.page ?? 0;
      if (!endReached && page >= slides.length - 1.5) {  
        setState(() {
          endReached = true;
        });
      }
      //print(pageViewController.page);
    });
  }


@override
  void dispose() {
    pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView(
            controller: pageViewController,
            physics:
                const BouncingScrollPhysics(), //the same behaviour on both iOS and Android
            children: slides
                .map(
                  (slideData) => _Slide(
                    title: slideData.title,
                    caption: slideData.caption,
                    imageUrl: slideData.imageUrl,
                  ),
                )
                .toList(),
          ),

          Positioned(
            right: 20,
            top: 50,
            child: TextButton(
              onPressed: () => context.pop(),
              child: const Text("Skip"),
            ),
          ),

          endReached ? Positioned(
            bottom: 20,
            right: 20,
            child: FadeInRight(
              delay: const Duration(seconds: 1),
              from: 15,
              child: FilledButton(
                onPressed: () => context.pop(),
                child: const Text("Next"),
              ),
            ),
          ) : SizedBox(),
        ],
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final String title;
  final String caption;
  final String imageUrl;

  const _Slide({
    required this.title,
    required this.caption,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.titleLarge;
    final captionStyle = Theme.of(context).textTheme.bodySmall;

    return Padding(
      padding: const EdgeInsets.all(30),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(image: AssetImage(imageUrl)),
            const SizedBox(height: 20),
            Text(title, style: titleStyle),
            const SizedBox(height: 20),
            Text(caption, style: captionStyle),
          ],
        ),
      ),
    );
  }
}
