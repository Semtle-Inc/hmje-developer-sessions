# S2 — 수식어

반복·블록·타입·필드 수식어를 사용하는 예제입니다. 진행 표시, 시간 측정, 설정 저장 기능과 함께 수식어 정의 모듈을 제공합니다.

## CLI 예제

저장소 루트에서 실행합니다.

```sh
./tools/run.sh sessions/s2-modifiers/02_이름표.hmje
./tools/run.sh sessions/s2-modifiers/03_시간재기.hmje
```

`01_진도.hmje`는 소수 계산을 수행하므로 실행 시간이 상대적으로 길 수 있습니다.

## macOS 앱

```sh
./tools/build.sh sessions/s2-modifiers/설정앱 SettingsDemo macos-app
open build/SettingsDemo.app
./tools/build.sh sessions/s2-modifiers/두자리앱 TwoPlaces macos-app
open build/TwoPlaces.app
```

설정 앱은 설정 값을 저장하고 다음 실행에서 복원합니다.

## 오류 진단 예제

| 파일 또는 프로젝트 | 진단 항목 |
|---|---|
| `04_가져오지않음.hmje` | 수식어 가져오기 누락 |
| `06_활용틀림.hmje` | 잘못된 수식어 활용 |
| `10_UI전용.hmje` | UI 전용 제약 위반 |
| `모르는속성/` | 정의되지 않은 UI 속성 |

## 검증

```sh
./tools/verify.sh --session s2
```
