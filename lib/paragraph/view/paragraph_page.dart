import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:regulation/app/app.dart';

import 'package:regulation/paragraph/bloc/paragraph_bloc.dart';
import 'package:regulation_api/regulation_api.dart';
import 'package:regulation_repository/regulation_repository.dart';

import '../widgets/paragraph_card.dart';

class ParagraphPage extends StatelessWidget {
  const ParagraphPage({Key? key, required this.paragraphArguments}) : super(key: key);
  final ParagraphArguments paragraphArguments;
  
  ParagraphCard _buildParagraphCard (Paragraph paragraph){
    return ParagraphCard(paragraph: paragraph);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFFFAFAFA),
      body: BlocProvider(
        create: (context) => ParagraphBloc(
            arguments: paragraphArguments,
            regulationRepository: context.read<RegulationRepository>()),
        child: BlocBuilder<ParagraphBloc, ParagraphState>(
          builder: (context, state) {
            if (state is ParagraphInitial) {
              List<Paragraph> paragraphs = state.paragraphs;
              return ListView.builder(
                itemCount: paragraphs.length,
                itemBuilder: (BuildContext context, int index) {  
                    if (index == 0 ){
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: paragraphs[index].paragraphClass == "align_right" ?  EdgeInsets.all( 25.0) : EdgeInsets.only(top: 50.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Flexible(child: Text(state.header, textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0),)),
                              ],
                            ),
                          ),
                          _buildParagraphCard(paragraphs[index])
                        ],
                      );
                    } else if (index == (paragraphs.length - 1) ){
                      return Column(
                        children: [
                          _buildParagraphCard(paragraphs[index]),
                          Container(height: 25, color: Color(0XFFFAFAFA),),
                        ],
                      );
                    }
                    return _buildParagraphCard(paragraphs[index]);
                
                    },

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

