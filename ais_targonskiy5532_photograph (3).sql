-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: mysql
-- Время создания: Янв 17 2023 г., 11:51
-- Версия сервера: 8.0.29
-- Версия PHP: 8.0.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `ais_targonskiy5532_photograph`
--

-- --------------------------------------------------------

--
-- Структура таблицы `client`
--

CREATE TABLE `client` (
  `id` int NOT NULL,
  `name` varchar(50) NOT NULL,
  `birth` date NOT NULL,
  `phone` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `payment_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `client`
--

INSERT INTO `client` (`id`, `name`, `birth`, `phone`, `payment_id`) VALUES
(13, 'Иванов И.И.', '2003-01-01', '89123456789', 1),
(14, 'Алексеев А.А.', '1995-01-20', '89123456745', 2),
(15, 'Антонов В.В.', '1996-05-17', '89123456678', 3),
(16, 'Тигранов А.В.', '1993-01-28', '89995557788', 4),
(17, 'Сулейманов И.В.', '1995-01-23', '89967773553', 5),
(18, 'Салманов В.И.', '1991-03-08', '89928887766', 6);

-- --------------------------------------------------------

--
-- Структура таблицы `payment`
--

CREATE TABLE `payment` (
  `id` int NOT NULL,
  `sum` int NOT NULL,
  `status` int NOT NULL,
  `type` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `payment`
--

INSERT INTO `payment` (`id`, `sum`, `status`, `type`) VALUES
(1, 3000, 1, 2),
(2, 6000, 2, 1),
(3, 10000, 2, 1),
(4, 5000, 1, 2),
(5, 4000, 1, 1),
(6, 4500, 1, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `photographer`
--

CREATE TABLE `photographer` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `phone_number` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `photographer`
--

INSERT INTO `photographer` (`id`, `name`, `phone_number`) VALUES
(1, 'Ильин И.И.', '89991234567'),
(2, 'Дмитриев Д.Д.', '88882341122'),
(3, 'Васильев И.И.', '89939092288');

-- --------------------------------------------------------

--
-- Структура таблицы `sessions`
--

CREATE TABLE `sessions` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `sessions`
--

INSERT INTO `sessions` (`id`, `name`) VALUES
(1, 'Групповая фотосессия'),
(2, 'Соло'),
(3, 'Семейная фотосессия'),
(4, 'Свадьба');

-- --------------------------------------------------------

--
-- Структура таблицы `visit`
--

CREATE TABLE `visit` (
  `id` int NOT NULL,
  `session_time` datetime NOT NULL COMMENT 'Дата и время фотосессии',
  `end_of_session` time NOT NULL,
  `id_client` int NOT NULL COMMENT 'id клиента',
  `id_photographer` int NOT NULL COMMENT 'id фотографа',
  `type_session` int NOT NULL COMMENT 'Тип фотосессии'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `visit`
--

INSERT INTO `visit` (`id`, `session_time`, `end_of_session`, `id_client`, `id_photographer`, `type_session`) VALUES
(9, '2023-01-16 10:00:00', '12:00:00', 13, 1, 2),
(10, '2023-01-18 12:00:00', '16:00:00', 17, 2, 2),
(11, '2023-01-23 10:00:00', '22:00:00', 15, 3, 4),
(12, '2023-01-20 11:00:00', '15:00:00', 14, 2, 3),
(13, '2023-01-30 13:00:00', '16:00:00', 16, 1, 1),
(14, '2023-01-31 09:00:00', '14:00:00', 18, 3, 2);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`id`),
  ADD KEY `client_ibfk_1` (`payment_id`);

--
-- Индексы таблицы `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `status` (`status`),
  ADD KEY `type` (`type`);

--
-- Индексы таблицы `photographer`
--
ALTER TABLE `photographer`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `visit`
--
ALTER TABLE `visit`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_client` (`id_client`),
  ADD KEY `type_session` (`type_session`),
  ADD KEY `id_photographer` (`id_photographer`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `client`
--
ALTER TABLE `client`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT для таблицы `payment`
--
ALTER TABLE `payment`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `photographer`
--
ALTER TABLE `photographer`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `sessions`
--
ALTER TABLE `sessions`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `visit`
--
ALTER TABLE `visit`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`id`) REFERENCES `client` (`payment_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Ограничения внешнего ключа таблицы `visit`
--
ALTER TABLE `visit`
  ADD CONSTRAINT `visit_ibfk_1` FOREIGN KEY (`id_client`) REFERENCES `client` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `visit_ibfk_2` FOREIGN KEY (`type_session`) REFERENCES `sessions` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `visit_ibfk_4` FOREIGN KEY (`id_photographer`) REFERENCES `photographer` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
