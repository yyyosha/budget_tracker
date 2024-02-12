class Parser {
  static String doubleToString(double val) {
    return val.toString().replaceAll(
          RegExp(r"([.]*0+)(?!.*\d)"),
          '',
        );
  }
}
