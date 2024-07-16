typedef UserInfo = Map<String, String>;

String sayHi(Map<String, String> userInfo) {
  return "Hi ${userInfo['name']}";
}

typedef ListOfInts = List<int>;

List<int> reverseListOfNumbers(List<int> list) {
  var reversed = list.reversed;
  return reversed.toList();
}

void typedef() {
  reverseListOfNumbers([1, 2, 3]);
  sayHi({'name' : 'seonga'});
}