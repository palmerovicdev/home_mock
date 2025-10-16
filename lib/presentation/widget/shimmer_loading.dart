import 'package:flutter/material.dart';

import '../../core/constants/constants.dart';
import '../../core/locator.dart';

class ShimmerLoading extends StatefulWidget {
  final Widget child;
  final bool isLoading;

  const ShimmerLoading({
    super.key,
    required this.child,
    this.isLoading = true,
  });

  @override
  State<ShimmerLoading> createState() => _ShimmerLoadingState();
}

class _ShimmerLoadingState extends State<ShimmerLoading>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: AppDurations.shimmerAnimation,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!widget.isLoading) {
      return widget.child;
    }

    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return ShaderMask(
          blendMode: BlendMode.srcATop,
          shaderCallback: (bounds) {
            return LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                theme.bgLight.withOpacity(0.3),
                theme.bgLight.withOpacity(0.8),
                theme.bgLight.withOpacity(0.3),
              ],
              stops: [
                0.0,
                _controller.value,
                1.0,
              ],
            ).createShader(bounds);
          },
          child: widget.child,
        );
      },
    );
  }
}

class HomeCardSkeleton extends StatelessWidget {
  const HomeCardSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return ShimmerLoading(
      child: ClipRRect(
        borderRadius: AppRadius.borderXxxl,
        child: Container(
          color: theme.bgLight,
          child: Stack(
            fit: StackFit.expand,
            children: [
              Container(color: theme.bgLight),
              Positioned(
                top: 10,
                left: 10,
                child: Container(
                  width: 100,
                  height: 28,
                  decoration: BoxDecoration(
                    color: theme.border,
                    borderRadius: AppRadius.borderLg,
                  ),
                ),
              ),
              Positioned(
                top: 10,
                right: 10,
                child: Container(
                  width: 28,
                  height: 28,
                  decoration: BoxDecoration(
                    color: theme.border,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
              Positioned(
                left: 8,
                right: 8,
                bottom: 12,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: theme.borderMuted,
                    borderRadius: AppRadius.borderLg,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: double.infinity,
                        height: 14,
                        decoration: BoxDecoration(
                          color: theme.border,
                          borderRadius: AppRadius.borderSm,
                        ),
                      ),
                      AppSpacing.gapSm,
                      Container(
                        width: 100,
                        height: 12,
                        decoration: BoxDecoration(
                          color: theme.border,
                          borderRadius: AppRadius.borderSm,
                        ),
                      ),
                      AppSpacing.gapSm,
                      Container(
                        width: 60,
                        height: 14,
                        decoration: BoxDecoration(
                          color: theme.border,
                          borderRadius: AppRadius.borderSm,
                        ),
                      ),
                    ],
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
