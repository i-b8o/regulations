import 'package:flutter/material.dart';


class ParagraphAppBar extends StatelessWidget {
  const ParagraphAppBar(
      {Key? key, required this.chapterOrderNum, required this.totalChapters})
      : super(key: key);
  final int chapterOrderNum, totalChapters;
  @override
  Widget build(BuildContext context) {
    Color? foregroundColor = Theme.of(context).appBarTheme.foregroundColor;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // AppBarBack(foregroundColor: foregroundColor),
        IconButton(
          onPressed: () {
            // context.read<HomeBloc>().add(SearchTextFieldActivatedEvent());
          },
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
                // context.read<HomeBloc>().add(SearchTextFieldActivatedEvent());
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
                    initialValue: '$chapterOrderNum',
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.zero,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(7.0),
                      ),
                    ))),
            Text.rich(TextSpan(
                text: ' стр. из ',
                style: TextStyle(color:foregroundColor,fontSize: 18,),
                children: <InlineSpan>[
                  TextSpan(
                    text: '$totalChapters',
                    style: TextStyle(
                        color: Color(0XFF3B4C61),
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  )
                ])),

            IconButton(
              onPressed: () {
                // context.read<HomeBloc>().add(SearchTextFieldActivatedEvent());
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
