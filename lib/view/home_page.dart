import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_weather_bg_null_safety/bg/weather_bg.dart';
import 'package:flutter_weather_bg_null_safety/utils/weather_type.dart';
import 'package:get/get.dart';
import 'package:weather_app/api_model/api_model.dart';
import 'package:weather_app/controller/api/api_controller.dart';
import 'package:weather_app/utils/color.dart';
import 'package:weather_app/view/savendays_weather.dart';
import 'package:weather_app/widget/todays_weather.dart';
import 'package:weather_app/widget/weather_hours.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _textController = TextEditingController();
  ApiController apiController = Get.put(ApiController());
  var searchText = "Dhaka";
  chooseCity() async {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Choose Location"),
            content: TextField(
              controller: _textController,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), hintText: "Choose Your City"),
            ),
            actions: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("Cancel")),
              ElevatedButton(
                  onPressed: () {
                    if (_textController.text.isEmpty) {
                      return;
                    } else {
                      setState(() {
                        searchText = _textController.text.toString();
                      });
                      Navigator.pop(context);
                    }
                  },
                  child: const Text("Ok"))
            ],
          );
        });
  }

  @override
  void initState() {
    super.initState();
    apiController.getWeatherData(searchText);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 10,
        backgroundColor: AppColor.blueColor,
        title: const Text(
          "Flutter Weather App",
          style: TextStyle(color: AppColor.whiteColor),
        ),
        actions: [
          IconButton(
            onPressed: () async {
              chooseCity();
            },
            icon: const Icon(Icons.search),
            color: AppColor.whiteColor,
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.my_location),
            color: AppColor.whiteColor,
          ),
        ],
      ),
      body: FutureBuilder(
          future: apiController.getWeatherData(searchText),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              WeatherModel? weatherModel = snapshot.data;
              return Stack(
                children: [
                  WeatherBg(
                      weatherType: WeatherType.cloudyNight,
                      width: MediaQuery.of(context).size.width,
                      height: Get.height),
                  Positioned(
                      top: 0,
                      left: 0,
                      child: SizedBox(
                        width: Get.width,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: Get.width * .04,
                              vertical: Get.height * .02),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TodaysWeather(weathermodel: weatherModel),
                              SizedBox(
                                height: 10.h,
                              ),
                              Text(
                                "Weather By Hours",
                                style: TextStyle(
                                    fontSize: 22.sp,
                                    color: AppColor.whiteColor,
                                    fontWeight: FontWeight.w600),
                              ),
                              SizedBox(
                                height: 5.h,
                              ),
                              SizedBox(
                                height: 150.h,
                                child: HoursWeather(weatherModel: weatherModel),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width,
                                margin: EdgeInsets.symmetric(
                                    horizontal: 20.w, vertical: 20.h),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 5.w, vertical: 10.h),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20.r),
                                    color: AppColor.blueColor),
                                child: TextButton(
                                  onPressed: () {
                                    Get.to(NextSevenDaysWeather(
                                        weatherModel: weatherModel));
                                  },
                                  child: Text(
                                    "Next 7 Days Weather",
                                    style: TextStyle(
                                        fontSize: 20.sp,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      )),
                ],
              );
            } else {
              return const Center(child: CircularProgressIndicator(color: AppColor.blueColor,));
            }
          }),
    );
  }
}
