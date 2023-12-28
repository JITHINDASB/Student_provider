import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:prostudent/models/models.dart';

class Studentdata extends ChangeNotifier{
  List<StudentModel>students=[];


// methords used for CRUD in database

  Future<void>addStudent(StudentModel student)async{
    final studentDB = await Hive.openBox<StudentModel>('studentDB');
      students.add(student);
      await studentDB.add(student);
      notifyListeners();

    
  }
  Future<void>getStudent()async{
    final studentDB=await Hive.openBox<StudentModel>('studentDB');
    students.clear();
    students.addAll(studentDB.values);
    notifyListeners();
  }
  Future<void>deleteStudent(int index)async{
    final studentDb=await Hive.openBox<StudentModel>("studentDB");
    await studentDb.deleteAt(index);
    getStudent();
  }
  Future<void>update(int index,StudentModel student)async{
    final studentDB=await Hive.openBox<StudentModel>("studentDB");
    await studentDB.putAt(index,student);
    getStudent();
    notifyListeners();
  }
}