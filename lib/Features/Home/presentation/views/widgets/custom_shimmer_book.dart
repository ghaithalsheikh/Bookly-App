import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CustomShimmerBook extends StatelessWidget {
  const CustomShimmerBook({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 3,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Shimmer.fromColors(
              baseColor: Colors.grey,
              highlightColor: Colors.grey[600]!,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Container(
                  width: 120,
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
