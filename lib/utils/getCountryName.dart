String getCountryFromTimezone({String timezone}) {
  RegExp regExp = RegExp(r"/(\w+)");
  Iterable<Match> matches = regExp.allMatches(timezone);
  return matches.elementAt(0).group(1);
}
