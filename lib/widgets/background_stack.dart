import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/bloc/weather_bloc_bloc.dart';
import 'package:weather_app/widgets/helpers/weather_helpers.dart';

class BackgroundStack extends StatelessWidget {
  const BackgroundStack({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: Stack(
        children: [
          buildBackgroundCircles(),
          buildBlurEffect(),
          BlocBuilder<WeatherBlocBloc, WeatherBlocState>(
            builder: (context, state) {
              if (state is WeatherBlocSuccess) {
                final sunriseTime = formatTime(state.weather.sunrise);
                final sunsetTime = formatTime(state.weather.sunset);
                final tempMax = state.weather.tempMax?.toString() ?? 'N/A';
                final tempMin = state.weather.tempMin?.toString() ?? 'N/A';

                return SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      buildLocationAndGreeting(state.weather.areaName),
                      buildMainWeatherInfo(
                          state.weather.temperature!.celsius!.round(),
                          state.weather.weatherMain!.toUpperCase(),
                          DateFormat('EEEE dd -')
                              .add_jm()
                              .format(state.weather.date!),
                          state.weather.weatherConditionCode!),
                      const SizedBox(height: 30),
                      buildWeatherInfoRow(
                          'Sunrise', sunriseTime, 'Sunset', sunsetTime),
                      const Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 5.0, horizontal: 8),
                        child: Divider(color: Colors.grey),
                      ),
                      buildWeatherInfoRow(
                          'Temp Max', tempMax, 'Temp Min', tempMin),
                    ],
                  ),
                );
              } else if (state is WeatherBlocLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is WeatherBlocFailure) {
                return buildErrorMessage(state.message);
              }
              return const SizedBox.shrink(); // Default empty state
            },
          ),
        ],
      ),
    );
  }
}
