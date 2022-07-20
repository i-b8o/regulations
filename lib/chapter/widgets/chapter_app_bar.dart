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


    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () {
            Navigator.of(context).pushNamedAndRemoveUntil(
                '/tableOfContents', (Route<dynamic> route) => false);
          },
          icon: Icon(
            Icons.arrow_back,
            size: Theme.of(context).appBarTheme.iconTheme!.size,
            color: Theme.of(context).appBarTheme.iconTheme!.color,
          ),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () {
                int? pageNum = int.tryParse(controller.text);
                if (pageNum == 1) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: const Text('Это первая страница!'),
                  ));
                  return;
                }
                pageController.previousPage(
                    duration: const Duration(seconds: 1), curve: Curves.ease);
              },
              icon: Icon(
                Icons.arrow_back_ios,
                size: Theme.of(context).iconTheme.size,
                color: Theme.of(context).iconTheme.color,
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
                              '${pageNum}-ой страницы не существует,  в документе всего $totalChapters страниц!'),
                        ));
                        return;
                      } else if (pageNum < 1) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content:
                              Text('${pageNum}-ой страницы не существует!'),
                        ));
                        return;
                      }

                      pageController.animateToPage(pageNum - 1,
                          duration: const Duration(seconds: 1),
                          curve: Curves.easeOut);
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
                style: Theme.of(context).appBarTheme.toolbarTextStyle,
                children: <InlineSpan>[
                  TextSpan(
                    text: '$totalChapters',
                    style: TextStyle(color: Theme.of(context).appBarTheme.titleTextStyle!.color , fontWeight: FontWeight.w400),
                  )
                ])),
            IconButton(
              onPressed: () {
                int? pageNum = int.tryParse(controller.text);
                if (pageNum == null) {
                  return;
                }
                if (pageNum == totalChapters) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text('Это последняя страница!'),
                  ));
                  return;
                }
                pageController.nextPage(
                    duration: const Duration(seconds: 1), curve: Curves.ease);
              },
              icon: Icon(
                Icons.arrow_forward_ios,
                size: Theme.of(context).iconTheme.size,
                color: Theme.of(context).iconTheme.color,
              ),
            )
          ],
        )
      ],
    );
  }
}
