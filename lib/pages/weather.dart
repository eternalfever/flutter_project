import 'package:flutter/material.dart';
import 'package:flutter_project/models/weather_model.dart';
import 'package:http/http.dart' as http;

class WeatherPage extends StatefulWidget {
  const WeatherPage({Key? key}) : super(key: key);

  @override
  _WeatherPageState createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  CurrentWeatherModel? weather;

  void getWeather() async {
    final body = {'key': 'db8c200072e147ecb67114206212309', 'q': 'Yaroslavl'};
    final response =
        await http.get(Uri.http('api.weatherapi.com', 'v1/current.json', body));

    if (response.statusCode == 200) {
      final data = currentWeatherModelFromJson(response.body);
      if (response.body.isNotEmpty) {
        weather = data;
        setState(() {});
      }
    } else {
      throw ("ошибка");
    }
  }

  @override
  void initState() {
    getWeather();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return weather != null
        ? Scaffold(
            body: SafeArea(
              child: Container(
                width: double.infinity,
                child: Column(
                  children: [
                    Expanded(
                      child: Center(
                        child: Container(
                          width: double.infinity,
                          decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [Color(0xFFB5DEE8), Colors.white])),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'Температура сейчас',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                              Text(weather!.current.tempC.toString() + '°C',
                                  style: const TextStyle(
                                      fontSize: 80,
                                      color: Colors.blueAccent,
                                      fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const Divider(thickness: 1, color: Colors.grey),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          children: [
                            const Text(
                              'Прочие данные',
                              style: TextStyle(
                                  fontSize: 16, color: Colors.black54),
                            ),
                            info('Время обращения',
                                weather!.location.localtime.toString()),
                            info('Ощущается как',
                                weather!.current.feelslikeC.toString()),
                            info('Влажность',
                                weather!.current.humidity.toString()),
                            info('Давление',
                                weather!.current.pressureMb.toString()),
                            info('Индекс облачности',
                                weather!.current.cloud.toString()),
                            info(
                                'Осадки', weather!.current.precipMm.toString()),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        : const Center(
            child: CircularProgressIndicator(),
          );
  }

  Widget info(String txt, String data) {
    return Container(
      padding: const EdgeInsets.all(5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(txt,
              style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 15)),
          const VerticalDivider(),
          Text(data,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 17)),
        ],
      ),
    );
  }
}
