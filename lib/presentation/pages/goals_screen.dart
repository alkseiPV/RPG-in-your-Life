import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mmorpg_life/common/colors_app.dart';
import 'package:mmorpg_life/data/datasources/hive_name.dart';
import 'package:mmorpg_life/data/models/goal_model.dart';
import 'package:mmorpg_life/presentation/widgets/add_goal_widget.dart';

class GoalsScreen extends StatefulWidget {
  const GoalsScreen({key}) : super(key: key);

  @override
  State<GoalsScreen> createState() => _GoalsScreenState();
}

class _GoalsScreenState extends State<GoalsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainBackgroundColor,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: AppColors.textColorBlack,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          "Goals",
          style: TextStyle(color: AppColors.textColorBlack),
        ),
        backgroundColor: AppColors.mainAppBarColor,
        centerTitle: true,
      ),
      body: ValueListenableBuilder(
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
                  subtitle:
                      Text('${res.note == null ? "Missing description" : res.note}'),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.mainAppBarColor,
        child: const Icon(
          Icons.add,
          size: 32,
        ),
        onPressed: () async {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => AddGoal()));
        },
        tooltip: 'Add Goal',
      ),
    );
  }

  Text? printNote(res) {
    if (res.note.isNotEmpty) {
      return res.note;
    } else {
      return Text(" ");
    }
  }
}
