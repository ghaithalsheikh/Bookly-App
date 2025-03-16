import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CustomShimmerListView extends StatelessWidget {
  const CustomShimmerListView({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return ListView.builder(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      itemCount: 3,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              Shimmer.fromColors(
                baseColor: Colors.grey,
                highlightColor: Colors.grey[600]!,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Container(
                    height: screenHeight * 0.18,
                    width: screenWidth * 0.25,
                    color: Colors.orange,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Column(
                  children: [
                    Shimmer.fromColors(
                      baseColor: Colors.grey,
                      highlightColor: Colors.grey[600]!,
                      child: Container(
                        height: screenHeight * 0.025,
                        width: screenWidth * 0.58,
                        color: Colors.orange,
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.04),
                    Shimmer.fromColors(
                      baseColor: Colors.grey,
                      highlightColor: Colors.grey[600]!,
                      child: Container(
                        height: screenHeight * 0.025,
                        width: screenWidth * 0.58,
                        color: Colors.orange,
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.04),
                    Shimmer.fromColors(
                      baseColor: Colors.grey,
                      highlightColor: Colors.grey[600]!,
                      child: Container(
                        height: screenHeight * 0.025,
                        width: screenWidth * 0.58,
                        color: Colors.orange,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
