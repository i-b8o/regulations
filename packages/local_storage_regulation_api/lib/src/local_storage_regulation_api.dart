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
    try {
      _tableOfContents.sort((a, b) => a.orderNum.compareTo(b.orderNum));
      return _tableOfContents;
    } catch (e) {
      return [];
    }
  }

  int countChapters() {
    try {
      return Regulation.chapters.length;
    } catch (e) {
      return 0;
    }
  }

  List<Paragraph> getParagraphsByChapterOrderNum(int chapterID) {
    try {
      Chapter chapter = Regulation.chapters
          .where((chapter) => chapter.orderNum == chapterID)
          .first;
      return chapter.paragraphs;
    } catch (e) {
      return [];
    }
  }

  String getChapterNameByOrderNum(int chapterID) {
    try {
      Chapter chapter = Regulation.chapters
          .where((chapter) => chapter.orderNum == chapterID)
          .first;
      String result = chapter.num.length > 0
          ? '${chapter.num}. ${chapter.name}'
          : chapter.name;
      return result;
    } catch (e) {
      return "";
    }
  }

  String getRegulationName() {
    try {
      return Regulation.name;
    } catch (e) {
      return "";
    }
  }

  GoTo? getGoTo(int id) {
    try {
      List<Link> links = AllLinks.links.where((l) => l.id == id).toList();
      if (links.isEmpty) {
        return null;
      }
      Link link = links.first;
      return GoTo(
        regId: link.rid,
        chapterOrderNum: link.chapterNum,
        paragraphOrderNum: link.paragraphNum,
      );
    } catch (e) {
      return null;
    }
  }

  static const THEME_KYE = 'theme_key';

  setTheme(bool value) async {
    try {
      await _plugin.setBool(THEME_KYE, value);
    } catch (e) {
      return;
    }
  }

  getTheme() async {
    try {
      bool theme_value = await _plugin.getBool(THEME_KYE) ?? false;
      return theme_value;
    } catch (e) {
      return false;
    }
  }
  // Future<List<Paragraph>> getParagraphs() {}

  // Future<void> saveParagraph(Paragraph paragraph) {}

  // Future<void> deleteParagraph(String id) {}
}
