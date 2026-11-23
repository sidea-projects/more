---
name: issue
description: 버그·기능 이슈를 프로젝트 이슈 양식대로 GitHub에 만든다. "이슈 만들어줘", "/issue" 할 때 쓴다. 브랜치는 만들지 않는다 (commit 스킬).
---

# 이슈

양식: `.github/ISSUE_TEMPLATE/bug_report.yml`(버그), `feature_request.yml`(기능). 먼저 해당 파일을 읽는다.

## 순서

1. **내용 정하기**
   - 버그인지 기능인지 정한다. 애매하면 묻는다.
   - 양식의 필수 항목(`required: true`)을 채울 정보가 모자라면 지어내지 말고 묻는다.
   - 제목은 양식의 `title` 접두어(`fix: `, `feat: `) + 한글로 짧게.
   - 본문은 양식 항목 순서대로 `label`을 `### ` 제목으로 쓰고, 빈 선택 항목은 `_No response_`로 둔다.

2. **확인 (필수)**
   - 제목, 라벨(양식의 `labels`), 본문을 보여 주고 확인을 받는다.

3. **만들기**

   ```sh
   gh issue create --title "feat: 보낸 메시지에 도착 예정일 표시" --label enhancement --body-file - <<'EOF'
   ### 무엇을 · 왜

   보낸 메시지 목록에 도착 예정일(D-2, D-1)을 보여 준다.

   ### 할 일

   - [ ] 목록 화면에 D-day 표시

   ### 참고 자료

   _No response_
   EOF
   ```

   - 이슈 번호와 링크를 알려 준다. `gh` 인증 오류면 `gh auth login`을 안내하고 멈춘다.
