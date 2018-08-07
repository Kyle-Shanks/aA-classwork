PRAGMA foreign_keys = ON;

-- CREATE TABLES --

DROP TABLE IF EXISTS users;
CREATE TABLE users(
  id INTEGER PRIMARY KEY,
  fname VARCHAR(255) NOT NULL,
  lname VARCHAR(255) NOT NULL
);

DROP TABLE IF EXISTS questions;
CREATE TABLE questions(
  id INTEGER PRIMARY KEY,
  title VARCHAR(255) NOT NULL,
  body VARCHAR(255) NOT NULL,
  user_id INTEGER,

  FOREIGN KEY (user_id) REFERENCES users(id)
);

DROP TABLE IF EXISTS question_follows;
CREATE TABLE question_follows(
  id INTEGER PRIMARY KEY,
  question_id INTEGER NOT NULL,
  user_id INTEGER NOT NULL,

  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (question_id) REFERENCES questions(id)
);

DROP TABLE IF EXISTS replies;
CREATE TABLE replies(
  id INTEGER PRIMARY KEY,
  question_id INTEGER NOT NULL,
  user_id INTEGER NOT NULL,
  parent_reply_id INTEGER,
  body VARCHAR(255) NOT NULL,

  FOREIGN KEY (question_id) REFERENCES questions(id),
  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (parent_reply_id) REFERENCES replies(id)
);

DROP TABLE IF EXISTS question_likes;
CREATE TABLE question_likes (
  id INTEGER PRIMARY KEY,
  question_id INTEGER NOT NULL,
  user_id INTEGER NOT NULL,

  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (question_id) REFERENCES questions(id)
);

--INSERTS--

INSERT INTO
  users (fname, lname)
VALUES
  ('Lingjie', 'Zhang'),
  ('Bumju', 'Seo'),
  ('Darren', 'Praseutsinh'),
  ('Brandon', 'Woodruff'),
  ('Inhoo', 'Ham'),
  ('Kevin', 'Chen'),
  ('Claire', 'Kim'),
  ('Daniel', 'Espina'),
  ('Caida', 'Ding'),
  ('Blake', 'Zhai'),
  ('Andrew', 'Langston'),
  ('Liming', 'Kang'),
  ('Dmitry', 'Slavnikov'),
  ('Michelle', 'Panzironi'),
  ('Ben', 'Rothman'),
  ('Jonathan', 'Ahn'),
  ('Ryan', 'Fitzgerald'),
  ('Kyle', 'Shanks'),
  ('Yuqian', 'Wang'),
  ('Ben', 'Pongsanarakul'),
  ('Jackson', 'Woods');

INSERT INTO
  questions (title, body, user_id)
VALUES
  ('Dog?','What is a dog?',(SELECT id FROM users WHERE fname='Ben' AND lname='Rothman')),
  ('aA Question','How do you like App Academy?',(SELECT id FROM users WHERE fname='Yuqian' AND lname='Wang')),
  ('Cursor Question','How do you create multiple cursors at once?',(SELECT id FROM users WHERE fname='Ryan' AND lname='Fitzgerald')),
  ('Coffee','Why is coffee the worst?',(SELECT id FROM users WHERE fname='Kyle' AND lname='Shanks'));

INSERT INTO
  question_follows (user_id, question_id)
VALUES
  ((SELECT id FROM users WHERE fname='Kyle' AND lname='Shanks'), (SELECT id FROM questions WHERE title='Dog?')),
  ((SELECT id FROM users WHERE fname='Ryan' AND lname='Fitzgerald'), (SELECT id FROM questions WHERE title='aA Question')),
  ((SELECT id FROM users WHERE fname='Daniel' AND lname='Espina'), (SELECT id FROM questions WHERE title='Coffee'));

INSERT INTO
  replies (question_id, user_id, parent_reply_id, body)
VALUES
  ((SELECT id FROM questions WHERE title='Dog?'), (SELECT id FROM users WHERE fname='Ryan' AND lname='Fitzgerald'),
    NULL, 'Dogs are better than cats.'),
  ((SELECT id FROM questions WHERE title='Coffee'), (SELECT id FROM users WHERE fname='Ryan' AND lname='Fitzgerald'),
    NULL, 'Coffee is not the worst. It is the best.'),
  ((SELECT id FROM questions WHERE title='aA Question'), (SELECT id FROM users WHERE fname='Dmitry' AND lname='Slavnikov'),
    NULL, 'It''s coo');

INSERT INTO
  replies (question_id, user_id, parent_reply_id, body)
VALUES
((SELECT id FROM questions WHERE title='Coffee'), (SELECT id FROM users WHERE fname='Kyle' AND lname='Shanks'),
  (SELECT id FROM replies WHERE body = 'Coffee is not the worst. It is the best.'), 'Wow, I never thought of it that way.');

INSERT INTO
  question_likes (user_id, question_id)
VALUES
  ((SELECT id FROM users WHERE fname='Kyle' AND lname='Shanks'), (SELECT id FROM questions WHERE title='Dog?')),
  ((SELECT id FROM users WHERE fname='Ryan' AND lname='Fitzgerald'), (SELECT id FROM questions WHERE title='aA Question')),
  ((SELECT id FROM users WHERE fname='Daniel' AND lname='Espina'), (SELECT id FROM questions WHERE title='Coffee'));
