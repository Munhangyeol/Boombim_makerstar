# ☕ 붐빔 (Boombim) - 실시간 카페 혼잡도 확인 앱

## 👥 팀원

| [문한결](https://github.com/Munhangyeol) | [appleberryunae](https://github.com/appleberryunae) | [csh991414](https://github.com/csh991414) |
|-------------------------------------------|-------------------------------------------------|-------------------------------------------|
| <div align="center"><img src="https://github.com/Munhangyeol.png" width="100"></div> | <div align="center"><img src="https://github.com/appleberryunae.png" width="100"></div> | <div align="center"><img src="https://github.com/csh991414.png" width="100"></div> |
| **Flutter & Firebase & Arduino Developer** | **Project Manager (PM)** | **Flutter & Firebase & Arduino Developer** |

## 📋 개요
**붐빔**은 사용자가 실시간으로 카페의 혼잡도, 영업시간, 위치 정보 등을 확인할 수 있도록 도와주는 Flutter 기반의 모바일 애플리케이션입니다. Firebase를 이용한 데이터 관리와 실시간 업데이트 기능을 제공합니다.

## 🚀 주요 기능
1.  **카페 이미지 슬라이드**: Firebase Storage에서 불러온 이미지를 슬라이드 형식으로 표시.
2.  **실시간 혼잡도 표시**: 테이블 사용 현황 및 혼잡도를 시각적으로 확인.
3.  **영업시간 및 위치 정보 제공**: 카페의 영업시간과 위치 정보 표시.
4.  **전화번호 제공**: 카페 전화번호를 확인하고 바로 전화 걸기 기능 제공.
5.  **메인 화면에서 여러 카페 리스트 확인 및 상세 페이지로 이동**.
6.  **사용자 피드백 반영**: 혼잡도 표시 방식을 별점에서 **진행 바(Progress Bar)**로 변경하여 더 직관적인 정보 제공.

## 🗂 프로젝트 구조
```plaintext
.
└── lib
    ├── screen
    │   ├── mainscreen.dart
    │   └── boombimscreen.dart
    └── assets
        ├── images
        │   ├── teralosa.jpg
        │   ├── starbucks.jpg
        │   ├── cafe-gondry.jpg
        │   ├── ucandoeat.jpg
        │   ├── Pandorothy.jpg
        │   ├── cafedic.png
        │   └── jejumol.jpg
        └── lottie
            └── animation_2.json
```

## 💻 주요 코드

### 🔥 Firebase에서 데이터 가져오기
```dart
getData() async {
  var caffeInfo = await FirebaseFirestore.instance
      .collection('ucandoit')
      .doc('caffe_information')
      .get()
      .then((DocumentSnapshot ds) {
    final data = ds.data() as Map<String, dynamic>;
    setState(() {
      phoneNumber = data["caffe_phonenumber"];
      timeCurrentDay = data["caffe_time"];
      caffeName = data["caffe_name"];
      caffeAddress = data["caffe_address"];
    });
  });
}
```

### 📊 혼잡도 표시 (LinearPercentIndicator)
```dart
LinearPercentIndicator(
  percent: percentValue,
  lineHeight: 5,
  backgroundColor: Color(0xFFD9D9D9),
  progressColor: Color(0xFFFFCD4A),
  width: size.width * 0.95,
);
```

### 🖼 카페 이미지 로딩 (PageView)
```dart
PageView(
  scrollDirection: Axis.horizontal,
  children: [
    Image.network(url1, errorBuilder: (context, error, stackTrace) {
      return Center(
        child: Lottie.asset('assets/lottie/animation_2.json'),
      );
    }),
    Image.network(url2, errorBuilder: (context, error, stackTrace) {
      return Center(
        child: Lottie.asset('assets/lottie/animation_2.json'),
      );
    }),
    Image.network(url3, errorBuilder: (context, error, stackTrace) {
      return Center(
        child: Lottie.asset('assets/lottie/animation_2.json'),
      );
    }),
  ],
)
```

### 📋 메인 화면에서 카페 리스트 표시 및 상세 페이지로 이동
```dart
OutlinedButton(
  onPressed: () {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation1, animation2) => BoombimScreen(),
        transitionsBuilder: (context, animation1, animation2, child) {
          return SlideTransition(
            position: Tween<Offset>(
              begin: Offset(1.0, 0.0),
              end: Offset(0.0, 0.0),
            ).animate(animation1),
            child: child,
          );
        },
        transitionDuration: Duration(milliseconds: 150),
      ),
    );
  },
  child: Row(
    children: [
      Image.asset("assets/images/ucandoeat.jpg"),
      SizedBox(width: size.width * 0.05),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("유캔두잇 세종대점", style: TextStyle(fontSize: 18)),
          Text("광개토관 15층", style: TextStyle(color: Colors.grey)),
          Text("10:00 ~ 18:00"),
        ],
      )
    ],
  ),
)
```

## 🛠 트러블슈팅

### ❌ Firebase 이미지 로드 오류
- **문제**: Firebase에서 이미지를 불러오지 못하거나 `null` 값으로 반환.
- **해결 방법**: Firestore에서 올바른 경로와 필드 이름을 확인하고, 이미지 URL이 정확히 등록되어 있는지 검증.

### 🔄 혼잡도 값 초기화 문제
- **문제**: 혼잡도 수치가 앱 재시작 시 초기화됨.
- **해결 방법**: 혼잡도 값을 Firestore에 저장하여 앱 재시작 후에도 상태를 유지하거나 `SharedPreferences`를 이용하여 로컬 저장소에 저장.

### 🔔 카페 정보가 업데이트되지 않음
- **문제**: Firestore의 데이터 변경 후 앱에서 업데이트된 정보가 표시되지 않음.
- **해결 방법**: Firestore `StreamBuilder`를 사용하여 실시간 데이터 스트림을 받아 UI가 자동으로 업데이트되도록 변경.

## 🔧 사용 기술

- **Flutter**: UI 개발을 위한 프레임워크.
- **Firebase Firestore**: 실시간 데이터베이스.
- **Firebase Storage**: 이미지 저장 및 관리.
- **Lottie**: 로딩 애니메이션.
- **LinearPercentIndicator**: 혼잡도 시각화.
- **Arduino**: IoT 기반 데이터 연동.

---

붐빔은 Sejong University에서 개발된 카페 혼잡도 확인 앱으로, 사용자에게 편리한 정보 제공을 목표로 합니다. 개선 사항이나 피드백이 있다면 언제든지 알려주세요! 😊

