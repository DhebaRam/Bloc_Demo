import 'dart:ui';

import 'package:bloc_demo/weather_app/weather_bloc/weather_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WeatherHome extends StatefulWidget {
  const WeatherHome({super.key});

  @override
  State<WeatherHome> createState() => _WeatherHomeState();
}

class _WeatherHomeState extends State<WeatherHome> {
  final cityController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<WeatherBloc>().add(WeatherFetched('New Delhi'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text('Weather App',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1)),
            backgroundColor: Colors.white,
            titleSpacing: 5,
            centerTitle: true),
        backgroundColor: Colors.white,
        body: BlocBuilder<WeatherBloc, WeatherState>(builder: (context, state) {
          if (state is WeatherFailure) {
            return Center(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                  Text(state.error),
                  const SizedBox(height: 20),
                  Padding(
                      padding: const EdgeInsets.all(20),
                      child: TextField(
                          controller: cityController,
                          decoration:
                              const InputDecoration(hintText: 'Enter City'))),
                  const SizedBox(height: 20),
                  ElevatedButton(
                      onPressed: () {
                        context
                            .read<WeatherBloc>()
                            .add(WeatherFetched(cityController.text.trim()));
                      },
                      child: const Text('Search Weather'))
                ]));
          }

          if (state is! WeatherSuccess) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          }
          final data = state.weatherModel.list![0];

          final currentTemp = data.main!.temp;
          final currentSky = data.weather![0].main;
          final currentPressure = data.main!.pressure;
          final currentWindSpeed = data.wind!.speed;
          final currentHumidity = data.main!.humidity;

          return SingleChildScrollView(
              child: Column(children: [
            SizedBox(
              width: double.infinity,
              child: Card(
                elevation: 10,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(
                      sigmaX: 10,
                      sigmaY: 10,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          Text(
                            '$currentTemp K',
                            style: const TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 16),
                          Icon(
                            currentSky == 'Clouds' || currentSky == 'Rain'
                                ? Icons.cloud
                                : Icons.sunny,
                            size: 64,
                          ),
                          const SizedBox(height: 16),
                          Text(
                            currentSky!,
                            style: const TextStyle(
                              fontSize: 20,
                            ),
                          ),
                          const SizedBox(height: 20),
                          const Text(
                            'Additional Information',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              AdditionalInfoItem(
                                icon: Icons.water_drop,
                                label: 'Humidity',
                                value: currentHumidity.toString(),
                              ),
                              AdditionalInfoItem(
                                icon: Icons.air,
                                label: 'Wind Speed',
                                value: currentWindSpeed.toString(),
                              ),
                              AdditionalInfoItem(
                                icon: Icons.beach_access,
                                label: 'Pressure',
                                value: currentPressure.toString(),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),

            Padding(
                padding: const EdgeInsets.all(20),
                child: TextField(
                    controller: cityController,
                    decoration: const InputDecoration(hintText: 'Enter City'))),

            const SizedBox(height: 20),
            ElevatedButton(
                onPressed: () {
                  context
                      .read<WeatherBloc>()
                      .add(WeatherFetched(cityController.text.trim()));
                },
                child: const Text('Search Weather'))
            // const Text(
            //   'Hourly Forecast',
            //   style: TextStyle(
            //     fontSize: 24,
            //     fontWeight: FontWeight.bold,
            //   ),
            // ),
            // const SizedBox(height: 8),
            // SizedBox(
            //   height: 120,
            //   child: ListView.builder(
            //     itemCount: state.weatherModel.list!.length,
            //     scrollDirection: Axis.horizontal,
            //     itemBuilder: (context, index) {
            //       final hourlyForecast = state.weatherModel.list[index].;
            //       final hourlySky =
            //           data['list'][index + 1]['weather'][0]['main'];
            //       final hourlyTemp =
            //           hourlyForecast['main']['temp'].toString();
            //       final time = DateTime.parse(hourlyForecast['dt_txt']);
            //       return HourlyForecastItem(
            //         time: DateFormat.j().format(time),
            //         temperature: hourlyTemp,
            //         icon: hourlySky == 'Clouds' || hourlySky == 'Rain'
            //             ? Icons.cloud
            //             : Icons.sunny,
            //       );
            //     },
            //   ),
            // ),
          ]));
        }));
  }
}

class AdditionalInfoItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const AdditionalInfoItem({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          size: 32,
        ),
        const SizedBox(height: 8),
        Text(label),
        const SizedBox(height: 8),
        Text(
          value,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        )
      ],
    );
  }
}

class HourlyForecastItem extends StatelessWidget {
  final String time;
  final String temperature;
  final IconData icon;

  const HourlyForecastItem({
    super.key,
    required this.time,
    required this.temperature,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      child: Container(
        width: 100,
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            Text(
              time,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 8),
            Icon(
              icon,
              size: 32,
            ),
            const SizedBox(height: 8),
            Text(temperature),
          ],
        ),
      ),
    );
  }
}
