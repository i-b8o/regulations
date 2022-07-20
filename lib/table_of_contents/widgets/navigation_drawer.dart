import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../app/bloc/app_bloc.dart';

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

  Widget buildHeader(BuildContext context) => Container(
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).padding.top,
        ),
      );
  Widget buildMenuItems(BuildContext context) => Column(
        children: [
          ListTile(
            title: Text('Первый'),
            leading: const Icon(Icons.home_outlined, color: Colors.black),
            trailing: const Icon(Icons.keyboard_arrow_down , color: Colors.black),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.home_outlined, color: Colors.black),
            title: const Text('Домой'),
            onTap: () {},
          ),
          BlocBuilder<AppBloc, AppState>(
            builder: (context, state) {
              return ListTile(
                leading: const Icon(Icons.home_outlined, color: Colors.black),
                title: const Text('Домой'),
                onTap: () {
                  context.read<AppBloc>().add(AppThemeSetEvent(false));
                },
              );
            },
          ),
          BlocBuilder<AppBloc, AppState>(
            builder: (context, state) {
              return ListTile(
                leading: const Icon(Icons.home_outlined, color: Colors.black),
                title: const Text('Домой'),
                onTap: () {
                  context.read<AppBloc>().add(AppThemeSetEvent(true));
                },
              );
            },
          ),
        ],
      );

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [buildHeader(context), buildMenuItems(context)],
      )),
    );
  }
}
