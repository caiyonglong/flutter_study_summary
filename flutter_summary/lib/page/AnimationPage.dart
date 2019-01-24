import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:spritewidget/spritewidget.dart';

///功能描述: 粒子动画
///
///todo
class SpriteAnimationWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => SpriteAnimationStates();
}

class SpriteAnimationStates extends State<SpriteAnimationWidget> {
  NodeWithSize rootNode;

  @override
  void initState() {
    super.initState();
    rootNode = new NodeWithSize(const Size(1024.0, 1024.0));

//    ParticleSystem particles = new ParticleSystem(
//        particleTexture,
//        posVar: const Point(100, 100.0),
//        startSize: 1.0,
//        startSizeVar: 0.5,
//        endSize: 2.0,
//        endSizeVar: 1.0,
//        life: 1.5 * distance,
//        lifeVar: 1.0 * distance
//    );

//    rootNode.addChild(particles);
    loadImg();
  }

  @override
  Widget build(BuildContext context) {
    return new SpriteWidget(rootNode);
  }

  void loadImg() async {
    ImageMap map = ImageMap(rootBundle);
    await map.load([
      "assets/spot.png",
    ]);
    setState(() {
      rootNode.addChild(ParticleWorld(images: map));
    });
  }
}

class ParticleWorld extends NodeWithSize {
  ParticleSystem particleSystem;

  final ImageMap images;

  int _selectedTexture = 1;

  int get selectedTexture => _selectedTexture;

  set selectedTexture(int texture) {
    particleSystem.texture = new SpriteTexture(images["assets/spot.png"]);
    _selectedTexture = texture;
  }

  ParticleWorld({this.images}) : super(const Size(1024.0, 1024.0)) {
    userInteractionEnabled = true;

    SpriteTexture texture = new SpriteTexture(images["assets/spot.png"]);
    double distance =10;
    particleSystem = new ParticleSystem(texture,
        autoRemoveOnFinish: true,
//        rotateToMovement: true,
        transferMode: BlendMode.srcATop,
        posVar: const Offset(1300.0, 0.0),
        direction: 90.0,
        directionVar: 0.0,
        speed: 150.0 / distance,
        speedVar: 50.0 / distance,
        startSize: 1.0 / distance,
        startSizeVar: 0.3 / distance,
        endSize: 1.2 / distance,
        endSizeVar: 0.2 / distance,
        life: 20.0 * distance,
        lifeVar: 10.0 * distance,
        emissionRate: 2.0,
        startRotationVar: 360.0,
        endRotationVar: 360.0,
        radialAccelerationVar: 10.0 / distance,
        tangentialAccelerationVar: 10.0 / distance);
    particleSystem.position = const Offset(512.0, 512.0);
    particleSystem.insertionOffset = Offset.zero;
    addChild(particleSystem);
  }

  @override
  bool handleEvent(SpriteBoxEvent event) {
    if (event.type == PointerDownEvent || event.type == PointerMoveEvent) {
      print(event.boxPosition);
      particleSystem.insertionOffset =
          convertPointToNodeSpace(event.boxPosition) -
              const Offset(512.0, 512.0);
    }

    if (event.type == PointerDownEvent) {
      particleSystem.reset();
    }
    return true;
  }
}
