import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../edit_paragraph/bloc/edit_paragraph_bloc.dart';
import '../edit_paragraph/edit_paragraph_page.dart';
import '../table_of_contents/bloc/table_of_contents_bloc.dart';
import 'package:regulation_repository/regulation_repository.dart';
import '../chapter/view/chapter_page.dart';
import '../table_of_contents/view/table_of_contents.dart';
import '../theme/theme.dart';
import 'bloc/app_bloc.dart';

class App extends StatelessWidget {
  const App({Key? key, required this.regulationRepository}) : super(key: key);

  final RegulationRepository regulationRepository;
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: regulationRepository,
      child: const AppView(),
    );
  }
}

class ChapterArguments {
  final int totalChapters, chapterOrderNum;

  ChapterArguments(
      {required this.totalChapters, required this.chapterOrderNum});
}

class AppView extends StatelessWidget {
  const AppView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => TableOfContentsBloc(
            regulationRepository: context.read<RegulationRepository>(),
          ),
        ),
        BlocProvider(
            create: (_) => AppBloc(
                  regulationRepository: context.read<RegulationRepository>(),
                )..add(AppThemeInitialEvent())),
        BlocProvider(
          create: (context) => EditParagraphBloc(
              regulationRepository: context.read<RegulationRepository>()),
        ),
      ],
      child: BlocBuilder<AppBloc, AppState>(
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: state is AppThemeState && state.isDark
                ? FlutterRegulationTheme.dark
                : FlutterRegulationTheme.light,

            darkTheme: FlutterRegulationTheme.dark,
            routes: {
              '/': (context) => (TableOfContentsPage()),
              '/paragraph': (context) => ChapterPage(
                    chapterArguments: ModalRoute.of(context)!.settings.arguments
                        as ChapterArguments,
                  ),
              '/edit': (context) => EditParagraphPage(
                    text: ModalRoute.of(context)!.settings.arguments as String,
                  )
            },
            initialRoute: '/',
            // home: const HomePage(),
          );
        },
      ),
    );
  }
}
