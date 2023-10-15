import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerEffect extends StatelessWidget {
  const ShimmerEffect({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: ListTile(
            title: Container(
              height: 40,
              width: double.infinity,
              color: Colors.white,
            ),
            subtitle: Container(
              height: 20,
              width: double.infinity,
              color: Colors.white,
            ),
          ),
        );
      },
    );
  }
}
