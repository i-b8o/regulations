import 'package:flutter/material.dart';

class ParagraphAppBar extends StatelessWidget {
  const ParagraphAppBar({
    Key? key,
    required this.totalChapters, required this.controller,
  }) : super(key: key);
  final int totalChapters;
 final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    Color? foregroundColor = Theme.of(context).appBarTheme.foregroundColor;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // AppBarBack(foregroundColor: foregroundColor),
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
                // controller.previousPage(
                //     duration: const Duration(seconds: 1),
                //     curve: Curves.linear);
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
                // controller.nextPage(
                //     duration: const Duration(seconds: 1),
                //     curve: Curves.easeInOut);
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
