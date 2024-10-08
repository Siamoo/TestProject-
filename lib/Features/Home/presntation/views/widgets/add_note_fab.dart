
import 'package:firebase1/Features/Home/presntation/manger/add_note_cubit/add_note_cubit.dart';
import 'package:firebase1/Features/Home/presntation/views/widgets/bottom_sheet_screen.dart';
import 'package:firebase1/constant.dart';
import 'package:firebase1/helpers/show_snacke_bar_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddNoteFAB extends StatelessWidget {
  const AddNoteFAB({
    super.key,
    required this.screenWidth,
  });

  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: kOrangeColor,
      foregroundColor: Colors.black,
      onPressed: () {
        showModalBottomSheet(
          isScrollControlled: true,
          context: context,
          builder: (context) {
            return Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: BlocConsumer<AddNoteCubit, AddNoteState>(
                listener: (context, state) {
                  if (state is AddNoteSuccess) {
                    Navigator.pop(context);
                  } else if (state is AddNoteFailure) {
                    showSnackBarHelpers(context, 'error : ${state.errMessage}');
                  }
                },
                builder: (BuildContext context, AddNoteState state) {
                  return BottomSheetScreen(screenWidth: screenWidth);
                },
              ),
            );
          },
        );
      },
      child: const Icon(Icons.add),
    );
  }
}
