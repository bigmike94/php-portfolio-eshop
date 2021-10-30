-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Хост: localhost:3306
-- Время создания: Окт 30 2021 г., 09:27
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
-- Структура таблицы `brands`
--

CREATE TABLE `brands` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `brands`
--

INSERT INTO `brands` (`id`, `name`) VALUES
(1, 'Acer'),
(2, 'Asus'),
(3, 'HP'),
(4, 'Samsung'),
(5, 'Gazer'),
(6, 'Dell'),
(7, 'Lenovo');

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
-- Структура таблицы `contact`
--

CREATE TABLE `contact` (
  `id` int(11) NOT NULL,
  `ge_address` varchar(255) NOT NULL,
  `en_address` varchar(255) NOT NULL,
  `mob_phone_num` varchar(20) NOT NULL,
  `email` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `contact`
--

INSERT INTO `contact` (`id`, `ge_address`, `en_address`, `mob_phone_num`, `email`) VALUES
(1, 'თბილისი, დ.აღმაშენებლის #14 ', 'Tbilisi, D.Aghmashenebeli #14', '+995-555-55-55-55', 'geo_eshopper@gmail.com');

-- --------------------------------------------------------

--
-- Структура таблицы `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `order_time` int(11) NOT NULL,
  `delivery_time` int(11) DEFAULT NULL,
  `products` text NOT NULL,
  `payment_status` int(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `order_time`, `delivery_time`, `products`, `payment_status`, `status`) VALUES
(64, 52, 1635027220, 1635321600, '{\"1\":1,\"2\":1,\"47\":1}', 1, 2),
(65, 52, 1635027918, NULL, '{\"7\":2,\"8\":2,\"32\":2}', 0, 0),
(66, 52, 1635361528, NULL, '{\"5\":1,\"7\":2,\"32\":1}', 0, 0),
(67, 54, 1635584304, NULL, '{\"45\":1,\"47\":1,\"48\":1}', 0, 0),
(68, 54, 1635584379, NULL, '{\"45\":1,\"47\":1,\"48\":1}', 0, 0),
(69, 54, 1635585518, NULL, '{\"45\":1,\"47\":1,\"48\":1}', 0, 0),
(70, 52, 1635585606, NULL, '{\"45\":1,\"47\":1,\"48\":1}', 0, 0),
(71, 52, 1635585644, NULL, '{\"7\":1,\"8\":1,\"32\":1,\"45\":1,\"47\":1,\"48\":1}', 0, 0),
(72, 52, 1635585675, NULL, '{\"7\":1,\"8\":1}', 0, 0),
(73, 52, 1635585949, NULL, '{\"8\":3,\"48\":1}', 0, 0),
(74, 52, 1635586002, NULL, '{\"47\":1,\"48\":2}', 0, 0);

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
  `brand_id` varchar(255) NOT NULL,
  `en_descr` text NOT NULL,
  `ge_descr` text NOT NULL,
  `is_new` int(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '1',
  `img` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `products`
--

INSERT INTO `products` (`id`, `name`, `category_id`, `code`, `price`, `availability`, `brand_id`, `en_descr`, `ge_descr`, `is_new`, `status`, `img`) VALUES
(1, 'Asus X200MA White ', 1, 2028027, 879, 1, '2', '', '', 0, 1, '/uploads/products-imgs/asus-x200ma-white.jpg'),
(2, 'Acer Aspire E3-112-C65X', 1, 2019487, 789, 1, '1', '', '', 0, 1, '/uploads/products-imgs/Aspire-E3.jpg'),
(3, 'Lenovo Flex 10', 1, 1602042, 679, 0, '7', '', '', 0, 1, '/uploads/products-imgs/Lenovo-Flex-10.jpg'),
(4, 'Asus X751MA', 1, 2028367, 999, 1, '2', '', '', 0, 1, '/uploads/products-imgs/asus-x751ma.jpg'),
(5, 'Samsung Galaxy Tab S 10.5 16GB', 2, 1129365, 780, 1, '4', '', '', 1, 1, '/uploads/products-imgs/Samsung-Galaxy-Tab-S-10.5 16GB.jpg'),
(7, 'Gazer Tegra Note 7', 2, 683364, 250, 1, '5', '', '', 0, 1, '/uploads/products-imgs/Gazer-Tegra-Note-7.jpg'),
(8, '23\" Dell E2314H Black', 3, 355025, 174.9, 1, '6', '', '', 0, 1, '/uploads/products-imgs/23-Dell-E2314H-Black.jpg'),
(32, 'Samsung Galaxy Tab S 8.4 16GB', 2, 1128670, 639, 1, '4', '', '', 0, 1, '/uploads/products-imgs/Samsung-Galaxy-Tab-S-8.4-16GB.jpg'),
(45, 'HP Stream', 1, 85864342, 599, 1, '3', '', '', 1, 1, '/uploads/products-imgs/hp-stream.jpg'),
(47, 'ASUS ZenBook 13 Ultra-Slim Laptop, 13.3” OLED FHD NanoEdge Bezel', 1, 2014527, 1899, 1, '2', '<li>13.3 inch OLED 400nits Full HD (1920 x 1080) Wide View 4-way NanoEdge bezel display</li> \r\n<li>11th generation Intel Core i7-1165G7 Quad Core Processor (12M Cache, up to 4.70 GHz)</li>\r\n<li>ErgoLift hinge and backlit keyboard and NumberPad</li> \r\n<li>Fast storage and memory featuring 512GB PCIe NVMe M.2 SSD with 8GB LPDDR4X RAM</li> \r\n<li>Built-in IR camera for facial recognition sign in with Windows Hello</li>\r\n<li>Windows 10 Home Sleek and lightweight 2.45 lbs for comfortable portability</li>\r\n<li>ASUS AI Noise-Canceling Technology employs machine learning to isolate unwanted noise</li>\r\n<li>MIL-STD 810G military standard for reliability and durability</li> \r\n<li>Carry sleeve and USB-C to audio jack adapter included</li>', '', 1, 1, '/uploads/products-imgs/ASUS-ZenBook-13 Ultra-Slim Laptop-13.3”-OLED-FHD-NanoEdge-Bezel.jpg'),
(48, 'Acer KA2 23.8\"', 3, 8228367, 220, 1, '1', '', '', 1, 1, '/uploads/products-imgs/acer_ka2.png');

-- --------------------------------------------------------

--
-- Структура таблицы `recommended`
--

CREATE TABLE `recommended` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `recommended`
--

INSERT INTO `recommended` (`id`, `user_id`, `product_id`) VALUES
(128, 52, 48),
(129, 52, 2),
(130, 52, 32),
(131, 52, 5),
(132, 52, 1),
(133, 52, 4),
(134, 52, 47),
(135, 54, 32),
(136, 54, 48),
(137, 54, 2);

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(12) NOT NULL,
  `address` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `phone`, `address`, `password`) VALUES
(52, 'Misha Kirichenko', 'misha.kirichenko.2994@gmail.com', '597-73-39-94', 'Tbilisi, Tseretlis #59', 'bfcdb0102c87c0e4d59eceffb5658ac6'),
(54, 'Oksana Kirichenko', 'okspochta@mail.ru', '597-07-07-00', 'Tbilisi, Tsereteli #59', '5cde3ed78ad72e99232dc56d939a849f');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `recommended`
--
ALTER TABLE `recommended`
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
-- AUTO_INCREMENT для таблицы `brands`
--
ALTER TABLE `brands`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT для таблицы `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `contact`
--
ALTER TABLE `contact`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=75;

--
-- AUTO_INCREMENT для таблицы `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT для таблицы `recommended`
--
ALTER TABLE `recommended`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=138;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
