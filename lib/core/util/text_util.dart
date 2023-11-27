String unitText(int n, String singularUnit, String pluralUnit) {
  return n == 1 ? singularUnit : pluralUnit;
}

String unquote(String text) {
  if (text.startsWith('"') && text.endsWith('"')) {
    return text.substring(1, text.length - 1);
  }
  return text;
}
