import 'package:flutter/material.dart';
import 'package:my_app/models/activity_models.dart';
import 'package:my_app/screens/details.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Activity> activities = [];

  @override
  void initState() {
    activities = [
      Activity(
          name: 'Hiking at Yosmite National Park',
          location: 'California, USA',
          imagePath: 'assets/img/hiking.jpg',
          price: 0),
      Activity(
        name: 'Skiing in Aspen',
        location: 'Aspen, Colorado, USA',
        imagePath: 'assets/img/skiing.jpg',
        price: 100,
      ),
      Activity(
        name: 'Skydiving in Dubai',
        location: 'Dubai, United Arab Emirates',
        imagePath: 'assets/img/skydiving.jpg',
        price: 300,
      ),
      Activity(
        name: 'Scuba Diving in Great Barrier Reef',
        location: 'Queensland, Australia',
        imagePath: 'assets/img/scuba.jpg',
        price: 150,
      ),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[100],
        title: Text('Home'),
      ),
      body: Container(
        padding: EdgeInsets.only(left: 20, right: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TweenAnimationBuilder<double>(
              tween: Tween<double>(begin: 0, end: 1),
              builder:(context, double val, child) {
                return Opacity(
                  opacity: val,
                  child: Padding(
                    padding: EdgeInsets.only(top: val * 20),
                    child: child,
                  ),
                  );
              },
              duration: Duration(seconds:2),
              child: Text(
                "Pick your \nFavourite Activity",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Flexible(
              child: ListView.builder(
                itemCount: activities.length,
                itemBuilder: (context, index) {
                  Activity activity = activities[index];
                  return buildCard(activity);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Card buildCard(Activity activity) {
    return Card(
      color: Colors.pink[100],
      child: Container(
        height: 100,
        child: Center(
          child: ListTile(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Details(
                      activity: activity,
                    ),
                  ));
            },
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Hero(
                tag: 'activity-img-${activity.imagePath}',
                child: Image.asset(
                  activity.imagePath,
                  height: 100,
                ),
              ),
            ),
            trailing: Text(
              activity.price.toString(),
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            title: Text(
              activity.name,
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            subtitle: Text(
              activity.location,
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
