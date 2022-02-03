import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mmorpg_life/domain/bloc/bloc_point/bloc_points.dart';

import 'package:mmorpg_life/locator_service.dart' as di;

import 'package:mmorpg_life/presentation/pages/statistics_screen.dart';

import 'locator_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  await Hive.initFlutter();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<PointBloc>(create: (context) => sl<PointBloc>()),
        ],
        child: MaterialApp(
          home: MenuScreen(),
        ));
  }
}
