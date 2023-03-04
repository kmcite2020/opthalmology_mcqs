// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:opthalmology_mcqs/src/features/mcq/data/mcq_repository.dart';
import 'package:opthalmology_mcqs/src/features/mcq/domain/answer.dart';
import 'package:opthalmology_mcqs/src/features/mcq/domain/mcq.dart';
import 'package:states_rebuilder/scr/state_management/extensions/type_extensions.dart';
import 'package:states_rebuilder/scr/state_management/rm.dart';

class MCQsController {
  final MCQRepository mcqRepository;
  MCQsController({
    required this.mcqRepository,
  });
  List<MCQ> get mcqs => mcqsRM.state;
  late final mcqsRM = RM.inject(() => mcqRepository.getAllMCQs());
  bool get isLoading => mcqsRM.isWaiting;
  void addMCQ() async {
    final mcq = MCQ.init();
    mcqsRM.setToIsWaiting();
    await Future.delayed(500.milliseconds);
    mcqsRM.setToHasData([...mcqs, mcq]);
    mcqRepository.addMCQ(mcq);
  }

  void deleteAllMCQs() async {
    mcqsRM.setToIsWaiting();
    await Future.delayed(500.milliseconds);
    mcqsRM.setToHasData(<MCQ>[]);
    mcqRepository.deleteAll();
  }

  final addMCQForm = RM.injectForm();
  final question = RM.injectTextEditing();
  final answerA = RM.injectTextEditing();
  final answerB = RM.injectTextEditing();
  final answerC = RM.injectTextEditing();
  final answerD = RM.injectTextEditing();
  final correctAnswer = RM.injectFormField(AnswerType.a);
}

final MCQsController mcqsController = MCQsController(
  mcqRepository: MCQRepository(),
);
