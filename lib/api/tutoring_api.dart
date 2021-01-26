import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coe_mobile_app/Objects/TutoredCourse.dart';
import 'package:coe_mobile_app/notifier/hkn_notifier.dart';

getTutoredCourse(HknNotifier tutoredCourseNotifier) async {
  // ignore: deprecated_member_use

  QuerySnapshot snapshot =
  await Firestore.instance.collection('hkn_data_test').getDocuments();
  List<TutoredCourse> _tutoredcourseList = [];
  // ignore: deprecated_member_use

  snapshot.documents.forEach((document) {
    TutoredCourse course = TutoredCourse.fromMap(document.data());

    document.reference.collection("Monday").get().then((querySnapshot){
      querySnapshot.docs.forEach((result) {
        tutor tutorM = tutor.fromMap(result.data());
        course.mondayList.add(tutorM);
         });
          });

    document.reference.collection("Thursday").get().then((querySnapshot){
      querySnapshot.docs.forEach((result) {
        tutor tutorT = tutor.fromMap(result.data());
        course.thursdayList.add(tutorT);
        });
    });

    _tutoredcourseList.add(course);
  });
  tutoredCourseNotifier.hknList = _tutoredcourseList;
}



