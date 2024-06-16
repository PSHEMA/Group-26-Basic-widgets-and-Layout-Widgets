import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Animation Practice')),
        body: Center(
          child: AnimatedSquare(),
        ),
      ),
    );
  }
}

class AnimatedSquare extends StatefulWidget {
  @override
  _AnimatedSquareState createState() => _AnimatedSquareState();
}

class _AnimatedSquareState extends State<AnimatedSquare> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  bool _isAnimating = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    _animation = Tween<double>(begin: 50.0, end: 1000.0).animate(_controller)
      ..addListener(() {
        setState(() {});
      });
  }

  void _toggleAnimation() {
    if (_isAnimating) {
      _controller.stop();
    } else {
      _controller.repeat(reverse: true);
    }
    setState(() {
      _isAnimating = !_isAnimating;
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: _animation.value,
          height: _animation.value,
          color: Colors.blue,
        ),
        SizedBox(height: 20),
        ElevatedButton(
          onPressed: _toggleAnimation,
          child: Text(_isAnimating ? 'Stop Animation' : 'Start Animation'),
        ),
      ],
    );
  }
}