import 'package:bookly_app/Features/Search/presentation/view_models/search_books_cubit/search_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomSearchTextFeild extends StatefulWidget {
  const CustomSearchTextFeild({super.key});

  @override
  State<CustomSearchTextFeild> createState() => _CustomSearchTextFeildState();
}

class _CustomSearchTextFeildState extends State<CustomSearchTextFeild> {
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onSubmitted: (value) {
        BlocProvider.of<SearchBooksCubit>(context)
            .fetchSearchBook(searchName: value);
      },
      decoration: InputDecoration(
        enabledBorder: buildOutlineInputBorder(),
        focusedBorder: buildOutlineInputBorder(),
        hintText: 'Search',
        suffixIcon: IconButton(
            onPressed: () {
              BlocProvider.of<SearchBooksCubit>(context)
                  .fetchSearchBook(searchName: controller.text);
            },
            icon: const Icon(FontAwesomeIcons.magnifyingGlass)),
      ),
    );
  }

  OutlineInputBorder buildOutlineInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: Colors.grey),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
