import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:regulation/chapter/widgets/chapter_page_body/bloc/chapter_page_body_bloc.dart';
import 'package:regulation_api/regulation_api.dart';
import 'package:regulation_repository/regulation_repository.dart';

import 'paragraph_card.dart';

class ChapterPageBody extends StatelessWidget {
  const ChapterPageBody({Key? key, required this.chapterOrderNum})
      : super(key: key);
  final int chapterOrderNum;

  ParagraphCard _buildParagraphCard(Paragraph paragraph) {
    return ParagraphCard(paragraph: paragraph);
  }


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChapterPageBodyBloc(
          chapterOrderNum: chapterOrderNum,
          regulationRepository: context.read<RegulationRepository>()),
      child: BlocBuilder<ChapterPageBodyBloc, ChapterPageBodyState>(
        builder: (context, state) {
                      
          if (state is StateChapterPageBodyInitial){
            List<Paragraph> paragraphs = state.paragraphs;
            return ListView.builder(
                itemCount: paragraphs.length,
                itemBuilder: (BuildContext context, int index) {
                  if (index == 0) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding:
                              paragraphs[index].paragraphClass == "align_right"
                                  ? EdgeInsets.all(25.0)
                                  : EdgeInsets.only(top: 50.0, left: 8.0, right: 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Flexible(
                                  child: Text(
                                state.header,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17.0),
                              )),
                            ],
                          ),
                        ),
                        _buildParagraphCard(paragraphs[index])
                      ],
                    );
                  } else if (index == (paragraphs.length - 1)) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _buildParagraphCard(paragraphs[index]),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              IconButton(
                                  onPressed: () {
                                    
                                  },
                                  icon: Icon(Icons.arrow_back_ios)),
                              IconButton(
                                  onPressed: () {
                                    
                                  },
                                  icon: Icon(Icons.arrow_forward_ios))
                            ],
                          ),
                        ),
                        SizedBox(height: 25)
                      ],
                    );
                  }
                  return _buildParagraphCard(paragraphs[index]);
                },
              );
          }
          return Center(child: Text("no"),);
        },
      ),
    );
  }
}
