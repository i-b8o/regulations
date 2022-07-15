import 'package:regulation_api/regulation_api.dart';

class RegulationRepository {
  const RegulationRepository({
    required RegulationApi regulationApi,
  }) : _regulationApi = regulationApi;

  final RegulationApi _regulationApi;

  String getRegulationAbbreviation() =>
      _regulationApi.getRegulationAbbreviation();

  List<ChapterInfo> getTableOfContents() => _regulationApi.getTableOfContents();
  
  int countChapters() => _regulationApi.countChapters();

  List<Paragraph> getParagraphsByChapterID(int chapterID) =>
      _regulationApi.getParagraphsByChapterID(chapterID);


}
