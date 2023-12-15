Drop database if exists case_study_03;
CREATE DATABASE case_study_03;
USE case_study_03;
-- Khởi tạo user
CREATE TABLE user (
    id int PRIMARY KEY auto_increment,
    name varchar(255),
    user_name varchar(255) ,
    user_password varchar(255),
    phone varchar(12) ,
    email varchar(255),
    status bit DEFAULT 0
);
SELECT id, name, phone, email FROM user;

insert into user(name, user_name, user_password, phone, email) values 
("Thơ", "user123", "123", '123456789', 'user1@example.com'),
("Hiếu","user123", "123", '987654321', 'user2@example.com'),
("Thảo", "user123", '123', '555555555','user3@example.com'),
("Việt",'user123', '123', '111111111', 'user4@example.com');

delete from user where id=4;

-- Quyền của user
CREATE TABLE role (
    id int PRIMARY KEY auto_increment,
    name varchar(255) NOT NULL
);

insert into role(name) values ("admin"),
("user");

-- Cấp quyền cho user
CREATE TABLE user_role (
    user_id int,
    role_id int,
    PRIMARY KEY (user_id, role_id),
    FOREIGN KEY (user_id) REFERENCES user(id),
    FOREIGN KEY (role_id) REFERENCES role(id)
);

insert into user_role(user_id, role_id) values (1, 2),
(2, 2),
(3, 2),
(4, 2);

-- Thể loại phim
CREATE TABLE genre (
    id int PRIMARY KEY auto_increment,
    name varchar(255) NOT NULL
);

insert into genre(id, name) values (1, "action"),
(2, "science-fiction"),
(3, "adventure"),
(4, "horror"),
(5, "comedy");

-- Khởi tạo phim
CREATE TABLE movie (
    id int PRIMARY KEY auto_increment,
    title varchar(255) NOT NULL,
    genre varchar(255),
    release_year int,
    rating float
);

insert into movie (title, genre, release_year, rating) values 
('Inception', 'adventure', 2010, 8.8),
('The Dark Knight', 'action', 2008, 9.0),
('The Shawshank Redemption', 'comedy', 1994, 9.3),
('Forrest Gump', 'horror', 1994, 8.8),
('The Matrix', 'science-fiction', 1999, 8.7);

-- Mối quan hệ giữa phim và thể loại
CREATE TABLE movie_genre(
    movie_id int,
    genre_id int,
    PRIMARY KEY (movie_id, genre_id),
    FOREIGN KEY (movie_id) REFERENCES movie(id),
    FOREIGN KEY (genre_id) REFERENCES genre(id)
);

insert into movie_genre(movie_id, genre_id) values (1, 3),
(2, 1),
(3, 5),
(4, 4),
(5, 2);

-- Đăng ký gói dịch vụ
CREATE TABLE subscription  (
    id int PRIMARY KEY auto_increment,
    name varchar(255),   -- (Basic, Standard, Premium)
    user_id int,
    start_date date,
    end_date date,
    status bit(1),
    FOREIGN KEY (user_id) REFERENCES user(id)
);

insert into subscription (name, user_id, start_date, end_date, status) values 
( "Basic", 1, '2023-11-01', '2023-11-01', 1),
( 'Standard', 2, '2023-10-01', '2023-10-30', 1),
( 'Premium', 3, '2023-09-01', '2023-09-30', 1),
( 'Premium', 4, '2023-12-01', '2023-12-31', 1);

-- Mối quan hệ giữa subscription và movie
CREATE TABLE subscription_movie (
    subcription_id int,
    movie_id int,
    PRIMARY KEY (subcription_id, movie_id),
    FOREIGN KEY (subcription_id) REFERENCES subscription(id),
    FOREIGN KEY (movie_id) REFERENCES movie(id)
);

INSERT INTO subscription_movie (subcription_id, movie_id) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4);

-- Thanh toán
CREATE TABLE payment (
    id int PRIMARY KEY auto_increment,
    user_id int,
    amount float,
    payment_date date,
    FOREIGN KEY (user_id) REFERENCES user(id)
);

INSERT INTO payment (user_id, amount, payment_date) VALUES
(1, 10.0, '2023-01-15'),
(2, 15.0, '2023-02-20'),
(3, 20.0, '2023-03-25'),
(4, 25.0, '2023-04-30');

-- Đánh giá
CREATE TABLE review (
    id int PRIMARY KEY auto_increment,
    user_id int,
    movie_id int,
    rating int,
    review_date date,
    comment text,
    FOREIGN KEY (user_id) REFERENCES user(id),
    FOREIGN KEY (movie_id) REFERENCES movie(id)
);

INSERT INTO review (user_id, movie_id, rating, review_date, comment) VALUES
(1, 1, 5, '2023-01-05', 'Great movie!'),
(2, 2, 4, '2023-02-10', 'Awesome action scenes'),
(3, 3, 5, '2023-03-15', 'A classic film'),
(4, 4, 3, '2023-04-20', 'Not my favorite');