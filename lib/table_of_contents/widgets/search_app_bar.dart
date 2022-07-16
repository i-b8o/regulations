import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../table_of_contents.dart';

class SearchAppBar extends StatelessWidget {
  const SearchAppBar({
    Key? key,
    this.foregroundColor,
  }) : super(key: key);
  final Color? foregroundColor;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
            onPressed: () {
              context
                  .read<TableOfContentsBloc>()
                  .add(EventTableOfContentsInitial());
            },
            icon: Icon(
              Icons.arrow_back,
              size: 24.0,
              color: foregroundColor,
            )),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: TextField(
              cursorColor: foregroundColor,
              decoration: InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 12, vertical: 7),
                prefixIconConstraints:
                    BoxConstraints(minWidth: 22, maxHeight: 22),
                prefixIcon: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: Icon(
                    Icons.search,
                    color: foregroundColor,
                  ),
                ),
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Theme.of(context).primaryColor)),
                isDense: true,
                hintText: 'Поиск',
              ),
              style: TextStyle(
                fontSize: 15.0,
              ),
            ),
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.search,
            size: 24.0,
            color: foregroundColor,
          ),
        ),
      ],
    );
  }
}
