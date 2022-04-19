import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_forecast/screens/controller.dart';
import 'package:intl/intl.dart';
import 'package:weather_forecast/utils/config.dart';

class MainScreen extends StatelessWidget {
  Controller controller = Get.put(Controller());

  Color blue = const Color(0xFF353E5E);
  Color white = const Color(0xFFF8F8F8);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(
          top: getHeight(200),
          left: getWidth(62),
          right: getWidth(62),
        ),
        decoration: BoxDecoration(
          color: Color(0xFF9DCAFF),
        ),
        child: Column(
          children: [
            Obx(
              () => Text(
                controller.state.value,
                style: TextStyle(
                  color: blue,
                  fontSize: getWidth(46),
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
            Text(
              DateFormat("EEEE dd, MMM, yyyy").format(DateTime.now()),
              style: TextStyle(
                color: blue.withOpacity(0.5),
                fontSize: getWidth(37),
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(
              height: getHeight(80),
            ),
            Obx(
              () => Text(
                controller.location.value,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: getWidth(60),
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            SizedBox(
              height: getHeight(0),
            ),
            Stack(
              alignment: Alignment.topCenter,
              children: [
                Container(
                  margin: EdgeInsets.only(
                    top: getHeight(250),
                  ),
                  padding: EdgeInsets.only(
                    top: getHeight(100),
                    bottom: getHeight(30),
                    left: getWidth(65),
                    right: getWidth(65),
                  ),
                  decoration: BoxDecoration(
                    color: Color(0xFF71BFF0),
                    borderRadius: BorderRadius.circular(46),
                  ),
                  height: getHeight(400),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Text(
                                "Humidity",
                                style: TextStyle(
                                  fontWeight: FontWeight.w800,
                                  fontSize: getWidth(18),
                                  color: white,
                                ),
                              ),
                              Obx(
                                () => Text(
                                  "${controller.humidity.value}%",
                                  style: TextStyle(
                                    color: white,
                                    fontSize: getWidth(43),
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                "Wind",
                                style: TextStyle(
                                  fontWeight: FontWeight.w800,
                                  fontSize: getWidth(18),
                                  color: white,
                                ),
                              ),
                              Obx(
                                () => Text(
                                  "${controller.wind.value}km",
                                  style: TextStyle(
                                    color: white,
                                    fontSize: getWidth(43),
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: getHeight(50),
                      ),
                      Obx(
                        () => Text(
                          "${controller.temp.value} C",
                          style: TextStyle(
                            color: white,
                            fontSize: getWidth(62),
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Image.asset(
                  "assets/cloud.png",
                  height: getHeight(400),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
