import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:regulation/app/app.dart';

import 'package:regulation/paragraph/bloc/paragraph_bloc.dart';
import 'package:regulation_api/regulation_api.dart';
import 'package:regulation_repository/regulation_repository.dart';

import '../widgets/paragraph_app_bar.dart';
import '../widgets/paragraph_card.dart';

class ParagraphPage extends StatelessWidget {
  const ParagraphPage({Key? key, required this.paragraphArguments})
      : super(key: key);
  final ParagraphArguments paragraphArguments;

  ParagraphCard _buildParagraphCard(Paragraph paragraph) {
    return ParagraphCard(paragraph: paragraph);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => ParagraphBloc(
          arguments: paragraphArguments,
          regulationRepository: context.read<RegulationRepository>()),
      child: BlocBuilder<ParagraphBloc, ParagraphState>(
        builder: (context, state) {
          if (state is ParagraphInitial) {
            List<Paragraph> paragraphs = state.paragraphs;
            int chapterOrderNum = state.chapterOrderNum;
            int totalChapters = state.totalChapters;
            return Scaffold(
              backgroundColor: Color(0XFFFAFAFA),
              appBar: PreferredSize(
                  preferredSize: Size.fromHeight(60.0),
                  child: Padding(
                    padding: EdgeInsets.only(
                      top: MediaQuery.of(context).padding.top,
                    ),
                    child: Container(
                      child: ParagraphAppBar(chapterOrderNum: chapterOrderNum, totalChapters: totalChapters),
                      decoration: BoxDecoration(
                        border: Border.all(color: Color(0xFFE2E4E7)),
                      ),
                    ),
                  )),
              body: ListView.builder(
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
                                    print("pressed prev");
                                  },
                                  icon: Icon(Icons.arrow_back_ios)),
                              IconButton(
                                  onPressed: () {
                                    print("pressed prev");
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
              ),
         
            );
          }
          return Center(
            child: Text("not"),
          );
        },
      ),
    );
  }
}

