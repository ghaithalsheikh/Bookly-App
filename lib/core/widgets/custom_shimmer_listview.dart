import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CustomShimmerListView extends StatelessWidget {
  const CustomShimmerListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
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
                    height: 150,
                    width: 100,
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
                        height: 20,
                        width: 240,
                        color: Colors.orange,
                      ),
                    ),
                    SizedBox(height: 25),
                    Shimmer.fromColors(
                      baseColor: Colors.grey,
                      highlightColor: Colors.grey[600]!,
                      child: Container(
                        height: 20,
                        width: 240,
                        color: Colors.orange,
                      ),
                    ),
                    SizedBox(height: 25),
                    Shimmer.fromColors(
                      baseColor: Colors.grey,
                      highlightColor: Colors.grey[600]!,
                      child: Container(
                        height: 20,
                        width: 240,
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
