// default user
INSERT INTO users VALUES ('keith', '{noop}keithpw');
INSERT INTO user_roles(username, role) VALUES ('keith', 'ROLE_USER');
INSERT INTO user_roles(username, role) VALUES ('keith', 'ROLE_ADMIN');

INSERT INTO users VALUES ('john', '{noop}johnpw');
INSERT INTO user_roles(username, role) VALUES ('john', 'ROLE_ADMIN');

INSERT INTO users VALUES ('mary', '{noop}marypw');
INSERT INTO user_roles(username, role) VALUES ('mary', 'ROLE_USER');

// default lecture
INSERT INTO LECTURE values (1, 'This is lecture 1', 'Lec1', 'Lecture 1');

// default comment
// lecture comment
INSERT INTO COMMENT values (1, 'i am lecture comment 1', 'john', CURRENT_TIMESTAMP, false, null,1);
INSERT INTO COMMENT values (1, 'i am lecture comment 1', 'keith', CURRENT_TIMESTAMP, true, null,1);
// poll comment
INSERT INTO COMMENT values (1, 'i am lecture comment 1', 'john', CURRENT_TIMESTAMP, false, 1,null);
INSERT INTO COMMENT values (1, 'i am lecture comment 1', 'keith', CURRENT_TIMESTAMP, true, 1,null);

// default poll
insert into POLL values (1, 'keith', 'how are you?', 'very good', 'good', 'bad', 'very bad');

// default vote
insert into vote values (null, 'keith', 1, 'A', null);