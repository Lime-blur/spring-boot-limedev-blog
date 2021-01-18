insert into usr (id, username, password, active)
    values (1, 'admin', '$2y$08$UjtStLS/ARkypeoQqznTy.SqC/G2NwDBAi8bB9KhUMm9nnhbLNqze', true);

insert into user_role (user_id, roles)
    values (1, 'USER'), (1, 'ADMIN');