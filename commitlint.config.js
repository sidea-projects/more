export default {
  extends: ['@commitlint/config-conventional'],
  rules: {
    'type-enum': [
      2,
      'always',
      ['feat', 'fix', 'design', 'refactor', 'style', 'perf', 'test', 'docs', 'chore', 'build', 'ci', 'revert'],
    ],
    // 한글 제목을 영어 대소문자 규칙으로 막지 않게
    'subject-case': [0],
    'scope-case': [2, 'always', 'kebab-case'],
  },
};
