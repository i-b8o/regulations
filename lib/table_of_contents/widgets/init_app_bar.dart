import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../constants.dart';
import '../table_of_contents.dart';

class InitAppBAr extends StatelessWidget {
  const InitAppBAr({
    Key? key,
    this.foregroundColor,
    required this.title, required this.name,
  }) : super(key: key);
  final Color? foregroundColor;
  final String title, name;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () {
            Scaffold.of(context).openDrawer();
            // context.read<HomeBloc>().add(SearchTextFieldActivatedEvent());
          },
          icon: Icon(
            Icons.menu,
            color: foregroundColor,
          ),
        ),
        // TODO on tap popup message with a full name of a regulation
        GestureDetector(
          onTap: () {
            // String name =context.select((TableOfContentsBloc bloc) => bloc.regulationName);
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(name)));
          },
          child: Text(title,
              style: TextStyle(
                  color: Constants.appBarHeaderColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0)),
        ),
        IconButton(
          onPressed: () {
            context
                .read<TableOfContentsBloc>()
                .add(EventTableOfContentsSearchTextFieldActivated());
          },
          icon: Icon(
            Icons.search,
            color: foregroundColor,
          ),
        ),
      ],
    );
  }
}
