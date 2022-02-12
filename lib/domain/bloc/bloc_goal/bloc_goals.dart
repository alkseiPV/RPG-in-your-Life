import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mmorpg_life/domain/bloc/bloc_goal/bloc_goal_event.dart';
import 'package:mmorpg_life/domain/bloc/bloc_goal/bloc_goal_state.dart';
import 'package:mmorpg_life/domain/usecases/goalUsecases/add_goal.dart';
import 'package:mmorpg_life/domain/usecases/goalUsecases/change_complete.dart';
import 'package:mmorpg_life/domain/usecases/goalUsecases/diss_goal.dart';
import 'package:mmorpg_life/domain/usecases/goalUsecases/get_goals.dart';

class GoalBloc extends Bloc<GoalEvent, GoalState> {
  final GetGoals getGoals;
  final ChangeComplete changeComplete;
  final AddGoalHive addGoalHive;
  final DissGoal dissGoal;
  GoalBloc(
      {required this.getGoals,
      required this.changeComplete,
      required this.addGoalHive,
      required this.dissGoal})
      : super(LoadingGoalState()) {
    on<LoadGoalEvent>((event, emit) async {
      emit(LoadingGoalState());
      try {
        final boxg = await getGoals.callGoals();
        print("ge");

        emit(boxg.fold((failure) => ErrorGoalstate(),
            (goal) => LoadedGoalState(loadedGoal: goal)));
      } catch (e) {
        print(e.toString());
      }
    });
    on<CompleteGoalEvent>((event, emit) async {
      changeComplete.changeCompleteElement(event.index);
    });
    on<SubmitGoalEvent>((event, emit) async {
      addGoalHive.addGoalInHive(event.note, event.task);
    });
    on<DismissGoalEvent>((event, emit) async {
      dissGoal.deleteGoal(event.index);
    });
  }
}
