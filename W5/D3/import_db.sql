
PRAGMA foreign_keys = ON;

DROP TABLE IF EXISTS replies;
DROP TABLE IF EXISTS question_follows;
DROP TABLE IF EXISTS question_likes;
DROP TABLE IF EXISTS questions;
DROP TABLE IF EXISTS users;

CREATE TABLE users (
  id INTEGER PRIMARY KEY,
  fname TEXT NOT NULL,
  lname TEXT NOT NULL
);


CREATE TABLE questions (
  id INTEGER PRIMARY KEY,
  title TEXT NOT NULL,
  body TEXT NOT NULL,
  author_id INTEGER NOT NULL,

  FOREIGN KEY (author_id) REFERENCES users(id)
);


CREATE TABLE question_follows (
  id INTEGER PRIMARY KEY,
  question_id INTEGER NOT NULL, -- can be null?
  user_id INTEGER NOT NULL,

  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (question_id) REFERENCES questions(id)
);

CREATE TABLE replies (
  id INTEGER PRIMARY KEY,
  question_id INTEGER NOT NULL,
  parent_id INTEGER,
  reply_author_id INTEGER NOT NULL,
  body TEXT NOT NULL,

  FOREIGN KEY (reply_author_id) REFERENCES users(id),
  FOREIGN KEY (question_id) REFERENCES questions(id)

);


CREATE TABLE question_likes (
  id INTEGER PRIMARY KEY,
  question_id INTEGER NOT NULL,
  user_id INTEGER NOT NULL,
  
  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (question_id) REFERENCES questions(id)

);


INSERT INTO
  users (fname, lname)
VALUES
  ('Edward', 'James'),
  ('David', 'Green'),
  ('Sam', 'Song');

INSERT INTO
  questions (title, body, author_id)
VALUES
  ('How do I open SQL file?', 'How do I open SQL file?', (SELECT id FROM users WHERE fname = 'Edward' AND lname = 'James')),
  ('How to pass Ruby 2 assessment?', 'How to pass Ruby 2 assessment?', (SELECT id FROM users WHERE fname = 'Edward' AND lname = 'James')),
  ('What is the weather today?', 'What is the weather today?', (SELECT id FROM users WHERE fname = 'David' AND lname = 'Green'));

INSERT INTO
  question_follows (question_id, user_id)
VALUES
  ((SELECT id FROM questions WHERE title = 'How do I open SQL file?'),(SELECT id FROM users WHERE fname = 'Edward' AND lname = 'James') ),
  ((SELECT id FROM questions WHERE title = 'How to pass Ruby 2 assessment?'), (SELECT id FROM users WHERE fname = 'Edward' AND lname = 'James') ),
  ((SELECT id FROM questions WHERE title = 'How to pass Ruby 2 assessment?'),(SELECT id FROM users WHERE fname = 'David' AND lname = 'Green') );

INSERT INTO
  replies (question_id, parent_id, reply_author_id, body)
VALUES
  ((SELECT id FROM questions WHERE title = 'How do I open SQL file?'), null, 1, 'I still dont know how to open the SQL file'),
  ((SELECT id FROM questions WHERE title = 'How to pass Ruby 2 assessment?'),null, 1, 'Any tips?'),
  ((SELECT id FROM questions WHERE title = 'How to pass Ruby 2 assessment?'), 2, 2, 'What if I fail?');


INSERT INTO
  question_likes (question_id, user_id)
VALUES
  ((SELECT id FROM questions WHERE title = 'How do I open SQL file?'), (SELECT id FROM users WHERE fname = 'Edward' AND lname = 'James') )





