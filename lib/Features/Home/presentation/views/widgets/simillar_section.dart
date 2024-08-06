import 'package:bookly_app/Features/Home/presentation/views/widgets/simillar_books_listview.dart';
import 'package:bookly_app/core/utils/styles.dart';
import 'package:flutter/material.dart';

class SimllarSection extends StatelessWidget {
  const SimllarSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'You can also like',
              style: Styles.textStyle16.copyWith(fontWeight: FontWeight.w600),
            ),
          ),
        ),
        const SizedBox(height: 20),
        const SimillarBooksListView(),
      ],
    );
  }
}
