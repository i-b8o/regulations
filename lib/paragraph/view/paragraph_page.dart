import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:regulation/paragraph/bloc/paragraph_bloc.dart';
import 'package:regulation_api/regulation_api.dart';
import 'package:regulation_repository/regulation_repository.dart';

import '../widgets/paragraph_card.dart';

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
              List<Paragraph> paragraphs = state.paragraphs;
              return ListView(
                children: paragraphs
                    .map((paragraph) => ParagraphCard(
                      isLast: paragraphs.indexOf(paragraph) == (paragraphs.length - 1),
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

