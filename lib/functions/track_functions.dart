num roundCalculator({required num length}) => length / 400;

num numberOfRounds({required num length}) {
  num rounds = roundCalculator(length: length);
  if (rounds == rounds.roundToDouble()) {
    print("is int");
    return rounds.toInt();
  } else
    return rounds;
}
