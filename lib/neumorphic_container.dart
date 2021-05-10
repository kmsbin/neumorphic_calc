import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class NeumorphicContainer extends StatefulWidget {
  final Widget child;
  final double bevel;
  final Offset blurOffset;
  final Color color;
  final Function onPressed;
  final Function onLongPressed;
  NeumorphicContainer({
    Key key,
    this.onPressed,
    this.onLongPressed,
    this.child,
    this.bevel = 10.0,
    this.color,
  })  : this.blurOffset = Offset(bevel / 2, bevel / 2),
        super(key: key);

  @override
  _NeumorphicContainerState createState() => _NeumorphicContainerState();
}

class _NeumorphicContainerState extends State<NeumorphicContainer> {
  bool _isPressed = false;

  void _onPointerDown(TapDownDetails event) {
    widget.onPressed();
    setState(() {
      _isPressed = true;
    });
  }

  void _onUpdateStart(LongPressStartDetails details) {
    widget.onLongPressed();
    setState(() {
      _isPressed = true;
    });
  }

  void _onUpdateEnd(LongPressEndDetails details) {
    widget.onLongPressed();
    setState(() {
      _isPressed = false;
    });
  }

  void _onPointerUp(TapUpDetails event) {
    setState(() {
      _isPressed = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final color = this.widget.color ?? Theme.of(context).backgroundColor;

    return GestureDetector(
      onTapDown: _onPointerDown,
      onTapUp: _onPointerUp,
      onLongPressEnd: _onUpdateEnd,
      onLongPressStart: _onUpdateStart,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 50),
        padding: const EdgeInsets.all(24.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(widget.bevel * 10),
          gradient: LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, colors: [
            _isPressed ? color : color.mix(Colors.black, .1),
            _isPressed ? color.mix(Colors.black, .05) : color,
            _isPressed ? color.mix(Colors.black, .05) : color,
            color.mix(Colors.white, _isPressed ? .2 : .5),
          ], stops: [
            0.0,
            .3,
            .6,
            1.0,
          ]),
          boxShadow: _isPressed
              ? null
              : [
                  BoxShadow(
                    blurRadius: widget.bevel,
                    offset: -widget.blurOffset,
                    color: color.mix(Colors.white, .6),
                  ),
                  BoxShadow(
                    blurRadius: widget.bevel,
                    offset: widget.blurOffset,
                    color: color.mix(Colors.black, .3),
                  )
                ],
        ),
        child: widget.child,
      ),
    );
  }
}

extension ColorUtils on Color {
  Color mix(Color another, double amount) {
    return Color.lerp(this, another, amount);
  }
}
