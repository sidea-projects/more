---
name: pr
description: 현재 브랜치를 push 하고 main으로 PR을 올린다. "PR 올려줘", "/pr" 할 때 쓴다. 머지는 하지 않는다.
---

# PR

규칙: `docs/rules/git-workflow.md`의 'PR'을 먼저 읽고 따른다. 양식: `.github/pull_request_template.md`.

**머지는 하지 않는다.** main 머지 = 운영 배포라서 사용자가 GitHub에서 직접 한다.

## 순서

1. **브랜치 확인**
   - `main`이면 멈추고 브랜치부터 만들라고 한다.
   - 이름이 규칙과 다르면 CI가 실패한다. push 전에 `git branch -m`으로 바꾸자고 제안한다.
   - 커밋 안 한 변경이 있으면 먼저 커밋할지 묻는다.

2. **기존 PR 확인**
   - `gh pr view --json url,state`가 `OPEN`이면 새로 만들지 않는다. 확인받고 `git push`만 한 뒤 링크를 알려 준다.

3. **제목·본문·라벨 정하기**
   - `git fetch origin` 후 `git log origin/main..HEAD`, `git diff origin/main...HEAD`로 읽는다. 커밋이 없으면 끝낸다.
   - 제목: 커밋 규칙 형식. 커밋이 하나면 그 제목, 여러 개면 한 줄 요약 (타입은 가장 큰 변경 기준). Squash merge 하면 main의 커밋 제목이 된다.
   - 본문: PR 양식 그대로 채우고 주석(`<!-- -->`)은 지운다.
     - 관련 이슈: 브랜치 이름의 번호로 `close #12`. 없으면 섹션을 지운다.
     - 스크린샷: 화면이 바뀌었으면 PR 만든 뒤 직접 첨부해 달라고 한다. 아니면 섹션을 지운다.
     - `DROP TABLE`·컬럼 삭제가 있으면 따로 적는다.
     - 테스트: 내가 실제로 확인한 것을 쓰고, 사용자에게 직접 확인한 게 있는지 묻는다. 지어내지 않는다.
   - 라벨: `feat` → `enhancement`, `fix` → `bug`, `docs` → `documentation`. 나머지는 없음.

4. **확인 (필수)**
   - push 전에 제목, 라벨, `<브랜치> → main`, 본문을 보여 주고 확인을 받는다.

5. **push 하고 PR 만들기**
   - force push 하지 않는다.

   ```sh
   git push -u origin HEAD
   gh pr create --base main --assignee @me --label enhancement \
     --title "feat: 메시지 작성 화면 추가" --body-file - <<'EOF'
   ...
   EOF
   ```

   - PR 링크를 알려 준다. `gh` 인증 오류면 `gh auth login`을 안내하고 멈춘다.
