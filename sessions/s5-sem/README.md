# S5 — 모델 학습과 실행

글자 단위 언어 모델의 학습, 체크포인트 저장 및 텍스트 생성 예제입니다. 별도의 GGUF 추론 예제도 제공합니다.

## 요구사항

- HmjeSem, HmjeJindo 및 HmjeLLM 라이브러리
- Metal 실행 시 macOS 및 지원 장치
- GGUF 추론 시 Gemma 4 E2B 형식의 호환 모델

## 학습 및 텍스트 생성

저장소 루트에서 실행합니다.

```sh
./tools/build.sh sessions/s5-sem 학습
./tools/build.sh sessions/s5-sem 이어쓰기
mkdir -p build/runs/demo
./build/학습 sessions/s5-sem/data/corpus.txt build/runs/demo cpu 10
./build/이어쓰기 build/runs/demo/마지막.semt cpu 100 '공개 함수 '
```

위 명령은 CPU에서 10걸음 학습한 뒤 저장된 체크포인트로 100토큰을 생성합니다. Metal 실행은 장치 인자를 `metal`로 지정합니다. 학습 걸음수는 마지막 인자로 설정합니다.

포함된 말뭉치로 CPU 학습, 체크포인트 저장 및 텍스트 생성을 검증했습니다. 상세 결과는 [검증 문서](../../docs/verification.md)에 있습니다.

## GGUF 추론

추론 예제는 macOS Metal과 Gemma 4 E2B 모델 형식을 사용합니다. 모델 파일은 해당 모델의 이용 조건에 따라 별도로 준비합니다.

```sh
./tools/build.sh sessions/s5-sem 젬마
./build/젬마 /path/to/gemma-4-E2B_q4_0-it.gguf '좋은 변수 이름을 짓는 원칙을 알려 줘.'
```

## 학습 데이터

[기본 말뭉치](data/README.md)는 S1·S2 예제 코드로 구성됩니다. 학습 결과는 데이터, 툴체인 버전 및 실행 장치에 따라 달라집니다.

사용자 말뭉치를 적용할 경우 검증 구간을 확보해야 합니다. 학습 프로그램은 데이터 뒤쪽 10%에서 길이 256토큰인 검증 창 16개를 사용합니다.

## 검증

```sh
./tools/verify.sh --session s5
```

일괄 검증은 세 실행 파일의 빌드를 확인합니다. 학습과 추론은 위 명령으로 실행합니다. 모델 가중치와 생성된 체크포인트는 Git 추적 대상에서 제외됩니다.
