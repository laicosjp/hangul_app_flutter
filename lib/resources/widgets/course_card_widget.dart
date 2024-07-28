import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CourseCard extends StatelessWidget {
  final String? title;
  final int? wordsCount;
  final String? thumbnailUrl;

  const CourseCard({
    super.key,
    this.title,
    this.wordsCount,
    this.thumbnailUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black12, width: 1),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            height: 100,
            child: Row(children: [
              Container(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.network(
                    thumbnailUrl ?? 'https://via.placeholder.com/100',
                    width: 100,
                  ),
                ),
              ),
              Gap(16),
              Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      title ?? '',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(children: [
                      Icon(Icons.menu_book, color: Colors.black54, size: 16),
                      Gap(4),
                      Text('${wordsCount} words',
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 12,
                          )),
                    ])
                  ])
            ]),
          ),
        ),
      ),
    );
  }
}
