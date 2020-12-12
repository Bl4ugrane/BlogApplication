delete from user_role;
delete from user;

insert into user(id, active, email, password, username) values
(1, true, 'admin@gmail.com', 'admin', 'admin'),
(2, true, 'test@test.ru', 'test', 'test');

insert into user_role(user_id, roles) values
(1, 'ADMIN'),
(2, 'USER');