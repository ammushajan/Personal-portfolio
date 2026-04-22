import 'package:flutter/material.dart';

import 'package:ammu_portfolio/themes/colors.dart';
import 'package:ammu_portfolio/widgets/common/skeleton_loader.dart';

class HomePageSkeleton extends StatelessWidget {
  const HomePageSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final double descriptionWidth =
        screenSize.width > 850 ? screenSize.width * 0.5 : screenSize.width;

    return Padding(
      padding: const EdgeInsets.all(20),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            const SkeletonLoader(width: 320, height: 52),
            const SizedBox(height: 20),
            const SkeletonLoader(width: 260, height: 34),
            const SizedBox(height: 20),
            SkeletonLoader(width: descriptionWidth, height: 110),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 20,
              children: const [
                SkeletonLoader(
                  width: 28,
                  height: 28,
                  borderRadius: BorderRadius.all(Radius.circular(14)),
                ),
                SkeletonLoader(
                  width: 28,
                  height: 28,
                  borderRadius: BorderRadius.all(Radius.circular(14)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ProjectsPageSkeleton extends StatelessWidget {
  const ProjectsPageSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SkeletonLoader(width: 180, height: 34),
          SizedBox(height: 20),
          SkeletonLoader(width: 320, height: 20),
          SizedBox(height: 40),
          ProjectListSkeleton(itemCount: 3),
        ],
      ),
    );
  }
}

class ContactPageSkeleton extends StatelessWidget {
  const ContactPageSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final bool isWide = screenSize.width > 850;

    return Container(
      padding: const EdgeInsets.all(24),
      constraints: BoxConstraints(
        minWidth: double.infinity,
        minHeight: screenSize.height,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SkeletonLoader(width: 180, height: 34),
          const SizedBox(height: 20),
          const SkeletonLoader(width: 320, height: 20),
          const SizedBox(height: 50),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: isWide ? screenSize.width * 0.1 : 20,
            ),
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(36),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                color: AppColors.white.withValues(alpha: 0.2),
                border: Border.all(
                  color: AppColors.blackRock.withValues(alpha: 0.2),
                  width: 1,
                ),
              ),
              child: Flex(
                direction: isWide ? Axis.horizontal : Axis.vertical,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SkeletonLoader(width: 260, height: 34),
                      SizedBox(height: 20),
                      SkeletonLoader(width: 240, height: 20),
                      SizedBox(height: 20),
                      SkeletonLoader(width: 240, height: 20),
                      SizedBox(height: 20),
                      SkeletonLoader(width: 240, height: 20),
                      SizedBox(height: 40),
                      Row(
                        spacing: 20,
                        children: [
                          SkeletonLoader(
                            width: 28,
                            height: 28,
                            borderRadius: BorderRadius.all(Radius.circular(14)),
                          ),
                          SkeletonLoader(
                            width: 28,
                            height: 28,
                            borderRadius: BorderRadius.all(Radius.circular(14)),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: isWide ? 0 : 24),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SkeletonLoader(
                        width: isWide ? 360 : screenSize.width * 0.62,
                        height: 50,
                      ),
                      const SizedBox(height: 16),
                      SkeletonLoader(
                        width: isWide ? 360 : screenSize.width * 0.62,
                        height: 50,
                      ),
                      const SizedBox(height: 16),
                      SkeletonLoader(
                        width: isWide ? 360 : screenSize.width * 0.62,
                        height: 120,
                      ),
                      const SizedBox(height: 16),
                      const SkeletonLoader(width: 120, height: 44),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ProjectListSkeleton extends StatelessWidget {
  final int itemCount;

  const ProjectListSkeleton({super.key, this.itemCount = 3});

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final bool isWide = screenSize.width > 850;

    return Column(
      children: List.generate(itemCount, (index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 60),
          child: Flex(
            direction: isWide ? Axis.horizontal : Axis.vertical,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SkeletonLoader(width: 220, height: 30),
                  const SizedBox(height: 8),
                  SkeletonLoader(
                    width: isWide ? screenSize.width * 0.4 : screenSize.width,
                    height: 96,
                  ),
                  const SizedBox(height: 8),
                  const SkeletonLoader(width: 180, height: 20),
                ],
              ),
              SizedBox(height: isWide ? 0 : 16),
              const SkeletonLoader(width: 400, height: 200),
            ],
          ),
        );
      }),
    );
  }
}
