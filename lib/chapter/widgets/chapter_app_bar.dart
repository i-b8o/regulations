import 'package:flutter/material.dart';

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
    Color? foregroundColor = Theme.of(context).appBarTheme.foregroundColor;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.arrow_back,
            color: foregroundColor,
          ),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () {
                pageController.previousPage(
                    duration: const Duration(seconds: 1), curve: Curves.ease);
              },
              icon: Icon(
                Icons.arrow_back_ios,
                size: 20,
                color: Color(0XFF447FEB),
              ),
            ),
            Container(
                height: 30,
                width: 30,
                child: TextFormField(
                    onEditingComplete: () {
                      FocusScope.of(context).unfocus();
                      int pageNum = int.tryParse(controller.text) ?? 1;
                      if (pageNum > totalChapters) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(
                              '${pageNum}-ой страницы не существует, всего $totalChapters страниц!'),
                        ));
                        return;
                      } else if (pageNum < 1) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content:
                              Text('${pageNum}-ой страницы не существует!'),
                        ));
                        return;
                      }
                      pageNum++;
                      pageController.animateToPage(pageNum,
                          duration: const Duration(seconds: 1),
                          curve: Curves.linear);
                    },
                    controller: controller,
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.zero,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(7.0),
                      ),
                    ))),
            Text.rich(TextSpan(
                text: ' стр. из ',
                style: TextStyle(
                  color: foregroundColor,
                  fontSize: 18,
                ),
                children: <InlineSpan>[
                  TextSpan(
                    text: '$totalChapters',
                    style: TextStyle(
                        color: Color(0XFF3B4C61),
                        fontSize: 18,
                        fontWeight: FontWeight.w500),
                  )
                ])),
            IconButton(
              onPressed: () {
                pageController.nextPage(
                    duration: const Duration(seconds: 1), curve: Curves.ease);
              },
              icon: Icon(
                Icons.arrow_forward_ios,
                size: 20,
                color: Color(0XFF447FEB),
              ),
            )
          ],
        )
      ],
    );
  }
}
