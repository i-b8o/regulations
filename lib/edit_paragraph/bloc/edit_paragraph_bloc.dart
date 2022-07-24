import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:regulation_repository/regulation_repository.dart';

part 'edit_paragraph_event.dart';
part 'edit_paragraph_state.dart';

List<int> sss = [
  0xFF525965,
  0xFFffa200,
  0xFFff3063,
  0xFF00d2b0,
  0xFF8963ff,
  0xFF007fff,
];

class EditParagraphBloc extends Bloc<EditParagraphEvent, EditParagraphState> {
  final RegulationRepository _regulationRepository;

  List<int> userColorsList = [
    0xFF525965,
    0xFFffa200,
    0xFFff3063,
    0xFF00d2b0,
    0xFF8963ff,
    0xFF007fff,
  ];
  // List<int> get userColorsList => _userColorsList;
  setUserColorsList(List<int> ucList) {
    userColorsList = ucList;
    // _regulationRepository.setColorPickerColors(ucList);
  }

  getUserColorsList() async {
    List<int> _colorsList = await _regulationRepository.getColorPickerColors();
    if (_colorsList.length == 0) {
      return;
    } else {
      userColorsList = _colorsList;
    }
  }

  setColorByIndex(int index, color) {
    userColorsList[index] = color;
  }

  int _activeColorCircleIndex = 3;
  int get activeColorCircleIndex => _activeColorCircleIndex;
  set activeColorCircleIndex(int i) {
    _activeColorCircleIndex = i;
  }

  int _activeCircleColor = 0xFFff3063;
  int get activeCircleColor => _activeCircleColor;
  set activeCircleColor(int index) {
    _activeCircleColor = index;
  }

  EditParagraphBloc({required RegulationRepository regulationRepository})
      : _regulationRepository = regulationRepository,
        super(EditParagraphState(
            activeColorCircleIndex: 5,
            listcolorsInt: sss,
            activeCircleColor: sss[3])) {
    on<EditParagraphInitialEvent>(_onEditParagraphInitialEvent);
    on<EventColorCircleChoosen>(_onEventColorCircleChoosen);
    on<EventColorCircleChanged>(_onEventColorCircleChanged);
  }

  void _onEditParagraphInitialEvent(
      EditParagraphInitialEvent event, Emitter<EditParagraphState> emit) async {
    emit(EditParagraphState(
        activeColorCircleIndex: activeColorCircleIndex,
        listcolorsInt: userColorsList,
        activeCircleColor: _activeCircleColor));
    await getUserColorsList();
    emit(EditParagraphState(
        activeCircleColor: activeCircleColor,
        listcolorsInt: userColorsList,
        activeColorCircleIndex: activeColorCircleIndex));
  }

  void _onEventColorCircleChoosen(
      EventColorCircleChoosen event, Emitter<EditParagraphState> emit) {
    // setColorByIndex(activeColorCircleIndex, activeCircleColor);
    // userColorsList[activeColorCircleIndex] = activeCircleColor;
    activeColorCircleIndex = event.index;
    emit(EditParagraphState(
        activeCircleColor: activeCircleColor,
        activeColorCircleIndex: activeColorCircleIndex,
        listcolorsInt: userColorsList));
  }

  void _onEventColorCircleChanged(
      EventColorCircleChanged event, Emitter<EditParagraphState> emit) {
    activeCircleColor = event.color;
    userColorsList[activeColorCircleIndex] = activeCircleColor;
    

    emit(EditParagraphState(
        activeCircleColor: activeCircleColor,
        activeColorCircleIndex: activeColorCircleIndex,
        listcolorsInt: userColorsList));
  }
}
