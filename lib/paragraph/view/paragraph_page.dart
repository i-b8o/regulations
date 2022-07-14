import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

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

