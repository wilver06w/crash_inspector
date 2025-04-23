String format422Errors(Map<String, List<String>> errors) {
  final formattedErrors = <String>[];

  errors.forEach((key, value) {
    formattedErrors.add(value[0]); // Cast value[0] to String
  });

  return formattedErrors.join('\n\n');
}
