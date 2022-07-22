import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../Customer/appbar_class.dart';
import '../Customer/category.dart';
import '../Customer/dashboard.dart';
import '../Customer/index_page.dart';
import '../Customer/post_a_request_customer.dart';
import '../constant.dart';

class IndexPageDesktop extends StatefulWidget {
  const IndexPageDesktop({Key? key}) : super(key: key);

  @override
  _IndexPageDesktopState createState() => _IndexPageDesktopState();
}

class _IndexPageDesktopState extends State<IndexPageDesktop> {
  final List<String> imgListWeb = [
    'images/img1.jpg',
    'images/img2.jpg',
    'images/img3.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      extendBodyBehindAppBar: true,
      appBar: const Appbar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CarouselSlider(
              options: CarouselOptions(
                  viewportFraction: 1.0,
                  aspectRatio: 2.8,
                  initialPage: 0,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 5),
                  autoPlayAnimationDuration:
                      const Duration(milliseconds: 1800)),
              items: imgListWeb
                  .map((item) => ClipRRect(
                        child: Image.asset(
                          item,
                          fit: BoxFit.fill,
                        ),
                      ))
                  .toList(),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 25.0, bottom: 10),
              child: Center(
                child: Text(
                  'CATEGORIES',
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 90.0),
              child: Row(
                children: List.generate(6, (index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 8.0,
                      horizontal: 15.0,
                    ),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Categories()));
                      },
                      child: Container(
                        width: size.width * 0.2,
                        height: size.height * 0.45,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 1,
                              blurRadius: 1,
                              offset: const Offset(
                                  0, 0), // changes position of shadow
                            ),
                          ],
                          color: kLightBlue,
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: size.width * 0.2,
                              height: size.height * 0.32,
                              child: ClipRRect(
                                borderRadius: const BorderRadius.only(
                                  topRight: Radius.circular(10),
                                ),
                                child: Image.asset(
                                  'images/image${index + 1}.jpeg',
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 16.0,
                                horizontal: 15.0,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Padding(
                                    padding: EdgeInsets.all(0),
                                    child: Text(
                                      'Service',
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    'Car & Bike Services',
                                    style: TextStyle(
                                      fontSize: 14,
                                      overflow: TextOverflow.ellipsis,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 25.0, bottom: 10),
              child: Center(
                child: Text(
                  'How MultiBob Works',
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 3.0, vertical: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  WorkContainer(
                      size: size,
                      title: 'POST AND DESCRIBE YOUR TASK ',
                      imagePath: 'images/writing down.png',
                      description:
                          'Post and describe the task for free! Please wait'
                          ' and MultiBob\'s group will respond with offers.'),
                  WorkContainer(
                      size: size,
                      title: 'CHOOSE A MULTIBOB YOU PREFER',
                      imagePath: 'images/one finger.png',
                      description:
                          'View Bob\'s favorite profile, skills, and assessments. Make a personal decision about the professional service provider you hire.'),
                  WorkContainer(
                      size: size,
                      title: 'LIVE A SMARTER LIFE WITH MULTIBOB',
                      imagePath: 'images/smart home checked.png',
                      description:
                          'Now relax and let MultiBob do his job. Please rate it and prepare to post the next job.'),

                  // const SizedBox(height: 18),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 25.0, bottom: 10),
              child: Center(
                child: Text(
                  'Why Choose MultiBob?',
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 3.0, vertical: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  WorkContainer(
                      size: size,
                      title: 'MEET NEW CUSTOMERS ',
                      imagePath: 'images/hands.png',
                      description:
                          'The beauty of signing up for MultiBob. The hard part of finding a job is over.'
                          ' You receive them directly in the e-mail box.'
                          ' You get into the position of choosing the jobs you like to do.'),
                  WorkContainer(
                      size: size,
                      title: 'INCREASE INCOME',
                      imagePath: 'images/refund2.png',
                      description:
                          'You get potential customers and you respond to them. More leads will follow. More jobs equals more income.'),
                  WorkContainer(
                      size: size,
                      title: 'BUILD YOUR ONLINE REPUTATION',
                      imagePath: 'images/five star.png',
                      description:
                          'Allow your staff to be reviewed and evaluated. Leads will make decisions based on your ratings. The better your reputation, the more jobs you will get.'),

                  // const SizedBox(height: 18),
                ],
              ),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            Container(
              height: size.height * 0.4,
              width: double.infinity,
              color: Colors.black,
              // constraints: BoxConstraints(maxWidth: 1200.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      Image.asset(
                        'images/horizontalLogo.png',
                        scale: 4,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(
                            left: 45.0, top: 20, bottom: 10, right: 10),
                        child: SizedBox(
                          width: 350,
                          child: Text(
                            'Mkilledbob is the easiest and best way to find the perfect service provider for your needs. Whether you are looking for a plumber, hairdresser, car service, carpenter, web designer or a music band. Don\'t worry, get the best BOB to do the job and service you need.',
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  size.width >= 820
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 50,
                            ),
                            const Text(
                              'SITE LINKS',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 10.0),
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const Dashboard()));
                              },
                              child: const Text(
                                'My Profile',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            const SizedBox(height: 10.0),
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const Categories()));
                              },
                              child: const Text(
                                'Categories',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            const SizedBox(height: 10.0),
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const PostARequestCustomer(),
                                  ),
                                );
                              },
                              child: const Text(
                                'Post A Requests',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        )
                      : Container(),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 50,
                      ),
                      const Text(
                        'SOCIAL MEDIA',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        children: [
                          IconButton(
                            icon: const Icon(FontAwesomeIcons.twitter),
                            tooltip: 'Twitter',
                            color: kLightBlue,
                            onPressed: () {},
                          ),
                          TextButton(
                            onPressed: () {},
                            child: const Text(
                              'Twitter',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(width: 10.0),
                      Row(
                        children: [
                          IconButton(
                              icon: const Icon(FontAwesomeIcons.facebook),
                              tooltip: 'Facebook',
                              color: kLightBlue,
                              onPressed: () {}),
                          TextButton(
                            onPressed: () {},
                            child: const Text(
                              'Facebook',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(width: 10.0),
                      Row(
                        children: [
                          IconButton(
                              icon: const Icon(FontAwesomeIcons.instagram),
                              tooltip: 'Instagram',
                              color: kLightBlue,
                              onPressed: () {}),
                          TextButton(
                            onPressed: () {},
                            child: const Text(
                              'Instagram',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 50,
                      ),
                      const Text(
                        'DOWNLOAD OUR APP',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Image.asset(
                        'images/google-play.png',
                        scale: 4,
                      ),
                      //const SizedBox(height: 10.0),
                      Image.asset(
                        'images/app-store.png',
                        scale: 7.6,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
