import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BottomSheetBloc extends Cubit<String> {
  BottomSheetBloc() : super('');

  void showBottomSheet(
      {required Widget widget, required BuildContext context}) {
    showModalBottomSheet(
        context: context,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(25))),
        builder: (context) {
          return SingleChildScrollView(
            child: Container(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 35),
                child: widget,
              ),
            ),
          );
        });
  }
}

abstract class BottomSheetEvent {}

class OpenBottomSheetEvent extends BottomSheetEvent {}

class CloseBottomSheetEvent extends BottomSheetEvent {}

abstract class BottomSheetState {}

class BottomSheetOpenState extends BottomSheetState {}

class BottomSheetCloseState extends BottomSheetState {}

class BottomSheetInitial extends BottomSheetState {}
