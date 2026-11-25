-- Migration number: 0001 	 2026-11-23T14:20:04.907Z

-- 시각(*_at)은 UTC 기준 유닉스 초, 날짜(*_on)는 한국 시간 기준 YYYY-MM-DD

CREATE TABLE messages (
  id INTEGER PRIMARY KEY,
  author_id TEXT, -- 작성자의 쿠키 UUID. NULL 이면 운영자 메시지
  request_id TEXT, -- 발송 요청 ID. 발송 버튼을 연달아 눌러도 한 번만 저장한다
  content TEXT NOT NULL CHECK (length(content) > 0),
  hidden_at INTEGER, -- NULL 이면 노출
  reviewed_at INTEGER, -- 운영자가 마지막으로 검토한 시각
  created_at INTEGER NOT NULL DEFAULT (unixepoch()),
  UNIQUE (author_id, request_id)
);

-- 오늘 작성한 메시지 수 계산용
CREATE INDEX messages_author_id_created_at ON messages (author_id, created_at);

-- 전달 기록. 같은 사람이 같은 메시지를 두 번 받지 않는다
CREATE TABLE deliveries (
  receiver_id TEXT NOT NULL,
  message_id INTEGER NOT NULL REFERENCES messages (id),
  delivered_on TEXT NOT NULL, -- 하루 횟수 계산용
  created_at INTEGER NOT NULL DEFAULT (unixepoch()),
  PRIMARY KEY (receiver_id, message_id)
);

-- 신고. 받은 사람만, 한 메시지를 한 번만 신고한다
CREATE TABLE message_reports (
  message_id INTEGER NOT NULL,
  reporter_id TEXT NOT NULL,
  reason TEXT NOT NULL CHECK (reason IN ('offensive', 'spam', 'privacy', 'concern', 'other')),
  reason_detail TEXT, -- '기타(other)' 를 골랐을 때 직접 입력한 내용
  created_at INTEGER NOT NULL DEFAULT (unixepoch()),
  PRIMARY KEY (message_id, reporter_id),
  FOREIGN KEY (reporter_id, message_id) REFERENCES deliveries (receiver_id, message_id)
);
