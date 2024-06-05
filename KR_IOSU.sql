CREATE DATABASE gisdb;
\connect gisdb;
-- Enable PostGIS (includes raster)
CREATE EXTENSION postgis;

CREATE DATABASE trekking_app;

--Создание таблицы country
CREATE TABLE country (
    ID INT PRIMARY KEY NOT NULL,
    Name VARCHAR(25) NOT NULL
);
--Создание таблицы training_level
CREATE TABLE training_level (
    ID INT PRIMARY KEY NOT NULL,
    Name VARCHAR(25) NOT NULL
);

--Создание таблицы trek_status
CREATE TABLE trek_status (
    ID INT PRIMARY KEY NOT NULL,
    Name VARCHAR(25) NOT NULL
);

--Создание таблицы gender
CREATE TABLE gender (
    ID INT PRIMARY KEY NOT NULL,
    Name VARCHAR(25) NOT NULL
);

--Создание таблицы equipment_status
CREATE TABLE equipment_status (
    ID INT PRIMARY KEY NOT NULL,
    Name VARCHAR(25) NOT NULL
);

--Создание таблицы equipment_type
CREATE TABLE equipment_type (
    ID INT PRIMARY KEY NOT NULL,
    Name VARCHAR(25) NOT NULL
);

--Создание таблицы trail_type
CREATE TABLE trail_type (
    ID INT PRIMARY KEY NOT NULL,
    Name VARCHAR(25) NOT NULL
);

--Создание таблицы assessment
CREATE TABLE assessment (
    ID INT PRIMARY KEY NOT NULL,
    Name VARCHAR(25) NOT NULL
);

--Создание таблицы difficulty
CREATE TABLE difficulty (
    ID INT PRIMARY KEY NOT NULL,
    Name VARCHAR(25) NOT NULL
);

--Создание таблицы wish_list
CREATE TABLE wish_list (
    ID INT PRIMARY KEY NOT NULL,
    Name VARCHAR(25) NOT NULL
);

--Создание таблицы friendship_list
CREATE TABLE friendship_list (
    ID INT PRIMARY KEY NOT NULL,
    Name VARCHAR(25) NOT NULL
);
--Создание таблицы equipment_rental
CREATE TABLE equipment_rental (
    ID INT PRIMARY KEY NOT NULL,
    name VARCHAR(25) NOT NULL,
    adress VARCHAR(100) NOT NULL,
    phone_number VARCHAR(25) NOT NULL,
    email VARCHAR(25)
);

--Создание таблицы trails
CREATE TABLE trails (
    ID INT PRIMARY KEY NOT NULL,
    name VARCHAR(100) NOT NULL,
    description VARCHAR(100),
    trail_lenght DECIMAL(10, 2) NOT NULL,
    trail_duration DECIMAL(10, 2) NOT NULL,
    height_difference DECIMAL(10, 2) NOT NULL,
    water_avaibability BOOLEAN NOT NULL,
    difficulty_id INT NOT NULL,
    trail_type_id INT NOT NULL,
    start_coordinates geography,
    end_coordinates geography,
    FOREIGN KEY (difficulty_id) REFERENCES difficulty (ID) 
    ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (trail_type_id) REFERENCES trail_type (ID) 
    ON DELETE CASCADE ON UPDATE CASCADE
);

--Создание таблицы equipment
CREATE TABLE equipment (
    ID INT PRIMARY KEY NOT NULL,
    name VARCHAR(25) NOT NULL,
    description VARCHAR(100),
    equipment_type_id INT NOT NULL,
    equipment_status_id INT NOT NULL,
    rental_id INT,
    price DECIMAL(10, 2), 
    FOREIGN KEY (equipment_type_id) REFERENCES equipment_type (ID) 
    ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (equipment_status_id) REFERENCES equipment_status (ID) 
    ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (rental_id) REFERENCES equipment_rental (ID) 
    ON DELETE CASCADE ON UPDATE CASCADE
);

--Создание таблицы wish_list_elements
CREATE TABLE wish_list_elements (
    ID INT PRIMARY KEY NOT NULL,
    element_id_equip INT,
    element_id_trail INT,
    wish_list_id INT NOT NULL,
    FOREIGN KEY (element_id_equip) REFERENCES equipment (ID) 
    ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (element_id_trail) REFERENCES trails (ID) 
    ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (wish_list_id) REFERENCES wish_list (ID) 
    ON DELETE CASCADE ON UPDATE CASCADE
);

--Создание таблицы treks
CREATE TABLE treks (
    ID INT PRIMARY KEY NOT NULL,
    start_date TIMESTAMP NOT NULL,
    end_date TIMESTAMP,
    distance DECIMAL(10, 2),
    spend_time BIGINT,
    trek_status_id INT NOT NULL,
    trail_id INT,
    FOREIGN KEY (trek_status_id) REFERENCES trek_status (ID) 
    ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (trail_id) REFERENCES trails (ID) 
    ON DELETE CASCADE ON UPDATE CASCADE
);

--Создание таблицы person_coordinates
CREATE TABLE person_coordinates (
    ID INT PRIMARY KEY NOT NULL,
    coordinates GEOGRAPHY, -- тип данных GEOGRAPHY используется для работы с географическими координатами
    trek_id INT,
    FOREIGN KEY (trek_id) REFERENCES treks(ID) -- ссылка на таблицу treks по полю ID
);

--Создание таблицы person
CREATE TABLE person (
    ID INT PRIMARY KEY NOT NULL,
    name VARCHAR(25) NOT NULL,
    surname VARCHAR(25) NOT NULL,
    middle_name VARCHAR(25) NOT NULL,
    date_of_birth DATE NOT NULL,
    gender_id INT  NOT NULL,
    phone_number VARCHAR(11) NOT NULL,
    email VARCHAR(25),
    country_id INT NOT NULL,
    training_level_id INT NOT NULL,
    coordinates_id INT,
    wish_list_id INT,
    friendship_list_id INT,
    FOREIGN KEY (country_id) REFERENCES country (ID) 
    ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (training_level_id) REFERENCES training_level (ID) 
    ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (coordinates_id) REFERENCES person_coordinates (ID) 
    ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (wish_list_id) REFERENCES wish_list (ID) 
    ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (friendship_list_id) REFERENCES friendship_list (ID) 
    ON DELETE CASCADE ON UPDATE CASCADE
);


--Создание таблицы friendship_list_elements
CREATE TABLE friendship_list_elements (
    ID INT PRIMARY KEY NOT NULL,
    friend_id INT NOT NULL,
    friendship_list_id INT NOT NULL,
    FOREIGN KEY (friend_id) REFERENCES person (ID) 
    ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (friendship_list_id) REFERENCES friendship_list (ID) 
    ON DELETE CASCADE ON UPDATE CASCADE
);

--Создание таблицы community
CREATE TABLE community (
    ID INT PRIMARY KEY NOT NULL,
    name VARCHAR(100) NOT NULL,
    description VARCHAR(100)
);

--Создание таблицы person_community
CREATE TABLE person_community (
    community_id INT NOT NULL,
    person_id INT NOT NULL,
    FOREIGN KEY (community_id) REFERENCES community (ID) 
    ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (person_id) REFERENCES person (ID) 
    ON DELETE CASCADE ON UPDATE CASCADE
);

--Создание таблицы achievements
CREATE TABLE achievements (
    ID INT PRIMARY KEY NOT NULL,
    name VARCHAR(100) NOT NULL,
    description VARCHAR(100)
);

--Создание таблицы achievements_person
CREATE TABLE achievements_person (
    achievement_id INT NOT NULL,
    person_id INT NOT NULL,
    FOREIGN KEY (achievement_id) REFERENCES achievements (ID) 
    ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (person_id) REFERENCES person (ID) 
    ON DELETE CASCADE ON UPDATE CASCADE
);


--Создание таблицы reviews
CREATE TABLE reviews (
    ID INT PRIMARY KEY NOT NULL,
    description VARCHAR(250) NOT NULL,
    assessment_type_id INT NOT NULL,
    author_id INT NOT NULL,
    trail_id INT NOT NULL,
    FOREIGN KEY (assessment_type_id) REFERENCES assessment (ID) 
    ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (author_id) REFERENCES person (ID) 
    ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (trail_id) REFERENCES trails (ID) 
    ON DELETE CASCADE ON UPDATE CASCADE
);


--Создание таблицы images
CREATE TABLE images (
    ID INT PRIMARY KEY NOT NULL,
    equipment_id INT,
    person_id INT,
    trail_id INT,
    file_name VARCHAR(100),
    url_image VARCHAR(100),
    FOREIGN KEY (equipment_id) REFERENCES equipment (ID) 
    ON DELETE SET NULL,
    FOREIGN KEY (person_id) REFERENCES person (ID) 
    ON DELETE SET NULL,
    FOREIGN KEY (trail_id) REFERENCES trails (ID) 
    ON DELETE SET NULL
);
--создание генератора ID
CREATE SEQUENCE sequence_generator_id
START WITH 1000000
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;

INSERT INTO country (ID, Name) VALUES
(1, 'Россия'),
(2, 'Австралия'),
(3, 'Австрия'),
(4, 'Бангладеш'),
(5, 'Барбадос'),
(6, 'Беларусь'),
(7, 'Белиз'),
(8, 'Бельгия'),
(9, 'Бенин'),
(10, 'Болгария'),
(11, 'Ботсвана'),
(12, 'Бразилия'),
(13, 'Бруней'),
(14, 'Буркина-Фасо'),
(15, 'Бурунди'),
(16, 'Вануату'),
(17, 'Великобритания'),
(18, 'Венгрия'),
(19, 'Вьетнам'),
(20, 'Габон'),
(21, 'Гамбия'),
(22, 'Гана'),
(23, 'Гваделупа'),
(24, 'Гватемала'),
(25, 'Гвинея'),
(26, 'Гвинея-Бисау'),
(27, 'Германия'),
(28, 'Гондурас'),
(29, 'Гонконг'),
(30, 'Гренада'),
(31, 'Греция'),
(32, 'Грузия'),
(33, 'Дания'),
(34, 'Джибути'),
(35, 'Доминика'),
(36, 'Доминиканская Республика'),
(37, 'Египет'),
(38, 'Замбия'),
(39, 'Зимбабве'),
(40, 'Исландия'),
(41, 'Индия'),
(42, 'Индонезия'),
(43, 'Иордания'),
(44, 'Ирак'),
(45, 'Иран'),
(46, 'Ирландия'),
(47, 'Исландия'),
(48, 'Италия'),
(49, 'Ямайка'),
(50, 'Япония'),
(51, 'Джибути'),
(52, 'Кения'),
(53, 'Кипр'),
(54, 'Киргизия'),
(55, 'Кирибати'),
(56, 'Китай'),
(57, 'Колумбия'),
(58, 'Коморы'),
(59, 'Конго'),
(60, 'Коста-Рика'),
(61, 'Кот-д Ивуар'),
(62, 'Куба'),
(63, 'Кувейт'),
(64, 'Лаос'),
(65, 'Латвия'),
(66, 'Лесото'),
(67, 'Либерия'),
(68, 'Ливан'),
(69, 'Ливия'),
(70, 'Литва'),
(71, 'Люксембург'),
(72, 'Маврикий'),
(73, 'Мавритания'),
(74, 'Мадагаскар'),
(75, 'Малави'),
(76, 'Малайзия'),
(77, 'Мали'),
(78, 'Мальдивы'),
(79, 'Мальта'),
(80, 'Марокко'),
(81, 'Маршалловы Острова'),
(82, 'Мексика'),
(83, 'Мозамбик'),
(84, 'Монако'),
(85, 'Монголия'),
(86, 'Намибия'),
(87, 'Науру'),
(88, 'Непал'),
(89, 'Нигер'),
(90, 'Нигерия'),
(91, 'Нидерланды'),
(92, 'Новая Зеландия'),
(93, 'Норвегия'),
(94, 'Оман');


--Добавление данных в таблицу training_level
INSERT INTO training_level (ID, Name) VALUES
(1, 'Начинающий'),
(2, 'Средний'),
(3, 'Продвинутый'),
(4, 'Эксперт');

--Добавление данных в таблицу trek_status
INSERT INTO trek_status (ID, Name) VALUES
(1, 'Планируется'),
(2, 'В процессе'),
(3, 'Завершен'),
(4, 'Отменен');

--Добавление данных в таблицу gender
INSERT INTO gender (ID, Name) VALUES
(1, 'Мужской'),
(2, 'Женский');

--Добавление данных в таблицу equipment_status
INSERT INTO equipment_status (ID, Name) VALUES
(1, 'Доступно'),
(2, 'Забронировано'),
(3, 'Недоступно'),
(4, 'В ремонте');

--Добавление данных в таблицу equipment_type
INSERT INTO equipment_type (ID, Name) VALUES
(1, 'Рюкзак'),
(2, 'Палатка'),
(3, 'Коврик'),
(4, 'Спальный мешок'),
(5, 'Треккинговые палки'),
(6, 'Ботинки'),
(7, 'Куртка'),
(8, 'Брюки'),
(9, 'Шапка'),
(10, 'Перчатки'),
(11, 'Горнолыжные ботинки'),
(12, 'Горнолыжная куртка'),
(13, 'Горнолыжные брюки'),
(14, 'Горнолыжные очки'),
(15, 'Горнолыжные перчатки'),
(16, 'Крепления'),
(17, 'Лыжи'),
(18, 'Сноуборд'),
(19, 'Крепления для сноуборда'),
(20, 'Крепления для лыж');

--Добавление данных в таблицу trail_type
INSERT INTO trail_type (ID, Name) VALUES
(1, 'Треккинг'),
(2, 'Альпинизм'),
(3, 'Скалолазание'),
(4, 'Ски-тур'),
(5, 'Бэккантри'),
(6, 'Фрирайд'),
(7, 'Ски-альпинизм'),
(8, 'Трэил-раннинг');

--Добавление данных в таблицу assessment
INSERT INTO assessment (ID, Name) VALUES
(1, 'Очень плохо'),
(2, 'Плохо'),
(3, 'Удовлетворительно'),
(4, 'Хорошо'),
(5, 'Отлично');

--Добавление данных в таблицу difficulty
INSERT INTO difficulty (ID, Name) VALUES
(1, 'Легкий'),
(2, 'Средний'),
(3, 'Сложный'),
(4, 'Очень сложный');


--Добавление данных в таблицу equipment_rental
INSERT INTO equipment_rental (ID, name, adress, phone_number, email) VALUES
(nextval('sequence_generator_id'), 'Экстрим-тур', 'ул. Кирова, д. 1, Пятигорск', '78791234567', 'extremetour@example.com'),
(nextval('sequence_generator_id'), 'Горный мир', 'ул. Ленина, д. 20, Ессентуки', '78799876543', 'gornymir@example.com'),
(nextval('sequence_generator_id'), 'Вершина', 'ул. Мира, д. 30, Кисловодск', '78796543210', 'vershina@example.com'),
(nextval('sequence_generator_id'), 'Туризм+', 'пр. Победы, д. 15, Железноводск', '78793456789', 'turizmplus@example.com'),
(nextval('sequence_generator_id'), 'Горный клуб', 'ул. Советская, д. 25, Нальчик', '78664567890', 'gornyclub@example.com');





--Добавление данных в таблицу trails
INSERT INTO trails (ID, name, description, trail_lenght, trail_duration, height_difference, water_avaibability, difficulty_id, trail_type_id, start_coordinates, end_coordinates) VALUES
(1, 'Тропа к озеру', 'Тропа ведет к живописному озеру', 10000.00, 4.00, 300.00, TRUE, 1, 1, 'POINT(55.7558261 37.6173891)', 'POINT(55.7558261 37.6173891)'),
(2, 'Тропа через лес', 'Тропа проходит через густой лес', 7500.75, 3.00, 250.00, FALSE, 2, 2, 'POINT(55.7558261 37.6173891)', 'POINT(55.7558261 37.6173891)'),
(3, 'Тропа к водопаду', 'Тропа ведет к красивому водопаду', 20000.00, 24.50, 1000.00, TRUE, 3, 3, 'POINT(55.7558261 37.6173891)', 'POINT(55.7558261 37.6173891)'),
(4, 'Тропа к горной вершине', 'Тропа ведет к горной вершине', 25000.00, 32.00, 1400.00, FALSE, 4, 4, 'POINT(55.7558261 37.6173891)', 'POINT(55.7558261 37.6173891)'),
(5, 'Тропа к древнему монастырю', 'Тропа ведет к древнему монастырю', 17700.50, 18.00, 800.00, TRUE, 3, 5, 'POINT(55.7558261 37.6173891)', 'POINT(55.7558261 37.6173891)'),
(6, 'Тропа к горному хребту', 'Тропа ведет к горному хребту', 5000.00, 3.00, 500.00, FALSE, 2, 6, 'POINT(55.7558261 37.6173891)', 'POINT(55.7558261 37.6173891)'),
(7, 'Тропа к горному озеру', 'Тропа ведет к горному озеру', 4000.00, 2.5, 300.00, TRUE, 4, 7, 'POINT(55.7558261 37.6173891)', 'POINT(55.7558261 37.6173891)'),
(8, 'Тропа к леднику', 'Тропа ведет к леднику', 4300.00, 1.5, 150.00, FALSE, 1, 8, 'POINT(55.7558261 37.6173891)', 'POINT(55.7558261 37.6173891)');


--Добавление данных в таблицу equipment
INSERT INTO equipment (ID, name, description, equipment_type_id, equipment_status_id, rental_id, price) VALUES
(1, 'Рюкзак', 'Описание рюкзака', 1, 1, 1000015, 2000.00),
(2, 'Палатка', 'Описание палатки', 2, 1, 1000016, 5000.00),
(3, 'Коврик', 'Описание коврика', 3, 1, 1000017, 1000.00),
(4, 'Спальный мешок', 'Описание спального мешка', 4, 1, 1000018, 3000.00),
(5, 'Треккинговые палки', 'Описание треккинговых палок', 5, 1, 1000019, 2500.00),
(6, 'Ботинки', 'Описание ботинок', 6, 1, 1000015, 4000.00),
(7, 'Куртка', 'Описание куртки', 7, 1, 1000016, 3500.00),
(8, 'Брюки', 'Описание брюк', 8, 1, 1000017, 2500.00),
(9, 'Шапка', 'Описание шапки', 9, 1, 1000018, 1000.00),
(10, 'Перчатки', 'Описание перчаток', 10, 1, 1000019, 1500.00),
(11, 'Горнолыжные ботинки', 'Описание горнолыжных ботинок', 11, 1, 1000015, 6000.00),
(12, 'Горнолыжная куртка', 'Описание горнолыжной куртки', 12, 1, 1000016, 5000.00),
(13, 'Горнолыжные брюки', 'Описание горнолыжных брюк', 13, 1, 1000017, 4000.00),
(14, 'Горнолыжные очки', 'Описание горнолыжных очков', 14, 1, 1000018, 3000.00),
(15, 'Горнолыжные перчатки', 'Описание горнолыжных перчаток', 15, 1, 1000019, 2000.00),
(16, 'Крепления', 'Описание креплений', 16, 1, 1000015, 2500.00),
(17, 'Лыжи', 'Описание лыж', 17, 1, 1000016, 8000.00),
(18, 'Сноуборд', 'Описание сноуборда', 18, 1, 1000017, 10000.00),
(19, 'Крепления для сноуборда', 'Описание креплений для сноуборда', 19, 1, 1000018, 4000.00),
(20, 'Крепления для лыж', 'Описание креплений для лыж', 20, 1, 1000019, 3500);

--Добавление данных в таблицу person
INSERT INTO person (ID, name, surname, middle_name, date_of_birth, gender_id, phone_number, email, country_id, training_level_id, coordinates_id, wish_list_id, friendship_list_id) VALUES
(nextval('sequence_generator_id'), 'Иван', 'Иванов', 'Иванович', '1990-01-01', 1, '+9161234567', 'ivanov@example.com', 1, 1, NULL, NULL, NULL),
(nextval('sequence_generator_id'), 'Алексей', 'Смирнов', 'Алексеевич', '1995-04-15', 1, '79265487965', 'alexey.smirnov@mail.com', 1, 2, NULL, NULL, NULL),
(nextval('sequence_generator_id'), 'Мария', 'Петрова', 'Мариванна', '1980-02-28', 2, '79151234567', 'mariap@example.com', 1, 3, NULL, NULL, NULL),
(nextval('sequence_generator_id'), 'Анна', 'Сидорова', 'Анна', '1998-05-05', 2, '79291234567', 'anna@example.com', 2, 1, NULL, NULL, NULL),
(nextval('sequence_generator_id'), 'Егор', 'Степанов', 'Егорович', '2001-03-10', 1, '79145678901', 'egor@example.com', 2, 2, NULL, NULL, NULL);

--Добавление данных в таблицу achievements
INSERT INTO achievements (ID, name, description) VALUES
(1, 'Восхождение на Эльбрус', 'Восхождение на самую высокую вершину России и Европы'),
(2, 'Восхождение на Эверест', 'Восхождение на высочайшую вершину мира'),
(3, 'Первопрохождение', 'Первое восхождение на ранее непокоренную вершину'),
(4, 'Спуск на лыжах с вершины', 'Спуск на лыжах с вершины горы'),
(5, 'Спуск на сноуборде с вершины', 'Спуск на сноуборде с вершины горы'),
(6, 'Спуск на велосипеде с вершины', 'Спуск на велосипеде с вершины горы'),
(7, 'Прохождение трассы за отведенное время', 'Прохождение сложной трассы за установленное время'),
(8, 'Участие в горной гонке', 'Участие в горной гонке на время или на выносливость'),
(9, 'Установление рекорда', 'Установление рекорда скорости, высоты или дальности в горном спорте'),
(10, 'Организация горного лагеря', 'Организация горного лагеря для восхождения или отдыха');


--Добавление данных в таблицу achievements_person
INSERT INTO achievements_person (achievement_id, person_id) VALUES
(1, 1000020),
(2, 1000020),
(3, 1000021),
(4, 1000021),
(3, 1000022),
(4, 1000022),
(5, 1000023),
(6, 1000023),
(7, 1000024),
(10, 1000024);


--добавление столбца в таблицу
ALTER TABLE achievements_person 
ADD COLUMN ID int PRIMARY KEY NOT NULL 

--Добавление данных в таблицу achievements_person
INSERT INTO achievements_person (achievement_id, person_id, id) VALUES
(1, 1000020  ,nextval('sequence_generator_id')),
(2, 1000020  ,nextval('sequence_generator_id')),
(3, 1000021  ,nextval('sequence_generator_id')),
(4, 1000021  ,nextval('sequence_generator_id')),
(3, 1000022  ,nextval('sequence_generator_id')),
(4, 1000022  ,nextval('sequence_generator_id')),
(5, 1000023  ,nextval('sequence_generator_id')),
(6, 1000023  ,nextval('sequence_generator_id')),
(7, 1000024  ,nextval('sequence_generator_id')),
(10, 1000024 ,nextval('sequence_generator_id'));



--Добавление данных в таблицу community
INSERT INTO community (ID, name, description) VALUES
(1, 'Клуб любителей горных походов', 'Клуб для тех, кто любит покорять горные вершины'),
(2, 'Клуб пеших походов', 'Клуб для любителей долгих пеших прогулок'),
(3, 'Клуб водных походов', 'Клуб для любителей сплавов по рекам и озерам'),
(4, 'Клуб зимних походов', 'Клуб для любителей зимних приключений в горах и лесах'),
(5, 'Клуб велосипедных походов', 'Клуб для любителей путешествий на велосипедах');

--Добавление данных в таблицу person_community
INSERT INTO person_community (community_id, person_id) VALUES
(5, 1000020),
(2, 1000020),
(3, 1000021),
(4, 1000021),
(3, 1000022),
(4, 1000022),
(5, 1000023),
(4, 1000023),
(2, 1000024),
(5, 1000024);

ALTER TABLE person_community 
ADD COLUMN ID int PRIMARY KEY NOT NULL 

INSERT INTO person_community (community_id, person_id, id) VALUES
(5, 1000020,nextval('sequence_generator_id')),
(2, 1000020,nextval('sequence_generator_id')),
(3, 1000021,nextval('sequence_generator_id')),
(4, 1000021,nextval('sequence_generator_id')),
(3, 1000022,nextval('sequence_generator_id')),
(4, 1000022,nextval('sequence_generator_id')),
(5, 1000023,nextval('sequence_generator_id')),
(4, 1000023,nextval('sequence_generator_id')),
(2, 1000024,nextval('sequence_generator_id')),
(5, 1000024,nextval('sequence_generator_id'));

--Добавление данных в таблицу reviews
INSERT INTO reviews (ID, description, assessment_type_id, author_id, trail_id) VALUES
(nextval('sequence_generator_id'), 'Отличная тропа к озеру, живописные виды', 5, 1000020, 1),
(nextval('sequence_generator_id'), 'Тропа через лес была утомительной', 2, 1000021, 2),
(nextval('sequence_generator_id'), 'Красивый водопад, тропа к нему великолепна', 5, 1000022, 3),
(nextval('sequence_generator_id'), 'Тропа к горной вершине была сложной, но впечатляющей', 4, 1000023, 4),
(nextval('sequence_generator_id'), 'Древний монастырь - прекрасное место, тропа к нему хорошая', 4, 1000024, 5),
(nextval('sequence_generator_id'), 'Тропа к горному хребту была средней сложности', 3, 1000020, 6),
(nextval('sequence_generator_id'), 'Тропа к горному озеру была легкой и приятной', 4, 1000021, 7),
(nextval('sequence_generator_id'), 'Ледник впечатляет, но тропа к нему непроходимая', 1, 1000022, 8);

--Добавление данных в таблицу friendship_list
INSERT INTO friendship_list (ID) VALUES
(nextval('sequence_generator_id')),
(nextval('sequence_generator_id')),
(nextval('sequence_generator_id')),
(nextval('sequence_generator_id')),
(nextval('sequence_generator_id'));

--Добавление данных в таблицу friendship_list_elements
INSERT INTO friendship_list_elements (id, friend_id, friendship_list_id) VALUES
(nextval('sequence_generator_id'),1000021, 1000046),
(nextval('sequence_generator_id'),1000022, 1000046),
(nextval('sequence_generator_id'),1000023, 1000046),
(nextval('sequence_generator_id'),1000023, 1000047),
(nextval('sequence_generator_id'),1000024, 1000047),
(nextval('sequence_generator_id'),1000022, 1000047),
(nextval('sequence_generator_id'),1000021, 1000048),
(nextval('sequence_generator_id'),1000023, 1000048),
(nextval('sequence_generator_id'),1000020, 1000048),
(nextval('sequence_generator_id'),1000022, 1000049),
(nextval('sequence_generator_id'),1000024, 1000049),
(nextval('sequence_generator_id'),1000020, 1000050);

--Добавление данных в таблицу images
INSERT INTO images (ID, equipment_id, person_id, trail_id, file_name, url_image) VALUES
(nextval('sequence_generator_id'), 1, NULL, NULL, 'image1.jpg', 'url_image1'),
(nextval('sequence_generator_id'), NULL, 1000021, NULL, 'image2.jpg', 'url_image2'),
(nextval('sequence_generator_id'), NULL, NULL, 3, 'image3.jpg', 'url_image3'),
(nextval('sequence_generator_id'), 4, NULL, NULL, 'image4.jpg', 'url_image4'),
(nextval('sequence_generator_id'), NULL, 1000024, NULL, 'image5.jpg', 'url_image5');

--Добавление данных в таблицу treks
INSERT INTO treks (ID, start_date, end_date, distance, spend_time, trek_status_id, trail_id) VALUES
(nextval('sequence_generator_id'), '2023-01-01 00:00:00', NULL, 10.00, 10000, 1, 1), 
(nextval('sequence_generator_id'), '2023-01-02 00:00:00', NULL, 20.00, 20000, 2, 2), 
(nextval('sequence_generator_id'), '2023-01-03 00:00:00', '2023-01-03 00:00:00', 30.00, 30000, 3, 3), -- Завершен
(nextval('sequence_generator_id'), '2023-01-04 00:00:00', NULL, 40.00, 40000, 4, 4); 

--Добавление данных в таблицу person_coordinates
INSERT INTO person_coordinates (ID, coordinates , trek_id) VALUES
(nextval('sequence_generator_id'), 'POINT(55.7558261 37.6173891)', 1000069),
(nextval('sequence_generator_id'), 'POINT(55.7558261 37.6173891)', 1000069),
(nextval('sequence_generator_id'), 'POINT(55.7558261 37.6173891)', NULL);

--Вывести список достижений туристов:
SELECT 
	p."name" AS "Имя", 
	p.surname AS "Фамилия" , 
	a."name" AS "Достижение" , 
	a.description AS "Описание"
FROM person p 
JOIN achievements_person ap ON ap.person_id = p.id 
JOIN achievements a ON ap.achievement_id = a.id

--Вывести информацию о туристах, находящихся на данный момент в походе:
SELECT 
	p."name" AS "Имя",
	p.surname AS "Фамилия",
	g."name" AS "Пол",
	c."name" AS "Страна",
	tl."name" AS "Уровень подготовки",
	t2."name" AS "Маршрут",
	pc.coordinates AS "Координаты"
FROM treks t 
	JOIN person_coordinates pc ON pc.trek_id = t.id 
	JOIN person p ON p.coordinates_id = pc.id 
	JOIN trails t2 ON t2.id = t.trail_id 
	JOIN country c ON c.id = p.country_id 
	JOIN training_level tl ON tl.id = p.training_level_id 
	JOIN gender g ON g.id = p.gender_id 
WHERE t.trek_status_id = 2


