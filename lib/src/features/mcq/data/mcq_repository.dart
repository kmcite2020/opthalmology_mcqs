// ignore_for_file: public_member_api_docs, sort_constructors_first, unused_local_variable
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:opthalmology_mcqs/src/common/constants.dart';
import 'package:opthalmology_mcqs/src/features/mcq/domain/mcq.dart';

class MCQRepository {
  Future<void> addMCQ(MCQ mcq) async {}
  FirebaseFirestore get db => CONSTANTS.locator<FirebaseFirestore>();

  List<MCQ> getAllMCQs() {
    final dataBaseRef = db.collection('database');
    final mcqsRef = dataBaseRef.doc('mcqs');
    final mcq = mcqsRef.get().then((value) => MCQ.fromMap(value.data()!));
    return [];
    // return box.box.values.map((e) => MCQ.fromJson(e as String)).toList();
  }

  Future<void> deleteAll() async {}
}
