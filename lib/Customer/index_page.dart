import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:skilled_bob_app_web/isMobile/Index_page_mobile.dart';
import 'package:skilled_bob_app_web/responsive.dart';
import '../constant.dart';
import '../isDesktop/Index_page_desktop.dart';

class IndexPage extends StatefulWidget {
  static const String id = 'IndexPage';

  const IndexPage({Key? key}) : super(key: key);

  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  @override
  Widget build(BuildContext context) {
    return const Responsive(
      desktop: IndexPageDesktop(),
      isDesktopMobile: IndexPageMobile(),
      mobile: IndexPageMobile(),
    );
  }
}

class WorkContainer extends StatelessWidget {
  const WorkContainer({
    Key? key,
    required this.size,
    required this.title,
    required this.description,
    required this.imagePath,
  }) : super(key: key);

  final Size size;
  final String title;
  final String description;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
      child: AnimatedContainer(
        duration: const Duration(seconds: 2),
        width: size.width * 0.25,
        height: size.height * 0.4,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 1,
              offset: const Offset(0, 0), // changes position of shadow
            )
          ],
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
          color: Colors.white,
        ),
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  // mainAxisAlignment:
                  // MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 22.0, bottom: 10),
                        child: SizedBox(
                          width: 90,
                          height: 80,
                          child: Image.asset(
                            imagePath,
                          ),
                        ),
                      ),
                    ),
                    Center(
                      child: Text(
                        title,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(
                        description,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                          color: Colors.grey,
                        ),
                        textAlign: TextAlign.justify,
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BuildMenuItem extends StatelessWidget {
  BuildMenuItem(
      {required this.icon, required this.text, required this.onPresed});

  final IconData icon;
  final String text;
  final Function onPresed;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        color: Colors.white,
      ),
      title: Text(
        text,
        style: kBodyText.copyWith(
            fontWeight: FontWeight.bold, color: Colors.white),
      ),
      hoverColor: Colors.orange.shade700,
      onTap: Ontap,
    );
  }

  Ontap() {
    return onPresed();
  }
}
