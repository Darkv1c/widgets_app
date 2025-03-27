import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SlideInfo {
  final String title;
  final String description;
  final String imageUrl;

  const SlideInfo({
    required this.title,
    required this.description,
    required this.imageUrl,
  });
}

const List<SlideInfo> slides = [
  SlideInfo(
    title: 'Welcome to the App',
    description: 'Discover new features and functionalities.',
    imageUrl: 'assets/images/1.png',
  ),
  SlideInfo(
    title: 'Stay Organized',
    description: 'Keep track of your tasks and activities easily.',
    imageUrl: 'assets/images/2.png',
  ),
  SlideInfo(
    title: 'Achieve Your Goals',
    description: 'Set goals and accomplish them step by step.',
    imageUrl: 'assets/images/3.png',
  ),
];

class TutorialScreen extends StatefulWidget {
  final name = 'Tutorial Screen';
  const TutorialScreen({super.key});

  @override
  State<TutorialScreen> createState() => _TutorialScreenState();
}

class _TutorialScreenState extends State<TutorialScreen> {
  late final PageController pageViewController;
  bool lastPageReached = false;

  @override
  void initState() {
    super.initState();
    pageViewController = PageController();
    pageViewController.addListener(() {
      final currentPage = pageViewController.page ?? 0;
      if (currentPage > (slides.length - 1.5)) lastPageReached = true;

      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: pageViewController,
            physics: BouncingScrollPhysics(),
            children: [for (final slideData in slides) _Slide(slideData)],
          ),
          Positioned(
            bottom: 40,
            right: 40,
            child: FilledButton(
              onPressed: () => context.pop(),
              child: Text('Go Home'),
            ),
          ),
        ],
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final SlideInfo _slideInfo;

  const _Slide(this._slideInfo);

  @override
  Widget build(BuildContext context) {
    final TextTheme(titleLarge: titleStyle, bodySmall: captionStyle) =
        Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Center(
        child: Column(
          spacing: 20,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(_slideInfo.imageUrl),
            Text(_slideInfo.title, style: titleStyle),
            Text(_slideInfo.description, style: captionStyle),
          ],
        ),
      ),
    );
  }
}
