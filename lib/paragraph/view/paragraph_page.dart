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
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Flexible(child: Text(state.header, style: TextStyle(fontWeight: FontWeight.bold),)),
                          ],
                        ),
                      );
                    } else if (index == (paragraphs.length - 1) ){
                      return SizedBox(height: 15,);
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

