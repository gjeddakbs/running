const double mileLength = 1.609344;

double lapCounterfromKm(int distance) {
  return distance / 400;
}

double kmToMiles(double km) => km / mileLength;

double milesToKm(double miles) => miles * mileLength;

double kmMinToKmHour(double speed) => 60 / speed;

double kmHourToKmMin(double speed) => speed * 60;

String distance(
    {required double paceMS, required int timeUsed, required lengthMetric}) {
  if (lengthMetric.toString() == "LengthMetric.meters") {
    return "${(paceMS * timeUsed).toStringAsFixed(1)} m";
  } else if (lengthMetric.toString() == "LengthMetric.km") {
    return "${((paceMS * timeUsed) / 1000).toStringAsFixed(1)} km";
  } else if (lengthMetric.toString() == "LengthMetric.miles") {
    return "${((paceMS * timeUsed) / (mileLength * 1000)).toStringAsFixed(1)} miles";
  }
  return "0.0";
}

double velocity({
  required int time,
  required double distance,
}) {
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
  if (metric)
    return 1000 / seconds;
  else
    return mileLength * 1000 / seconds;
}

double kmPerHourConverter({required double pace}) => pace * 3600 / 1000;
double milesPerHourConverter({required double pace}) =>
    pace * 3600 / (mileLength * 1000);

double timeElapsed({required int distance, required double speed}) =>
    distance / speed;

double oneRoundPace({required int time, required double length}) {
  var pace = velocity(time: time, distance: length);

  return pace;
}

String secondsToTimeString({required double secondsUsed}) {
  if (secondsUsed.isNaN || secondsUsed.isInfinite) return "0";
  var test = Duration(seconds: secondsUsed.toInt());

  return test.toString().split('.').first.padLeft(8, "0");

  // return "${(secondsUsed / 60).floor()} minutes :${(secondsUsed % 60).floor()}";
}

String timeUsed({required double pace, required var length}) {
  return secondsToTimeString(secondsUsed: (length / pace));
}

double lengthToMeter({required lengthMetric, required var length}) {
  if (lengthMetric.toString() == "LengthMetric.meters") {
    return length;
  } else if (lengthMetric.toString() == "LengthMetric.miles") {
    return length * (mileLength * 1000);
  }
  return length * 1000;
}

String meterSecondToDifferentSpeeds(
    {required double meterSecondSpeed, required speedEnum}) {
  if (speedEnum.toString() == "SpeedMetric.kmMin") {
    var minKm = (16.666666667 / meterSecondSpeed);
    return "${minKm.truncate()}m : ${(minKm.remainder(1) * 60).toStringAsFixed(0)}s /km";
  } else if (speedEnum.toString() == "SpeedMetric.milesMin") {
    return "${(26.8224 / meterSecondSpeed).toStringAsFixed(1)} Min/miles";
  } else if (speedEnum.toString() == "SpeedMetric.milesHour") {
    return "${(meterSecondSpeed * 2.236936).toStringAsFixed(1)} mph";
  } else if (speedEnum.toString() == "SpeedMetric.kmHour") {
    return "${(meterSecondSpeed * 18 / 5).toStringAsFixed(1)} km/h";
  }

  return "Annen verdi enn min/km";
}

double meterSecondConverter2({required speedMetric, var seconds, var value}) {
  if (speedMetric.toString() == "SpeedMetric.kmMin")
    return 1000 / seconds;
  else if (speedMetric.toString() == "SpeedMetric.milesMin")
    return mileLength * 1000 / seconds;
  else if (speedMetric.toString() == "SpeedMetric.kmHour")
    return (value * 5) / 18;
  else
    return value * 0.44704;
}

// var speed1 = meterSecondConverter(metric: true, minutes: 4, seconds: 20);

// var timeElapsed1000 = timeElapsed(distance: 1000, speed: speed1);
