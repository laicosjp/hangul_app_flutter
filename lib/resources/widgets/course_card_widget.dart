import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CourseCard extends StatelessWidget {
  const CourseCard({
    super.key,
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
          child: Row(children: [
            Container(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.network(
                  'https://t2.genius.com/unsafe/193x193/https%3A%2F%2Fimages.genius.com%2F2f2c553bf84b85ccc17daef3da1a3dbc.1000x1000x1.png',
                  width: 100,
                  height: 100,
                ),
              ),
            ),
            Gap(16),
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                'How Sweet',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(children: [
                Icon(Icons.menu_book, color: Colors.black54, size: 16),
                Gap(4),
                Text('102 words',
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 12,
                    )),
              ])
            ])
          ]),
        ),
      ),
    );
  }
}
