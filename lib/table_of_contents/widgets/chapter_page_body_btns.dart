import 'package:flutter/material.dart';



class ChapterPageBodyBtns extends StatelessWidget {
  const ChapterPageBodyBtns({
    Key? key,
    required this.first,
    required this.pageController,
    required this.last,
  }) : super(key: key);

  final bool first;
  final PageController pageController;
  final bool last;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          !first
              ? IconButton(
                  onPressed: () {
                    pageController.previousPage(
                        duration: const Duration(seconds: 1),
                        curve: Curves.ease);
                  },
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color:  Theme.of(context).iconTheme.color,
                  ))
              : Container(),
          !last
              ? IconButton(
                  onPressed: () {
                    pageController.nextPage(
                        duration: const Duration(seconds: 1),
                        curve: Curves.ease);
                  },
                  icon: Icon(
                    Icons.arrow_forward_ios,
                    color:  Theme.of(context).iconTheme.color,
                  ))
              : Container()
        ],
      ),
    );
  }
}
