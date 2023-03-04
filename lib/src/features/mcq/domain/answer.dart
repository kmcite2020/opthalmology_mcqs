// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Answer {
  final String answer;
  final AnswerType answerType;

  Answer._({
    required this.answer,
    required this.answerType,
  });
  static Answer answerA(String answer) => Answer._(answer: answer, answerType: AnswerType.a);
  static Answer answerB(String answer) => Answer._(answer: answer, answerType: AnswerType.b);
  static Answer answerC(String answer) => Answer._(answer: answer, answerType: AnswerType.c);
  static Answer answerD(String answer) => Answer._(answer: answer, answerType: AnswerType.d);

  Answer copyWith({
    String? answer,
    AnswerType? answerType,
  }) {
    return Answer._(
      answer: answer ?? this.answer,
      answerType: answerType ?? this.answerType,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'answer': answer,
      'answerType': answerType.toMap(),
    };
  }

  factory Answer.fromMap(Map<String, dynamic> map) {
    return Answer._(
      answer: map['answer'] as String,
      answerType: AnswerType.fromMap(map['answerType']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Answer.fromJson(String source) => Answer.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Answer(answer: $answer, answerType: $answerType)';

  @override
  bool operator ==(covariant Answer other) {
    if (identical(this, other)) return true;

    return other.answer == answer && other.answerType == answerType;
  }

  @override
  int get hashCode => answer.hashCode ^ answerType.hashCode;
}

enum AnswerType {
  a,
  b,
  c,
  d;

  static AnswerType fromMap(int index) => AnswerType.values[index];

  int toMap() => index;
}
