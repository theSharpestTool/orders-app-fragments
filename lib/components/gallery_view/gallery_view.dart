import 'dart:typed_data';

import 'package:extended_image/extended_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/svg.dart';
import 'package:orders_app/components/loading_indicator/gk_loader.dart';
import 'package:orders_app/constants/colors.dart';
import 'package:orders_app/routes/transparent_route.dart';
import 'package:orders_app/stores/card_store/card_model_store.dart';
import 'package:orders_app/style/dimensions.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobx/mobx.dart';

class CardGalleryView extends StatelessWidget {
  const CardGalleryView({
    Key key,
    @required CardModelStore order,
  })  : _order = order,
        super(key: key);

  final CardModelStore _order;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Observer(
          builder: (_) => Row(
            children: [
              ..._order.userImages.map((image) {
                return Container(
                  width: 300,
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    color: GKColors.grey,
                    borderRadius: BorderDim.borderRadius,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderDim.borderRadius,
                    child: Image.memory(
                      image,
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              }).toList(),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                width: 300,
                decoration: BoxDecoration(
                  color: GKColors.grey,
                  borderRadius: BorderDim.borderRadius,
                ),
                child: Center(
                  child: InkWell(
                    onTap: () async {
                      ImageSource source;
                      await showDialog(
                        context: context,
                        builder: (context) => CupertinoAlertDialog(
                          title: Text('Select source'),
                          actions: <Widget>[
                            CupertinoDialogAction(
                              child: Text("Camera"),
                              onPressed: () {
                                source = ImageSource.camera;
                                Navigator.pop(context);
                              },
                            ),
                            CupertinoDialogAction(
                              child: Text("Gallery"),
                              onPressed: () {
                                source = ImageSource.gallery;
                                Navigator.pop(context);
                              },
                            ),
                          ],
                        ),
                      );
                      if (source == null) return;
                      final image = await ImagePicker.pickImage(
                        source: source,
                        maxWidth: 800,
                        maxHeight: 800,
                      );
                      if (image != null)
                        _order.addImage(image.readAsBytesSync());
                    },
                    child: SvgPicture.asset(
                      'svgs/add_shadow.svg',
                      width: 80,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class GalleryViewNetwork extends StatelessWidget {
  final ObservableList<String> images;

  const GalleryViewNetwork({
    @required this.images,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: <Widget>[
            for (final image in images)
              Row(
                children: <Widget>[
                  SizedBox(width: 10),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        TransparentRoute(
                          builder: (_) => ImageViewNetwork(
                            image: image,
                          ),
                        ),
                      );
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Hero(
                        tag: image,
                        child: GKImageNetwork(
                          image: image,
                          height: 150,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}

class GalleryViewMemory extends StatelessWidget {
  final ObservableList<Uint8List> images;

  const GalleryViewMemory({
    @required this.images,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: <Widget>[
            for (final image in images)
              Row(
                children: <Widget>[
                  SizedBox(width: 10),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        TransparentRoute(
                          builder: (_) => ImageViewMemory(
                            image: image,
                          ),
                        ),
                      );
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Hero(
                        tag: image,
                        child: Image.memory(
                          image,
                          height: 150,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}

class GKImageNetwork extends StatelessWidget {
  final String image;
  final double height;
  final double width;
  final BoxFit fit;

  GKImageNetwork({this.image, this.height, this.fit, this.width});

  @override
  Widget build(BuildContext context) {
    return Image.network(
      image,
      fit: fit,
      height: height,
      width: width,
      loadingBuilder: (context, child, event) {
        if (event == null) return child;
        return Center(
          child: Container(
            height: 50,
            width: 50,
            margin: EdgeInsets.all(20),
            child: GKLoader(),
          ),
        );
      },
    );
  }
}

class _ImageViewWrapper extends StatelessWidget {
  final Widget child;

  const _ImageViewWrapper({this.child});

  @override
  Widget build(BuildContext context) {
    return ExtendedImageSlidePage(
      slidePageBackgroundHandler: (offset, color) =>
          Colors.black.withOpacity(0.0),
      slideEndHandler: (offset, {details, state}) =>
          _slideEndHandler(offset, context),
      child: child,
    );
  }

  bool _slideEndHandler(Offset offset, BuildContext context) {
    Size pageSize = MediaQuery.of(context).size;
    return offset.distance >
        Offset(pageSize.width, pageSize.height).distance / 7.0;
  }
}

GestureConfig _initGestureConfigHandler(ExtendedImageState state) {
  return GestureConfig(
    minScale: 0.9,
    animationMinScale: 0.7,
    maxScale: 3.0,
    animationMaxScale: 3.5,
    speed: 1.0,
    inertialSpeed: 100.0,
    initialScale: 1.0,
    inPageView: true,
  );
}

class ImageViewMemory extends StatelessWidget {
  final Uint8List image;

  ImageViewMemory({this.image});

  @override
  Widget build(BuildContext context) {
    return _ImageViewWrapper(
      child: Hero(
        tag: image,
        child: ExtendedImage.memory(
          image,
          enableSlideOutPage: true,
          fit: BoxFit.contain,
          mode: ExtendedImageMode.gesture,
          initGestureConfigHandler: _initGestureConfigHandler,
        ),
      ),
    );
  }
}

class ImageViewNetwork extends StatelessWidget {
  final String image;

  ImageViewNetwork({this.image});

  @override
  Widget build(BuildContext context) {
    return _ImageViewWrapper(
      child: Hero(
        tag: image,
        child: ExtendedImage.network(
          image,
          enableSlideOutPage: true,
          fit: BoxFit.contain,
          mode: ExtendedImageMode.gesture,
          initGestureConfigHandler: _initGestureConfigHandler,
        ),
      ),
    );
  }
}
