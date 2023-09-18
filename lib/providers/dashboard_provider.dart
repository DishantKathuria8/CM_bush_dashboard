import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DashboardProvider extends ChangeNotifier{
  var device1 = 40.0;
  var device2 = 50.0;
  var device3 = 50.0;

  var hotspotTemp = 100.0;
  var highTemp = 90.0;

  int alertCounterDevices =0;
  int warningCounterDevices =0;
  int normalCounterDevices = 3;

  Color boxColor = Colors.lightGreen;
  Color boxBorderColor = Colors.green;

  void checkTemperature() {
    if(device1>hotspotTemp || device2> hotspotTemp || device3>hotspotTemp){
      boxColor = Colors.redAccent;
      boxBorderColor = Colors.red;
    }
    else if (device1>highTemp || device2> highTemp || device3>highTemp){
      boxColor = CupertinoColors.systemYellow;
      boxBorderColor = Colors.orangeAccent;
    }
    else{
      boxColor = Colors.lightGreen;
      boxBorderColor = Colors.green;
    }

    notifyListeners();
  }

  void calculateCounters(){
    alertCounterDevices = 0;
    warningCounterDevices = 0;
    normalCounterDevices = 0;
    if(device1 < highTemp) {
      normalCounterDevices++;
    } else if(device1 > highTemp && device1 <= hotspotTemp) {
      warningCounterDevices++;
    } else {
      alertCounterDevices++;
    }
    if(device2 < highTemp) {
      normalCounterDevices++;
    } else if(device2 > highTemp && device2 <= hotspotTemp) {
      warningCounterDevices++;
    } else {
      alertCounterDevices++;
    }
    if(device3 < highTemp) {
      normalCounterDevices++;
    } else if(device3 > highTemp && device3 <= hotspotTemp) {
      warningCounterDevices++;
    } else {
      alertCounterDevices++;
    }
    notifyListeners();
  }
}