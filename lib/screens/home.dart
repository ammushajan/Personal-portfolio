import 'package:flutter/material.dart';

import 'package:ammu_portfolio/themes/colors.dart';
import 'package:ammu_portfolio/resources/strings.dart';
import 'package:ammu_portfolio/themes/typography.dart';
import 'package:ammu_portfolio/resources/contact.dart';
import 'package:ammu_portfolio/utils/url_launcher.dart';
import 'package:ammu_portfolio/widgets/common/base_layout.dart';
import 'package:ammu_portfolio/widgets/common/page_skeletons.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

///[HomePage] is a widget that represents the home screen of the application.
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 700), () {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return BaseLayout(
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 450),
        switchInCurve: Curves.easeOutCubic,
        switchOutCurve: Curves.easeInCubic,
        child:
            _isLoading
                ? const HomePageSkeleton(key: ValueKey('home-skeleton'))
                : _AnimatedHomeContent(
                  key: const ValueKey('home-content'),
                  screenSize: screenSize,
                ),
      ),
    );
  }
}

class _AnimatedHomeContent extends StatefulWidget {
  final Size screenSize;

  const _AnimatedHomeContent({required this.screenSize, super.key});

  @override
  State<_AnimatedHomeContent> createState() => _AnimatedHomeContentState();
}

class _AnimatedHomeContentState extends State<_AnimatedHomeContent>
    with SingleTickerProviderStateMixin {
  static const int _sectionCount = 4;
  late final AnimationController _controller;
  late final List<Animation<double>> _fades;
  late final List<Animation<Offset>> _slides;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );

    _fades = List.generate(_sectionCount, _buildFadeAnimation);
    _slides = List.generate(_sectionCount, _buildSlideAnimation);

    _controller.forward();
  }

  Animation<double> _buildFadeAnimation(int index) {
    final double start = index * 0.12;
    final double end = (start + 0.45).clamp(0.0, 1.0);
    return CurvedAnimation(
      parent: _controller,
      curve: Interval(start, end, curve: Curves.easeOutCubic),
    );
  }

  Animation<Offset> _buildSlideAnimation(int index) {
    final double start = index * 0.12;
    final double end = (start + 0.45).clamp(0.0, 1.0);
    return Tween<Offset>(begin: const Offset(0, 0.2), end: Offset.zero).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(start, end, curve: Curves.easeOutCubic),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _reveal({required int index, required Widget child}) {
    return FadeTransition(
      opacity: _fades[index],
      child: SlideTransition(position: _slides[index], child: child),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            _reveal(
              index: 0,
              child: Text(
                'Hi! Im ${Strings.firstName} ✨',
                textAlign: TextAlign.center,
                style: Theme.of(
                  context,
                ).textTheme.displayLarge600?.copyWith(color: AppColors.white),
              ),
            ),
            const SizedBox(height: 20),
            _reveal(
              index: 1,
              child: ShaderMask(
                shaderCallback: (Rect bounds) {
                  return LinearGradient(
                    colors: [AppColors.blackRock, AppColors.purplePizzazz],
                  ).createShader(
                    Rect.fromLTWH(0, 0, bounds.width, bounds.height),
                  );
                },
                child: Text(
                  Strings.role,
                  style: Theme.of(
                    context,
                  ).textTheme.headlineMedium600?.copyWith(
                    color: AppColors.white,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            _reveal(
              index: 2,
              child: SizedBox(
                width:
                    widget.screenSize.width > 850
                        ? widget.screenSize.width * 0.5
                        : widget.screenSize.width,
                child: Text(
                  Strings.description,
                  textAlign: TextAlign.center,
                  style: Theme.of(
                    context,
                  ).textTheme.headlineSmall?.copyWith(color: AppColors.white),
                ),
              ),
            ),
            const SizedBox(height: 20),
            _reveal(
              index: 3,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 20,
                children: [
                  IconButton(
                    onPressed: () {
                      UrlLauncher().launchInBrowser(Contact.githubUrl);
                    },
                    constraints: const BoxConstraints(),
                    padding: EdgeInsets.zero,
                    icon: FaIcon(
                      FontAwesomeIcons.github,
                      color: AppColors.white,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      UrlLauncher().launchInBrowser(Contact.linkedInUrl);
                    },
                    constraints: const BoxConstraints(),
                    padding: EdgeInsets.zero,
                    icon: FaIcon(
                      FontAwesomeIcons.linkedin,
                      color: AppColors.white,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
