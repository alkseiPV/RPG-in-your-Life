import 'package:flutter/material.dart';
import 'package:mmorpg_life/common/colors_app.dart';
import 'package:mmorpg_life/presentation/widgets/add_goal_widget.dart';
import 'package:mmorpg_life/presentation/widgets/goal_list.dart';

class GoalsScreen extends StatelessWidget {
  const GoalsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainBackgroundColor,
      appBar: AppBar(
        title: Text("My Goal"),
        centerTitle: true,
      ),
      body: GoalList(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add_alert),
        onPressed: () {
         Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => AddGoal()));
        },
      ),
    );
  }
}
