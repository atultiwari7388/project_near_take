import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:project_one/constants/app_colors.constants.dart';
import 'package:project_one/constants/dimensions.const.dart';

import '../../../constants/styles.const.dart';
import '../../../widgets/global_var.widgets.dart';
import '../home_screen.views.dart';

class RestaurantDetailsScreen extends StatefulWidget {
  const RestaurantDetailsScreen(
      {Key? key, required this.resImage, required this.title})
      : super(key: key);

  final resImage;
  final title;

  @override
  State<RestaurantDetailsScreen> createState() =>
      _RestaurantDetailsScreenState();
}

class _RestaurantDetailsScreenState extends State<RestaurantDetailsScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 4, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            // toolbarHeight: 90,
            automaticallyImplyLeading: false,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomCircleButtonWidget(
                    onTap: () => Navigator.pop(context),
                    icon: Icons.arrow_back_ios),
                CustomCircleButtonWidget(onTap: () {}, icon: Icons.search),
              ],
            ),
            pinned: true,
            backgroundColor: kPrimaryColor,
            elevation: 1,
            expandedHeight: AppDimensions.getHeight(240),
            flexibleSpace: FlexibleSpaceBar(
              collapseMode: CollapseMode.parallax,
              background: Image.asset(widget.resImage,
                  width: double.maxFinite, fit: BoxFit.cover),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              height: MediaQuery.of(context).size.height * 1.7,
              color: kLightGreyColor.withOpacity(0.24),
              child: Column(
                children: [
//======================== image and restaurant name or product name  ===========================
                  Container(
                    margin: EdgeInsets.only(
                        left: AppDimensions.getHeight(8),
                        right: AppDimensions.getWidth(12)),
                    decoration: BoxDecoration(
                        // color: kGreyColor.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(3)),
                    child: Row(
                      children: [
                        //image section
                        Stack(
                          children: [
                            Container(
                              width: AppDimensions.getWidth(90),
                              height: AppDimensions.getHeight(80),
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(widget.resImage),
                                    fit: BoxFit.cover),
                                borderRadius: BorderRadius.circular(7),
                              ),
                            ),
                          ],
                        ),
                        //text Section
                        Expanded(
                          child: Container(
                            height: AppDimensions.getHeight(110),
                            // width: AppDimensions.getWidth(230),
                            padding: const EdgeInsets.all(3),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: AppDimensions.getHeight(14)),
                                ReusableTextWidgetRes(
                                    text: widget.title,
                                    color: kBlackColor,
                                    fontSize: 15),
                                SizedBox(height: AppDimensions.getHeight(10)),
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: AppDimensions.getWidth(8)),
                                  child: Text(
                                    "House:00, Road:00, Street:00,City",
                                    style: AppStyles.subtitleText
                                        .copyWith(fontSize: 14),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: AppDimensions.getWidth(8)),
                                  child: Row(
                                    children: [
                                      Text(
                                        "Minimum Order:",
                                        style: AppStyles.subtitleText
                                            .copyWith(fontSize: 12),
                                      ),
                                      SizedBox(
                                          width: AppDimensions.getWidth(7)),
                                      const FaIcon(
                                          FontAwesomeIcons.indianRupeeSign,
                                          size: 12,
                                          color: kPrimaryColor),
                                      Text(
                                        "00.00",
                                        style: AppStyles.subtitleText.copyWith(
                                            fontSize: 12, color: kPrimaryColor),
                                      ),
                                    ],
                                  ),
                                ),

                                SizedBox(height: AppDimensions.getHeight(15)),

                                // SizedBox(height: 5),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(width: AppDimensions.getWidth(10)),
                        //favorite section
                        InkWell(
                            onTap: () {},
                            child: const FaIcon(FontAwesomeIcons.heart,
                                color: kLightGreyColor)),
                        SizedBox(width: AppDimensions.getWidth(10)),
                      ],
                    ),
                  ),

//======================== Rating , Location, Delivery Time, Free delivery =======================
                  Container(
                    margin: EdgeInsets.only(
                        left: AppDimensions.getHeight(30),
                        right: AppDimensions.getWidth(30)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const CustomColumnAndRowWidget(
                            icon: Icons.star,
                            firstText: "4.5",
                            secondText: "2 ratings"),
                        Column(
                          children: [
                            Row(
                              children: const [
                                Icon(Icons.location_on, color: kPrimaryColor),
                              ],
                            ),
                            Text("Location",
                                style: AppStyles.subtitleText.copyWith(
                                    color: kBlackColor, fontSize: 15)),
                          ],
                        ),
                        const CustomColumnAndRowWidget(
                            icon: Icons.alarm,
                            firstText: "30-40 min",
                            secondText: "Delivery Time"),
                      ],
                    ),
                  ),
                  SizedBox(height: AppDimensions.getHeight(30)),
//======================== All / Asian / Pizza / Varieties ==============================
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      // padding: EdgeInsets.all(AppDimensions.getHeight(2)),
                      margin: EdgeInsets.only(left: AppDimensions.getWidth(14)),
                      // width: AppDimensions.getWidth(260),
                      decoration: BoxDecoration(
                        color: kPrimaryColor.withOpacity(0.23),
                        borderRadius:
                            BorderRadius.circular(AppDimensions.getWidth(40)),
                      ),
                      child: TabBar(
                        labelColor: kPrimaryColor,
                        isScrollable: true,
                        unselectedLabelColor: kLightGreyColor,
                        controller: _tabController,
                        indicator: const CircleTabIndicator(
                            color: kPrimaryColor, radius: 4),
                        tabs: const [
                          Tab(text: "All"),
                          Tab(text: "Asian"),
                          Tab(text: "Pizza"),
                          Tab(text: "Varities"),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: AppDimensions.getHeight(10)),
//======================== Show TabBar view Data ==================================
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(
                          left: AppDimensions.getWidth(14), bottom: 20),
                      child: TabBarView(
                        controller: _tabController,
                        children: [
                          ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount:
                                  Globalvariable.popularFoodsItems.length,
                              itemBuilder: (_, index) {
                                final resData =
                                    Globalvariable.popularFoodsItems[index];
                                return RestaurantFoodData(
                                  title: resData["name"]!,
                                  image: resData["image"]!,
                                  onTap: () {
                                    Get.bottomSheet(
                                      persistent: false,
                                      // isScrollControlled: true,
                                      ignoreSafeArea: true,
                                      Container(
                                        padding: const EdgeInsets.all(8),
                                        decoration: const BoxDecoration(
                                          color: kWhiteColor,
                                          borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(10),
                                            topLeft: Radius.circular(10),
                                          ),
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            //tap to close
                                            InkWell(
                                              onTap: () => Get.back(),
                                              child: Align(
                                                alignment: Alignment.topRight,
                                                child: CircleAvatar(
                                                  radius: 25,
                                                  backgroundColor:
                                                      kPrimaryColor,
                                                  child: Text(
                                                    "X",
                                                    style: AppStyles
                                                        .subtitleText
                                                        .copyWith(
                                                            color: kWhiteColor),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            // image section
                                            Container(
                                              margin: EdgeInsets.only(
                                                  left: AppDimensions.getHeight(
                                                      8)),
                                              padding: EdgeInsets.only(
                                                  left: AppDimensions.getWidth(
                                                      8)),
                                              // width: AppDimensions.getWidth(280),
                                              width: double.maxFinite,
                                              decoration: BoxDecoration(
                                                  color: kWhiteColor,
                                                  borderRadius:
                                                      BorderRadius.circular(8)),
                                              child: Row(
                                                children: [
                                                  //image section
                                                  Stack(
                                                    children: [
                                                      Container(
                                                        width: AppDimensions
                                                            .getWidth(100),
                                                        height: AppDimensions
                                                            .getHeight(100),
                                                        decoration:
                                                            BoxDecoration(
                                                                // color: Colors.green,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            7),
                                                                image: DecorationImage(
                                                                    image: AssetImage(
                                                                        resData[
                                                                            "image"]!),
                                                                    fit: BoxFit
                                                                        .cover)),
                                                      ),
                                                      Positioned(
                                                        top: AppDimensions
                                                            .getHeight(15),
                                                        child: Container(
                                                          height: AppDimensions
                                                              .getHeight(20),
                                                          width: AppDimensions
                                                              .getWidth(60),
                                                          decoration:
                                                              BoxDecoration(
                                                            color:
                                                                kPrimaryColor,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .only(
                                                              topRight: Radius.circular(
                                                                  AppDimensions
                                                                      .getHeight(
                                                                          10)),
                                                              bottomRight: Radius
                                                                  .circular(AppDimensions
                                                                      .getHeight(
                                                                          10)),
                                                            ),
                                                          ),
                                                          child: Center(
                                                              child: Text(
                                                                  "15% Off",
                                                                  style: AppStyles
                                                                      .subtitleText
                                                                      .copyWith(
                                                                          color:
                                                                              kWhiteColor,
                                                                          fontSize:
                                                                              13))),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  //text Section
                                                  Container(
                                                    height:
                                                        AppDimensions.getHeight(
                                                            120),
                                                    padding:
                                                        const EdgeInsets.all(3),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        ReusableTextWidgetRes(
                                                            text: resData[
                                                                "name"]!,
                                                            color: kBlackColor,
                                                            fontSize: 15),
                                                        SizedBox(
                                                            height:
                                                                AppDimensions
                                                                    .getHeight(
                                                                        5)),
                                                        ReusableTextWidgetRes(
                                                            text:
                                                                "Hungry puppets",
                                                            color:
                                                                kDarkGreyColor,
                                                            fontSize: 15),
                                                        Padding(
                                                          padding: EdgeInsets.only(
                                                              left:
                                                                  AppDimensions
                                                                      .getWidth(
                                                                          7)),
                                                          child: Row(
                                                            children: [
                                                              Row(
                                                                children: List.generate(
                                                                    5,
                                                                    (index) => const Icon(
                                                                        Icons
                                                                            .star,
                                                                        color:
                                                                            kPrimaryColor,
                                                                        size:
                                                                            18)),
                                                              ),
                                                              SizedBox(
                                                                  width: AppDimensions
                                                                      .getWidth(
                                                                          3)),
                                                              Text("(12)"),
                                                            ],
                                                          ),
                                                        ),
                                                        SizedBox(
                                                            height:
                                                                AppDimensions
                                                                    .getHeight(
                                                                        5)),
                                                        //price section
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  left: 8.0),
                                                          child: Row(
                                                            children: [
                                                              FaIcon(
                                                                  FontAwesomeIcons
                                                                      .indianRupeeSign,
                                                                  size: 12),
                                                              Text("120"),
                                                            ],
                                                          ),
                                                        ),
                                                        //price drop section
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  left: 8.0),
                                                          child: Row(
                                                            children: [
                                                              const FaIcon(
                                                                FontAwesomeIcons
                                                                    .indianRupeeSign,
                                                                size: 12,
                                                                color:
                                                                    kGreyColor,
                                                              ),
                                                              Text("120",
                                                                  style: AppStyles
                                                                      .subtitleText
                                                                      .copyWith(
                                                                          color:
                                                                              kGreyColor,
                                                                          decoration:
                                                                              TextDecoration.lineThrough)),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            //details section
                                            Flexible(child: Container()),
                                            //bottom section
                                            Row(
                                              children: [
                                                Container(
                                                  height: 50,
                                                  width: 60,
                                                  decoration: BoxDecoration(
                                                    color: kWhiteColor,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    border: Border.all(
                                                        color: kPrimaryColor),
                                                  ),
                                                  child: const Icon(
                                                      Icons.shopping_cart,
                                                      color: kPrimaryColor),
                                                ),
                                                SizedBox(
                                                    width:
                                                        AppDimensions.getWidth(
                                                            10)),
                                                Expanded(
                                                  child: ElevatedButton(
                                                    onPressed: () {},
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                      backgroundColor:
                                                          kPrimaryColor,
                                                      elevation: 1,
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              12.0),
                                                      child: Text(
                                                        "Order now",
                                                        style: AppStyles
                                                            .subtitleText
                                                            .copyWith(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color:
                                                                    kWhiteColor,
                                                                fontSize: 18),
                                                      ),
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                );
                              }),
                          Text("Second data"),
                          Text("Third data"),
                          Text("Fourth data"),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

//================= Restaurants food data  =========================

class RestaurantFoodData extends StatelessWidget {
  const RestaurantFoodData(
      {Key? key, required this.title, required this.image, required this.onTap})
      : super(key: key);

  final String title, image;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(bottom: AppDimensions.getHeight(8)),
        padding: EdgeInsets.only(left: AppDimensions.getWidth(8)),
        // width: AppDimensions.getWidth(280),
        // decoration: BoxDecoration(
        //     color: kWhiteColor, borderRadius: BorderRadius.circular(8)),
        child: Row(
          children: [
            //image section
            Stack(
              children: [
                Container(
                  width: AppDimensions.getWidth(100),
                  height: AppDimensions.getHeight(100),
                  decoration: BoxDecoration(
                      // color: Colors.green,
                      borderRadius: BorderRadius.circular(7),
                      image: DecorationImage(
                          image: AssetImage(image), fit: BoxFit.cover)),
                ),
                Positioned(
                  top: AppDimensions.getHeight(15),
                  child: Container(
                    height: AppDimensions.getHeight(20),
                    width: AppDimensions.getWidth(60),
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(AppDimensions.getHeight(10)),
                        bottomRight:
                            Radius.circular(AppDimensions.getHeight(10)),
                      ),
                    ),
                    child: Center(
                        child: Text("15% Off",
                            style: AppStyles.subtitleText
                                .copyWith(color: kWhiteColor, fontSize: 13))),
                  ),
                ),
              ],
            ),
            //text Section
            Expanded(
              child: Container(
                height: AppDimensions.getHeight(100),
                padding: const EdgeInsets.all(3),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ReusableTextWidgetRes(
                        text: title, color: kBlackColor, fontSize: 15),
                    SizedBox(height: AppDimensions.getHeight(5)),
                    ReusableTextWidgetRes(
                        text: "Hungry puppets",
                        color: kDarkGreyColor,
                        fontSize: 15),
                    Padding(
                      padding: EdgeInsets.only(left: AppDimensions.getWidth(7)),
                      child: Row(
                        children: [
                          Row(
                            children: List.generate(
                                5,
                                (index) => const Icon(Icons.star,
                                    color: kPrimaryColor, size: 18)),
                          ),
                          SizedBox(width: AppDimensions.getWidth(3)),
                          Text("(12)"),
                        ],
                      ),
                    ),
                    SizedBox(height: AppDimensions.getHeight(5)),
                    Padding(
                      padding: EdgeInsets.only(left: AppDimensions.getWidth(7)),
                      child: Row(
                        children: [
                          Row(
                            children: [
                              FaIcon(FontAwesomeIcons.indianRupeeSign,
                                  size: 12),
                              Text("120"),
                            ],
                          ),
                          SizedBox(width: AppDimensions.getWidth(10)),
                          Row(
                            children: [
                              FaIcon(FontAwesomeIcons.indianRupeeSign,
                                  size: 12, color: kDarkGreyColor),
                              Text("190",
                                  style: AppStyles.subtitleText.copyWith(
                                      fontSize: 15,
                                      decoration: TextDecoration.lineThrough)),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Column(
              children: [
                InkWell(onTap: () {}, child: const Icon(Icons.add)),
                SizedBox(height: AppDimensions.getHeight(20)),
                InkWell(
                    onTap: () {},
                    child: const Icon(Icons.favorite, color: kLightGreyColor)),
              ],
            ),
            SizedBox(width: AppDimensions.getWidth(15)),
          ],
        ),
      ),
    );
  }
}

class CircleTabIndicator extends Decoration {
  const CircleTabIndicator(
      {Key? key, required this.color, required this.radius});

  final Color color;
  final double radius;

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _CirclePainter(color: color, radius: radius);
  }
}

class _CirclePainter extends BoxPainter {
  final double radius;
  late Color color;

  _CirclePainter({required this.color, required this.radius});

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration cfg) {
    late Paint _paint;
    _paint = Paint()..color = color;
    _paint = _paint..isAntiAlias = true;
    final Offset circleOffset =
        offset + Offset(cfg.size!.width / 2, cfg.size!.height - radius);
    canvas.drawCircle(circleOffset, radius, _paint);
  }
}

class CustomCircleButtonWidget extends StatelessWidget {
  const CustomCircleButtonWidget(
      {Key? key, required this.onTap, required this.icon})
      : super(key: key);

  final Function() onTap;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: CircleAvatar(
        radius: 22,
        backgroundColor: kPrimaryColor,
        child: Center(
            child: Icon(
          icon,
          color: kWhiteColor,
        )),
      ),
    );
  }
}

class CustomColumnAndRowWidget extends StatelessWidget {
  const CustomColumnAndRowWidget(
      {Key? key,
      required this.icon,
      required this.firstText,
      required this.secondText})
      : super(key: key);

  final IconData icon;
  final String firstText;
  final String secondText;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Icon(icon, color: kPrimaryColor),
            Text(firstText.toString(),
                style: AppStyles.subtitleText
                    .copyWith(color: kBlackColor, fontSize: 15)),
          ],
        ),
        Text(secondText,
            style: AppStyles.subtitleText
                .copyWith(color: kBlackColor, fontSize: 15)),
      ],
    );
  }
}
