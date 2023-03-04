import 'package:flutter/material.dart';
import 'package:opthalmology_mcqs/src/common/extensions.dart';
import 'package:opthalmology_mcqs/src/features/mcq/application/mcqs_controller.dart';
import 'package:opthalmology_mcqs/src/features/mcq/domain/answer.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

class AddMCQView extends ReactiveStatelessWidget {
  const AddMCQView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OnFormBuilder(
        listenTo: mcqsController.addMCQForm,
        builder: () => Column(
          children: [
            TextField(
              controller: mcqsController.question.controller,
            ).pad,
            TextField(
              controller: mcqsController.answerA.controller,
            ).pad,
            TextField(
              controller: mcqsController.answerB.controller,
            ).pad,
            TextField(
              controller: mcqsController.answerC.controller,
            ).pad,
            TextField(
              controller: mcqsController.answerD.controller,
            ).pad,
            OnFormFieldBuilder<AnswerType>(
              listenTo: mcqsController.correctAnswer,
              builder: (value, onChanged) {
                return DropdownButtonFormField(
                  value: value,
                  items: AnswerType.values
                      .map(
                        (e) => DropdownMenuItem(
                          value: e,
                          child: e.name.text,
                        ),
                      )
                      .toList(),
                  onChanged: onChanged,
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: OnFormSubmissionBuilder(
        listenTo: mcqsController.addMCQForm,
        onSubmitting: () => const CircularProgressIndicator(),
        child: FloatingActionButton(
          onPressed: () {
            final form = mcqsController.addMCQForm;
            form.isValid ? form.submit() : print('not_valid');
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
