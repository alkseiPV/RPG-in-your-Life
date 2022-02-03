import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mmorpg_life/data/datasources/hive_name.dart';
import 'package:mmorpg_life/data/models/goal_model.dart';

class MainGoal extends StatefulWidget {
  const MainGoal({key}) : super(key: key);

  @override
  State<MainGoal> createState() => _MainGoalState();
}

class _MainGoalState extends State<MainGoal> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: Hive.box<GoalModel>(HiveBoxes.toGoal).listenable(),
      builder: (context, Box<GoalModel> box, _) {
        if (box.values.isEmpty)
          return Center(
            child: Text(
              "Goals list is empty",
              style: TextStyle(fontSize: 32),
            ),
          );
        return ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: box.values.length,
          itemBuilder: (context, index) {
            GoalModel res = box.getAt(index)!;
            return Dismissible(
              background: Container(color: Colors.red),
              key: Key(res.id!),
              onDismissed: (direction) {
                res.delete();
              },
              child: ListTile(
                leading: res.complete!
                    ? Icon(Icons.check_box)
                    : Icon(Icons.check_box_outline_blank),
                onTap: () {
                  res.complete = !res.complete!;
                  res.save();
                },
                title: Text(res.task!),
                subtitle: Text(
                    '${res.note == null ? "Missing description" : res.note}'),
              ),
            );
          },
        );
      },
    );
  }
}
