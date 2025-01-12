import 'package:flutter/material.dart';

class CustomDot extends StatelessWidget {
  const CustomDot({super.key, required this.isActive});
  final bool isActive;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      width: isActive ? 32 : 8,
      height: 8,
      decoration: ShapeDecoration(
        color: isActive ? Colors.redAccent : const Color.fromARGB(255, 168, 164, 164),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}

class DotsIndecator extends StatelessWidget {
  const DotsIndecator({super.key, required this.currentIndex});
 final int currentIndex;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
          3,
          (index) =>  Padding(
                padding: const EdgeInsets.only(right: 6),
                child: CustomDot(
                  isActive: index == currentIndex,
                ),
              )),
    );
  }
}