import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Stack2 extends Stack {
  Stack2({
    Key? key,
    AlignmentGeometry alignment = AlignmentDirectional.topStart,
    TextDirection? textDirection,
    StackFit fit = StackFit.loose,
    Clip overflow = Clip.none,
    List<Widget> children = const <Widget>[],
  }) : super(
          key: key,
          alignment: alignment,
          textDirection: textDirection,
          fit: fit,
          clipBehavior: overflow,
          children: children,
        );

  @override
  RenderStack createRenderObject(BuildContext context) {
    return RenderStack2(
      alignment: alignment,
      textDirection: textDirection ?? Directionality.of(context),
      fit: fit,
      overflow: Clip.none,
    );
  }
}

class RenderStack2 extends RenderStack {
  RenderStack2({
    List<RenderBox>? children,
    AlignmentGeometry alignment = AlignmentDirectional.topStart,
    TextDirection? textDirection,
    StackFit fit = StackFit.loose,
    Clip overflow = Clip.none,
  }) : super(
          children: children,
          alignment: alignment,
          textDirection: textDirection,
          fit: fit,
          clipBehavior: overflow,
        );

  @override
  bool hitTest(BoxHitTestResult result, {Offset? position}) {
    if (hitTestChildren(result, position: position!) || hitTestSelf(position)) {
      result.add(BoxHitTestEntry(this, position));
      return true;
    }
    return false;
  }
}
