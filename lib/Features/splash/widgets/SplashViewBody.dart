


import 'package:flutter/material.dart';

class SplashViewBody extends StatelessWidget {
  const SplashViewBody({
    super.key,
    required Animation<Offset> slidingAnimation,
  }) : _slidingAnimation = slidingAnimation;

  final Animation<Offset> _slidingAnimation;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Center(
          child: Image.asset(
            'assets/images/Stroke 3.png', 
            width: 200,
            height: 200,
          ),
        ),
        const SizedBox(height: 16),
        AnimatedBuilder(
          animation: _slidingAnimation,
          builder: (context, child) {
            return SlideTransition(
              position: _slidingAnimation,
              child: const Text(
                'Catalyst Tech Task', // Replace with your app's tagline.
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
