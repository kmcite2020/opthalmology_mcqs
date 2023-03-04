// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Question {
  final String question;
  Question({
    required this.question,
  }) {
    if (!question.contains('?')) {
      throw Exception('Should contain ?');
    }
  }
  static Question fromString(String question) => Question(question: question);
  @override
  String toString() => 'Question(question: $question)';

  @override
  bool operator ==(covariant Question other) {
    if (identical(this, other)) return true;

    return other.question == question;
  }

  @override
  int get hashCode => question.hashCode;

  Question copyWith({
    String? question,
  }) {
    return Question(
      question: question ?? this.question,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'question': question,
    };
  }

  factory Question.fromMap(Map<String, dynamic> map) {
    return Question(
      question: map['question'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Question.fromJson(String source) => Question.fromMap(json.decode(source) as Map<String, dynamic>);
}
