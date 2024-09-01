// ignore: must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/api_model/api_model.dart';
import 'package:weather_app/utils/color.dart';

// ignore: must_be_immutable
class TodaysWeather extends StatelessWidget {
  WeatherModel? weathermodel;
  TodaysWeather({super.key, required this.weathermodel});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        

        SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  color: Colors.white10,
                ),
                child: Padding(
                  padding: EdgeInsets.all(5.h),
                  child: Column(
                    children: [
                      Text(
                        weathermodel?.location?.name ?? "",
                        style: TextStyle(
                            fontSize: 16.sp,
                            color: AppColor.whiteColor,
                            fontWeight: FontWeight.w600),
                      ),
                      Text(
                        DateFormat.yMMMMEEEEd().format(DateTime.parse(
                            weathermodel?.current?.lastUpdated ?? "")),
                        style: TextStyle(
                            fontSize: 12.sp,
                            color: AppColor.whiteColor,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 15.h),
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle, color: AppColor.blackShade),
                          child: Image.network(
                              "http:${weathermodel?.current?.condition?.icon ?? ""}")),
                      const Spacer(),
                      Text(
                        weathermodel?.current?.tempC?.round().toString() ??
                            "",
                        style:  TextStyle(
                            fontSize: 60.sp,
                            color: AppColor.pinkColor,
                            fontWeight: FontWeight.w600,letterSpacing: 5.h),
                      ),
                       Text(
                        "o",
                        style: TextStyle(
                            fontSize: 20.sp,
                            color: AppColor.pinkColor,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  Text(
                    weathermodel?.current?.condition?.text.toString() ?? "",
                    style: TextStyle(
                        fontSize: 15.sp,
                        color: AppColor.whiteColor,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
        
              //there is feelings====================
              Container(
                margin: EdgeInsets.only(top: 8.h),
                padding: EdgeInsets.all(2.h),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.r),
                    color: AppColor.blackShade),
                child: Column(children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                           Text(
                            "Feel Like",
                            style: TextStyle(
                                fontSize: 14.sp,
                                color: AppColor.whiteColor,
                                fontWeight: FontWeight.w400),
                          ),
                          Text(
                            weathermodel?.current?.feelslikeC
                                    ?.round()
                                    .toString() ??
                                "",
                            style: TextStyle(
                                fontSize: 14.sp,
                                color: AppColor.whiteColor,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                           Text(
                            "Wind",
                            style: TextStyle(
                                fontSize: 14.sp,
                                color: AppColor.whiteColor,
                                fontWeight: FontWeight.w400),
                          ),
                          Text(
                            "${weathermodel?.current?.windKph?.round().toString()} Km/h",
                            style: TextStyle(
                                fontSize: 14.sp,
                                color: AppColor.whiteColor,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      )
                    ],
                  ),
                 SizedBox(
                    height: 5.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          Text(
                            "Humidity",
                            style: TextStyle(
                                fontSize: 14.sp,
                                color: AppColor.whiteColor,
                                fontWeight: FontWeight.w400),
                          ),
                          Text(
                            "${weathermodel?.current?.humidity.toString()}%",
                            style: TextStyle(
                                fontSize: 14.sp,
                                color: AppColor.whiteColor,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                         Text(
                            "Visibility",
                            style: TextStyle(
                                fontSize: 14.sp,
                                color: AppColor.whiteColor,
                                fontWeight: FontWeight.w400),
                          ),
                          Text(
                            "${weathermodel?.current?.visKm?.round().toString()} Km",
                            style: TextStyle(
                                fontSize: 14.sp,
                                color: AppColor.whiteColor,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      )
                    ],
                  ),
                ]),
              )
            ],
          ),
        )
      ],
    );
  }
}
