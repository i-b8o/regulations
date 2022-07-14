import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

import 'package:regulation/paragraph/bloc/paragraph_bloc.dart';
import 'package:regulation_api/regulation_api.dart';
import 'package:regulation_repository/regulation_repository.dart';

class ParagraphPage extends StatelessWidget {
  const ParagraphPage({Key? key, required this.id}) : super(key: key);
  final int id;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => ParagraphBloc(
            chapterID: id,
            regulationRepository: context.read<RegulationRepository>()),
        child: BlocBuilder<ParagraphBloc, ParagraphState>(
          builder: (context, state) {
            if (state is ParagraphInitial) {
              return ListView(
                children: state.paragraphs
                    .map((paragraph) => ParagraphCard(
                          paragraph: paragraph,
                        ))
                    .toList(),
              );
            }
            return Center(
              child: Text("not"),
            );
          },
        ),
      ),
    );
  }
}

class ParagraphCard extends StatelessWidget {
  const ParagraphCard({Key? key, required this.paragraph}) : super(key: key);
  final Paragraph paragraph;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color(0XFFFAFAFA),
      margin: EdgeInsets.zero,
      shape: const Border(
        bottom: BorderSide(width: 1.0, color: Color.fromRGBO(230, 230, 230, 1)),
      ),
      child: Container(
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
          child: paragraph.isHTML
              ? SingleChildScrollView(
                  padding: EdgeInsets.all(2),
                  scrollDirection: Axis.horizontal,
                  child: HtmlWidget(paragraph.content,  
                        customStylesBuilder: (element) {
                          switch (element.localName) {
                            case 'table':
                              return {
                                'border': '1px solid',
                                'border-collapse': 'collapse',
                              };
                            case 'td':
                              return {'border': '1px solid'};
                          }
                          if (element.className.contains('align_center')){
                            return {'text-align': 'center'};
                          }

                          return null;
                        }
                  )

                  // Html(
                  //   data: paragraph.content,
                  //   style: {
                  //     "table": Style(
                  //       width: MediaQuery.of(context).size.width,
                  //     ),
                  //   },
                  // ),
                  )
              : Text(paragraph.content)),
    );
  }
}
