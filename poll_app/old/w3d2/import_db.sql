CREATE TABLE users (
  id INTEGER PRIMARY KEY,
  fname STRING NOT NULL,
  lname STRING NOT NULL
);

CREATE TABLE questions (
  id INTEGER PRIMARY KEY,
  title STRING NOT NULL,
  body STRING NOT NULL,
  author_id INTEGER,

  FOREIGN KEY ('author_id') references 'users'(id)
);

CREATE TABLE question_follows (
  id INTEGER PRIMARY KEY,
  question_id INTEGER,
  user_id INTEGER,

  FOREIGN KEY ('question_id') references 'questions'(id) ,
  FOREIGN KEY ('user_id') references 'users'(id)
);

CREATE TABLE replies (
  id INTEGER PRIMARY KEY,
  question_id INTEGER,
  parent_reply INTEGER,
  user_id INTEGER,
  body STRING NOT NULL,

  FOREIGN KEY ('question_id') references 'user_id'(id),
  FOREIGN KEY ('user_id') references 'users'(id),
  FOREIGN KEY ('parent_reply') references 'replies'(id)
);

CREATE TABLE question_likes (
  id INTEGER PRIMARY KEY,
  question_id INTEGER,
  user_id INTEGER,

  FOREIGN KEY ('question_id') references 'questions'(id),
  FOREIGN KEY ('user_id') references 'users'(id)
);

INSERT INTO
  users (fname, lname)
VALUES
  ('john', 'smith'),
  ('john', 'smith2');

  INSERT INTO
    questions(title, body, author_id)
  VALUES
    ('help', 'How does this work?', 1),
    ('uhm', 'help?', 1),
    ('having problem', 'issue?', 1);

  INSERT INTO
    question_likes(question_id, user_id)
  VALUES
    (1, 1),
    (1, 2),
    (2, 2),
    (3, 1),
    (3, 2);

  INSERT INTO
    question_follows(question_id, user_id)
  VALUES
    (1, 1),
    (1, 2),
    (2, 1),
    (3, 2);

  INSERT INTO
    replies(question_id, parent_reply, user_id, body)
  VALUES
    (1, NULL, 2, "dunno"),
    (1, 1, 2, "oh");
