import 'package:flutter/material.dart';
import 'package:lorem_ipsum/lorem_ipsum.dart';
import 'package:my_app/models/activity_models.dart';
import 'package:my_app/widgets/fav_widget.dart';

class Details extends StatelessWidget {
  final Activity activity;
  const Details({super.key, required this.activity});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Hero(
              tag: 'activity-img-${activity.imagePath}',
              child: Image.asset(
                '${activity.imagePath}',
                height: 460,
                fit: BoxFit.cover,
                alignment: Alignment.topCenter,
              ),
            ),
            SizedBox(height: 30),
            ListTile(
              title: Text(activity.name,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.grey[800])),
              subtitle: Text('\$ ${activity.price} Only',
                  style: TextStyle(letterSpacing: 1)),
              trailing: Heart(),
            ),
            Padding(
              padding: EdgeInsets.all(18),
              child: Text(
                loremIpsum(words: 60, paragraphs: 3, initWithLorem: true),
                style: TextStyle(color: Colors.grey[600], height: 1.4),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
