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

  int countChapters() {
    return Regulation.chapters.length;
  }

  List<Paragraph> getParagraphsByChapterOrderNum(int chapterID) {
    Chapter chapter = Regulation.chapters
        .where((chapter) => chapter.orderNum == chapterID)
        .first;
    return chapter.paragraphs;
  }

  String getChapterNameByOrderNum(int chapterID) {
    Chapter chapter = Regulation.chapters
        .where((chapter) => chapter.orderNum == chapterID)
        .first;
    String result = chapter.num.length > 0
        ? '${chapter.num}. ${chapter.name}'
        : chapter.name;
    return result;
  }

  String getRegulationName() {
    return Regulation.name;
  }

  // TODO index all links
  GoTo getGoTo(int id) {
    print("sssssssssssssssssssssss" + id.toString());
    Chapter _chapter = Regulation.chapters
        .where((chapter) => chapter.paragraphs.map((p) => p.id).contains(id))
        .first;
    int _paragraphOrderNum =
        _chapter.paragraphs.where((p) => p.id == id).first.num;

    return GoTo(
        chapterOrderNum: _chapter.orderNum,
        paragraphOrderNum: _paragraphOrderNum);
  }

  // Future<List<Paragraph>> getParagraphs() {}

  // Future<void> saveParagraph(Paragraph paragraph) {}

  // Future<void> deleteParagraph(String id) {}
}
