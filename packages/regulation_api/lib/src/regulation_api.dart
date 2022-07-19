import 'models/go_to.dart';
import 'models/models.dart';

abstract class RegulationApi {
  const RegulationApi();

  String getRegulationAbbreviation() {
    return Regulation.abbreviation;
  }

  List<ChapterInfo> getTableOfContents();

  int countChapters();

  List<Paragraph> getParagraphsByChapterOrderNum(int chapterOrderNum);
  
  String getChapterNameByOrderNum(int chapterOrderNum);

  String getRegulationName();
  
  GoTo? getGoTo(int id);

  // Future<List<Paragraph>> getParagraphs();

  // Future<void> saveParagraph(Paragraph paragraph);

  // Future<void> deleteParagraph(String id);
}
