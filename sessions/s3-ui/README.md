# S3 — HmjeUI 메모 앱

HmjeUI로 메모 앱을 구현하는 단계별 프로젝트입니다. 각 폴더를 독립적인 프로젝트로 열 수 있습니다.

| 프로젝트 | 주요 기능 |
|---|---|
| `01-목록` | 메모 목록 |
| `02-편집` | 메모 편집 |
| `03-완성` | 검색, 고정, 삭제 및 테마 |

## 요구사항

- HmjeUI 및 기반 라이브러리
- macOS 14 이상 또는 iOS 17 이상
- iOS 빌드 시 Xcode 및 대상 SDK

## macOS 실행

저장소 루트에서 실행합니다.

```sh
./tools/build.sh sessions/s3-ui/01-목록 메모앱 macos-app
open build/메모앱.app
./tools/build.sh sessions/s3-ui/03-완성 메모앱 macos-app
open build/메모앱.app
```

세 프로젝트는 같은 앱 이름과 출력 경로를 사용합니다.

## iOS 빌드

```sh
./tools/build.sh sessions/s3-ui/03-완성 메모앱 ios-sim-app
```

빌드한 앱을 부팅된 시뮬레이터에 설치해 실행합니다. iOS 기기 실행에는 인증서와 프로비저닝 설정이 필요합니다.

## IDE 사용

프로젝트 폴더를 열고 빌드 대상 `메모앱`을 선택합니다.
