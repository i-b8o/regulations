import 'models/models.dart';

abstract class RegulationApi {
  const RegulationApi();

  String getRegulationAbbreviation() {
    return Regulation.abbreviation;
  }

  List<ChapterInfo> getTableOfContents();

  int countChapters();

  List<Paragraph> getParagraphsByChapterOrderNum(int chapterID);
  
  String getChapterNameByOrderNum(int chapterID);

  // Future<List<Paragraph>> getParagraphs();

  // Future<void> saveParagraph(Paragraph paragraph);

  // Future<void> deleteParagraph(String id);
}
