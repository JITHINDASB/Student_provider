import 'package:flutter/material.dart';
import 'package:prostudent/provider/student_form.dart';
import 'package:provider/provider.dart';

class AlertProvider extends ChangeNotifier {
  void success(BuildContext context) {
    final snackBar = SnackBar(
      content: const Text("Successfull", style: TextStyle()),
      backgroundColor: Colors.green,
      behavior: SnackBarBehavior.floating,
      padding: const EdgeInsets.only(left: 10),
      action:
          SnackBarAction(label: "undo", onPressed: Navigator.of(context).pop),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void notsuccess(BuildContext context) {
    final snackBar = SnackBar(
      content: const Text(
        'image not added',
        style: TextStyle(),
      ),
      backgroundColor: Colors.red,
      behavior: SnackBarBehavior.floating,
      padding: const EdgeInsets.only(left: 10),
      action: SnackBarAction(
          label: "undo", onPressed: () => Navigator.of(context).pop),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  Future<void> dialogbuilder(BuildContext context, int index) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            'Are you sure?',
            style: TextStyle(color: Colors.red),
          ),
          content: const Text('Do you want to delete'),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Discard'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Delete'),
              onPressed: () {
                final student =
                    Provider.of<Studentdata>(context, listen: false);
                student.deleteStudent(index);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
