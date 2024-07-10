# 1. Flutter 기본 개념

![](https://velog.velcdn.com/images/junnkyuu/post/8ae88045-22bf-47cf-ab67-ae929ed825fc/image.png)

## Flutter?

플러터는 구글에서 개발한 크로스 플랫폼 프레임워크이다. 구글에서 개발했기 때문에 언어도 구글에서 개발한 Dart를 사용한다. 플러터 3.0 이후로 window, mac, linux, ios, android, web의 6개 플랫폼을 모두 공식적으로 지원하게 되었다.

위에서 말했듯이 플러터는 크로스 플랫폼 방식으로 앱을 개발하며, 웹UI 작업을 할 수 있다. 크로스 플랫폼에는 리액트 네이티브, 자마린 등의 방식이 플러터 이전에 사용되었다.

<br>

## Flutter 특징

- 선언형 사용자 인터페이스
  - 데이터가 가변적이면, 데이터가 변할 때 마다 화면이 자동으로 바뀐다. 리액트에서 사용되는 상태 개념과 비슷하다.
- Dart 언어
  - 리액트 네이티브에서는 UI는 JSX, 로직은 JS/TS를 사용하는 것과 달리 플러터에서는 Dart 하나의 언어를 가지고 UI, 로직 모두 작성이 가능하다.
- 직접 그리는 화면
  - 플러터는 시스템의 UI라이브러리에 의존하지 않고, 머티리얼, 쿠퍼티노 등의 내장 위젯을 픽셀 단위로 직접 그릴 수 있다.
- 핫 리로드
  - 플러터는 앱을 재시작하지 않고도 코드상의 변경사항을 반영할 수 있는 기능이다. 단, 디버그 모드에서만 사용이 가능하다.
- 플러터로 개발 가능한 일
  - 모바일 앱 개발 : ios, android
  - 데스크톱 앱 개발 : window, mac, linux
  - 웹사이트 개발 : 다양한 그래픽 효과, 웹 게임에 적합
  - 임베디드 시스템 개발 : 토요타 인포테인먼트 시스템
  - TV 앱 개발 : 삼성 타이젠 TV 앱

---

<br>

# 2. 개발 환경 설정

- homebrew에서 `brew install flutter` 명령어를 통해 설치한다.
- vscode에서 dart, flutter extension을 설치한다.
- ios 환경을 위해 xcode, cocoapods을 설치한다.
- android 환경을 위해 androidstudio, SDK를 설치한다.
- `flutter doctor` 명령어를 입력해서 모두 잘 설치되었는 지 확인한다. 아래와 같다면 이상이 없는 것이다.
  ![](https://velog.velcdn.com/images/junnkyuu/post/0a4422af-46dd-4beb-9c41-786ad1ba8e07/image.png)

---

<br>

### 참고 자료 및 출처

- [초보자도 프로처럼 만드는 플러터 앱개발](https://product.kyobobook.co.kr/detail/S000208993133)
