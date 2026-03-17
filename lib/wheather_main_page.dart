import 'dart:convert';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:wheather_app/add_info_page.dart';
import 'package:http/http.dart' as http;
import 'package:wheather_app/secrets.dart';
import 'wheather_forecast_page.dart';
import 'dart:async';
import './options_page.dart';

class main_page extends StatefulWidget {
  const main_page({super.key});

  @override
  State<main_page> createState() => _main_pageState();
}

class _main_pageState extends State<main_page> {

  

  Future<Map<String,dynamic>> fetdata() async {
    try {
      String city = "Chennai";
      final res = await http.get(
        Uri.parse(
          'https://api.openweathermap.org/data/2.5/forecast?q=$city&APPID=$apikey',
        ),
      );
      final data = jsonDecode(res.body);
      if (data['cod'] != '200') {
        throw 'poda dei veliya';
      }
      return data;
    } catch (e) {
      throw e.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color.fromARGB(255, 154, 151, 127),
        title: const Text(
          'Wheather App',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [IconButton(onPressed: () {
          setState(() {
            
          });
        }, icon: Icon(Icons.refresh))],
      ),
      body: FutureBuilder(
        future: fetdata(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator.adaptive(),);
          }

          if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }

          final data=snapshot.data!;
          final dataatzero=data['list'][0];
          final curSky=dataatzero['weather'][0]['main'];
          final temp=dataatzero['main']['temp'];
          final curHumidity=dataatzero['main']['humidity'];
          final curWindSpeed=dataatzero['wind']['speed'];
          final curPresure=dataatzero['main']['pressure'];

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: double.infinity,
                  child: Card(
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: ClipRRect(
                      
                      borderRadius: BorderRadius.circular(15),
                      child: BackdropFilter(
                        
                        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            children: [
                              Text(
                                '$temp F',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 32,
                                ),
                              ),
                              const SizedBox(height: 10),
                              Icon(curSky=='Clouds' || curSky=='Rain'?Icons.cloud:Icons.sunny, size: 55),
                              const SizedBox(height: 10),
                              Text(
                                curSky,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  'Hourly Forecast',
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                
                      // for(int i=0;i<39;i++)
                      
                      //   forecastrow(
                      //     connect: data['list'][i+1]['dt'].toString(), value: data['list'][i+1]['main']['temp'].toString(),
                      //     icon: data['list'][i+1]['weather'][0]['main']=="Clouds" || data['list'][i+1]['weather'][0]['main']=="Rain"?"Cloud":"Sunny" 
                      //     )
                      SizedBox(
                        height: 103,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 8,
                          itemBuilder: (context, index)
                          {
                            final hourlyData=data['list'][index+1];
                            final time=DateTime.parse(hourlyData['dt_txt']);
                            return forecastrow(
                              time: DateFormat.j().format(time) ,
                              icon: hourlyData['weather'][0]['main']=="Clouds" || hourlyData['weather'][0]['main']=="Rain"?"Cloud":"Sunny",
                              value: hourlyData['main']['temp'].toString(),
                            );
                          },
                          ),
                      ),
                      
                    
                const SizedBox(height: 20),
                const Text(
                  'Additional Information',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    additional_info(
                      icon: Icons.water_drop,
                      label: "Humidity",
                      value: curHumidity.toString(),
                    ),
                    additional_info(
                      icon: Icons.air,
                      label: "Wind speed",
                      value: curWindSpeed.toString(),
                    ),
                    additional_info(
                      icon: Icons.beach_access,
                      label: "Pressure",
                      value: curPresure.toString(),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: BottomAppBar(
        color: const Color.fromARGB(255, 156, 153, 124),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: InkWell(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>options() ));
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Icon(Icons.home),
            Icon(Icons.search),
            Icon(Icons.settings),
            Icon(Icons.location_city),
            Icon(Icons.portable_wifi_off_outlined),
          ],
        ),
      ),
    )
    )
    );
  }
}
