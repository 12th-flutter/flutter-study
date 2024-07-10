void theVarKeyword() {
  // var name = '성아';
  dynamic name = '성아';
  if (name is String) {
    // 조건문 안에서는 name을 String으로 인식
  }
  if (name is int) {
    // 조건문 안에서는 name을 int로 인식
  }
  // name = 'seonga';
  // name = 12;
  // name = true;
}