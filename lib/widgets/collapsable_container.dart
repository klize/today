import 'package:flutter/material.dart';

class CollapsableContainer extends StatefulWidget {
  final Widget child;
  final bool expand;

  CollapsableContainer({this.child, this.expand = false});

  @override
  _CollapsableContainerState createState() => _CollapsableContainerState();
}

class _CollapsableContainerState extends State<CollapsableContainer>
    with SingleTickerProviderStateMixin {
  AnimationController _collapseController;
  Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    setUp();
    _collapse();
  }

  void setUp() {
    _collapseController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );
    _animation = CurvedAnimation(
      parent: _collapseController,
      curve: Curves.fastOutSlowIn,
    );
  }

  void _collapse() {
    print(widget.expand);
    if (widget.expand) {
      _collapseController.forward();
    } else {
      _collapseController.reverse();
    }
  }

  @override
  void didUpdateWidget(CollapsableContainer oldWidget) {
    super.didUpdateWidget(oldWidget);
    _collapse();
  }

  @override
  void dispose() {
    _collapseController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizeTransition(
      axisAlignment: 1.0,
      sizeFactor: _animation,
      child: widget.child,
    );
  }
}
