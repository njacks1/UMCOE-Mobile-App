import 'package:coe_mobile_app/Objects/StudentOrg.dart';
import 'package:coe_mobile_app/api/studentOrg_api.dart';
import 'package:coe_mobile_app/notifier/studentorg_notifier.dart';
import 'package:coe_mobile_app/pages/studentorg_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:coe_mobile_app/constants/fonts.dart';

class StudentOrgSwipe extends StatefulWidget {
  @override
  _StudentOrgSwipeState createState() => _StudentOrgSwipeState();
}



class _StudentOrgSwipeState extends State<StudentOrgSwipe> {
  TextEditingController _controller;
  List<StudentOrg> _studentOrgFullList;
  List<StudentOrg> _filteredStudentOrgList = [];
  bool oneTimePass = true;

  @override
  void initState() {
    StudentOrgNotifier studentOrgNotifier =
        Provider.of<StudentOrgNotifier>(context, listen: false);
    getStudentOrg(studentOrgNotifier);
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    StudentOrgNotifier studentOrgNotifier =
      Provider.of<StudentOrgNotifier>(context);
    _studentOrgFullList = studentOrgNotifier.studentOrgList;
    oneTimePass ? (_filteredStudentOrgList = _studentOrgFullList) : (_filteredStudentOrgList = _filteredStudentOrgList);
    if(_studentOrgFullList.length>0){
      oneTimePass = false;
    }
    else oneTimePass = true;
    return Scaffold(
      body: ClipRRect(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(60), topRight: Radius.circular(60)),
        child: Container(
          child: ClipRRect(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(60), topRight: Radius.circular(60)),
            child: Container(
              decoration: BoxDecoration(color: Colors.white),
              margin: EdgeInsets.fromLTRB(0, 30.0, 0, 0),
              child: Column(
                children: <Widget>[
                  Padding(
                      padding: EdgeInsets.all(8.0),
                      child: TextField(
                          keyboardType: TextInputType.text,
                          controller: _controller,
                          decoration: InputDecoration(
                              labelText: "Search",
                              hintText: "Search",
                              prefixIcon: Icon(Icons.search),
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(25.0)))),
                          onChanged: (string) {
                            setState(() {
                              _filteredStudentOrgList = _studentOrgFullList
                                .where((u) =>
                            (u.name.toLowerCase()
                                .contains(string.toLowerCase())))
                                .toList();
                            });
                          })),
                 Expanded(child: buildList(context))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  ListView buildList(BuildContext context) {
    return ListView.builder(
        padding: EdgeInsets.only(top: 10),
        itemCount: _filteredStudentOrgList.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            contentPadding: EdgeInsets.fromLTRB(20.0, 0, 0, 0),
            leading: CircleAvatar(
              backgroundColor: Colors.white,
              backgroundImage:
                  NetworkImage(_filteredStudentOrgList[index].image),
            ),
            title: new Text(_filteredStudentOrgList[index].name,
                style: TextStyle(
                    fontFamily: font,
                    fontWeight: fontWeightSemiBold,
                    fontSize: fontSizeText)),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      StudentOrgPage(Org: _filteredStudentOrgList[index]),
                ),
              );
            },
          );
        });
  }
}
