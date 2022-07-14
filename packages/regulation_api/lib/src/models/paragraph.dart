class Paragraph {
  final int id;
  final int num;
  final bool isHTML;
  final String paragraphClass;
  final String content;
  final int chapterID;

  const Paragraph(
      {required this.id,
      required this.num,
      required this.isHTML,
      required this.paragraphClass,
      required this.content,
      required this.chapterID});
}
