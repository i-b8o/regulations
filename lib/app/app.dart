import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:regulation/home/home.dart';

import 'package:regulation/table_of_contents/bloc/table_of_contents_bloc.dart';
import 'package:regulation_repository/regulation_repository.dart';
import '../chapter/view/chapter_page.dart';
import '../one/one.dart';
import '../table_of_contents/view/table_of_contents.dart';
import '../theme/theme.dart';

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

class ParagraphArguments {
  
  final int totalChapters, chapterOrderNum;

  ParagraphArguments({ required this.totalChapters, required this.chapterOrderNum});

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
        BlocProvider(create: (_) => HomeCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: FlutterRegulationTheme.light,
        darkTheme: FlutterRegulationTheme.dark,
        routes: {
          '/': (context) => HomePage(),
          '/buy': (context) => One(),
          '/tableOfContents': (context) => (TableOfContentsPage()),
          '/paragraph': (context) => ChapterPage(
                paragraphArguments: ModalRoute.of(context)!.settings.arguments as ParagraphArguments,
              )
        },
        initialRoute: '/',
        // home: const HomePage(),
      ),
    );
  }
}
