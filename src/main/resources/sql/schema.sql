create table if not exists lecture (
    id bigint generated by default as identity,
    body varchar(255),
    name varchar(255),
    subject varchar(255),
    primary key (id)
);
create table if not exists attachment (
    id uuid default random_uuid() not null,
    content blob,
    content_type varchar(255),
    filename varchar(255),
    ticket_id bigint,
    primary key (id),
    foreign key (ticket_id) references lecture
    );

DROP TABLE IF EXISTS user_roles;
DROP TABLE IF EXISTS users;
CREATE TABLE IF NOT EXISTS users (
    username VARCHAR(50) NOT NULL,
    password VARCHAR(50) NOT NULL,
    PRIMARY KEY (username)
    );
CREATE TABLE IF NOT EXISTS user_roles (
    user_role_id INTEGER GENERATED ALWAYS AS IDENTITY,
    username VARCHAR(50) NOT NULL,
    role VARCHAR(50) NOT NULL,
    PRIMARY KEY (user_role_id),
    FOREIGN KEY (username) REFERENCES users(username)
    );

CREATE TABLE IF NOT EXISTS comment (
    id BIGINT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    content VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    username VARCHAR(50) NOT NULL,
    lecture_id BIGINT NOT NULL,
    poll_id BIGINT NOT NULL,
    FOREIGN KEY (lecture_id) REFERENCES lecture(id) ON DELETE CASCADE,
    FOREIGN KEY (username) REFERENCES users(username),
    FOREIGN KEY (poll_id) REFERENCES poll(id) ON DELETE CASCADE
    );

CREATE TABLE IF NOT EXISTS poll (
    id BIGINT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    teacherName VARCHAR(255) NOT NULL,
    question VARCHAR(255) NOT NULL,
    optionAText VARCHAR(255) NOT NULL,
    optionBText VARCHAR(255) NOT NULL,
    optionCText VARCHAR(255) NOT NULL,
    optionDText VARCHAR(255) NOT NULL,
    deleted BOOLEAN DEFAULT FALSE
);

CREATE TABLE IF NOT EXISTS vote (
    id uuid default random_uuid() not null,
    username VARCHAR(255) NOT NULL,
    poll_id BIGINT NOT NULL,
    choice VARCHAR(255) NOT NULL,
    createTime TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (username) REFERENCES users(username) ON DELETE CASCADE,
    FOREIGN KEY (poll_id) REFERENCES poll(id) ON DELETE CASCADE
)