# Dart 기본 문법

모든 다트앱에는 main() 함수가 있어야 한다. 일반적인 경우는 main() 함수가 시작점이 된다. 그리고 표현식 또는 함수 호출 끝에는 ;이 붙는다.

## 1. Hello World

콘솔에 텍스트를 출력하고 싶으면 print() 함수를 사용하고, 안에 원하는 문자열을 입력하면 된다.

```
void main() {
	print("Hello, World!");
}
```

![](https://velog.velcdn.com/images/junnkyuu/post/41c919f1-0074-4827-ab14-4e4a6621f8a6/image.png)

---
<br>

## 2. 변수/상수

변수는 특정 값을 담는 상자이다. 변수는 하나의 값을 담았다가 다른 값을 담을 수 있다. 그러나 상수는 하나의 값을 담으면 다른 값은 담지 못한다. 

### 자료형
- 숫자
    - 정수 : int
    - 실수 : double
    - 숫자(int, double의 상위) : num
- 문자열
    - 모든 문자열 : String
- 논리
    - 참 또는 거짓의 논리 값 : bool
- 콜렉션
    - 순서가 있는 여러 값들의 묶음 : List
    - 순서가 없고 중복되지 않는 값들의 집합 : Set
    - 키-값(key-value) 쌍들의 묶음 : Map
- 기타
    - 모든 타입의 상위 타입 : Object
    - 비동기 프로그래밍에 사용 : Future
    - 날짜와 시간 : DateTime
    - 동적 타입 : dynamic
    - null이 될 수 있는 타입 : 타입?
    
var 키워드로 선언된 변수는 처음 할당된 값의 타입만 가능하지만, dynamic으로 선언된 변수는 모든 타입의 값이 가능하다.

```
void main() {
	String? name = "JunKyu";
    print(name);
}
```

![](https://velog.velcdn.com/images/junnkyuu/post/d2587251-9f3c-4aca-bc5c-6bfd09ba9f21/image.png)

---
<br>

## 3. 레코드

레코드는 2023년 5월 구글에서 다트3에 새롭게 추가한 타입(자료형)이다. 다른 언어에서는 튜플(tuple)이라고 부른다. 

### 레코드
- 익명
    - 레코드에 속한 값(value)들은 꼭 키(key)를 가질 필요가 없다.
- 불변
    - 레코드를 한 번 생성한 후, 레코드 내부에서 값을 추가, 교체, 삭제할 수 없다. const, final 키워드로 선언되지 않으면 다른 값으로 교체할 수는 있다.
- 집합
    - 콜렉션으로 분류되는 리스트, 집합 또는 맵처럼 레코드 또한 여러 개의 값을 묶어서 사용할 수 있다.

<br>

### 기존의 콜렉션과의 차이점
- 고정 사이즈
    - 기존 콜렉션과 달리 레코드는 불변이므로 고정 사이즈이다.
- 이종의
    - 레코드에 속한 값들은 다양한 타입을 가질 수 있다. 기존의 콜렉션은 dynamic으로 선언하지 않는 이상 하나의 타입만 가질 수 있다.
- 타입이 지정됨
    - 레코드 그 자체에 대한 타입은 없고, (String, int)와 같이 레코드의 구조 자체가 하나의 타입이 된다.
    
<br>

### 레코드 생성 및 출력 방법

#### 생성

- 레코드 표현식을 작성하여 변수에 대입

```
var record = ('first', a: 2, b: true, 'last');
```

- 변수 선언과 초기화를 따로 작성

```
(String, int) record;
record = ('A string', 123);
```

#### 출력

키가 없는 경우는 $1,$2를 사용해서 값을 꺼낼 수 있다(0이 아니라 1부터 시작한다). 키가 있는 경우는 키를 사용해서 값을 꺼낼 수 있다.

```
void main() {
  var record = ('first', a: 2, b: 3, 'last');
  print(record.$1);
  print(record.a);
  print(record.b);
  print(record.$2);
}
```

![](https://velog.velcdn.com/images/junnkyuu/post/65f49e29-e969-47d8-b1f1-ac845f9b0053/image.png)

<br>

### 함수에서 여러 개의 값 반환 가능

레코드를 사용하는 큰 장점은 함수에서 여러 개의 값을 반환받을 수 있다는 점이다. 다음 코드는 userInfo 함수의 반환값은 하나의 레코드이면서 여러 개의 값이다.

```
void main() {
  (String, int) userInfo(Map<String, dynamic> json) {
    return (json['name'] as String, json['age'] as int);
  }
  
  final json = <String, dynamic> {
    'name' : 'dash',
    'age' : 10,
    'color' : 'blue',
  };
  
  var (name, age) = userInfo(json);
  
  print(name);
  print(age);
}
```

![](https://velog.velcdn.com/images/junnkyuu/post/14979dfd-8bf0-4079-b5ea-828978d2c7d9/image.png)

---
<br>

## 4. 연산자

### 연산자 종류
- 덧셈 : +
- 뺄셈 : -
- 부호를 뒤집음 : -
- 곱셈 : *
- 나눗셈(실수) : /
- 몫(정수) : ~/
- 나머지 : %
- 1을 더함(선반영) : ++변수
- 1을 더함(후반영) : 변수++
- 1을 뺌(선반영) : --변수
- 1을 뺌(후반영) : 변수--
- 같은지 비교 : ==
- 다른지 비교 : !=
- 큰지 비교 : >
- 작은지 비교 : <
- 크거나 같은지 비교 : >=
- 작거나 같은지 비교 : <=
- 값을 할당/재할당 : =
- 사칙연산 이후 재할당 : +=, -=, *= ,,,
- 표현식 결과 뒤집음 : !표현식
- OR : ||
- AND : &&

---
<br>

## 5. 조건문

특정 조건에서 실행되어야 하는 코드들은 if/else if 조건문을 사용한다.

```
void main() {
  int number = 31;
  if(number % 2 == 1) {
    print("홀수");
  } else {
    print("짝수");
  }
}
```
![](https://velog.velcdn.com/images/junnkyuu/post/9513789b-7128-4543-97ee-7bbfd73f0975/image.png)

---
<br>

## 6. 반복문

반복이 필요한 코드는 for, while 반복문을 사용한다.

```
void main() {
  for(int i = 0; i<100; i ++) {
    print(i);
  }
}
```

![](https://velog.velcdn.com/images/junnkyuu/post/2b41a9c9-3d80-4eb5-8afc-193a68d4b10d/image.png)

<br>

for in문을 통해서 반복도 가능하다.

```
void main() {
  List<String> kleague = ['수원삼성블루윙즈', 'FC서울', '울산HD', '포항스틸러스'];
  
  for(String team in kleague) {
    print(team);
  }
}
```

![](https://velog.velcdn.com/images/junnkyuu/post/f2a76ee1-4346-4020-8dda-db78225c4b2e/image.png)

<br>

while문을 통해서 동일하게 적을 수 있다.

```
void main() {
  int i = 0;
  while(i<100) {
    print(i);
    i++;
  }
}
```

![](https://velog.velcdn.com/images/junnkyuu/post/c7167d0e-7a63-4e0f-81d1-904011194b5a/image.png)

<br>

continue와 break를 통해서 조건문을 사용할 수도 있다.

```
void main() {
  for(int i = 0; i < 100; i ++) {
    if(i % 2 == 0) {
      continue;
    }
    print(i + 1);
  }
}
```
![](https://velog.velcdn.com/images/junnkyuu/post/a76008a4-aa6c-4227-862f-8191ed4df5da/image.png)

---
<br>

## 7. 함수

원하는 타입의 변수를 원하는 개수만큼 입력받을 수 있고, 특정한 값을 반환할 수도 있다. 앞에 언급했던 main도 하나의 함수이다. main함수와 함께 main함수에 들어갈 내용을 선언하고, 다트 코드가 실행될 때 main 함수가 코드의 시작점이 된다.

앞에 실습에서 사용했던 print처럼 다트에서 제공하는 함수를 내장함수라고 한다.

```
int add(int a, int b) {
  return a + b;
}

void main() {
  int num = add(10, 20);
  
  print(num);
}
```

![](https://velog.velcdn.com/images/junnkyuu/post/fbf5dbc1-61e7-4d1b-8b28-7280f37631b0/image.png)

위에 코드는 main 함수 -> add 함수 순서로 실행된다. 즉 나중에 호출된 함수가 먼저 종료되는 것을 call stack이라고 한다. 실행이 끝나면 맨 위에서부터 제거된다.

---
<br>

## 8. 패턴 매칭과 switch 문

### 패턴

다트의 문법적 카테고리로 실제값과 매치하는 값들의 집합의 모양을 의미한다. 패턴은 크게 2가지 일을 한다.

- 매칭 : 주어진 값이 특정한 패턴에 해당하는지 확인한다. 주로 switch문과 함께 쓰인다.
- 구조 분해 : 하나의 값을 여러 개의 값으로 분해한다.

<br>

패턴 매칭을 통해서는 주어진 값이 다음에 해당하는지 확인할 수 있다.

- 특정한 모양을 가지는지
- 특정한 상수 값인지
- 특정한 값과 같은지
- 특정 타입에 속하는지

<br>

```
void main() {
  int number = 1;
  
  switch(number) {
    case 1:
      print('one');
  }
}
```

![](https://velog.velcdn.com/images/junnkyuu/post/83a538dd-52e3-40ac-a0cf-6abb5833e0d4/image.png)

switch문은 if문을 여러개 쓰는 것과 크게 다르지 않다. 위 코드는 number의 값이 1인 경우 one을 출력하게 되는 switch문이다. 이것은 패턴 매칭이 등장하기 전부터 지원한 기능이지만, 패턴 매칭의 일부로 볼 수 있다.

---
<br>

## 9. 클래스 / 상속

### 클래스

클래스는 객체를 만들기 위한 하나의 틀이다. 클래스의 생성자 함수를 통해서 새로운 객체를 만들 수 있다. 객체는 다음을 포함한다.

- 속성 / 인스턴스 변수 : 객체 내부에 포함된 변수들
- 메서드 : 객체 내부에 포함된 함수들

<br>

```
class Person {
  String name;
  int age;
  int health = 100;
  
  Person(this.name, this.age);
  // 생성자 함수
  // 속성의 초기값을 할당
  
  void grow() {
    age = age + 1;
  }
  
  void run() {
    health = health - 10;
  }
  
  void sleep() {
    health = health + 10;
  }
}

void main() {
  Person junkyu = Person('junkyu', 28);
  
  junkyu.run();
  print(junkyu.health);
  
  junkyu.grow();
  print(junkyu.age);
  
}
```

![](https://velog.velcdn.com/images/junnkyuu/post/f1a63af2-53e8-48d5-a767-bf188233d603/image.png)

- name : 이름 속성
- age : 나이 속성
- health : 체력 속성
- grow() : age를 1 증가시키는 메서드
- run() : health를 10 감소시키는 메서드
- sleep() : health를 10 증가시키는 메서드

<br>

### 상속

```
class Animal {
  String name;
  int age;
  int health = 100;
  
  Animal(this.name, this.age);
  
  void grow() {
    age = age + 1;
  }
  
  void run() {
    health = health - 10;
  }
  
  void sleep() {
    health = health + 10;
  }
}

class Cat extends Animal {
  Cat(super.name, super.age);
  
  void meow() {
    print('meow');
  }
}

void main() {
  Cat cathy = Cat('cathy', 3);
  
  print(cathy.name);
  cathy.meow();
  
}
```

![](https://velog.velcdn.com/images/junnkyuu/post/3869d115-0b09-4ba9-a034-0bcd8a133c59/image.png)

위 코드는 Animal을 상속받아 Cat 클래스를 만들었다. 따라서 Cat은 Animal의 속성과 메서드를 모두 사용할 수 있고 Animal에는 존재하지 않지만 meow라는 함수도 만들 수 있다.

<br>

위에서 설명한 클래스, 상속은 객체 지향 프로그래밍 언어 특징을 가진 다트에서 중요한 개념이다. 플러터의 위젯을 다룰 때 클래스와 상속을 직접 사용하게 되므로 기억해야 한다.

---
<br>

## 10. 비동기

함수에 대해 설명할 때 call stack 개념이 나왔었다. 그러나 모든 함수를 call stack 방식으로 처리할 수는 없다. 가령, 타이머를 설정할 때, 서버의 응답을 기다려야 할 때 같은 상황, 플러터에서 사용자의 상호작용을 기다려야 할 때가 있다.

```
import 'dart:async';

void main() {
  Timer(Duration(seconds: 3),() {
    print("3초가 지났습니다!");
  });
  
  print("타이머 시작");
}
```

![](https://velog.velcdn.com/images/junnkyuu/post/8698430f-a163-4d6f-954e-e408a593e114/image.png)

위 코드를 보면 "타이머 시작"이 먼저 출력된다. 그 이유는 Timer가 비동기(async)함수이기 때문이다. Timer함수의 첫번째 인자로 들어온 3초가 지나고 나서 2번째 인자로 들어온 익명함수/람다함수가 실행이 된다.

기다리는 동안 밑에 있는 코드가 정상적으로 실행이 되므로, 3초를 기다리는 동안 밑에 있는 "타이머 시작"이 먼저 출력되고, 3초가 지나고 나서 "3초가 지났습니다"가 출력이 된다.

대표적인 비동기 함수로는 Future과 Stream이 있다.

- Future : 비동기적으로 반환되는 객체를 의미한다. HTTP 라이브러리를 통한 API의 호출 결과값이 있다.
- Stream : 데이터의 시퀀스를 의미한다. 파일을 읽어들이는 경우가 있다.

---
<br>

## 11. 예외처리

예외(Exception)이란, 코드의 컴파일 또는 실행 과정에서 발생할 수 있는 예상치 못한 상황이다. 오류와는 다른 개념인데, 오류는 개발자가 손쓸 수 없고 프로그램이 죽는 상황을 의미한다. 따라서 오류를 발생하지 않기 위해 미리 예외처리를 통해 예외를 발생시키는 것이다.

예외처리는 예외가 발생하면 그에 따른 알맞은 동작을 수행하게 하는 거이다. throw문으로 예외를 발생시키고, try/catch문을 통해서 예외 상황에서의 동작을 지정할 수 있다. finally는 예외가 발생하든, 발생하지 않든 마지막에 실행되는 코드이다.

```
throw FormatException('Expected at least 1 section');
```

```
try {
  breedMoreLlamas();
} catch {
  print('Error: $e'); // 예외 처리
} finally {
  cleanLlamaStalls(); // 마지막에 수행할 동작을 지정
}
```

---
<br>

### 참고 자료 및 출처
- [초보자도 프로처럼 만드는 플러터 앱개발](https://product.kyobobook.co.kr/detail/S000208993133)
