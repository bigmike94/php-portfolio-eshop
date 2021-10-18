-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Хост: localhost:3306
-- Время создания: Сен 07 2021 г., 18:55
-- Версия сервера: 5.7.24
-- Версия PHP: 7.2.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `eshopper`
--

-- --------------------------------------------------------

--
-- Структура таблицы `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `ge_name` varchar(100) NOT NULL,
  `en_name` varchar(100) NOT NULL,
  `sort_order` int(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `category`
--

INSERT INTO `category` (`id`, `ge_name`, `en_name`, `sort_order`, `status`) VALUES
(1, 'ნოუტბუქები', 'Notebooks', 1, 1),
(2, 'პლანშეტები', 'Tablets', 2, 1),
(3, 'მონიტორები', 'Monitors', 3, 1),
(4, 'სათამაშო PC', 'Gamer PCs', 4, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `category_id` int(11) NOT NULL,
  `code` int(11) NOT NULL,
  `price` float NOT NULL,
  `availability` tinyint(1) NOT NULL,
  `brand` varchar(255) NOT NULL,
  `en_description` text NOT NULL,
  `ge_description` text NOT NULL,
  `is_new` int(11) NOT NULL DEFAULT '0',
  `is_recommended` int(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '1',
  `img` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `products`
--

INSERT INTO `products` (`id`, `name`, `category_id`, `code`, `price`, `availability`, `brand`, `en_description`, `ge_description`, `is_new`, `is_recommended`, `status`, `img`) VALUES
(1, 'Asus X200MA White ', 1, 2028027, 270, 1, 'Asus', 'Экран 11.6\" (1366x768) HD LED, глянцевый / Intel Celeron N2840 (2.16 ГГц) / RAM 2 ГБ / HDD 500 ГБ / Intel HD Graphics / без ОД / Bluetooth 4.0 / Wi-Fi / LAN / веб-камера / без ОС / 1.24 кг / белый', '', 0, 1, 1, '/uploads/products-imgs/asus-x200ma-white.jpg'),
(2, 'Acer Aspire E3-112-C65X', 1, 2019487, 325, 1, 'Acer', 'Экран 11.6\'\' (1366x768) HD LED, матовый / Intel Celeron N2840 (2.16 ГГц) / RAM 2 ГБ / HDD 500 ГБ / Intel HD Graphics / без ОД / LAN / Wi-Fi / Bluetooth / веб-камера / Linpus / 1.29 кг / серебристый', '', 0, 1, 1, '/uploads/products-imgs/Aspire-E3.jpg'),
(3, 'Lenovo Flex 10', 1, 1602042, 370, 0, 'Lenovo', 'Экран 10.1\" (1366x768) HD LED, сенсорный, глянцевый / Intel Celeron N2830 (2.16 ГГц) / RAM 2 ГБ / HDD 500 ГБ / Intel HD Graphics / без ОД / Wi-Fi / Bluetooth / веб-камера / Windows 8.1 / 1.2 кг / черный', '', 0, 0, 1, '/uploads/products-imgs/Lenovo-Flex-10.jpg'),
(4, 'Asus X751MA', 1, 2028367, 430, 1, 'Asus', 'Экран 17.3\" (1600х900) HD+ LED, глянцевый / Intel Pentium N3540 (2.16 - 2.66 ГГц) / RAM 4 ГБ / HDD 1 ТБ / Intel HD Graphics / DVD Super Multi / LAN / Wi-Fi / Bluetooth 4.0 / веб-камера / DOS / 2.6 кг / белый', '', 0, 1, 1, '/uploads/products-imgs/asus-x751ma.jpg'),
(5, 'Samsung Galaxy Tab S 10.5 16GB', 2, 1129365, 780, 1, 'Samsung', 'Samsung Galaxy Tab S создан для того, чтобы сделать вашу жизнь лучше. Наслаждайтесь своим контентом с покрытием 94% цветов Adobe RGB и 100000:1 уровнем контрастности, который обеспечивается sAmoled экраном с функцией оптимизации под отображаемое изображение и окружение. Яркий 10.5” экран в ультратонком корпусе весом 467 г порадует вас высоким уровнем портативности. Работа станет проще вместе с Hancom Office и удаленным доступом к вашему ПК. E-Meeting и WebEx – отличные помощники для проведения встреч, когда вы находитесь вне офиса. Надежно храните ваши данные благодаря сканеру отпечатка пальцев.', '', 1, 1, 1, '/uploads/products-imgs/Samsung-Galaxy-Tab-S-10.5 16GB.jpg'),
(6, 'Samsung Galaxy Tab S 8.4 16GB', 2, 1128670, 640, 1, 'Samsung', 'Экран 8.4\" Super AMOLED (2560x1600) емкостный Multi-Touch / Samsung Exynos 5420 (1.9 ГГц + 1.3 ГГц) / RAM 3 ГБ / 16 ГБ встроенной памяти + поддержка карт памяти microSD / Bluetooth 4.0 / Wi-Fi 802.11 a/b/g/n/ac / основная камера 8 Мп, фронтальная 2.1 Мп / GPS / ГЛОНАСС / Android 4.4.2 (KitKat) / 294 г / белый', '', 0, 0, 1, '/uploads/products-imgs/Samsung-Galaxy-Tab-S-8.4-16GB.jpg'),
(7, 'Gazer Tegra Note 7', 2, 683364, 210, 1, 'Gazer', 'Экран 7\" IPS (1280x800) емкостный Multi-Touch / NVIDIA Tegra 4 (1.8 ГГц) / RAM 1 ГБ / 16 ГБ встроенной памяти + поддержка карт памяти microSD / Wi-Fi / Bluetooth 4.0 / основная камера 5 Мп, фронтальная - 0.3 Мп / GPS / ГЛОНАСС / Android 4.4.2 (KitKat) / вес 320 г', '', 0, 0, 1, '/uploads/products-imgs/Gazer-Tegra-Note-7.jpg'),
(8, '23\" Dell E2314H Black', 3, 355025, 175, 1, 'Dell', 'С расширением Full HD Вы сможете рассмотреть мельчайшие детали. Dell E2314H предоставит Вам резкое и четкое изображение, с которым любая работа будет в удовольствие. Full HD 1920 x 1080 при 60 Гц разрешение (макс.)', '', 0, 0, 1, '/uploads/products-imgs/23-Dell-E2314H-Black.jpg'),
(45, 'HP Stream', 1, 85864342, 586, 1, 'HP', '', '', 1, 1, 1, '/uploads/products-imgs/hp-stream.jpg'),
(47, 'ASUS ZenBook 13 Ultra-Slim Laptop, 13.3” OLED FHD NanoEdge Bezel', 1, 2014527, 899, 1, 'Asus', '<li>13.3 inch OLED 400nits Full HD (1920 x 1080) Wide View 4-way NanoEdge bezel display</li> \r\n<li>11th generation Intel Core i7-1165G7 Quad Core Processor (12M Cache, up to 4.70 GHz)</li>\r\n<li>ErgoLift hinge and backlit keyboard and NumberPad</li> \r\n<li>Fast storage and memory featuring 512GB PCIe NVMe M.2 SSD with 8GB LPDDR4X RAM</li> \r\n<li>Built-in IR camera for facial recognition sign in with Windows Hello</li>\r\n<li>Windows 10 Home Sleek and lightweight 2.45 lbs for comfortable portability</li>\r\n<li>ASUS AI Noise-Canceling Technology employs machine learning to isolate unwanted noise</li>\r\n<li>MIL-STD 810G military standard for reliability and durability</li> \r\n<li>Carry sleeve and USB-C to audio jack adapter included</li>', '', 1, 1, 1, '/uploads/products-imgs/ASUS-ZenBook-13 Ultra-Slim Laptop-13.3”-OLED-FHD-NanoEdge-Bezel.jpg');

-- --------------------------------------------------------

--
-- Структура таблицы `product_order`
--

CREATE TABLE `product_order` (
  `id` int(11) NOT NULL,
  `user_name` varchar(255) NOT NULL,
  `user_phone` varchar(255) NOT NULL,
  `user_comment` text NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `products` text NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `product_order`
--

INSERT INTO `product_order` (`id`, `user_name`, `user_phone`, `user_comment`, `user_id`, `date`, `products`, `status`) VALUES
(45, 'fsdfsd', '1', '123123123', 4, '2015-05-14 05:54:45', '{\"1\":1,\"2\":1,\"3\":2}', 3),
(46, 'САША1', 'g3424242342', '', 4, '2015-05-18 11:34:42', '{\"44\":3,\"43\":3}', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`) VALUES
(28, 'Misha Kirichenko', 'misha.kirichenko.1994@mail.ru', '1e96d34c5e13a9246df2f191d609f1d5');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `product_order`
--
ALTER TABLE `product_order`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT для таблицы `product_order`
--
ALTER TABLE `product_order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
