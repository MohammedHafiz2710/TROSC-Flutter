// weather_bloc.dart
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather/weather.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc() : super(WeatherInitial()) {
    String Your_API = "Your_API";
    on<FetchWeather>((event, emit) async {
      emit(WeatherLoading());
      try {
        WeatherFactory wf =
            WeatherFactory(Your_API, language: Language.ENGLISH);
        Weather weather = await wf.currentWeatherByLocation(
            event.position.latitude, event.position.longitude);
        emit(WeatherSuccess(weather));
      } catch (e) {
        emit(WeatherFailure('Unable to fetch weather data. Please try again.'));
      }
    });

    on<SearchWeather>((event, emit) async {
      emit(WeatherLoading());
      try {
        WeatherFactory wf = WeatherFactory("5821a8e7282b2ab332585139ab2b9d6b",
            language: Language.ENGLISH);
        Weather weather = await wf.currentWeatherByCityName(event.cityName);
        emit(WeatherSuccess(weather));
      } catch (e) {
        emit(WeatherFailure('City not found. Please enter a valid city name.'));
      }
    });
  }
}
