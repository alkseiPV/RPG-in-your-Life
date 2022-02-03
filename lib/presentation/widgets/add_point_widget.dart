// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

import 'package:mmorpg_life/domain/bloc/bloc_point/bloc_point_event.dart';
import 'package:mmorpg_life/domain/bloc/bloc_point/bloc_points.dart';
import 'package:provider/src/provider.dart';


class AddPoint extends StatefulWidget {
  final formKey = GlobalKey<FormState>();

  @override
  State<AddPoint> createState() => _AddPointState();
}

class _AddPointState extends State<AddPoint> {
  String? titl;
  String? subtitl;

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
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
                TextFormField(
                    initialValue: '',
                    decoration: const InputDecoration(labelText: 'subtitle'),
                    onChanged: (value) {
                      setState(() {
                        subtitl = value;
                      });
                    }),
                OutlineButton(
                  child: Text('Add'),
                  onPressed: _validateAndSave,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _validateAndSave() {
    final form = _formKey.currentState!;
    final PointBloc userBloc = context.read<PointBloc>();
    if (form.validate()) {
      userBloc.add(PointOnFormSubmit(titl: titl!, subtitl: subtitl??"описание не задано"));
      Navigator.of(context).pop();
    } else {
      print('form is invalid');
    }
  }

  // void _onFormSubmit() {
  //   Box<PointModel> contactBox = Hive.box<PointModel>(HiveBoxes.toPoint);
  //   contactBox.add(PointModel(titl: titl, subtitl: subtitl));
  //   Navigator.of(context).pop();
  // }
}
