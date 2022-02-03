// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mmorpg_life/data/datasources/hive_name.dart';
import 'package:mmorpg_life/data/models/goal_model.dart';

class AddGoal extends StatefulWidget {
  final formKey = GlobalKey<FormState>();

  @override
  State<AddGoal> createState() => _AddGoalState();
}

class _AddGoalState extends State<AddGoal> {
  String? task;
  String? note;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  TextFormField(
                    autofocus: true,
                    initialValue: '',
                    decoration: const InputDecoration(labelText: 'Task'),
                    onChanged: (value) {
                      setState(() {
                        task = value;
                      });
                    },
                    validator: (val) {
                      return val!.trim().isEmpty
                          ? 'Task name should not be empty'
                          : null;
                    },
                  ),
                  TextFormField(
                    initialValue: ' ',
                    decoration: const InputDecoration(
                      labelText: 'Note',
                    ),
                    onChanged: (value) {
                      setState(() {
                        note = value;
                      });
                    },
                  ),
                  OutlineButton(
                    child: Text('Add'),
                    onPressed: _validateAndSave,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _validateAndSave(){
    final form = _formKey.currentState!;
    if(form.validate()){
      _onFormSubmit();
    }else{
      print('form is invalid');
    }
  }

  void _onFormSubmit(){
    Box<GoalModel> contactsBox = Hive.box<GoalModel>(HiveBoxes.toGoal);
    contactsBox.add(GoalModel(task: task, note: note));
    Navigator.of(context).pop();
  }
}
