import 'package:flutter/material.dart';

import '../../../core/app_colors.dart';
import '../../../core/core.dart';

class ChartWidget extends StatefulWidget {
  final double percent;
  const ChartWidget({required this.percent});
  @override
  _ChartWidgetState createState() => _ChartWidgetState();
}

class _ChartWidgetState extends State<ChartWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  void initAnimation() {
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 100));
    _animation =
        Tween<double>(begin: 0.0, end: widget.percent).animate(_controller);
    _controller.forward();
  }

  @override
  void initState() {
    initAnimation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 80,
        height: 80,
        child: AnimatedBuilder(
          animation: _animation,
          builder: (context, _) => Stack(
            children: [
              Container(
                width: 70,
                height: 70,
                child: CircularProgressIndicator(
                  strokeWidth: 10,
                  value: _animation.value,
                  backgroundColor: AppColors.chartSecondary,
                  valueColor:
                      AlwaysStoppedAnimation<Color>(AppColors.chartPrimary),
                ),
              ),
              Center(
                child: Text(
                  '${(_animation.value * 100).toInt()}%',
                  style: AppTextStyles.heading,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
