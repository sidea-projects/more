# more

모레: 낯선 사람의 메시지가 모레 닿는 서비스

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
