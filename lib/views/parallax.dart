import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ParallaxWidget extends StatelessWidget {
  final String src;
  final keyImage = GlobalKey();
  final title;
  final String url;

  ParallaxWidget(
      {super.key, required this.src, required this.title, this.url = ""});

  Future<void> _launchInBrowser(String url) async {
    await launchUrl(Uri.parse(url),mode: LaunchMode.externalApplication);
    
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(5),
        margin: EdgeInsets.all(5),
        height: 220,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Flow(
            delegate: ParallaxFlowDelegate(
                scrollable: Scrollable.of(context)!,
                itemContext: context,
                keyImage: keyImage),
            children: [
              GestureDetector(
                child: Stack(
                  children: [
                    Container(
                        color: Colors.grey,
                        height: 280,
                        child: ColorFiltered(
                          colorFilter: ColorFilter.mode(
                              Theme.of(context)
                                  .backgroundColor
                                  .withOpacity(0.5),
                              BlendMode.color),
                          child: Image.network(
                            src,
                            fit: BoxFit.cover,
                            key: keyImage,
                          ),
                        )),
                    Container(
                      margin: EdgeInsets.only(top: 220, left: 20),
                      child: Text(
                        title,
                        style: TextStyle(color: Colors.white, fontSize: 20,fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                onTap: () {
                  _launchInBrowser(url);
                },
              )
            ],
          ),
        ));
  }
}

class ParallaxFlowDelegate extends FlowDelegate {
  final ScrollableState scrollable;
  final BuildContext itemContext;
  final GlobalKey keyImage;

  ParallaxFlowDelegate(
      {required this.scrollable,
      required this.itemContext,
      required this.keyImage})
      : super(repaint: scrollable.position);

  @override
  BoxConstraints getConstraintsForChild(int i, BoxConstraints constraints) =>
      BoxConstraints.tightFor(width: constraints.maxWidth);

  @override
  void paintChildren(FlowPaintingContext context) {
    final scrollableBox = scrollable.context.findRenderObject() as RenderBox;
    final itemBox = itemContext.findRenderObject() as RenderBox;
    final itemOffset = itemBox.localToGlobal(
        itemBox.size.centerLeft(Offset.zero),
        ancestor: scrollableBox);

    final viewportDimension = scrollable.position.viewportDimension;
    final scrollFraction = (itemOffset.dy / viewportDimension).clamp(0, 1);

    final verticalAlignment = Alignment(0, scrollFraction * 2 - 1);

    final imageBox = keyImage.currentContext!.findRenderObject() as RenderBox;
    final childRect =
        verticalAlignment.inscribe(imageBox.size, Offset.zero & context.size);
    context.paintChild(
      0,
      transform:
          Transform.translate(offset: Offset(0, childRect.top)).transform,
    );
  }

  @override
  bool shouldRepaint(covariant FlowDelegate oldDelegate) => true;
}
