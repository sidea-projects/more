# more

모레 - 행운을 주고받는 곳

> 오늘 보낸 메시지가, 누군가의 모레가 되어요

포춘쿠키처럼, 모레에서는 낯선 누군가의 행운 메시지를 받아요. 내 메시지도 함께 보내 보세요.

## 기술 스택

- Vite + React + TypeScript (SPA)
- Cloudflare Workers + Hono
- Cloudflare D1

## 실행

```sh
nvm use
npm install
npm run dev
```

| 명령                | 설명                          |
| ------------------- | ----------------------------- |
| `npm run build`     | 빌드                          |
| `npm run preview`   | 빌드 결과를 로컬에서 실행     |
| `npm run deploy`    | 빌드 + DB 마이그레이션 + 배포 |
| `npm run typecheck` | `Env` 타입 생성 + 타입 검사   |
| `npm run lint`      | ESLint                        |
| `npm run format`    | Prettier                      |
