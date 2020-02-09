import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flare_flutter/flare_controls.dart';
import 'package:homepage/scanner.dart';
import 'package:image_picker/image_picker.dart';

enum AnimationToPlay {
  Activate,
  Deactivate,
  CameraTapped,
  ImageTapped
}

class SmartFlareAnimation extends StatefulWidget {
  _SmartFlareAnimationState createState() => _SmartFlareAnimationState();
}

class _SmartFlareAnimationState extends State<SmartFlareAnimation> {
  // width and height retrieved from the artboard values in the animation
  static const double AnimationWidth = 200.0;
  static const double AnimationHeight = 200.0;

  // AnimationToPlay _animationToPlay = AnimationToPlay.Deactivate;
  AnimationToPlay _lastPlayedAnimation;

  // Flare animation controls
  final FlareControls animationControls = FlareControls();

  bool isOpen = false;
  
  File _image;
  Future openCamera() async {
    var image =await ImagePicker.pickImage(
      source: ImageSource.camera
      );
    setState(() {
      _image = image;

    });
          if (image != null) {
      print(image.path);
      await Navigator.pushReplacement(
        context,
          MaterialPageRoute(
            builder: (context) =>
                Scanner(image: image,)
          ),
        );
      }
  }
    Future openGallery() async {
    var image1 =await ImagePicker.pickImage(
      source: ImageSource.gallery
      );
    setState(() {
      _image = image1;
      Scanner(image: image1,);

    });
    if (image1 != null) {
      print(image1.path);
      await Navigator.push(
        context,
          MaterialPageRoute(
            builder: (context) =>
                Scanner(image: image1,)
          ),
        );
      }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AnimationWidth,
      height: AnimationHeight,
      child: GestureDetector(
          onTapUp: (tapInfo) {
            var localTouchPosition = (context.findRenderObject() as RenderBox)
                .globalToLocal(tapInfo.globalPosition);

            var topHalfTouched = localTouchPosition.dy < AnimationHeight / 2;

            var leftSideTouched = localTouchPosition.dx < AnimationWidth / 2;

            var rightSideTouched =
                localTouchPosition.dx > AnimationWidth / 2;


            // Call our animation in our conditional checks
            if (leftSideTouched && topHalfTouched) {
              _setAnimationToPlay(AnimationToPlay.CameraTapped);
              openCamera();
              print("Camera Tapped");
            } else if (rightSideTouched && topHalfTouched) {
              _setAnimationToPlay(AnimationToPlay.ImageTapped);
              openGallery();
            } else {
              if (isOpen) {
                _setAnimationToPlay(AnimationToPlay.Deactivate);
              } else {
                _setAnimationToPlay(AnimationToPlay.Activate);
              }
setState(() {
  
              isOpen = !isOpen;
});
            }
          },
          child: FlareActor('assets/button-animation.flr',
              controller: animationControls, animation: 'deactivate')),
    );
  }

  String _getAnimationName(AnimationToPlay animationToPlay) {
    switch (animationToPlay) {
      case AnimationToPlay.Activate:
        return 'activate';
      case AnimationToPlay.Deactivate:
        return 'deactivate';
      case AnimationToPlay.CameraTapped:
        return 'camera_tapped';
      case AnimationToPlay.ImageTapped:
        return 'image_tapped';
      default:
        return 'deactivate';
    }
  }

  void _setAnimationToPlay(AnimationToPlay animation) {
    var isTappedAnimation = _getAnimationName(animation).contains("_tapped");
    if (isTappedAnimation &&
        _lastPlayedAnimation == AnimationToPlay.Deactivate) {
      return;
    }

    animationControls.play(_getAnimationName(animation));

    _lastPlayedAnimation = animation;
  }
}
