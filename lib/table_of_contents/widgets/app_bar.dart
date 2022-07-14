import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../table_of_contents.dart';
import 'init_app_bar.dart';
import 'search_app_bar.dart';

class TableOfContentsAppBar extends StatelessWidget {
  const TableOfContentsAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color? foregroundColor = Theme.of(context).appBarTheme.foregroundColor;
    return BlocBuilder<TableOfContentsBloc, TableOfContentsState>(
      buildWhen: (prev, state) => prev.runtimeType != state.runtimeType,
      builder: (context, state) {
        if (state is StateTableOfContentsSearchTextFieldActivated) {
          return SearchAppBar(
            foregroundColor: foregroundColor,
          );
        }
        if (state is StateTableOfContentsInitial) {
          return InitAppBAr(
            foregroundColor: foregroundColor,
            title: state.title,
          );
        }
        return Container();
      },
    );

    // Color? foregroundColor = Theme.of(context).appBarTheme.foregroundColor;
    // return BlocBuilder<TableOfContentsBloc, TableOfContentsState>(
    //   buildWhen: (prev, state) => prev.runtimeType != state.runtimeType,
    //   builder: (context, state) {
    //     print(state);
    //     if (state is StateTableOfContentsSearchTextFieldActivated) {
    //       return SearchAppBar(
    //         foregroundColor: foregroundColor,
    //       );
    //     }
    //     return InitAppBAr(
    //       title: regulationName,
    //       foregroundColor: foregroundColor,
    //     );
    //   },
    // );
  }
}
