create table article (
    id integer not null,
    filename varchar(255),
    name varchar(255) not null,
    text varchar(2048) not null,
    user_id bigint,
    primary key (id)
);

create table hibernate_sequence (
    next_val bigint
);

insert into hibernate_sequence values ( 1 );

insert into hibernate_sequence values ( 1 );

create table user_role (
    user_id bigint not null,
    roles varchar(255)
);

create table usr (
    id bigint not null,
    activation_code varchar(255),
    active bit not null,
    avatar_link varchar(255),
    email varchar(255),
    password varchar(255) not null,
    telephone varchar(255),
    tg_link varchar(255),
    username varchar(255) not null,
    vk_link varchar(255),
    primary key (id)
);

alter table article
    add constraint article_user_fk
    foreign key (user_id) references usr (id);

alter table user_role
    add constraint user_role_user_fk
    foreign key (user_id) references usr (id);