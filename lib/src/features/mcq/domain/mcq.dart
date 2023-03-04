// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:math';

import 'answer.dart';
import 'question.dart';

class MCQ {
  final String id;
  final Question question;
  final Answer answerA;
  final Answer answerB;
  final Answer answerC;
  final Answer answerD;
  final AnswerType correctAnswerType;

  MCQ({
    required this.id,
    required this.question,
    required this.answerA,
    required this.answerB,
    required this.answerC,
    required this.answerD,
    required this.correctAnswerType,
  });

  @override
  bool operator ==(covariant MCQ other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.question == question &&
        other.answerA == answerA &&
        other.answerB == answerB &&
        other.answerC == answerC &&
        other.answerD == answerD &&
        other.correctAnswerType == correctAnswerType;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        question.hashCode ^
        answerA.hashCode ^
        answerB.hashCode ^
        answerC.hashCode ^
        answerD.hashCode ^
        correctAnswerType.hashCode;
  }

  MCQ copyWith({
    String? id,
    Question? question,
    Answer? answerA,
    Answer? answerB,
    Answer? answerC,
    Answer? answerD,
    AnswerType? correctAnswerType,
  }) {
    return MCQ(
      id: id ?? this.id,
      question: question ?? this.question,
      answerA: answerA ?? this.answerA,
      answerB: answerB ?? this.answerB,
      answerC: answerC ?? this.answerC,
      answerD: answerD ?? this.answerD,
      correctAnswerType: correctAnswerType ?? this.correctAnswerType,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'question': question.toMap(),
      'answerA': answerA.toMap(),
      'answerB': answerB.toMap(),
      'answerC': answerC.toMap(),
      'answerD': answerD.toMap(),
      'correctAnswerType': correctAnswerType.toMap(),
    };
  }

  factory MCQ.fromMap(Map<String, dynamic>? map) {
    if (map == null) return MCQ.init();
    return MCQ(
      id: map['id'] as String,
      question: Question.fromMap(map['question'] as Map<String, dynamic>),
      answerA: Answer.fromMap(map['answerA'] as Map<String, dynamic>),
      answerB: Answer.fromMap(map['answerB'] as Map<String, dynamic>),
      answerC: Answer.fromMap(map['answerC'] as Map<String, dynamic>),
      answerD: Answer.fromMap(map['answerD'] as Map<String, dynamic>),
      correctAnswerType: AnswerType.fromMap(map['correctAnswerType']),
    );
  }

  String toJson() => json.encode(toMap());

  factory MCQ.fromJson(String source) => MCQ.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'MCQ(id: $id, question: $question, answerA: $answerA, answerB: $answerB, answerC: $answerC, answerD: $answerD, correctAnswerType: $correctAnswerType)';
  }

  factory MCQ.init() => MCQ(
        id: Random().nextInt(100000).toString(),
        question: Question(question: 'question?'),
        answerA: Answer.answerA('a'),
        answerB: Answer.answerB('b'),
        answerC: Answer.answerC('c'),
        answerD: Answer.answerD('d'),
        correctAnswerType: AnswerType.d,
      );
}
