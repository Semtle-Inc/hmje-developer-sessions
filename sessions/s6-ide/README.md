# S6 — 훈민정음 IDE

전시 관람 앱을 사용하는 IDE 예제입니다. 코드 편집, 자동 완성, 미리보기, 문제 검사, 빌드 및 실행을 다룹니다.

## 프로젝트 구성

| 파일 | 구성 |
|---|---|
| `exhibit/Project.hmjep` | 프로젝트 및 빌드 대상 |
| `exhibit/Sources/App/main.hmje` | 앱 구현 |
| `exhibit/Sources/App/안내카드.hmje` | 안내 카드 UI |

## 요구사항

- 훈민정음 IDE 및 HmjeUI·기반 라이브러리
- macOS 14 이상 또는 iOS 17 이상
- iOS 빌드 시 Xcode 및 대상 SDK

## IDE 사용

`exhibit/` 폴더를 열고 빌드 대상 `Exhibit`을 선택합니다. 제공되는 IDE 기능은 설치된 버전에 따릅니다.

## macOS 실행

저장소 루트에서 실행합니다.

```sh
./tools/build.sh sessions/s6-ide/exhibit Exhibit macos-app
open build/Exhibit.app
```

## iOS 빌드

```sh
./tools/build.sh sessions/s6-ide/exhibit Exhibit ios-sim-app
```

iOS 기기 실행에는 인증서와 프로비저닝 설정이 필요합니다.
