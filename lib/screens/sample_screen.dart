import 'package:flutter/material.dart';

class SampleScreen extends StatefulWidget {
  const SampleScreen({super.key});

  @override
  State<SampleScreen> createState() => _SampleScreenState();
}

class _SampleScreenState extends State<SampleScreen> {

  double _margin = 0;
  double _width = 250;
  Color _color = Colors.red;
  double _opacity = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: AnimatedContainer(
        margin: EdgeInsets.all(_margin),
        color: _color,
        width: _width,
        
        duration: Duration(seconds: 2),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: (){
                setState(() {
                  _margin = 50;
                  _width = 200;
                  _color= Colors.green;

                });
              }, 
              child: Text('Animate')
              ),
              AnimatedOpacity(
                duration: Duration(seconds: 2),
                opacity: _opacity,
                child: Container(
                  height: 150,
                  width: 200,
                  color: Colors.yellow,
                ),
              ),
               ElevatedButton(
              onPressed: (){
                setState(() {
                 _opacity = 0;

                });
              }, 
              child: Text('Hide')
              ),
          ],
        ),
        ),
    );
  }
}