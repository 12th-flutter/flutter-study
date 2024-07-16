String sayHi(String name) {
  return "Hello $name nice to meet you!";
  // void 형태는 return 값을 갖지 않는다.
  // 이러한 형태는 call api 혹은 perform에서 사용
}

String sayHello(String name) => "Hello $name nice to meet you!";
num plus(num a, num b) => a + b;

void main() {
  print(sayHello('seonga'));
}