String sayHello(String name, int age, [String? country = 'korea']) => 'Hello $name, you are $age years old from $country';

void optionalPositionalParameters() {
  var results = sayHello('seonga', 24);
  print(results);
}