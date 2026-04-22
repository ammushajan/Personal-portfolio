import 'package:flutter/material.dart';

import 'package:ammu_portfolio/themes/colors.dart';

/// [SkeletonLoader] renders a shimmering placeholder block.
class SkeletonLoader extends StatefulWidget {
  final double? width;
  final double? height;
  final BorderRadius? borderRadius;

  const SkeletonLoader({super.key, this.width, this.height, this.borderRadius});

  @override
  State<SkeletonLoader> createState() => _SkeletonLoaderState();
}

class _SkeletonLoaderState extends State<SkeletonLoader>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final BorderRadius borderRadius =
        widget.borderRadius ?? BorderRadius.circular(8);

    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: ClipRRect(
        borderRadius: borderRadius,
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment(-1.0 + (2.0 * _controller.value), -0.3),
                  end: Alignment(1.0 + (2.0 * _controller.value), 0.3),
                  colors: [
                    AppColors.white.withValues(alpha: 0.08),
                    AppColors.white.withValues(alpha: 0.32),
                    AppColors.white.withValues(alpha: 0.08),
                  ],
                ),
              ),
              child: child,
            );
          },
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: AppColors.white.withValues(alpha: 0.18),
            ),
          ),
        ),
      ),
    );
  }
}
