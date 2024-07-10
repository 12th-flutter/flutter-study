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

late: 초기 데이터 없이 변수 선언 가능

```dart
late final String name;
name = 'yun';
```

const: final과 비슷하지만, 컴파일 할 때 알고 있는 값에 사용