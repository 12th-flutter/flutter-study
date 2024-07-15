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