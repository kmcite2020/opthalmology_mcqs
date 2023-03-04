import 'package:flutter/material.dart';
import 'package:opthalmology_mcqs/src/common/extensions.dart';
import 'package:opthalmology_mcqs/src/features/time.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

import '../domain/answer.dart';
import '../domain/mcq.dart';
import 'add_mcq_view.dart';
import 'mcqs_controller.dart';

class MCQsView extends ReactiveStatelessWidget {
  const MCQsView({super.key});

  @override
  Widget build(BuildContext context) {
    return mcqsController.isLoading
        ? const Scaffold(body: Center(child: CircularProgressIndicator()))
        : Scaffold(
            appBar: AppBar(
              title: 'MCQs (all)'.text,
              actions: const [Center(child: TimerWidget())],
            ),
            body: ListView.builder(
              itemCount: mcqsController.mcqs.length,
              itemBuilder: (context, index) {
                final MCQ mcq = mcqsController.mcqs[index];
                return Column(
                  children: [
                    const Divider(),
                    ListTile(
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('ID: ${mcq.id}'),
                          Text(mcq.question.question),
                        ],
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Radio(value: AnswerType.a, groupValue: AnswerType.b, onChanged: (_) {}),
                              Text(mcq.answerA.answer),
                            ],
                          ),
                          Row(
                            children: [
                              Radio(value: AnswerType.a, groupValue: AnswerType.b, onChanged: (_) {}),
                              Text(mcq.answerB.answer),
                            ],
                          ),
                          Row(
                            children: [
                              Radio(value: AnswerType.a, groupValue: AnswerType.b, onChanged: (_) {}),
                              Text(mcq.answerC.answer),
                            ],
                          ),
                          Row(
                            children: [
                              Radio(value: AnswerType.a, groupValue: AnswerType.b, onChanged: (_) {}),
                              Text(mcq.answerD.answer),
                            ],
                          ),
                          Text(
                            mcq.correctAnswerType.name,
                            textScaleFactor: 2,
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
            floatingActionButton: ButtonBar(
              children: [
                FloatingActionButton(
                  onPressed: () => RM.navigate.to(const AddMCQView()),
                  child: const Icon(Icons.add),
                ),
                FloatingActionButton(
                  onPressed: () => mcqsController.deleteAllMCQs(),
                  child: const Icon(Icons.delete),
                ),
              ],
            ),
          );
  }
}
