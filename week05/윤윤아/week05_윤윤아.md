### Flutter

- 프레임워크
- Fuchsia의 사용자 인터페이스와 애플리케이션 만들기 위해 사용
- Flutter 앱 개발 위해 **Dart**(프로그래밍 언어) 사용
- **크로스 플랫폼**(안드로이드, IOS 동시 개발 가능) 애플리케이션 개발
    
    ➡️ 장점: **동일한 코드**로 서비스 개발 → 유지 보수&기능 개발 인력 효율적 활용 가능
    
- 인터페이스나 사용자 경험 하나로 통일 ⭕ (자체적으로 인터페이스 렌더링 하기 때문)

### SDK(Software Development Kit)

- 소스코드의 모음 & 유틸리티

# Dart

- UI에 최적화
- 생산적인 개발환경
- 모든 플랫폼에서 빠름
    - 두 개의 컴파일러
    - Dart Web: dart 코드 → JS로 변환 
    - Dart Native: dart 코드 → 여러 CPU의 아키텍쳐에 맞게 변환(IOS, Android, Windows, Linux, Mac 컴파일 ⭕)
    - JIT (Just-In-Time): dart VM 사용 → 코드 결과 바로 보여줌(개발 중에는 dart 가상 머신이 JIT 컴파일러 제공), AOT (Ahead-Of-Time): 컴파일(시간 오래 걸림) → 바이너리 배포 (앱 배포 시 사용)
    : windows 바이너리로 컴파일 - 바이너리(=기계어) 제공
    → C 컴파일러 기계어로 컴파일 - 사람들 코드 실행
    - dart 가상 머신에서 코드 실행(개발 도중) → dart 가상 머신은 코드를 JIT로 컴파일 → dart한테 코드 AOT로 컴파일 요청(개발 완료) (= 코드가 기계어로 변환)
    - JIT 컴파일 → 코드 결과 화면으로 바로 볼 수 있음
    AOT 컴파일 → CPU 아키텍쳐에 맞춰 빠른 기계어, 컴파일된 바이너리 만들 수 있음
- null safety 도입: 개발자가 null 값 참조하면 고장

# flutter가 dart를 택한 이유

- JIT 컴파일 & AOT 컴파일 모두 존재 (빠른 피드백 & 최종 앱 컴파일)
- flutter & dart made by 구글 - 서로 최적화 가능

# 변수

```dart
void main() { // 'main' 함수가 꼭 있어야 함
  print('hello world'); // ;(세미콜론) 중요!
}
```

```dart
void main() {
  var name = '윤윤'; // 변수 type 없어도 알아서 구분함
  
  // 변수 업데이트 시 타입 일치해야 함
  name = 1; // ❌
  name = 'yunyun'; // ⭕
}
```

```dart
void main() {
  String name = '윤윤'; // 변수 type 명시적 지정
  name = 'yunyun';
}
```

- 함수나 메소드 내부에 지역 변수 선언 시 → **var** 사용
- class에서 변수나 property 선언 시 → **type 지정**

**dynamic**: 여러가지 type을 가질 수 있는 변수에 사용

```dart
void main() {
  var name; // dynamic name; 도 가능
  name = 'yunyun';
  name = 12;
  name = true;
}
```

```dart
void main() {
  dynamic name;
  if(name is String){
    /* 이 안에선 name은 String */
  }
  if(name is int){
    /* 이 안에선 name은 int */
  }
}
```

**null safety**: 개발자가 null 값을 참조할 수 없도록 하는 것 / 어떤 변수 or 데이터가 null이 될 수 있음을 명시하는 것 (dart 변수는 기본적으로 nullable ❌)

```dart
// null safety가 없을 때
bool isEmpty(String string) => string.length == 0; // null에는 length 속성 없음

void main() {
  isEmpty(null); // String 보내야 하는 곳에 null 보냈기 때문에 에러 뜸
}
```

```dart
void main() {
  String? yun = 'yun'; // yun이 String 또는 null
  yun = null;
  if(yun != null) { // 변수 사용하기 전 확인 or
    yun.isNotEmpty;
  }
  yun?.isNotEmpty; // yun이 null이 아니라면 isNotEmpty 속성 줌
}
```

final: 변수 절대 변경하지 않을 것(= 오직 한 번만 설정 가능)

```dart
final number = 1;
number = 2;  // 에러

final numbers = [1, 2, 3];
numbers.add(4)  // [1, 2, 3, 4] -> 에러 발생 ❌
```

const: final과 비슷하지만, 컴파일 할 때 알고 있는 값에 사용

late: 초기 데이터 없이 변수 선언 가능

```dart
late final String name;
name = 'yun';
```

# Widget

1. 독립적으로 실행되는 작은 프로그램
2. 주로 바탕화면 등에서 날씨나 뉴스, 생활정보 등을 보여줌
3. 그래픽이나 데이터 요소를 처리하는 함수를 가지고 있음

# What is Widget in flutter?

1. UI를 만들고 구성하는 모든 기본 단위 요소(text, icon, image, Text field, …)
2. 눈에 보이지 않는 요소들까지 위젯 (레이아웃을 정의하는 요소들(center, padding, column, …))
3. flutter에서는 모든 것이 위젯. 앱 그 자체도 위젯

# Types of Widgets

## Stateless와 Stateful의 일반적인 의미

Stateless ⇒ 이전 상호작용의 어떠한 값도 저장 ❌

Stateful ⇒ value 값을 지속적으로 추적 보존

## Stateless Widget(상태가 없는 정적인 위젯)

- 스크린상에 존재만 할 뿐 아무것도 하지 않음
- 어떠한 실시간 데이터도 저장 ❌
- 어떤 변화(모양, 상태)를 유발시키는 value값을 가지지 않음

↘️ text, image, …

## Stateful Widgets(계속 움직임이나 변화가 있는 위젯)

- 사용자의 interaction에 따라서 모양이 바뀜
- 데이터를 받게 되었을 때 모양이 바뀜

↘️ 체크박스, 라디오 버튼, …

# Flutter Widget tree

- Widget들은 tree 구조로 정리될 수 있음
- 한 Widget내에 얼마든지 다른 widget들이 포함될 수 있음
- Widget은 부모 위젯(Parent widget = widget container)과 자식 위젯으로 구성

# 기본 위젯

- 글자 위젯: `Text('글내용')`
- 이미지 위젯: `Image.asset('경로')`
- 이미지 보관용 assets 폴더 만들고 이미지 넣기
- 이미지 등록
- pubspec.yaml 파일 안에 assets 폴더 쓰겠다고 명시
    
    ```yaml
    # The following section is specific to Flutter packages.
    flutter:
      assets:
        - assets/
    ```
    
- 아이콘 위젯: `Icon(Icons.아이콘이름)`
- 박스 위젯: `Container(스타일)` or `SizedBox()` 
`스타일` 줄 땐 ( 스타일명: 값 ) → ( `width: 50, height: 50, …` ) (사이즈 단위는 LP(== 1.2cm))
Center(): 내 자식 위젯의 기준점을 중앙으로 설정
    
    ```dart
    home: Center(
          child: Container( width: 50, height: 50 ),
    )
    // 위젯( child: 위젯() )
    ```
    

# 상태 관리 기법

- Local State: 작은 위젯에서 상태 관리 할 때 유용
- Lifting State Up: 상태를 상위 위젯으로 이동 → 여러 위젯이 상태 공유할 수 있게 함
- Provider, Riverpod: 상태 객체를 효과적으로 제공&관리
- Redux, BLoC, Mobx: 큰 앱에서 복잡한 상태 관리에 사용되는 패턴 · 라이브러리

# 내비게이션

: 메뉴별로 화면을 분리해서 개발하는 방법
(ex. 버튼 클릭 → 어디로 이동? 어떤 데이터?)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SubPage Example',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: FirstPage(),
    );
  }
}

class FirstPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _FirstPage();
}

class _FirstPage extends State<FirstPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sub Page Main'),
      ),
      body: Container(
        child: Center(
          child: Text('첫 번째 페이지'),
        ),
      ),
      floatingActionButton: FloatingActionButton(
	      onPressed: (){ // Floating Button 누르면 onPressed 이벤트 호출
		      Navigator.of(context).push(MaterialPageRoute(builder: (context) => SecondPage())); // 현재 페이지(FirstPage) 위에 SecondPage 쌓음
		    },
		    child: Icon(Icons.add),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Page'),
      ),
      body: Container(
        child: Center(
          child: ElevatedButton(
            onPressed: (){
	            Navigator.of(context).pop(); // SecondPage 사라지고 FirstPage 보임
	          },
            child: Text('돌아가기'),
          ),
        ),
      ),
    );
  }
}
```

`Navigator`: 스택을 이용해 페이지를 관리할 때 사용하는 클래스
↘️ `of(context)` 함수: 현재 페이지 나타냄
↘️ `push()` 함수: 스택에 페이지를 쌓는 역할
↘️ `pop()` 함수: 스택 메모리에서 맨 위에 있는 페이지 제거