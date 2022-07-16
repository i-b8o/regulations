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

  List<Paragraph> getParagraphsByChapterOrederNum(int chapterOrderNum) =>
      _regulationApi.getParagraphsByChapterOrderNum(chapterOrderNum);

  String getChapterNameByOrderNum(int chapterOrderNum) => _regulationApi.getChapterNameByOrderNum(chapterOrderNum);

  String getRegulationName() => _regulationApi.getRegulationName();

}
