# 훈민정음 개발자 세션 예제

훈민정음(HMJE) 개발자 세션에서 사용하는 예제 저장소입니다. 문법, 수식어, UI, 서버, 모델 학습, IDE 활용 예제를 제공합니다.

## 예제 구성

| 세션 | 주제 | 주요 내용 |
|---|---|---|
| [S1 — 문법](sessions/s1-grammar/README.md) | 언어 기본 기능 | 값과 제어 흐름, 함수, 타입, 소유권, 동시 작업 |
| [S2 — 수식어](sessions/s2-modifiers/README.md) | 선언 확장 | 진행 표시, 시간 측정, 필드 수식어, 설정 앱 |
| [S3 — HmjeUI](sessions/s3-ui/README.md) | UI 개발 | 목록, 편집, 검색 기능을 갖춘 메모 앱 |
| [S4 — 서버와 저장](sessions/s4-server/README.md) | 백엔드 개발 | SQLite 기반 행사 예약 API 및 서비스 테스트 |
| [S5 — 모델 학습과 실행](sessions/s5-sem/README.md) | 머신러닝 | 글자 모델 학습, 체크포인트 저장, 텍스트 생성, GGUF 추론 |
| [S6 — IDE](sessions/s6-ide/README.md) | 개발 도구 | 전시 관람 앱의 편집, 미리보기, 빌드 및 실행 |

## 요구 사항

- [HMJE Beta 1 툴체인](https://github.com/Semtle-Inc/hmje/releases/tag/v1.0.0-beta.1) 및 각 예제에서 사용하는 공개 라이브러리
- PATH에 등록된 `hmjec`
- macOS 빌드: Xcode Command Line Tools
- iOS 빌드: Xcode 및 대상 SDK
- 일괄 검증: HmjeFiles 및 HmjeProcess 라이브러리

설치된 툴체인과 라이브러리는 다음 명령으로 확인합니다.

```sh
hmjec --version
hmjec --platform-libraries
```

## 빠른 시작

예제 저장소를 내려받고 저장소 루트에서 실행합니다.

```sh
git clone https://github.com/Semtle-Inc/hmje-developer-sessions.git
cd hmje-developer-sessions
```

### macOS · Linux

```sh
./tools/run.sh sessions/s1-grammar/01_안녕.hmje
```

`tools/run.sh`는 소스를 빌드한 뒤 실행합니다. 같은 이름의 `.stdin` 파일이 있으면 해당 파일을 표준 입력으로 사용합니다.

### Windows

```powershell
.\tools\build.ps1 sessions/s1-grammar/01_안녕.hmje
& .\build\01_안녕.exe
```

## 빌드

단일 소스 파일과 프로젝트 폴더를 지원합니다.

```sh
./tools/build.sh sessions/s1-grammar/01_안녕.hmje
./tools/build.sh sessions/s3-ui/03-완성 메모앱 macos-app
```

산출물은 `build/`에 저장됩니다. `HMJEC` 환경 변수로 사용할 컴파일러를 지정할 수 있습니다.

```sh
HMJEC=/path/to/hmjec ./tools/run.sh sessions/s1-grammar/01_안녕.hmje
```

프로젝트별 실행 명령과 추가 요구사항은 각 세션의 README를 참조하십시오.

## 지원 및 검증

HMJE Beta 1 빌드 `2026100804`의 소스에서 빌드한 툴체인과 해당 버전의 HmjeUI SDK로 CLI 예제와 macOS 앱 빌드를 macOS arm64에서 검증했습니다. 소스 버전과 도구 해시는 [검증 환경](docs/verification.md#검증-환경)에 기록되어 있습니다. 앱 프로젝트는 macOS 14 이상 또는 iOS 17 이상을 대상으로 합니다. Windows·Linux 실행, iOS 기기 서명 및 UI 동작은 이번 검증 범위에 포함되지 않습니다.

컴파일러 진단을 설명하는 오류 예제는 정상 실행 예제와 구분되어 있습니다. 검증 환경, 항목별 결과 및 오류 예제 목록은 [검증 문서](docs/verification.md)를 참조하십시오.

## 공개 범위

저장소에는 S1–S6 예제 소스, 학습 말뭉치, 빌드·검증 도구, 문서 및 요약 검증 보고서가 포함됩니다. 예제 소스 83개와 일괄 검증 항목 52개는 서로 다른 집계입니다. 프로젝트 하나에 여러 소스 파일이 포함될 수 있습니다.

빌드 과정에서 생성되는 `.app`·실행 파일·자원 묶음·로그는 `build/`에 저장되며 Git에서 제외됩니다. 모델, 학습 체크포인트 및 실행 중 생성되는 데이터베이스도 공개 파일에 포함되지 않습니다. 소스 압축 파일은 저장소의 **Code → Download ZIP**에서 내려받을 수 있습니다.

## 학습 데이터 및 모델

S5에는 S1·S2 예제 코드로 구성한 학습 말뭉치가 포함됩니다. 학습 결과는 데이터, 툴체인 버전 및 실행 장치에 따라 달라집니다. GGUF 추론에는 Gemma 4 E2B 형식의 호환 모델과 macOS Metal이 필요합니다. 모델 파일은 별도로 준비해야 합니다.

## 참고 자료

- [세션별 챕터 및 예제 목록](sessions.json)
- [예제 소스 SHA-256 목록](SOURCE-MANIFEST.json)
- [검증 환경 및 결과](docs/verification.md)

## 라이선스

예제 코드, 문서 및 학습 말뭉치는 [MIT License](LICENSE)로 제공됩니다. HMJE 툴체인, 런타임, 플랫폼 라이브러리 및 외부 모델에는 각 구성요소의 라이선스가 적용됩니다.
