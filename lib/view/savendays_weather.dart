import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/api_model/api_model.dart';
import 'package:weather_app/utils/color.dart';

// ignore: must_be_immutable
class NextSevenDaysWeather extends StatelessWidget {
  WeatherModel? weatherModel;
  NextSevenDaysWeather({super.key, required this.weatherModel});

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: weatherModel?.forecast?.forecastday?.length,
                itemBuilder: (context, index) {
                  Forecastday? forecastday =
                      weatherModel?.forecast?.forecastday?[index];
                  return Container(
                    margin: EdgeInsets.all(8.h),
                    padding: EdgeInsets.symmetric(vertical: 5.h),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.r),
                        color: AppColor.blackShade),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Image.network(
                                "http:${forecastday?.day?.condition?.icon}",height: 40,),
                            Text(
                              DateFormat.MMMEd().format(
                                  DateTime.parse(forecastday?.date ?? "")),
                              style: TextStyle(
                                  fontSize: 14.sp, color: AppColor.whiteColor),
                            ),
                            Text(forecastday?.day?.condition?.text ?? "",
                                style: TextStyle(
                                    fontSize: 14.sp, color: AppColor.whiteColor)),
                            Text(
                                "^${forecastday?.day?.maxtempC?.round().toString()}/${forecastday?.day?.mintempC?.round().toString()}",
                                style: TextStyle(
                                    fontSize: 14.sp, color: AppColor.whiteColor))
                          ],
                        )
                      ],
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}
