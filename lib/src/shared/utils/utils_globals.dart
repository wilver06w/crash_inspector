class UtilGlobals {
  static String maskString(String input) {
    if (input.length <= 4) return input;
    return '${input.substring(0, 2)}...${input.substring(input.length - 2)}';
  }
}
