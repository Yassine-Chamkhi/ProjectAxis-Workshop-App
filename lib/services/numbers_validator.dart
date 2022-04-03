class NumbersValidator {
  bool isNumerical(String input) {
    int? parseResult = int.tryParse(input);
    if (parseResult == null) {
      return false;
    } else {
      return true;
    }
  }
}
