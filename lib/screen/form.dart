import 'package:flutter/material.dart';
import 'package:prostudent/core/constants.dart';
import 'package:prostudent/models/models.dart';
import 'package:prostudent/provider/alert.dart';
import 'package:prostudent/provider/image_form.dart';
import 'package:prostudent/provider/student_form.dart';
import 'package:prostudent/screen/image_form.dart';
import 'package:provider/provider.dart';


class Screeadd extends StatelessWidget {
  Screeadd({super.key, });

  final formkey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final ageController = TextEditingController();
  final phoneController = TextEditingController();

  @override
  Widget build( context) {
    
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.cyan,
          title: const Text("Add Student"),
          centerTitle: true,
        ),
        body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              child: Form(
                key: formkey,
                child: Column(
                  
                  children: [
                    const StudentPhoto(),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.name,
                      controller: nameController,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.person),
                        hintText: "Name",
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) => nameController.text.isEmpty
                          ? "Enter your name"
                          : null,
                    ),
                    aheight,
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      controller: emailController,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.person),
                        hintText: "Email",
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) => emailController.text.isEmpty
                          ? "Enter your email"
                          : null,
                    ),
                    aheight,
                    TextFormField(
                      keyboardType: TextInputType.number,
                      controller: ageController,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.person),
                        hintText: "Age",
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) =>
                          ageController.text.isEmpty ? "Enter your age" : null,
                    ),
                    aheight,
                    TextFormField(
                      keyboardType: TextInputType.number,
                      controller: phoneController,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.person),
                        hintText: "Phone",
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) => phoneController.text.isEmpty
                          ? "Enter your phone"
                          : null,
                    ),
                    aheight,
                   Consumer<StudentImage>(
                  builder: (context, value, child) => Consumer<Studentdata>(
                    builder: (context, data, child) => Consumer<AlertProvider>(
                      builder: (context, alert, child) => 
                       Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                             
                              onPressed: () {
                                if (formkey.currentState!.validate()) {
                                  if (value.imgPath == null) {
                                    alert.notsuccess(context); 
                                  } else {
                                    isSccess(value, data, context);
                                  }
                                }
                              },
                             
                              child: const Text('Submit'),
                              
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void isSccess(
      StudentImage value, Studentdata data, BuildContext context) async {
    final selectedImage = value.imgPath;
    if (selectedImage == null) {
      return;
    }

    final studentObject = StudentModel(
      id: DateTime.now(),
      profile: selectedImage,
      name: nameController.text.trim(),
      email: emailController.text.trim(),
      age: int.parse(ageController.text),
      contact: int.parse(phoneController.text.trim()),
    );

    data.addStudent(studentObject);
    value.imgPath = null;
    Navigator.of(context).pop();
  }
}