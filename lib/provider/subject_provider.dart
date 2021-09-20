import 'package:flutter/material.dart';

import '../model/subject.dart';
/// Subject Provider contains the Subject List and
/// all the functions require.
class SubjectProvider with ChangeNotifier {
  final List<Subject> _subjectList = <Subject>[
    Subject(
      sem: 1,
      courseID: 'btech',
      departmentID: 'it',
      title: 'MA2101',
      id:'ma2101'
    ),
  ];

  /// Getter to make a copy of the List.
  List<Subject> get subjectList => _subjectList;

/// Function to get final list of the subject department wise.
  List<Subject> findSubject(
    String courseID,
    String departmentID,
    int sem,
  ) {
    final List<Subject> finalSubjectList = subjectList
        .where(
          (Subject element) =>
              element.courseID
                  .toLowerCase()
                  .contains(courseID.toLowerCase()) &&
              element.departmentID
                  .toLowerCase()
                  .contains(departmentID.toLowerCase()) &&
              element.sem == sem,
        )
        .toList();
    return finalSubjectList;
  }
}