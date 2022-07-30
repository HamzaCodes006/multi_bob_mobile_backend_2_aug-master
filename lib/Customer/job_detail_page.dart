import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:skilled_bob_app_web/isDesktop/Job_Detail_Page_Desktop.dart';
import 'package:skilled_bob_app_web/isMobile/Job_Detail_Page_Mobile.dart';
import 'package:skilled_bob_app_web/responsive.dart';

class JobDetail extends StatefulWidget {
  static const String id = 'JobDetail';
  final String? jID;
  final String? jobName;
  final List? jobImages;
  final String? jobPrice;
  final String? jobDescription;
  final String? providerId;
  final String? jobRating;
  final String? category;

  const JobDetail({
    Key? key,
    this.jID,
    this.jobName,
    this.jobPrice,
    this.jobDescription,
    this.providerId,
    this.jobImages,
    this.category,
    this.jobRating,
  }) : super(key: key);

  @override
  _JobDetailState createState() => _JobDetailState();
}

class _JobDetailState extends State<JobDetail> {
  // List<Asset> images = <Asset>[];
  String _error = 'No Error Dectected';

  // Future<void> loadAssets() async {
  //   List<Asset> resultList = <Asset>[];
  //   String error = 'No Error Detected';
  //   try {
  //     resultList = await MultiImagePicker.pickImages(
  //       maxImages: 300,
  //       enableCamera: true,
  //       selectedAssets: images,
  //       cupertinoOptions: const CupertinoOptions(
  //         takePhotoIcon: "chat",
  //         doneButtonTitle: "Fatto",
  //       ),
  //       materialOptions: const MaterialOptions(
  //         actionBarColor: "#abcdef",
  //         actionBarTitle: "Example App",
  //         allViewTitle: "All Photos",
  //         useDetailsView: false,
  //         selectCircleStrokeColor: "#000000",
  //       ),
  //     );
  //   } on Exception catch (e) {
  //     error = e.toString();
  //   }
  //
  //   // If the widget was removed from the tree while the asynchronous platform
  //   // message was in flight, we want to discard the reply rather than calling
  //   // setState to update our non-existent appearance.
  //   if (!mounted) return;
  //
  //   setState(() {
  //     images = resultList;
  //     _error = error;
  //   });
  // }

  // Widget buildGridView() {
  //   return GridView.count(
  //     crossAxisCount: 3,
  //     children: List.generate(images.length, (index) {
  //       Asset asset = images[index];
  //       return AssetThumb(
  //         asset: asset,
  //         width: 300,
  //         height: 300,
  //       );
  //     }),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Responsive(
      desktop: const JobDetailPageDesktop(),
      isDesktopMobile: JobDetailPageMobile(
        jobImages: widget.jobImages,
        jobPrice: widget.jobPrice,
        jobName: widget.jobName,
        jobDescription: widget.jobDescription,
        jID: widget.jID,
        providerId: widget.providerId,
        jobRating: widget.jobRating,
      ),
      mobile: JobDetailPageMobile(
        jobImages: widget.jobImages,
        jobPrice: widget.jobPrice,
        jobName: widget.jobName,
        jobDescription: widget.jobDescription,
        jID: widget.jID,
        providerId: widget.providerId,
        jobRating: widget.jobRating,
      ),
    );
  }
}
