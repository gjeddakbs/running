const double mileLength = 1.609344;

double lapCounterfromKm(int distance) {
  return distance / 400;
}

double kmToMiles(double km) => km / mileLength;

double milesToKm(double miles) => miles * mileLength;

double kmMinToKmHour(double speed) => 60 / speed;

double kmHourToKmMin(double speed) => speed * 60;

double velocity(double time, double distance) {
  return distance / time;
}

//   https://runandbeyond.com/convert-pace/

double secondsSum(int minutes, double seconds) {
  return ((minutes * 60) + seconds);
}

// void minkmToMsecond({required int minutes, required double seconds}) {
//   var time = secondsSum(minutes, seconds);
//
//   // print("velocity: ${(1000 / time).toStringAsFixed(2)} m/s");
// }
//
// double minMilesToMsecond({required int minutes, required double seconds}) {
//    double time = secondsSum(minutes, seconds);
//   return (mileLength * 1000 / time);
// }

String mpMinToKmMin({required int seconds}) {
  double distanceTime = seconds / mileLength;
  return "${(distanceTime / 60).floor()}:${(distanceTime % 60).floor()}";
}

String kmMintoMileMin({required int seconds}) {
  double distanceTime = seconds * mileLength;
  return "${(distanceTime / 60).floor()}:${(distanceTime % 60).floor()}";
}

double meterSecondConverter({required bool metric, required int seconds}) {
  if (seconds == null) {
    return 0;
  } else if (metric)
    return 1000 / seconds;
  else
    return mileLength * 1000 / seconds;
}

double timeElapsed({required int distance, required double speed}) =>
    distance / speed;

String secondsToTimeString({required double seconds}) =>
    "${(seconds / 60).floor()}:${(seconds % 60).floor()}";

String timeUsed({required double pace, required var length}) {
  return secondsToTimeString(seconds: (length / pace));
}
// var speed1 = meterSecondConverter(metric: true, minutes: 4, seconds: 20);

// var timeElapsed1000 = timeElapsed(distance: 1000, speed: speed1);
