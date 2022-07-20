import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:focused_menu/focused_menu.dart';
import 'package:focused_menu/modals.dart';
import '../../bloc/chapter_page_bloc.dart';
import 'bloc/chapter_page_body_bloc.dart';
import 'paragraph_nft.dart';
import '../../../constants.dart';

import 'package:regulation_api/regulation_api.dart';

import 'paragraph_table.dart';
import 'paragraph_text.dart';

enum ParagraphClass { right, center, indent, none }

class ParagraphCard extends StatelessWidget {
  const ParagraphCard({
    Key? key,
    required this.ids,
    required this.paragraph,
  }) : super(key: key);
  final Paragraph paragraph;
  final List<int> ids;

  void goTo(BuildContext context, int id) {
    int index = ids.indexOf(id);
    if (index > 0) {
      context.read<ChapterPageBodyBloc>().add(EventLinkPressed(index + 1));
      return;
    }

    context.read<ChapterPageBloc>().add(EventGoToChapter(id: id));
  }

  @override
  Widget build(BuildContext context) {
    ParagraphClass pClass;
    switch (paragraph.paragraphClass) {
      case 'align_right':
        pClass = ParagraphClass.right;
        break;
      case 'align_center':
        pClass = ParagraphClass.center;
        break;
      case 'indent':
        pClass = ParagraphClass.indent;
        break;
      default:
        pClass = ParagraphClass.none;
    }
    ;
    return FocusedMenuHolder(
      menuItems: [
        FocusedMenuItem(
            title: Text("AAAAAAA"),
            onPressed: () {},
            trailingIcon: Icon(Icons.abc))
      ],
      onPressed: () {},
      menuWidth: MediaQuery.of(context).size.width*0.8,
      blurBackgroundColor: Colors.blueGrey[900],
      openWithTap: true,
      menuOffset: 20,
      blurSize: 1,
      menuItemExtent: 40,
      child: Card(
        shadowColor: Colors.transparent,
        color: Constants.bodyColor,
        margin: EdgeInsets.zero,
        child: pClass == ParagraphClass.indent
            ? SizedBox(
                height: 15,
              )
            : buildCard(context, pClass),
      ),
    );
  }

  Container buildCard(BuildContext context, ParagraphClass pClass) {
    return Container(
      child: Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.symmetric(
              horizontal: 8.0,
              vertical: pClass == ParagraphClass.none ? 16.0 : 2.0),
          child: paragraph.isNFT
              ? ParagraphNFT(paragraph: paragraph)
              : paragraph.isTable
                  ? ParagraphTable(paragraph: paragraph)
                  : paragraph.isHTML
                      ? HtmlWidget(
                          paragraph.content,
                          customStylesBuilder: pClass == ParagraphClass.none
                              ? null
                              : (element) {
                                  return {
                                    'text-align': pClass == ParagraphClass.right
                                        ? 'right'
                                        : 'center'
                                  };
                                },
                          onTapUrl: (p0) {
                            int id = int.tryParse(p0) ?? 0;
                            goTo(context, id);
                            return false;
                          },
                        )
                      : ParagraphText(
                          paragraph: paragraph,
                          pClass: pClass,
                        )),
    );
  }
}
