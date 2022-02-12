import 'package:flutter/material.dart';
import 'package:mmorpg_life/domain/bloc/bloc_goal/bloc_goal_event.dart';
import 'package:mmorpg_life/domain/bloc/bloc_goal/bloc_goals.dart';
import 'package:provider/src/provider.dart';

class AddGoal extends StatefulWidget {
  final formKey = GlobalKey<FormState>();

  @override
  _AddGoalState createState() => _AddGoalState();
}

class _AddGoalState extends State<AddGoal> {
  String? note;
  String? task;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("add a goal or task to yourself!", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  autofocus: true,
                  initialValue: '',
                  decoration: InputDecoration(labelText: "Task"),
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
                    initialValue: '',
                    decoration: const InputDecoration(labelText: 'note'),
                    onChanged: (value) {
                      setState(() {
                        note = value;
                      });
                    }),
                SizedBox(
                  height: 15,
                ),
                ElevatedButton(
                  child: Text(
                    'ADD',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  onPressed: () {
                    final form = _formKey.currentState!;
                    final GoalBloc userBloc = context.read<GoalBloc>();
                    if (form.validate()) {
                      Navigator.of(context).pop();
                      userBloc.add(SubmitGoalEvent(note: note?? " ", task: task!));
                      userBloc.add(LoadGoalEvent());
                    } else {
                      print('form is invalid');
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
