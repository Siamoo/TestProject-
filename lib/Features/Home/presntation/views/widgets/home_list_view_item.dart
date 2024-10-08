import 'package:firebase1/Features/Home/data/models/model.dart';
import 'package:firebase1/Features/Home/presntation/views/widgets/home_note_title_and_icon.dart';
import 'package:flutter/material.dart';

class HomeListViewItem extends StatelessWidget {
  const HomeListViewItem({
    super.key,
    required this.screenWidth,
    required this.note,
  });

  final double screenWidth;
  final Model note;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * .07),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black26,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HomeNoteTitleAndIcon(note: note),
              const SizedBox(
                height: 7,
              ),
              HomeNoteAdvice(
                advice: note.firstObj,
              ),
              HomeNoteAdvice(
                advice: note.secondObj,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class HomeNoteAdvice extends StatelessWidget {
  const HomeNoteAdvice({
    super.key,
    required this.advice,
  });


  final String advice;

  @override
  Widget build(BuildContext context) {
    return Row( 
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          'asset/images/arow.png',
          height: 35,
          width: 35,
        ),
        const SizedBox(
          width: 4,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * .65,
          child: Text(
            advice,
            style: const TextStyle(
              fontSize: 16,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
