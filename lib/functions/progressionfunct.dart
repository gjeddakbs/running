List<double> progression(
    {required double currentMileage, required double mileageGoal}) {
  List<double> progressList = [];

  if (currentMileage < mileageGoal) {
    while (currentMileage <= mileageGoal) {
      currentMileage *= 1.1;
      print(currentMileage);
      progressList.add(double.parse(currentMileage.toStringAsExponential(2)));
    }
    return progressList;
  } else
    return progressList;
}
