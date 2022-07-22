import 'package:flutter/material.dart';
import 'package:skilled_bob_app_web/Customer/job_detail_page.dart';
import '../constant.dart';

class ProviderJobScreenMobile extends StatefulWidget {
  const ProviderJobScreenMobile({Key? key}) : super(key: key);

  @override
  _ProviderJobScreenMobileState createState() =>
      _ProviderJobScreenMobileState();
}

class _ProviderJobScreenMobileState extends State<ProviderJobScreenMobile> {
  bool convert = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'All Services',
          style: TextStyle(fontSize: 18.0, color: kLightBlue),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0.5,
        leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios, color: kLightBlue),
            onPressed: () => {Navigator.pop(context)}),
      ),
      body: CustomScrollView(
        shrinkWrap: true,
        slivers: [
          SliverToBoxAdapter(
            child: Wrap(
              children: [
                ListView.builder(
                    padding: const EdgeInsets.only(bottom: 10, top: 10),
                    primary: false,
                    shrinkWrap: true,
                    itemCount: 6,
                    itemBuilder: ((_, index) {
                      return GestureDetector(
                        onTap: () {
                          // Get.toNamed(RouteName.myServiceDetailRoute);
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return const JobDetail();
                          }));
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          margin: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black87.withOpacity(0.1),
                                  blurRadius: 10,
                                  offset: const Offset(0, 5))
                            ],
                            border: Border.all(
                                color: Colors.black87.withOpacity(0.05)),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(children: [
                                Hero(
                                  tag: '',
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10.0),
                                    child: Image.asset(
                                      'images/painting.jpg',
                                      height: 80,
                                      width: 80,
                                      fit: BoxFit.cover,
                                      //   errorWidget: (context, url,
                                      //           error) =>
                                      //       const Icon(Icons.error_outline),
                                      // ),
                                    ),
                                  ),
                                ),

                                //
                              ]),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Wrap(
                                  runSpacing: 10,
                                  alignment: WrapAlignment.start,
                                  children: <Widget>[
                                    Row(children: const [
                                      Expanded(
                                          child: Text('Painting Service',
                                              style: TextStyle(
                                                  color: Colors.black87,
                                                  height: 1.4,
                                                  fontSize: 16,
                                                  fontWeight:
                                                      FontWeight.bold))),
                                      // BookingOptionsPopupMenuWidget()
                                    ]),
                                    const Divider(
                                      height: 6,
                                      thickness: 0.5,
                                    ),
                                    Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Wrap(
                                              crossAxisAlignment:
                                                  WrapCrossAlignment.center,
                                              spacing: 5,
                                              children: [
                                                SizedBox(
                                                    height: 32,
                                                    child: Chip(
                                                        padding:
                                                            const EdgeInsets.all(
                                                                0),
                                                        label: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: const <
                                                                Widget>[
                                                              Icon(Icons.star,
                                                                  color:
                                                                      kLightBlue,
                                                                  size: 16),
                                                              Text('3.45',
                                                                  style: TextStyle(
                                                                      color:
                                                                          kLightBlue,
                                                                      height:
                                                                          1.4))
                                                            ]),
                                                        backgroundColor:
                                                            kLightBlue
                                                                .withOpacity(
                                                                    0.15),
                                                        shape:
                                                            const StadiumBorder())),
                                                const Text('(44)',
                                                    style: TextStyle(
                                                        color: kLightBlue,
                                                        height: 1.4))
                                              ]),
                                          const Text(
                                            '30 km',
                                            style: TextStyle(
                                                color: kLightBlue, height: 1.4),
                                          ),
                                        ]),
                                    const Divider(height: 6, thickness: 0.5),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: const [
                                        Text('Description',
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                fontSize: 17.0,
                                                color: Colors.black87)),
                                        Text(
                                            'We are providing high quality services to our customers. You are our first priority',
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                fontSize: 15.0,
                                                color: Colors.grey))
                                      ],
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    }))
              ],
            ),
          )
        ],
      ),
    );
  }
}
