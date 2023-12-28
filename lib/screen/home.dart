import 'dart:io';

import 'package:flutter/material.dart';

import 'package:prostudent/provider/alert.dart';
import 'package:prostudent/provider/student_form.dart';
import 'package:prostudent/screen/form.dart';
import 'package:prostudent/screen/profile.dart';
import 'package:prostudent/screen/search.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final studentProvider = Provider.of<Studentdata>(context);
    studentProvider.getStudent;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Student',
          style: TextStyle(fontSize: 20,color:Color.fromARGB(255, 16, 16, 16),fontWeight: FontWeight.bold),
          
        ),
        centerTitle: true,
        backgroundColor: Colors.cyan,
        actions: [
          IconButton(
              onPressed: () => showSearch(context: context, delegate: Search()),
              icon: const Icon(Icons.search)),
        ],
      ),
      body: Column(
        children: [
          Consumer<Studentdata>(
            builder: (context, value, child) => value.students.isNotEmpty
                ? Expanded(
                    child: ListView.separated(
                      itemBuilder: (context, index) => ListTile(
                        leading: CircleAvatar(
                            backgroundImage:
                                FileImage(File(value.students[index].profile))),
                        title: Text(value.students[index].name),
                        trailing: Consumer<AlertProvider>(
                            builder: (context, value, child) => IconButton(
                                onPressed: () =>
                                    value.dialogbuilder(context, index),
                                icon: const Icon(Icons.delete))),
                        onTap: () => navigateToProfile(context, index),
                      ),
                      separatorBuilder: (context, index) => const Divider(),
                      itemCount: value.students.length,
                    ),
                  )
                : const SizedBox(),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.cyan,
        onPressed: () => navigateToForm(context),
        child: const Icon(Icons.add),
      ),
    );
  }
}

void navigateToForm(BuildContext context) {
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) => Screeadd(),
    ),
  );
}

void navigateToProfile(BuildContext context, int index) {
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) => ScreenProfile(index: index),
    ),
  );
}
