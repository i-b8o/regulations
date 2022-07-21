import 'package:flutter/material.dart';

class EditParagraphPage extends StatelessWidget {
  const EditParagraphPage({Key? key, required this.text}) : super(key: key);
  final String text;

  void _showModalBottomSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            height: MediaQuery.of(context).size.height * 0.3,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(
          Icons.mode_edit_outline,
          color: Color(0xFFff9500),
        ),
        backgroundColor: Color(0xFFd4d5d5),

      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      body: GestureDetector(
         onTap: () {
                _showModalBottomSheet(context);
              },
        child: Container(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).padding.top + 15,
            ),
            child: Text(text)),
      ),
    );
  }
}
