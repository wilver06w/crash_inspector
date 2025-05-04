String format422Errors(Map<String, List<String>> errors) {
  final List<String> formattedErrors = <String>[];

  errors.forEach((String key, List<String> value) {
    formattedErrors.add(value[0]); // Cast value[0] to String
  });

  return formattedErrors.join('\n\n');
}
