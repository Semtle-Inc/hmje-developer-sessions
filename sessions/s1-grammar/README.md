# S1 — 훈민정음 문법

값과 제어 흐름, 함수, 타입, 소유권, 동시 작업을 다루는 언어 예제입니다. 파일 번호는 세션의 예제 순서에 해당합니다. 가져오기 예제는 `도구/인사말.hmje`를 사용합니다.

## 실행

저장소 루트에서 실행합니다.

```sh
./tools/run.sh sessions/s1-grammar/01_안녕.hmje
./tools/run.sh sessions/s1-grammar/19_입력.hmje
./tools/run.sh sessions/s1-grammar/27_낱말세기.hmje
./tools/run.sh sessions/s1-grammar/28_가져오기.hmje
```

입력 예제는 동일한 이름의 `.stdin` 파일을 사용합니다. `19b_입력_숫자아님.hmje`는 숫자가 아닌 입력을 처리하는 정상 실행 예제입니다.

## 오류 진단 예제

| 파일 | 진단 항목 |
|---|---|
| `08b_반환타입불일치.hmje` | 반환 타입 불일치 |
| `11c_구조체기호비교.hmje` | 구조체에 `==` 사용 |
| `22b_빌린동안수정.hmje` | 빌림 중 수정 |

## 검증

```sh
./tools/verify.sh --session s1
```
