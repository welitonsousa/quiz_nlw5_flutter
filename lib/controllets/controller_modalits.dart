import 'package:quiz/data/questions.dart';
import 'package:quiz/models/model_modalits.dart';

class ControllerModalits {
  static final ControllerModalits instante = ControllerModalits();
  int indexModalit = 0;
  List<ModelModalits> _modalits = modalitis;
  List<ModelModalits> get modalits => _modalits;
}
