import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coe_mobile_app/Objects/StudentOrg.dart';
import 'package:coe_mobile_app/notifier/studentorg_notifier.dart';

getStudentOrg(StudentOrgNotifier studentOrgNotifier) async {
  //TODO: Get Maisy to update her API to non-deprecated version
  QuerySnapshot snapshot =
      await FirebaseFirestore.instance.collection('studentorg_data').get();
  List<StudentOrg> _studentOrgList = [];
  snapshot.docs.forEach((document) {
    StudentOrg org = StudentOrg.fromMap(document.data());
    _studentOrgList.add(org);
  });

  studentOrgNotifier.studentOrgList = _studentOrgList;
}
