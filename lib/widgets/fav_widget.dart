import 'package:flutter/material.dart';

class Heart extends StatefulWidget {
  const Heart({super.key});

  @override
  State<Heart> createState() => _HeartState();
}

class _HeartState extends State<Heart> with SingleTickerProviderStateMixin {
  AnimationController? _controller;
  Animation<Color?>? _colorAnimation;
  Animation<double?>? _sizeAnimation;
  Animation<double>? _curve;
  bool isFav = false;

  @override
  void initState() {
    _controller =
        AnimationController(duration: Duration(microseconds: 400), vsync: this);
    _colorAnimation = ColorTween(
      begin: Colors.grey[400],
      end: Colors.red,
    ).animate(_controller!);


     _curve = CurvedAnimation(
      parent: _controller!,
       curve: Curves.slowMiddle
       );

    _sizeAnimation = TweenSequence(
      <TweenSequenceItem<double>>[
      TweenSequenceItem<double>(tween: Tween(begin: 30, end: 50), weight:50),
      TweenSequenceItem<double>(tween: Tween(begin: 30, end: 50), weight:50),
    ]).animate(_curve!);

   

    // _controller!.forward();

    _controller!.addListener(() {
      print(_controller!.value);
      print(_colorAnimation!.value);
    });

    _controller!.addStatusListener((status){
      // print(_controller!.status);
      if(status == AnimationStatus.completed){
        setState(() {
          isFav = true;
        });
      }
      if(status == AnimationStatus.dismissed){
        setState(() {
          isFav = false;
        });
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller!,
      builder: (context, child) {
        return IconButton(
          onPressed: () {
            // _controller!.forward();
            isFav
            ?_controller!.reverse()//if we already clicked the heart icon  we need to go back to the original state.
            :_controller!.forward();
          },
          icon: Icon(
            Icons.favorite,
            // size: 30,
            size: _sizeAnimation!.value,
            color: _colorAnimation!.value,
          ),
        );
      },
    );
  }
}
