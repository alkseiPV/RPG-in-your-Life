import 'package:flutter/material.dart';
import 'package:mmorpg_life/common/colors_app.dart';
import 'package:mmorpg_life/domain/bloc/bloc_point/bloc_point_event.dart';
import 'package:mmorpg_life/domain/bloc/bloc_point/bloc_points.dart';
import 'package:provider/src/provider.dart';

class ChangeBoxPoint extends StatefulWidget {
  final formKey = GlobalKey<FormState>();
  final int indx;
  final String t;
  final String subt;

  ChangeBoxPoint({required this.indx, required this.t, required this.subt});

  @override
  State<ChangeBoxPoint> createState() => _ChangeBoxPointState();
}

class _ChangeBoxPointState extends State<ChangeBoxPoint> {
  String? titl;
  String? subtitl;
  final _formKey = GlobalKey<FormState>();
  build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainBackgroundColor,
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Текущий Заголовок: ${widget.t}",
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
                TextFormField(
                  autofocus: true,
                  initialValue: '',
                  decoration: const InputDecoration(labelText: 'title'),
                  onChanged: (value) {
                    setState(() {
                      titl = value;
                    });
                  },
                  validator: (val) {
                    return val!.trim().isEmpty
                        ? 'Task name should not be empty'
                        : null;
                  },
                ),
                SizedBox(
                  height: 25,
                ),
                Text(
                  "Текущий подзаголовок: ${widget.subt}",
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
                TextFormField(
                    initialValue: '',
                    decoration: const InputDecoration(labelText: 'subtitle'),
                    onChanged: (value) {
                      setState(() {
                        subtitl = value;
                      });
                    }),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.purple,
                  ),
                  child: Text(
                    'CHANGE',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  onPressed: () {
                    final form = _formKey.currentState!;
                    final PointBloc userBloc = context.read<PointBloc>();
                    if (form.validate()) {
                      userBloc.add(BoxPointChangeEvent(
                          indexBox: widget.indx,
                          newTitl: titl!,
                          newSubTitl: subtitl ?? "описание не задано"));
                      Navigator.of(context).pop();
                      userBloc.add(LoadPointEvent());
                    } else {
                      print('form is invalid');
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
