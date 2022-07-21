import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../table_of_contents.dart';
import 'init_app_bar.dart';
import 'search_app_bar.dart';

class TableOfContentsAppBar extends StatelessWidget {
  const TableOfContentsAppBar({
    Key? key,
  }) : super(key: key);

  Widget _buildChild(TableOfContentsState state) {
    if (state is StateTableOfContentsSearchTextFieldActivated) {
      return SearchAppBar();
    }
    if (state is StateTableOfContentsInitial) {
      return InitAppBAr(
        name: state.name,
        title: state.title,
      );
    }
    return Container();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TableOfContentsBloc, TableOfContentsState>(
      buildWhen: (prev, state) => prev.runtimeType != state.runtimeType,
      builder: (context, state) {
        return _buildChild(state);
      },
    );
  }
}
