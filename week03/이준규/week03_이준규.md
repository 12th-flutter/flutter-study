## 1. UI 작업(위젯)

위젯은 플러터에서 UI를 구성하는 기본 단위이다. 플러터 개발은 위젯을 사용하여 결합하는 방식으로 진행된다. 모든 위젯은 Stateless 위젯, Stateful 위젯 등의 클래스를 상속받은 클래스이기도 하다.

변경될 수 있는 값을 상태(State)를 사용해서 표현한다. 이를 선언형 UI라고 한다. 상태가 변경되면 위젯은 스스로 업데이트한다.

<br>

### React Component VS Flutter Widget

- 공통점
    - React는 component 단위, flutter는 widget 단위로 UI를 만든다. 
    - React의 component와 flutter의 widget 모두 재사용이 가능하다.
    - component, widget을 결합하여 새로운 component, widget을 만들 수 있다.
    - 모두 선언형 UI로 작성한다.
    - 상태를 가질 수 있다.(단, flutter의 widget 중에서는 상태를 가질 수 없는 stateless widget이 존재한다.)
    
- 차이점
    - React component의 최하위로 내려가면 html 요소들이 사용된다. 하지만 flutter의 최하위로 내려가면 material widget(text, icon,,,)이다.
    - React의 스타일은 css 영역이지만, flutter는 layout 관련 기본 위젯(Container, Row,,,) 및 스타일 관련 기본 클래스(TextStyle,,,)가 다수 존재한다.
    - React는 함수형 component를 생성할 수 있지만, flutter의 widget은 기본적으로 클래스이다.
    - React의 component는 html과 유사한 jsx 문법이지만, flutter의 widget은 dart 문법을 사용한다.
    
<br>

### Stateless widget VS Stateful Widget

위젯은 상태 포함 여부에 따라 Stateless, Stateful로 나뉘어진다. 많은 문서에서는 가능한 Stateless 위젯을 권장하고 있다.

- Stateless widget
    - 설명
    	- 상태를 포함하지 않는 위젯
       - Provider등 전역 상태는 사용 가능
    - 특징
    	- build 메서드: 완성된 위젯 타입의 UI를 반환
- Stateful widget
    - 설명
    	- 상태를 포함하는 위젯
       - 위젯 본체, 위젯 상태가 별개의 클래스로 구분됨
       - 로직 및 UI는 위젯 본체가 아닌 위젯 상태에 작성
    - 특징
    	- build 메서드 : Stateful 위젯 클래스가 아닌 State 클래스의 인스턴스에 존재, 완성된 위젯 타입의 UI를 반환
       - createState 메서드 : 위젯 내부에서 상태 생성, 템플릿에서 굳이 수정할 필요 없음
       - initState 메서드 : 상태를 초기화
       - setState 메서드(() {}) : 상태 변경 시, 해당 메서드의 콜백 함수 내에 상태 변경 로직을 넣어야 UI에 반영
    	
<br>

### 위젯 트리

![](https://velog.velcdn.com/images/junnkyuu/post/893d3000-a836-44f5-8430-7a62e8de9216/image.png)

[사진출처](https://www.hungrimind.com/flutter/widget-tree)

플러터 UI는 기본적으로 위젯들을 조합해서 만들어지며, 위젯 간의 포함 관계에 의한 위계가 있다. 그림의 Container, Row, Column은 레이아웃 위젯들이고, Child, Children 등의 프로퍼티로 하위 위젯을 가질 수 있다. 상태가 변경될 때 최소한의 변경을 수행한다.

---
<br>

## 2. 플러터 기본 위젯

### 텍스트(Text), 아이콘(Icon), 이미지(Image)

가장 기본적인 단위의 위젯이다. 위의 그림에서 위젯 트리의 맨 끝에 위치한다.

<br>

### 레이아웃

이들은 위젯들의 배치에 주로 관여한다. 주로 Child, Children으로 자식 위젯을 받아서 표시한다. 보통 Container, Row, Column, Stack들이 기본이 된다.

Container는 기본적인 채우기, 위치 및 크기 조정을 결합한 위젯이다. 기본적인 UI 요소를 만들어내는 단위이고 화면을 꾸미기 위한 다양한 기능을 제공한다.

Row와 Column은 Container와 같은 UI 요소들을 가로, 세로로 배치하는 위젯이다. 그래서 이들은 Children 속성을 가져서 여러 개의 자식 위젯을 받는다. 그리고 Row안에 또는 Column안에 또 다른 Row, Column을 넣어서 복잡하게 구현할 수도 있다.

Stack은 UI 요소들을 겹겹이 쌓이게 해주는 위젯이다. 가로축, 세로축과 같이 또 하나의 축이라고 생각하면 된다. Stack을 사용하면 하나의 위젯이 다른 위젯 위에 떠 있는 것처럼 구현할 수 있다.

- Container
- Padding
- SizeBox
- Column
- Row
- Flex
- ListView
- GridView
- SingleChildScrollView
- Stack
- Align
- AspectRatio
- ...

<br>

### 입력, 폼

사용자의 입력을 받고 사용자와 상호 작용하는 위젯이다. 주로 상태 관리 및 서버 호출에 사용된다.

- ElevatedButton
- Radio
- Switch
- Checkbox
- TextField
- TextFormField
- ...

<br>

### material 구성 요소, 제스처, 기타

구글에서 개발한 material 디자인의 구성 요소들이거나 시각적으로 보이지 않지만, 주어진 영역에서 사용자의 터치 동작을 감지하는 GestureDetector 등 제스처 관련 위젯들이다.

- MaterialApp
- Material
- Scaffold
- AppBar
- BottomNavigationBar
- GestureDetector
- ...

---
<br>

## 3. 상태관리

개발을 할 때 데이터의 변화에 따라 화면을 다시 렌더링 해야 할 경우가 있다. 

<br>

### setState

상태를 변경할 때 주로 사용된다. 구글에서는 setState를 다음처럼 설명해준다. 

"setState는 플러터에게 이 객체의 내부 상태가 변경되었다는 것을 알려준다. setState를 호출하는 것은 객체 내부 상태가 하위 트리의 UI에 영향을 끼칠 수 있는 방식으로 변경되었다는 것을 알려주고, 플러터가 해당 State 객체를 위한 새로운 빌드를 스케줄링하게 한다. 

setState 없이 상태를 변경할 경우, 플러터는 새로운 빌드를 스케줄링하지 않으며, 또한 하위 트리가 새로운 상태를 반영하기 위해 업데이트되지 않을 것이다."

setState의 입력값으로 함수가 들어가고, 그 함수 내부에서 상태 변경을 수행해야 UI가 업데이트 된다.

```
setState(() {
 value = newValue;
})
```

<br>

### initState, dispose

![](https://velog.velcdn.com/images/junnkyuu/post/c9be79ac-be47-4a11-aa61-5025823df82c/image.png)

[사진출처](https://www.dhiwise.com/post/unmasking-the-stateful-and-stateless-widgets-in-flutter)

플러터에는 상태 관리에 신경써야하는 부분이 있다. 가령, 화면이 보이기 시작할 때 http 통신을 통해 특정한 값을 가져와야 할 경우, 또는 화면이 닫힐 때 값이 바뀌거나 사라져야할 경우에서 작성해야할 코드들이 있다.

이들은 상태의 생명주기에 따라 동작하는 생명 주기 메서드라고 한다. 이러한 기능들은 상태 관리를 제공하는 React 등과 같은 대부분의 라이브러리/프레임워크에서 제공하고 있다.

생명 주기마다 그에 해당하는 생명 주기 메서드들이 존재하지만 일반적으로 initState, dispose 메서드를 사용하여 기능을 구현한다.

- initState
    - 화면이 로드될 때 새로운 데이터를 받아온다.
    - 일부 역할은 FutureBuilder로 대체 가능하다.
    - @override 키워드를 붇여야 한다.
    - 첫 줄에 super.initState();를 작성해야 한다. 왜냐하면 프레임워크에 미리 정의된 initState(); 작업을 불러와야하기 때문이다.
    - UI가 생성되기 전 이므로 setState를 사용하지 않아야 한다.
- dispose
    - 화면이 사라질 때 이벤트 리스너를 정리한다.

<br>

### 상태 넘기기

위에 정리한 내용은 상태는 위젯 내에서 선언하는 변수이고, 변수의 값이 바뀔 때 UI가 업데이트 되어야 하는 데이터이다. 그러나, 로그인과 같은 상황에서는 하나의 위젯 내부에서만 사용되지 않고 위젯을 넘나들며 사용되어야 한다.

위젯으로 상태를 넘길 때는 부모 위젯 -> 자식 위젯 방향으로 넘겨야 한다. 위젯 트리가 복잡해진다면, React의 PropsDrilling과 같은 상황이 발생할 수 있다.

<br>

### 전역 상태 관리

실제 개발환경에서는 하나의 앱 상태를 여러 스크린에 공유해야할 경우가 발생한다. 전역 상태 관리가 필요한 경우는 다음과 같다.

- 사용자 환경 설정값
- 로그인 정보
- sns 앱의 알림
- 쇼핑 앱의 쇼핑 카트
- 뉴스 앱의 기사 읽음/읽지 않은 상태

<br>

#### 전역 상태 관리 라이브러리 Provider

Provider는 전역 상태 관리 라이브러리이다. 플러터는 기본적으로 setState만 지원하는데, 이를 react에서 생각해보면 useState만 지원한다는 뜻이다. 따라서 위젯 간에 서로 상태를 공유할 수 없다.

이를 해결하기 위해 GetX, BloC, Redux, RiverPod 등 다양한 라이브러리 또는 디자인 패턴이 등장했다.

React의 useContext와 같은 느낌이 flutter의 Provider이다.

<br>


- 장점
    - 사용하기 쉽고 장래가 유망한 패키지이다.
    - Provider + ChangeNotifier를 사용하여 관심사의 분리를 만족시키면서 좀 더 간결한 코드로 사용할 수 있다.
    - 복잡한 프로젝트의 경우, Provider + BloC로 사용할 수 있다.
    
---
<br>

## 4. Navigation

화면 전환을 개념적으로 navigation이라고 한다. Navigation에는 다양한 의미가 있지만, 모바일 앱 개발에서는 일반적으로 화면과 화면 사이를 이동하는 것을 의미한다. 일반적으로 웹사이트에서의 navigation은 페이지 간 이동을 의미한다.

플러터 앱을 포함한 모바일 앱에서도 페이지 간 이동을 하는 방식으로 navigation을 구현할 수 있는데, 일반적으로는 푸시 앤 팝 방식이 많이 사용된다.

<br>

### 푸시 앤 팝(Push and Pop)

- 앱이 맨 처음에 로드하는 화면은 일반적으로 고정되어 있다.
- 새로운 화면을 불러오게 될 때, 화면 위에 화면을 하나씩 쌓는다.(Push) Stack의 개념이다.
- 뒤로가기 버튼을 누를 때, 맨 위에 쌓인 화면부터 하나씩 제거된다.(Pop) 결국에는 맨 처음 화면으로 돌아간다.

<br>

화면에 쌓이는 단위를 Stack이라고 했지만, 플러터에서는 Route라는 표현을 사용한다. 

가령 AppBar에서 Push로 들어간 화면에서 뒤로가기 버튼을 자동으로 만들어준다.

```
onPressed: () {
	Navigator.of(context).push(
    	MaterialPageRoute(
        	builder: (_) => DetailScreen(
            	color: color,
            ),
        ),
    );
},
```

위 코드를 보면 push 안에 다음 화면이 될 위젯을 바로 넣어두지 않고, MaterialPageRoute를 넣어서 다음 화면이 될 위젯을 지정하고 있다. 즉, 개념적으로 push가 위젯을 직접 집어넣는 게 아니라, Route라고 하는 Navigator에서 쓰는 특수한 단위를 집어넣기 때문이다.

<br>

### Navigator 위젯

Navigator는 반드시 Navigator.of(context)와 함께 사용해야 한다.

- Navigator 위젯 자체의 특징으로, 반드시 context가 필요하다.
- context를 통해 현재 Navigator를 호출하는 위젯이 위젯 트리에서 어느 위치에 있는지 파악한다. 잘못된 context가 들어갈 경우 이상한 동작이 일어난다.

---
<br>

### 참고 자료 및 출처
- [초보자도 프로처럼 만드는 플러터 앱개발](https://product.kyobobook.co.kr/detail/S000208993133)