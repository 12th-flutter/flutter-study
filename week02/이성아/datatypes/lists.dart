void lists() {
  var giveMeFive = true;
  var numbers1 = [1, 2, 3, 4];
  List<int> numbers2 = [
    1,
    2,
    3,
    4,
    if (giveMeFive) 5,
  ];
  // if (giveMeFive) {
  //   numbers2.add(5);
  // }
  // 선언 방법은 두 가지! var 사용 혹은 List<> 사용
  numbers1.add(5);
  numbers2.add('a'); // int에는 int에만, String에는 String만
  numbers1.first; // 가장 첫번째 값을 반환
  numbers1.last; // 가장 마지막 값을 반환
  // Dart의 List는 collection if, collection for 지원
  // collection if로 존재할 수도, 안할 수도 있는 값으로 List 생성 가능
}