import 'dart:convert';
import 'package:get/get.dart';
import '../custom_dio.dart';
import 'package:geolocator/geolocator.dart';

class Controller extends GetxController {
  RxString currentTime = "".obs;
  RxString state = "".obs;
  RxString location = "".obs;
  RxString humidity = "".obs;
  RxString temp = "".obs;
  RxString wind = "".obs;

  @override
  void onInit() async {
    // LocationPermission permission;
    // permission = await Geolocator.checkPermission();
    // Position position = await Geolocator.getCurrentPosition(
    //     desiredAccuracy: LocationAccuracy.high);
    // await getCurrentWeather(
    //   lat: position.latitude.toString(),
    //   lon: position.longitude.toString(),
    // );
    await getCurrentWeather();
    super.onInit();
  }

  Future getCurrentWeather(
      {String lat = "20.976454", String lon = "105.817439"}) async {
    try {
      CustomDio customDio = CustomDio();
      var res = await customDio.get("onecall", {
        "lat": lat,
        "lon": lon,
        "appid": "d7ba2fceb56356ee1a9bb20137211e29",
        "units": "metric",
      });
      print(res);

      var json = jsonDecode(res.toString());

      var current = json["current"];

      state.value = current["weather"][0]["description"];
      location.value = json["timezone"];
      humidity.value = current["humidity"].toString();
      temp.value = current["temp"].toString();
      wind.value = current["wind_speed"].toString();
    } catch (e) {
      print(e);
    }
  }
}
