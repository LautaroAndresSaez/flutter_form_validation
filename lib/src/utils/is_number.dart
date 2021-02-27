bool isNumber(String value) {
  if (value.isEmpty) return false;
  return num.tryParse(value) == null ? false : true;
}
