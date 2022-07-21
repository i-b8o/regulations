import 'package:flutter/material.dart';

import 'chapter_app_bar_pagination.dart';

class ParagraphAppBar extends StatelessWidget {
  const ParagraphAppBar({
    Key? key,
    required this.totalChapters,
    required this.controller,
    required this.pageController,
  }) : super(key: key);
  final int totalChapters;
  final TextEditingController controller;
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () {
            Navigator.of(context).pushNamedAndRemoveUntil(
                '/', (Route<dynamic> route) => false);
          },
          icon: Icon(
            Icons.arrow_back,
            size: Theme.of(context).appBarTheme.iconTheme!.size,
            color: Theme.of(context).appBarTheme.iconTheme!.color,
          ),
        ),
        ChapterAppBarPagination(
            controller: controller,
            pageController: pageController,
            totalChapters: totalChapters)
      ],
    );
  }
}
