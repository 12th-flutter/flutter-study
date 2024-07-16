// String sayHello({String name = 'anon', int age = 99, String country = 'wakanda'}) {
//   return "Hello $name, you are $age, and you come from $country";
// }

String sayHello({required String name, required int age, required String country}) {
  return "Hello $name, you are $age, and you come from $country";
}

void namedParameters() {
  // print(sayHello('seonga', 24, 'korea')); >> 좋지 않은 방법
  print(sayHello(
    age : 12,
    country : 'korea',
    name : 'seonga'
  ));
  // 순서는 중요하지 않음! null safety에 걸리지 않으려면..
  // 1. named argument에 default value 정하기
  // 2. null이 아닌 default value를 지정하거나 required modifier 이용
}