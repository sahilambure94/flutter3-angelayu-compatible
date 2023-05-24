import 'package:flutter/material.dart';
import 'package:climateapp/utilities/constants.dart';
import 'package:climateapp/services/weather.dart';
import 'city_screen.dart';

class LocationScreen extends StatefulWidget {
  final dynamic locationData;

  LocationScreen({this.locationData});

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  WeatherModel weatherModel = WeatherModel();
  int temperature = 0;
  String weatherIcon = '';
  String weatherMessage = '';
  String cityName = '';

  @override
  void initState() {
    super.initState();
    updateUI(widget.locationData);
  }

  void updateUI(weatherData) {
    setState(() {
      if (weatherData == null) {
        this.temperature = 0;
        this.weatherMessage = 'Error to get online data.';
        this.weatherIcon = '';
        this.cityName = 'Error';
        return;
      }
      var condition = weatherData['weather'][0]['id'];
      this.weatherIcon = this.weatherModel.getWeatherIcon(condition);
      this.temperature = weatherData['main']['temp'].toInt();
      this.weatherMessage = this.weatherModel.getMessage(temperature);
      this.cityName = weatherData['name'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/location_background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  TextButton(
                    onPressed: () async {
                      var weatherData =
                          await this.weatherModel.getLocationWeather();
                      updateUI(weatherData);
                    },
                    child: Icon(
                      Icons.near_me,
                      size: 50.0,
                    ),
                  ),
                  TextButton(
                    onPressed: () async {
                      var inputCity = await Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return CityScreen();
                      }));
                      print(inputCity);
                      if (inputCity != null) {
                        var weatherData =
                            await this.weatherModel.getWeatherByCity(cityName);
                        updateUI(weatherData);
                      }
                    },
                    child: Icon(
                      Icons.location_city,
                      size: 50.0,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      '${this.temperature}°',
                      style: kTempTextStyle,
                    ),
                    Text(
                      this.weatherIcon,
                      style: kConditionTextStyle,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: Text(
                  "${this.weatherMessage} in ${this.cityName}!",
                  textAlign: TextAlign.right,
                  style: kMessageTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
