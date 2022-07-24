import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/edit_paragraph_bloc.dart';

class BottomBarWhiteCircle extends StatelessWidget {
  const BottomBarWhiteCircle({
    Key? key,
    required this.height,
    required this.color,
    this.isActive = false,
    required this.index,
  }) : super(key: key);

  final double height;
  final Color color;
  final bool isActive;
  final int index;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<EditParagraphBloc>().add(EventColorCircleChoosen(index));
      },
      child: BlocBuilder<EditParagraphBloc, EditParagraphState>(
        buildWhen: (previous, current) =>
            (previous.listcolorsInt[index] != current.listcolorsInt[index]) &&
            isActive,
        builder: (context, state) {
          return Container(
            width: height * 0.15,
            height: height * 0.15,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color:  color),
            child: isActive
                ? Icon(
                    Icons.check,
                    color: Colors.white,
                  )
                : Container(),
          );
        },
      ),
    );
  }
}
