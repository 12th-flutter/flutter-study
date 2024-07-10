void nullableVariables() {
  String? seonga = 'seonga';
  // 변수타입 + ? = Nullable
  seonga = null;
  // if (seonga != null) {
  //   seonga.isNotEmpty;
  // }
  seonga?.isNotEmpty;
}