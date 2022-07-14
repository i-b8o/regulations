import 'package:regulation_api/regulation_api.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageRegulationApi extends RegulationApi {
  final List<ChapterInfo> _tableOfContents;
  final String _regulationAbbreviation;

  final SharedPreferences _plugin;

  LocalStorageRegulationApi({
    required SharedPreferences plugin,
  })  : _tableOfContents = Regulation.chapters.map((chapter) {
          return ChapterInfo(
              name: chapter.name,
              num: chapter.num,
              orderNum: chapter.orderNum,
              id: chapter.id);
        }).toList(),
        _regulationAbbreviation = Regulation.abbreviation,
        _plugin = plugin;

  String getRegulationAbbreviation() {
    return _regulationAbbreviation;
  }

  List<ChapterInfo> getTableOfContents() {
    _tableOfContents.sort((a, b) => a.orderNum.compareTo(b.orderNum));
    return _tableOfContents;
  }

  List<Paragraph> getParagraphsByChapterID(int chapterID) {
    Chapter chapter =
        Regulation.chapters.where((chapter) => chapter.id == chapterID).first;
    return chapter.paragraphs;
  }

  // Future<List<Paragraph>> getParagraphs() {}

  // Future<void> saveParagraph(Paragraph paragraph) {}

  // Future<void> deleteParagraph(String id) {}
}
