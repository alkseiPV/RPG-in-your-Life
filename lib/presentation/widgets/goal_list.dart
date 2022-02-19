import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mmorpg_life/domain/bloc/bloc_goal/bloc_goal_event.dart';
import 'package:mmorpg_life/domain/bloc/bloc_goal/bloc_goal_state.dart';
import 'package:mmorpg_life/domain/bloc/bloc_goal/bloc_goals.dart';
import 'package:mmorpg_life/domain/entities/goal_entity.dart';
import 'package:mmorpg_life/presentation/widgets/shimmer_widget.dart';

class GoalList extends StatelessWidget {
  const GoalList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GoalBloc userBlocGoal = context.read<GoalBloc>();

    return BlocBuilder<GoalBloc, GoalState>(
      builder: (context, state) {
        List<GoalEntity> goals = [];
        if (state is LoadingGoalState) {
          return ListView.builder(
              itemCount: 8,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: ShimmerWidget.circular(
                    width: 30,
                    height: 30,
                    shapeBorder: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0)),
                  ),
                  title: ShimmerWidget.rectangular(
                    height: 16,
                    width: 45,
                  ),
                  subtitle: ShimmerWidget.rectangular(
                    height: 12,
                    width: 70,
                  ),
                );
              });
        } else if (state is LoadedGoalState) {
          goals = state.loadedGoal;
        }
        return ListView.separated(
            itemBuilder: (context, index) {
              return Dismissible(
                  key: Key('${goals[index]}'),
                  child: GestureDetector(
                    child: ListTile(
                      title: Text('${goals[index].task}'),
                      subtitle: Text('${goals[index].note}'),
                      leading: IconButton(
                        icon: goals[index].complete!
                            ? Icon(Icons.check_box)
                            : Icon(Icons.check_box_outline_blank),
                        onPressed: () {
                          userBlocGoal.add(CompleteGoalEvent(index: index));
              
                          userBlocGoal.add(LoadGoalEvent());
                          print(goals[index].complete);
                        },
                      ),
                    ),
                  ),
                  onDismissed: (direction) async {
                  userBlocGoal.add(DismissGoalEvent(index: goals.indexOf(goals[index])));
                  userBlocGoal.add(LoadGoalEvent());
                },);
            },
            separatorBuilder: (context, index) {
              return Divider(
                color: Colors.orange,
              );
            },
            itemCount: goals.length);
      },
    );
  }
}
