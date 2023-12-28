import 'dart:io';
import 'package:flutter/material.dart';
import 'package:prostudent/provider/student_form.dart';
import 'package:prostudent/screen/edit.dart';
import 'package:provider/provider.dart';

int? student;
class ScreenProfile extends StatelessWidget {
  const ScreenProfile({Key? key, required this.index}) : super(key: key);
  final int index;

  @override
  Widget build(BuildContext context) {
    student=index;
    return Consumer<Studentdata>(
      builder: (context, value, child) => Scaffold(
        appBar: AppBar(
            title: const Text('Student Profile', ),
            centerTitle: true,
            ),

        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 100,
            ),
            Center(
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: CircleAvatar(
                          radius: 80,
                          backgroundImage:
                              FileImage(File(value.students[index].profile)),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        'NAME : ${value.students[index].name}',
                        
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        'EMAIL : ${value.students[index].email}',
                      
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text( 
                        'AGE : ${value.students[index].age}',
                    
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        'CONTACT : ${value.students[index].contact}',
                   
                      ),
                    ],
                  ),
                ),
              ), 
            ),
            ElevatedButton.icon(
                onPressed: () =>navigateToedit(context,student),
                icon: const Icon(Icons.edit),
                label: const Text('Edit')),
          ],
        ),
      ),
    );
  }
}
void navigateToedit(BuildContext context,int? index) {
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) =>  ScreenEdit(index: index!), 
    ),
  );
}