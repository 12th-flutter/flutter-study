// String capitalizeName(String? name) {
//   if (name != null) {
//     return name.toUpperCase();
//   }
//   return 'ANON';
// }

// fat allow 방법
String capitalizeName(String? name) =>
  // name != null ? name.toUpperCase() : 'ANON';
  name.toUpperCase() ?? 'ANON';
  // left ?? right >> 좌항이 null이면, 우항을 return
void qqOperator() {
  capitalizeName('seonga');
  // capitalizeName(null);
  String? name;
  name = null;
  name ??= 'another';
  print(name);
}