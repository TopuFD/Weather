import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/api_model/api_model.dart';
import 'package:weather_app/utils/color.dart';

// ignore: must_be_immutable
class HoursWeather extends StatelessWidget {
  WeatherModel? weatherModel;
  HoursWeather({super.key, required this.weatherModel});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: weatherModel?.forecast?.forecastday?[0].hour?.length,
        itemBuilder: (context, index) {
          Hour? hour = weatherModel?.forecast?.forecastday?[0].hour?[index];
          return Container(
            padding:  EdgeInsets.all(8.h),
            margin: EdgeInsets.all(8.h),
            width: 120.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color:AppColor.whiteOpacityColor,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 6.h),
                      child: Text(hour?.tempC?.round().toString()??"",style: const TextStyle(color: AppColor.whiteColor,)),
                    ),
                    Text("o",style: TextStyle(color: AppColor.whiteColor,fontSize: 10.sp),)
                  ],
                ),
                
                Image.network("http:${hour?.condition?.icon}"),
                
                Text(DateFormat.j().format(DateTime.parse(hour?.time??'')),style: const TextStyle(color: AppColor.whiteColor),),
              ],
            ),
          );
        });
  }
}
