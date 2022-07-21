import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rolling_switch/rolling_switch.dart';

import '../../../app/bloc/app_bloc.dart';

// TODO add in theme
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
            trailing:
                const Icon(Icons.keyboard_arrow_down, color: Colors.black),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.home_outlined, color: Colors.black),
            title: const Text('Что-то'),
            onTap: () {},
          ),
          BlocBuilder<AppBloc, AppState>(
            builder: (context, state) {
              return ListTile(
                leading: const Icon(Icons.home_outlined, color: Colors.black),
                // TODO Customize text, and background
                // TODO Search settings (local - global)
                title: const Text('Настройки'),
                onTap: () {
                  context.read<AppBloc>().add(AppThemeSetEvent(false));
                },
              );
            },
          ),
        ],
      );

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        decoration: BoxDecoration(border: Border.all()),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [buildHeader(context), buildMenuItems(context)],
            ),
            BlocBuilder<AppBloc, AppState>(
              builder: (context, state) {
                bool _isDark = false;
                if (state is AppThemeState && state.isDark) {
                  _isDark = true;
                }
                return Padding(
                  padding: const EdgeInsets.only(bottom: 25),
                  child: ListTile(
                    leading: Icon(
                      _isDark ? Icons.dark_mode : Icons.sunny,
                      size: 35,
                      color: Color(0xFF969899),
                    ),
                    title: Text(
                      // TODO change text
                      "Dark mode",
                      style: TextStyle(
                          color: _isDark ? Color(0xFFd4d5d5) : Color(0xFF777777)),
                    ),
                    trailing: Transform.scale(
                      scale: 0.7,
                      child: RollingSwitch.widget(
                          initialState: _isDark,
                          onChanged: (bool state) {
                            context
                                .read<AppBloc>()
                                .add(AppThemeSetEvent(!_isDark));
                          },
                          rollingInfoRight: RollingWidgetInfo(
                            icon: Container(
                              decoration: new BoxDecoration(
                                color: Color(0xFFff9500),
                                shape: BoxShape.circle,
                              ),
                            ),
                            backgroundColor: Color(0xFF191c1e),
                            text: Text('ON'),
                          ),
                          rollingInfoLeft: RollingWidgetInfo(
                            icon: Container(
                              decoration: new BoxDecoration(
                                color: Color(0xFFff9500),
                                shape: BoxShape.circle,
                              ),
                            ),
                            backgroundColor: Color(0xFFfdecd9),
                            text: Text(
                              'OFF',
                              style: TextStyle(color: Color(0xFF5a5a5a)),
                            ),
                          )),
                    ),
                  ),
                );
                // Switch.adaptive(value: _isDark, onChanged: (_isDark){
                // context.read<AppBloc>().add(AppThemeSetEvent(_isDark));

                //   });
              },
            ),
          ],
        ),
      ),
    );
  }
}
