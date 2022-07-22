import 'dart:developer';

import 'package:regulation_api/regulation_api.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageRegulationApi extends RegulationApi {
  final List<ChapterInfo> _tableOfContents;
  final String _regulationAbbreviation;

  final SharedPreferences _plugin;

  static const THEME_KEY = 'theme_key';
  static const COLOR_PICKER_KEY = 'color_picker_key';

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
      log(e.toString());
      return [];
    }
  }

  int countChapters() {
    try {
      return Regulation.chapters.length;
    } catch (e) {
      log(e.toString());
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
      log(e.toString());
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
      log(e.toString());
      return "";
    }
  }

  String getRegulationName() {
    try {
      return Regulation.name;
    } catch (e) {
      log(e.toString());
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
      log(e.toString());
      return null;
    }
  }

  setTheme(bool value) async {
    try {
      await _plugin.setBool(THEME_KEY, value);
    } catch (e) {
      log(e.toString());
      return;
    }
  }

  getTheme() async {
    try {
      bool theme_value = await _plugin.getBool(THEME_KEY) ?? false;
      return theme_value;
    } catch (e) {
      log(e.toString());
      return false;
    }
  }

  setColorPickerColors(List<int> colors) async {
    List<String> _colorsStringList = [];
    try {
      for (final _color in colors) {
        // int? c = int.tryParse(_color);
        _colorsStringList.add(_color.toString());
      }
      await _plugin.setStringList(THEME_KEY, _colorsStringList);
    } catch (e) {
      log(e.toString());
      return;
    }
  }

  getColorPickerColors() async {
    try {
      List<int> _colorsIntList = [];
      bool exists = await _plugin.containsKey(COLOR_PICKER_KEY);
      if (exists) {
        List<String> _colors =
            await _plugin.getStringList(COLOR_PICKER_KEY) ?? [];
        if (_colors.length == 0) {
          return _colorsIntList;
        }
        for (final _color in _colors) {
          // int? c = int.tryParse(_color);
          int? _colorInt = int.tryParse(_color);
          if (_colorInt != null) {
            _colorsIntList.add(_colorInt);
          }
        }

        return _colorsIntList;
      }
      return _colorsIntList;
    } catch (e) {
      log(e.toString());
      return false;
    }
  }

  // Future<List<Paragraph>> getParagraphs() {}

  // Future<void> saveParagraph(Paragraph paragraph) {}

  // Future<void> deleteParagraph(String id) {}
}
