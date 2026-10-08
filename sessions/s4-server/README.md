# S4 — 서버와 저장

SQLite 기반 행사 예약 API입니다. 서비스 구현을 HTTP 서버와 서비스 테스트에서 공유합니다.

| 경로 | 구성 |
|---|---|
| `서비스/` | 데이터 모형, 예약 처리 및 라우트 |
| `예약서버/` | HTTP 서버 |
| `예약시험/` | 서비스 테스트 |

## 요구사항

- macOS 14 이상
- 기반, Backend, DB, SQLite 및 SQLiteAsync 라이브러리

## 서비스 테스트

저장소 루트에서 실행합니다. 테스트는 메모리 데이터베이스를 사용하며 네트워크 포트를 열지 않습니다.

```sh
./tools/build.sh sessions/s4-server 예약시험
./build/예약시험
```

모든 항목이 통과하면 `실패 0개`가 출력됩니다.

## 서버 실행

```sh
./tools/build.sh sessions/s4-server 예약서버
EVENTS_ADMIN_KEY=local-demo-key ./build/예약서버 8080 build/events.sqlite
```

서버는 `127.0.0.1:8080`에서 요청을 수신하고 `build/events.sqlite`에 데이터를 저장합니다. 다른 터미널에서 다음 명령으로 요청합니다.

```sh
curl http://127.0.0.1:8080/events
```

관리자 요청에는 `Authorization: Bearer local-demo-key` 헤더가 필요합니다. `local-demo-key`는 로컬 실행용 예제 값입니다. 실행 인자는 `예약서버/main.hmje`, 요청 형식은 `서비스/라우트.hmje`에 정의되어 있습니다. 서버는 Ctrl+C로 종료합니다.

데이터베이스와 백업 파일은 Git 추적 대상에서 제외됩니다.
