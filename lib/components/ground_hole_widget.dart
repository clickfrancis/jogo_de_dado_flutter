import 'package:flutter/material.dart';

class GroundHoleWidget extends StatefulWidget {
  GroundHoleWidget(
      {Key? key, required this.hole, required this.callbackFuction})
      : super(key: key);

  bool hole;
  final Function callbackFuction;

  @override
  State<GroundHoleWidget> createState() => _GroundHoleWidgetState();
}

class _GroundHoleWidgetState extends State<GroundHoleWidget>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 1),
    reverseDuration: const Duration(milliseconds: 1500),
  );

  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.fastOutSlowIn,
    reverseCurve: Curves.fastOutSlowIn,
  )..addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller.reverse().whenComplete(() => widget.callbackFuction(false));
      }
    });

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    widget.hole == true ? _controller.forward() : _controller.stop();
    return Column(
      children: [
        ScaleTransition(
          scale: _animation,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 50.0,
              width: 250.0,
              decoration: const BoxDecoration(
                color: Colors.black87,
                borderRadius: BorderRadius.all(Radius.elliptical(150, 30)),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
