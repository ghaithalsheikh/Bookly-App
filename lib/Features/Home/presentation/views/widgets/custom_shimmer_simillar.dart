import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CustomSshimmerSimillar extends StatelessWidget {
  const CustomSshimmerSimillar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 175,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 6,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8),
            child: Shimmer.fromColors(
              baseColor: Colors.grey,
              highlightColor: Colors.grey[600]!,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Container(
                  width: 105,
                  color: Colors.orange,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
