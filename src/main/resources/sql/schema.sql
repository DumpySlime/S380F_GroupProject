create table if not exists lecture(
    id bigint generated by default as identity,
    lectureTitle varchar(255),
    primary key (id)
);

create table if not exists poll(
    id bigint generated by default as identity,
    question varchar(255),
    optionA varchar(255),
    optionB varchar(255),
    optionC varchar(255),
    optionD varchar(255),
);

create table if not exists note(
    id uuid default random_uuid() not null,
    filename varchar(255),
    content_type varchar(255),
    content blob,
    lecture_id bigint,
    primary key (id),
    foreign key (lecture_id) references lecture
);

create table if not exists comment(
    id uuid default random_uuid() not null,
    content varchar(255),
    lecture_id bigint,
    poll_id bigint,
    primary key (id),
    foreign key (lecture_id) references lecture,
    foreign key (poll_id) references poll
);