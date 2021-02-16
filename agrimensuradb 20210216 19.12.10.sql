-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 16-02-2021 a las 23:12:35
-- Versión del servidor: 10.4.11-MariaDB
-- Versión de PHP: 7.4.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `agrimensuradb`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `areaempleados`
--

CREATE TABLE `areaempleados` (
  `id` int(10) UNSIGNED NOT NULL,
  `oficina` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_area` int(11) DEFAULT NULL,
  `id_persona` int(11) NOT NULL,
  `created_by` int(11) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `areaempleados`
--

INSERT INTO `areaempleados` (`id`, `oficina`, `id_area`, `id_persona`, `created_by`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Contable General', 1, 1, 0, '2021-01-26 20:01:06', '2021-01-26 20:01:06', NULL),
(2, 'Legales', 2, 2, 0, '2021-01-26 20:01:29', '2021-01-26 20:01:29', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `areas`
--

CREATE TABLE `areas` (
  `id` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `areas`
--

INSERT INTO `areas` (`id`, `nombre`, `descripcion`, `created_at`, `updated_at`, `deleted_at`, `created_by`) VALUES
(1, 'Contable', 'area donde se hacen numeros', '2021-01-12 16:46:08', '2021-01-12 16:46:08', NULL, 1),
(2, 'Letrada', 'Donde estan los abogados giles', '2021-01-12 16:47:11', '2021-01-12 16:47:11', NULL, 1),
(3, 'mesa de entrada', 'esta es la oficina de mesa d', '2021-01-20 17:13:50', '2021-01-20 17:13:50', NULL, 1),
(4, 'auditoria', 'Oficina donde se auditan las demas', '2021-02-02 21:28:52', '2021-02-02 21:28:52', NULL, 1),
(5, 'secretaria', 'Oficina de las secretarias', '2021-02-02 21:29:15', '2021-02-02 21:29:15', NULL, 1),
(6, 'directivos', 'Oficina de los directores', '2021-02-02 21:29:31', '2021-02-02 21:29:31', NULL, 1),
(7, 'patrimonio', 'Oficina de Patrimonio', '2021-02-02 21:29:57', '2021-02-02 21:29:57', NULL, 1),
(8, 'personal', 'Oficina de personal', '2021-02-02 21:30:19', '2021-02-02 21:30:19', NULL, 1),
(9, 'Archivo', 'oficina de archivo', '2021-02-03 00:25:35', '2021-02-03 00:25:35', NULL, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categories`
--

CREATE TABLE `categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `parent_id` int(10) UNSIGNED DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT 1,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `categories`
--

INSERT INTO `categories` (`id`, `parent_id`, `order`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, NULL, 1, 'Category 1', 'category-1', '2021-01-12 00:02:25', '2021-01-12 00:02:25'),
(2, NULL, 1, 'Category 2', 'category-2', '2021-01-12 00:02:25', '2021-01-12 00:02:25');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contacts`
--

CREATE TABLE `contacts` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `estado` int(11) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `contacts`
--

INSERT INTO `contacts` (`id`, `name`, `email`, `message`, `estado`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'juancito el remitente', 'juancito@hotmail.com', 'Buen dia estoy buscando informacion para inscribirme como productor minero, ayuda  please', 0, '2021-01-14 17:19:56', '2021-01-14 17:19:56', NULL),
(2, 'juancito el remitente', 'juancito@hotmail.com', 'Buen dia estoy buscando informacion para inscribirme como productor minero, ayuda  please', 0, '2021-01-14 17:22:38', '2021-01-14 17:22:38', NULL),
(3, 'gordo jack', 'jackcito@hotmail.com', 'HOla soy jackcito cui cui', 0, '2021-01-14 19:41:13', '2021-01-14 19:51:26', '2021-01-14 19:51:26'),
(4, 'gordo jack', 'jackcito@hotmail.com', 'HOla soy jackcito cui cui', 0, '2021-01-14 19:44:20', '2021-01-14 19:51:26', '2021-01-14 19:51:26'),
(5, 'gordo jack', 'jackcito@hotmail.com', 'HOla soy jackcito cui cui3', 0, '2021-01-14 19:44:34', '2021-01-14 19:44:34', NULL),
(6, 'gordo jack', 'jackcito@hotmail.com', 'HOla soy jackcito cui cui34', 0, '2021-01-14 19:45:30', '2021-01-14 19:51:26', NULL),
(7, 'gordo jack', 'jackcito@hotmail.com', 'HOla soy jackcito cui cui99', 0, '2021-01-14 19:45:59', '2021-01-14 19:51:26', '2021-01-14 19:51:26'),
(8, 'Lionel messi', 'messsi@gmail.com', 'adsdasdasdasdasdasd23323', 3, '2021-01-16 01:01:34', '2021-01-26 17:37:09', NULL),
(9, 'diego', 'diegochecarelli@hotmail.com', 'este es mi mensaje', 0, '2021-02-12 07:50:46', '2021-02-12 07:50:46', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `data_rows`
--

CREATE TABLE `data_rows` (
  `id` int(10) UNSIGNED NOT NULL,
  `data_type_id` int(10) UNSIGNED NOT NULL,
  `field` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT 0,
  `browse` tinyint(1) NOT NULL DEFAULT 1,
  `read` tinyint(1) NOT NULL DEFAULT 1,
  `edit` tinyint(1) NOT NULL DEFAULT 1,
  `add` tinyint(1) NOT NULL DEFAULT 1,
  `delete` tinyint(1) NOT NULL DEFAULT 1,
  `details` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `data_rows`
--

INSERT INTO `data_rows` (`id`, `data_type_id`, `field`, `type`, `display_name`, `required`, `browse`, `read`, `edit`, `add`, `delete`, `details`, `order`) VALUES
(1, 1, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, '{}', 1),
(2, 1, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, '{}', 2),
(3, 1, 'email', 'text', 'Email', 1, 1, 1, 1, 1, 1, '{}', 3),
(4, 1, 'password', 'password', 'Password', 1, 0, 0, 1, 1, 0, '{}', 4),
(5, 1, 'remember_token', 'text', 'Remember Token', 0, 0, 0, 0, 0, 0, '{}', 5),
(6, 1, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 0, '{}', 6),
(7, 1, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 7),
(8, 1, 'avatar', 'image', 'Avatar', 0, 1, 1, 1, 1, 1, '{}', 8),
(9, 1, 'user_belongsto_role_relationship', 'relationship', 'Role', 0, 1, 1, 1, 1, 0, '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsTo\",\"column\":\"role_id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"roles\",\"pivot\":\"0\",\"taggable\":\"0\"}', 10),
(10, 1, 'user_belongstomany_role_relationship', 'relationship', 'Roles', 0, 1, 1, 1, 1, 0, '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"user_roles\",\"pivot\":\"1\",\"taggable\":\"0\"}', 11),
(11, 1, 'settings', 'hidden', 'Settings', 0, 0, 0, 0, 0, 0, '{}', 12),
(12, 2, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(13, 2, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(14, 2, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 3),
(15, 2, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 4),
(16, 3, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(17, 3, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(18, 3, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 3),
(19, 3, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 4),
(20, 3, 'display_name', 'text', 'Display Name', 1, 1, 1, 1, 1, 1, NULL, 5),
(21, 1, 'role_id', 'text', 'Role', 0, 1, 1, 1, 1, 1, '{}', 9),
(22, 4, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(23, 4, 'parent_id', 'select_dropdown', 'Parent', 0, 0, 1, 1, 1, 1, '{\"default\":\"\",\"null\":\"\",\"options\":{\"\":\"-- None --\"},\"relationship\":{\"key\":\"id\",\"label\":\"name\"}}', 2),
(24, 4, 'order', 'text', 'Order', 1, 1, 1, 1, 1, 1, '{\"default\":1}', 3),
(25, 4, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 4),
(26, 4, 'slug', 'text', 'Slug', 1, 1, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"name\"}}', 5),
(27, 4, 'created_at', 'timestamp', 'Created At', 0, 0, 1, 0, 0, 0, NULL, 6),
(28, 4, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 7),
(29, 5, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(30, 5, 'author_id', 'text', 'Author', 1, 0, 1, 1, 0, 1, NULL, 2),
(31, 5, 'category_id', 'text', 'Category', 1, 0, 1, 1, 1, 0, NULL, 3),
(32, 5, 'title', 'text', 'Title', 1, 1, 1, 1, 1, 1, NULL, 4),
(33, 5, 'excerpt', 'text_area', 'Excerpt', 1, 0, 1, 1, 1, 1, NULL, 5),
(34, 5, 'body', 'rich_text_box', 'Body', 1, 0, 1, 1, 1, 1, NULL, 6),
(35, 5, 'image', 'image', 'Post Image', 0, 1, 1, 1, 1, 1, '{\"resize\":{\"width\":\"1000\",\"height\":\"null\"},\"quality\":\"70%\",\"upsize\":true,\"thumbnails\":[{\"name\":\"medium\",\"scale\":\"50%\"},{\"name\":\"small\",\"scale\":\"25%\"},{\"name\":\"cropped\",\"crop\":{\"width\":\"300\",\"height\":\"250\"}}]}', 7),
(36, 5, 'slug', 'text', 'Slug', 1, 0, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"title\",\"forceUpdate\":true},\"validation\":{\"rule\":\"unique:posts,slug\"}}', 8),
(37, 5, 'meta_description', 'text_area', 'Meta Description', 1, 0, 1, 1, 1, 1, NULL, 9),
(38, 5, 'meta_keywords', 'text_area', 'Meta Keywords', 1, 0, 1, 1, 1, 1, NULL, 10),
(39, 5, 'status', 'select_dropdown', 'Status', 1, 1, 1, 1, 1, 1, '{\"default\":\"DRAFT\",\"options\":{\"PUBLISHED\":\"published\",\"DRAFT\":\"draft\",\"PENDING\":\"pending\"}}', 11),
(40, 5, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 0, NULL, 12),
(41, 5, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 13),
(42, 5, 'seo_title', 'text', 'SEO Title', 0, 1, 1, 1, 1, 1, NULL, 14),
(43, 5, 'featured', 'checkbox', 'Featured', 1, 1, 1, 1, 1, 1, NULL, 15),
(44, 6, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(45, 6, 'author_id', 'text', 'Author', 1, 0, 0, 0, 0, 0, NULL, 2),
(46, 6, 'title', 'text', 'Title', 1, 1, 1, 1, 1, 1, NULL, 3),
(47, 6, 'excerpt', 'text_area', 'Excerpt', 1, 0, 1, 1, 1, 1, NULL, 4),
(48, 6, 'body', 'rich_text_box', 'Body', 1, 0, 1, 1, 1, 1, NULL, 5),
(49, 6, 'slug', 'text', 'Slug', 1, 0, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"title\"},\"validation\":{\"rule\":\"unique:pages,slug\"}}', 6),
(50, 6, 'meta_description', 'text', 'Meta Description', 1, 0, 1, 1, 1, 1, NULL, 7),
(51, 6, 'meta_keywords', 'text', 'Meta Keywords', 1, 0, 1, 1, 1, 1, NULL, 8),
(52, 6, 'status', 'select_dropdown', 'Status', 1, 1, 1, 1, 1, 1, '{\"default\":\"INACTIVE\",\"options\":{\"INACTIVE\":\"INACTIVE\",\"ACTIVE\":\"ACTIVE\"}}', 9),
(53, 6, 'created_at', 'timestamp', 'Created At', 1, 1, 1, 0, 0, 0, NULL, 10),
(54, 6, 'updated_at', 'timestamp', 'Updated At', 1, 0, 0, 0, 0, 0, NULL, 11),
(55, 6, 'image', 'image', 'Page Image', 0, 1, 1, 1, 1, 1, NULL, 12),
(56, 7, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(57, 7, 'nombre', 'text', 'Nombre', 1, 1, 1, 1, 1, 1, '{\"description\":\"En este campo se debe escribir el nombre del tramite que se esta creando o editando.\",\"validation\":{\"rule\":\"required|max:50\"},\"placeholder\":\"Por favor ingrese el nombre del tipo de tramite\",\"messages\":{\"required\":\"Este :attribute campo es necesario.\",\"max\":\"Este campo :attribute tiene un maximo de :max caracteres.\"},\"display\":{\"width\":\"6\",\"id\":\"nombre\"}}', 2),
(58, 7, 'descripcion', 'text', 'Descripcion', 1, 1, 1, 1, 1, 1, '{\"description\":\"En este campo se debe escribir la descripci\\u00f3n del tramite que se esta creando o editando.\",\"validation\":{\"rule\":\"required|max:50\"},\"placeholder\":\"Por favor ingrese la descripci\\u00f3n del area\",\"messages\":{\"required\":\"Este :attribute campo es necesario.\",\"max\":\"Este campo :attribute tiene un maximo de :max caracteres.\"},\"display\":{\"width\":\"6\",\"id\":\"descripcion\"}}', 3),
(59, 7, 'created_by', 'hidden', 'Created By', 0, 0, 0, 0, 0, 0, '{}', 4),
(60, 7, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, '{}', 5),
(61, 7, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 6),
(62, 7, 'deleted_at', 'timestamp', 'Deleted At', 0, 0, 0, 0, 0, 0, '{}', 7),
(63, 8, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(64, 8, 'nombre', 'text', 'Nombre', 1, 1, 1, 1, 1, 1, '{\"validation\":{\"rule\":\"required|max:50\"},\"placeholder\":\"Por favor ingrese su nombre\",\"messages\":{\"required\":\"El :attribute es un campo necesario.\",\"max\":\"El :attribute debe tener un maximo de :max.\"},\"display\":{\"width\":\"6\",\"id\":\"nombre\"}}', 2),
(65, 8, 'apellido', 'text', 'Apellido', 1, 1, 1, 1, 1, 1, '{\"validation\":{\"rule\":\"required|max:50\"},\"placeholder\":\"Por favor ingrese su apellido\",\"messages\":{\"required\":\"El :attribute es un campo necesario.\",\"max\":\"El :attribute debe tener un maximo de :max.\"},\"display\":{\"width\":\"6\",\"id\":\"apellido\"}}', 3),
(66, 8, 'dni', 'text', 'Dni', 0, 1, 1, 1, 1, 1, '{\"description\":\"Por favor, ingrese su DNI, sin puntos ni espacios, solamente ingrese numeros.\",\"validation\":{\"rule\":\"required|max:8\"},\"placeholder\":\"Por favor ingrese su DNI\",\"min\":0,\"max\":99999999,\"messages\":{\"required\":\"El :attribute es un cmapo necesario para continuar.\",\"max\":\"El :attribute tiene un maximo de :max.\"},\"display\":{\"width\":\"6\",\"id\":\"dni\"}}', 4),
(67, 8, 'cuit', 'text', 'Cuit', 1, 1, 1, 1, 1, 1, '{\"description\":\"Por favor, ingrese su CUIT sin guiones ni espacios, solamente ingrese numeros.\",\"validation\":{\"rule\":\"required|max:12\"},\"placeholder\":\"Por favor ingrese su CUIT\",\"min\":0,\"max\":999999999999,\"messages\":{\"required\":\"El :attribute es necesario para continuar.\",\"max\":\"El :attribute tiene un maximo de :max.\"},\"display\":{\"width\":\"6\",\"id\":\"cuit\"}}', 5),
(68, 8, 'email', 'text', 'Email', 1, 1, 1, 1, 1, 1, '{\"description\":\"Por favor, ingrese su email valido. Este campo ser\\u00e1 utilizado al momento de notificarlo respecto de novedades que lo involucren a usted.\",\"validation\":{\"rule\":\"required\"},\"placeholder\":\"Por favor ingrese su email\",\"messages\":{\"required\":\"El :attribute es necesario para continuar.\",\"max\":\"El :attribute tiene un maximo de :max.\"},\"display\":{\"width\":\"6\",\"id\":\"email\"}}', 6),
(69, 8, 'empleado_agrimensor', 'checkbox', 'Agende de la DGC:', 0, 1, 1, 1, 1, 1, '{\"description\":\"Usted es un Agende de la DGC.\",\"placeholder\":\"Por favor seleccione\",\"default\":\"0\",\"options\":{\"0\":\"No\",\"1\":\"Si\"},\"display\":{\"width\":\"6\",\"id\":\"empleado\"}}', 7),
(70, 8, 'domicilio', 'text', 'Domicilio', 1, 1, 1, 1, 1, 1, '{\"description\":\"Por favor, ingrese su domicilio. Este campo ser\\u00e1 utilizado al momento de notificarlo respecto de novedades que lo involucren a usted.\",\"validation\":{\"rule\":\"required|max:50\"},\"placeholder\":\"Por favor ingrese su domicilio\",\"messages\":{\"required\":\"El :attribute es necesario para continuar.\",\"max\":\"El :attribute tiene un maximo :max.\"},\"display\":{\"width\":\"9\",\"id\":\"domicilio\"}}', 8),
(71, 8, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, '{}', 9),
(72, 8, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 10),
(73, 8, 'deleted_at', 'timestamp', 'Deleted At', 0, 0, 0, 0, 0, 0, '{}', 11),
(74, 10, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(75, 10, 'oficina', 'text', 'Oficina', 0, 1, 1, 1, 1, 1, '{\"description\":\"En este campo se debe escribir el nombre del area a la que pertenece la persona.\",\"validation\":{\"rule\":\"required|max:50\"},\"placeholder\":\"Por favor ingrese el nombre del area\",\"messages\":{\"required\":\"Este :attribute campo es necesario.\",\"max\":\"Este campo :attribute tiene un maximo de :max caracteres.\"},\"display\":{\"width\":\"6\",\"id\":\"nombre\"}}', 2),
(76, 10, 'id_area', 'text', 'Id Area', 0, 1, 1, 1, 1, 1, '{}', 3),
(77, 10, 'id_persona', 'text', 'Id Persona', 1, 1, 1, 1, 1, 1, '{}', 4),
(78, 10, 'created_by', 'hidden', 'Created By', 0, 0, 0, 0, 0, 0, '{\"value\":1}', 5),
(79, 10, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, '{}', 6),
(80, 10, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 7),
(81, 10, 'deleted_at', 'timestamp', 'Deleted At', 0, 0, 0, 0, 0, 0, '{}', 8),
(82, 10, 'areaempleado_hasone_persona_relationship', 'relationship', 'Persona asociada', 0, 1, 1, 1, 1, 1, '{\"description\":\"Por favor seleccione la persona que sea empleado.\",\"display\":{\"width\":\"6\",\"id\":\"Persona\"},\"model\":\"App\\\\Persona\",\"table\":\"personas\",\"type\":\"belongsTo\",\"column\":\"id_persona\",\"key\":\"id\",\"label\":\"apellido\",\"pivot_table\":\"areaempleados\",\"pivot\":\"0\",\"taggable\":\"0\"}', 9),
(83, 11, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(84, 11, 'nombre', 'text', 'Nombre', 1, 1, 1, 1, 1, 1, '{\"description\":\"En este campo se debe escribir el nombre del area que se esta creando o editando.\",\"validation\":{\"rule\":\"required|max:50\"},\"placeholder\":\"Por favor ingrese el nombre del tipo de tramite\",\"messages\":{\"required\":\"Este :attribute campo es necesario.\",\"max\":\"Este campo :attribute tiene un maximo de :max caracteres.\"},\"display\":{\"width\":\"6\",\"id\":\"nombre\"}}', 2),
(85, 11, 'descripcion', 'text', 'Descripcion', 0, 1, 1, 1, 1, 1, '{\"description\":\"En este campo se debe escribir la descripci\\u00f3n del tramite que se esta creando o editando.\",\"validation\":{\"rule\":\"required|max:50\"},\"placeholder\":\"Por favor ingrese la descripci\\u00f3n del area\",\"messages\":{\"required\":\"Este :attribute campo es necesario.\",\"max\":\"Este campo :attribute tiene un maximo de :max caracteres.\"},\"display\":{\"width\":\"6\",\"id\":\"descripcion\"}}', 3),
(86, 11, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 4),
(87, 11, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 5),
(88, 11, 'deleted_at', 'timestamp', 'Deleted At', 0, 0, 0, 0, 0, 0, '{}', 6),
(89, 11, 'created_by', 'hidden', 'Created By', 0, 0, 0, 0, 0, 0, '{\"value\":1}', 7),
(90, 10, 'areaempleado_belongsto_area_relationship', 'relationship', 'Departamento', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Area\",\"table\":\"areas\",\"type\":\"belongsTo\",\"column\":\"id_area\",\"key\":\"id\",\"label\":\"nombre\",\"pivot_table\":\"areaempleados\",\"pivot\":\"0\",\"taggable\":\"0\"}', 10),
(104, 13, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(105, 13, 'fecha_entrada', 'timestamp', 'Fecha Entrada', 1, 1, 1, 1, 1, 1, '{\"description\":\"En este campo se debe seleccionar la fecha en la que se da inicio al expdiente.\",\"validation\":{\"rule\":\"required\"},\"placeholder\":\"Por favor eliga la fecha\",\"messages\":{\"required\":\"Este :attribute campo es necesario.\"},\"display\":{\"width\":\"6\",\"id\":\"entrada\"}}', 2),
(106, 13, 'fecha_salida', 'timestamp', 'Fecha Salida', 0, 1, 1, 1, 1, 1, '{\"description\":\"En este campo se debe seleccionar la fecha en la que se da salida al expdiente.\",\"placeholder\":\"Por favor eliga la fecha\",\"messages\":{\"required\":\"Este :attribute campo es necesario.\"},\"display\":{\"width\":\"6\",\"id\":\"salida\"}}', 3),
(107, 13, 'bandera_observacion', 'checkbox', 'Tiene Observacion?', 0, 1, 1, 1, 1, 1, '{\"description\":\"Debe seleccionar si el movimiento tiene alguna observacion o no.\",\"on\":\"Tiene Obser\",\"off\":\"No tiene obser\",\"checked\":false,\"display\":{\"width\":\"4\"}}', 4),
(108, 13, 'observacion', 'text', 'Observacion', 0, 1, 1, 1, 1, 1, '{\"description\":\"En este campo se debe escribir cual es la observacion que se le esta haciendo al movimiento que se esta creando.\",\"validation\":{\"rule\":\"required\"},\"placeholder\":\"Por favor ingrese la observacion\",\"messages\":{\"required\":\"Este :attribute campo es necesario.\"},\"display\":{\"width\":\"8\",\"id\":\"observacion\"}}', 5),
(109, 13, 'subsanacion', 'text_area', 'Subsanacion', 0, 1, 1, 1, 1, 1, '{\"description\":\"En este campo se debe escribir cual es la subsanacion que se le esta haciendo al movimiento que se esta creando.\",\"placeholder\":\"Por favor ingrese la subsanacion\",\"messages\":{\"required\":\"Este :attribute campo es necesario.\"},\"display\":{\"width\":\"8\",\"id\":\"subsanacion\"}}', 6),
(110, 13, 'id_area', 'text', 'Id Area', 1, 1, 1, 1, 1, 1, '{}', 7),
(111, 13, 'id_expediente', 'text', 'Id Expediente', 1, 1, 1, 1, 1, 1, '{}', 8),
(112, 13, 'tramite_finalizado', 'checkbox', 'Finalizó?', 0, 1, 1, 1, 1, 1, '{\"description\":\"En este campo se debe seleccionar si el expediente finaliza o no con este movimieto.\",\"on\":\"Si, ahora finaliza\",\"off\":\"No, debe continuar\",\"checked\":false}', 9),
(113, 13, 'created_by', 'hidden', 'Created By', 0, 0, 0, 0, 0, 0, '{\"value\":1}', 10),
(114, 13, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, '{}', 11),
(115, 13, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 12),
(116, 13, 'deleted_at', 'timestamp', 'Deleted At', 0, 0, 0, 0, 0, 0, '{}', 13),
(117, 13, 'movimiento_belongsto_area_relationship', 'relationship', 'areas', 0, 1, 1, 1, 1, 1, '{\"description\":\"En este campo se debe seleccionar a que area le pertenece este movimiento que se esta creando.\",\"placeholder\":\"Por favor seleccione el area\",\"messages\":{\"required\":\"Este :attribute campo es necesario.\"},\"display\":{\"width\":\"6\",\"id\":\"area\"},\"model\":\"App\\\\Area\",\"table\":\"areas\",\"type\":\"belongsTo\",\"column\":\"id_area\",\"key\":\"id\",\"label\":\"nombre\",\"pivot_table\":\"areaempleados\",\"pivot\":\"0\",\"taggable\":\"0\"}', 14),
(118, 14, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(119, 14, 'name', 'text', 'Nombre y Apellido', 0, 1, 1, 1, 1, 1, '{\"description\":\"En este campo se debe escribir el nombre de la persona que es quiere contactar.\",\"validation\":{\"rule\":\"required|max:100\"},\"placeholder\":\"Por favor eliga escriba su nombre\",\"messages\":{\"required\":\"Este :attribute campo es necesario.\"},\"display\":{\"width\":\"6\",\"id\":\"name\"}}', 2),
(120, 14, 'email', 'text', 'Email', 0, 1, 1, 1, 1, 1, '{\"description\":\"En este campo se debe escribir el email de la persona que espera la respuesta al contacto que se esta haciendo.\",\"validation\":{\"rule\":\"required|max:100\"},\"placeholder\":\"Por favor eliga escriba su email\",\"messages\":{\"required\":\"Este :attribute campo es necesario.\"},\"display\":{\"width\":\"6\",\"id\":\"email\"}}', 3),
(121, 14, 'message', 'text', 'Mensaje', 0, 1, 1, 1, 1, 1, '{\"description\":\"En este campo se debe escribir el email de la persona que espera la respuesta al contacto que se esta haciendo.\",\"validation\":{\"rule\":\"required\"},\"placeholder\":\"Por favor escriba su mensaje aqui\",\"messages\":{\"required\":\"Este :attribute campo es necesario.\"},\"display\":{\"width\":\"10\",\"id\":\"message\"}}', 4),
(122, 14, 'estado', 'select_dropdown', 'Estado', 0, 1, 1, 1, 1, 1, '{\"default\":\"0\",\"options\":{\"0\":\"Sin Leer\",\"1\":\"Leido, pero sin responder\",\"2\":\"Leido, y respondido\",\"3\":\"En espera de tercero\",\"4\":\"Archivado\"},\"display\":{\"width\":\"2\",\"id\":\"estado\"}}', 5),
(123, 14, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, '{}', 6),
(124, 14, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 7),
(125, 14, 'deleted_at', 'timestamp', 'Deleted At', 0, 0, 0, 0, 0, 0, '{}', 8),
(126, 15, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(127, 15, 'numero_expediente', 'text', 'Numero Expediente', 1, 1, 1, 1, 1, 1, '{\"description\":\"En este campo se debe escribir el numero de expdiente que se esta creando.\",\"validation\":{\"rule\":\"required\"},\"placeholder\":\"Por favor escriba el numero de expdiente\",\"messages\":{\"required\":\"Este :attribute campo es necesario.\"},\"display\":{\"width\":\"4\",\"id\":\"numeroexp\"}}', 2),
(128, 15, 'path_papeles', 'media_picker', 'Path Papeles', 0, 0, 0, 0, 0, 0, '{\"max\":10,\"min\":0,\"expanded\":true,\"show_folders\":true,\"show_toolbar\":true,\"allow_upload\":true,\"allow_move\":false,\"allow_delete\":false,\"allow_create_folder\":false,\"allow_rename\":false,\"allow_crop\":true,\"allowed\":[],\"hide_thumbnails\":false,\"quality\":90,\"watermark\":{\"source\":\"...\",\"position\":\"top-left\",\"x\":0,\"y\":0}}', 3),
(129, 15, 'id_tramite', 'text', 'Id Tramite', 0, 1, 1, 1, 1, 1, '{}', 4),
(130, 15, 'id_persona', 'text', 'Id Persona', 0, 1, 1, 1, 1, 1, '{}', 5),
(131, 15, 'created_by', 'text', 'Created By', 0, 0, 0, 0, 0, 0, '{}', 6),
(132, 15, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, '{}', 7),
(133, 15, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 8),
(134, 15, 'deleted_at', 'timestamp', 'Deleted At', 0, 0, 0, 0, 0, 0, '{}', 9),
(135, 15, 'expediente_belongsto_persona_relationship', 'relationship', 'Profesional de la Agrimensura', 0, 1, 1, 1, 1, 1, '{\"description\":\"En este campo se debe seleccionar a que persona le pertenece este expdiente que se esta creando.\",\"placeholder\":\"Por favor seleccione la persona\",\"messages\":{\"required\":\"Este :attribute campo es necesario.\"},\"display\":{\"width\":\"4\",\"id\":\"persona\"},\"model\":\"TCG\\\\Voyager\\\\Models\\\\User\",\"table\":\"users\",\"type\":\"belongsTo\",\"column\":\"id_persona\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"areaempleados\",\"pivot\":\"0\",\"taggable\":\"0\"}', 10),
(136, 15, 'expediente_belongsto_tramite_relationship', 'relationship', 'Tipo de Tramite', 0, 1, 1, 1, 1, 1, '{\"description\":\"En este campo se debe seleccionar el tramite al que se asocia este expdiente que se esta creando.\",\"placeholder\":\"Por favor seleccione el tramite\",\"messages\":{\"required\":\"Este :attribute campo es necesario.\"},\"display\":{\"width\":\"4\",\"id\":\"tramite\"},\"model\":\"App\\\\Tramite\",\"table\":\"tramites\",\"type\":\"belongsTo\",\"column\":\"id_tramite\",\"key\":\"id\",\"label\":\"nombre\",\"pivot_table\":\"areaempleados\",\"pivot\":\"0\",\"taggable\":\"0\"}', 11),
(137, 15, 'file1', 'file', 'File1', 0, 0, 1, 1, 1, 1, '{\"description\":\"En este campo se debe cargar el archivo que se haga referencia al tipo de tramite que se este haciendo.\",\"placeholder\":\"Por favor cargue el archivo\",\"id\":\"file1\",\"display\":{\"width\":\"4\",\"id\":\"divfile1\"}}', 12),
(138, 15, 'file2', 'file', 'File2', 0, 0, 1, 1, 1, 1, '{\"description\":\"En este campo se debe cargar el archivo que se haga referencia al tipo de tramite que se este haciendo.\",\"placeholder\":\"Por favor cargue el archivo\",\"id\":\"file2\",\"display\":{\"width\":\"4\",\"id\":\"divfile2\"}}', 13),
(139, 15, 'file3', 'file', 'File3', 0, 0, 1, 1, 1, 1, '{\"description\":\"En este campo se debe cargar el archivo que se haga referencia al tipo de tramite que se este haciendo.\",\"placeholder\":\"Por favor cargue el archivo\",\"display\":{\"width\":\"4\",\"id\":\"divfile3\"}}', 14),
(140, 15, 'file4', 'file', 'File4', 0, 0, 1, 1, 1, 1, '{\"description\":\"En este campo se debe cargar el archivo que se haga referencia al tipo de tramite que se este haciendo.\",\"placeholder\":\"Por favor cargue el archivo\",\"display\":{\"width\":\"4\",\"id\":\"divfile4\"}}', 15),
(141, 15, 'file5', 'file', 'File5', 0, 0, 1, 1, 1, 1, '{\"description\":\"En este campo se debe cargar el archivo que se haga referencia al tipo de tramite que se este haciendo.\",\"placeholder\":\"Por favor cargue el archivo\",\"display\":{\"width\":\"4\",\"id\":\"divfile5\"}}', 16),
(142, 15, 'file6', 'file', 'File6', 0, 0, 1, 1, 1, 1, '{\"description\":\"En este campo se debe cargar el archivo que se haga referencia al tipo de tramite que se este haciendo.\",\"placeholder\":\"Por favor cargue el archivo\",\"display\":{\"width\":\"4\",\"id\":\"divfile6\"}}', 17),
(143, 15, 'file7', 'file', 'File7', 0, 0, 1, 1, 1, 1, '{\"description\":\"En este campo se debe cargar el archivo que se haga referencia al tipo de tramite que se este haciendo.\",\"placeholder\":\"Por favor cargue el archivo\",\"display\":{\"width\":\"4\",\"id\":\"divfile7\"}}', 18),
(144, 15, 'file8', 'file', 'File8', 0, 0, 1, 1, 1, 1, '{\"description\":\"En este campo se debe cargar el archivo que se haga referencia al tipo de tramite que se este haciendo.\",\"placeholder\":\"Por favor cargue el archivo\",\"display\":{\"width\":\"4\",\"id\":\"divfile8\"}}', 19),
(145, 15, 'file9', 'file', 'File9', 0, 0, 1, 1, 1, 1, '{\"description\":\"En este campo se debe cargar el archivo que se haga referencia al tipo de tramite que se este haciendo.\",\"placeholder\":\"Por favor cargue el archivo\",\"display\":{\"width\":\"4\",\"id\":\"divfile9\"}}', 20),
(146, 15, 'file10', 'file', 'File10', 0, 0, 1, 1, 1, 1, '{\"description\":\"En este campo se debe cargar el archivo que se haga referencia al tipo de tramite que se este haciendo.\",\"placeholder\":\"Por favor cargue el archivo\",\"display\":{\"width\":\"4\",\"id\":\"divfile10\"}}', 21),
(147, 15, 'file11', 'file', 'File11', 0, 0, 1, 1, 1, 1, '{\"description\":\"En este campo se debe cargar el archivo que se haga referencia al tipo de tramite que se este haciendo.\",\"placeholder\":\"Por favor cargue el archivo\",\"display\":{\"width\":\"4\",\"id\":\"divfile11\"}}', 22),
(148, 15, 'file12', 'file', 'File12', 0, 0, 1, 1, 1, 1, '{\"description\":\"En este campo se debe cargar el archivo que se haga referencia al tipo de tramite que se este haciendo.\",\"placeholder\":\"Por favor cargue el archivo\",\"display\":{\"width\":\"4\",\"id\":\"divfile12\"}}', 23),
(149, 15, 'file13', 'file', 'File13', 0, 0, 1, 1, 1, 1, '{\"description\":\"En este campo se debe cargar el archivo que se haga referencia al tipo de tramite que se este haciendo.\",\"placeholder\":\"Por favor cargue el archivo\",\"display\":{\"width\":\"4\",\"id\":\"divfile13\"}}', 24),
(150, 15, 'file14', 'file', 'File14', 0, 0, 1, 1, 1, 1, '{\"description\":\"En este campo se debe cargar el archivo que se haga referencia al tipo de tramite que se este haciendo.\",\"placeholder\":\"Por favor cargue el archivo\",\"display\":{\"width\":\"4\",\"id\":\"divfile14\"}}', 25),
(151, 15, 'file15', 'file', 'File15', 0, 0, 1, 1, 1, 1, '{\"description\":\"En este campo se debe cargar el archivo que se haga referencia al tipo de tramite que se este haciendo.\",\"placeholder\":\"Por favor cargue el archivo\",\"display\":{\"width\":\"4\",\"id\":\"divfile15\"}}', 26),
(152, 15, 'file16', 'file', 'File16', 0, 0, 1, 1, 1, 1, '{\"description\":\"En este campo se debe cargar el archivo que se haga referencia al tipo de tramite que se este haciendo.\",\"placeholder\":\"Por favor cargue el archivo\",\"display\":{\"width\":\"4\",\"id\":\"divfile16\"}}', 27),
(153, 15, 'file17', 'multiple_images', 'File17', 0, 0, 1, 1, 1, 1, '{\"description\":\"En este campo se debe cargar el archivo que se haga referencia al tipo de tramite que se este haciendo.\",\"placeholder\":\"Por favor cargue el archivo\",\"display\":{\"width\":\"4\",\"id\":\"divfile17\"}}', 28),
(154, 7, 'file1', 'text', 'File1', 0, 1, 1, 1, 1, 1, '{}', 4),
(155, 7, 'file2', 'text', 'File2', 0, 1, 1, 1, 1, 1, '{}', 5),
(156, 7, 'file3', 'text', 'File3', 0, 1, 1, 1, 1, 1, '{}', 6),
(157, 7, 'file4', 'text', 'File4', 0, 1, 1, 1, 1, 1, '{}', 7),
(158, 7, 'file5', 'text', 'File5', 0, 1, 1, 1, 1, 1, '{}', 8),
(159, 7, 'file6', 'text', 'File6', 0, 1, 1, 1, 1, 1, '{}', 9),
(160, 7, 'file7', 'text', 'File7', 0, 1, 1, 1, 1, 1, '{}', 10),
(161, 7, 'file8', 'text', 'File8', 0, 1, 1, 1, 1, 1, '{}', 11),
(162, 7, 'file9', 'text', 'File9', 0, 1, 1, 1, 1, 1, '{}', 12),
(163, 7, 'file10', 'text', 'File10', 0, 1, 1, 1, 1, 1, '{}', 13),
(164, 7, 'file11', 'text', 'File11', 0, 1, 1, 1, 1, 1, '{}', 14),
(165, 7, 'file12', 'text', 'File12', 0, 1, 1, 1, 1, 1, '{}', 15),
(166, 7, 'file13', 'text', 'File13', 0, 1, 1, 1, 1, 1, '{}', 16),
(167, 7, 'file14', 'text', 'File14', 0, 1, 1, 1, 1, 1, '{}', 17),
(168, 7, 'file15', 'text', 'File15', 0, 1, 1, 1, 1, 1, '{}', 18),
(169, 7, 'file16', 'text', 'File16', 0, 1, 1, 1, 1, 1, '{}', 19),
(170, 7, 'file17', 'text', 'File17', 0, 1, 1, 1, 1, 1, '{}', 20),
(171, 1, 'user_belongsto_area_relationship', 'relationship', 'areas', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Area\",\"table\":\"areas\",\"type\":\"belongsTo\",\"column\":\"id_area\",\"key\":\"id\",\"label\":\"nombre\",\"pivot_table\":\"areaempleados\",\"pivot\":\"0\",\"taggable\":\"0\"}', 13),
(172, 1, 'email_verified_at', 'timestamp', 'Email Verified At', 0, 1, 1, 1, 1, 1, '{}', 6),
(173, 1, 'domicilio', 'text', 'Domicilio', 1, 1, 1, 1, 1, 1, '{}', 12),
(174, 1, 'cuil', 'number', 'Cuil', 0, 1, 1, 1, 1, 1, '{}', 13),
(176, 1, 'created_by', 'text', 'Created By', 0, 0, 0, 0, 0, 0, '{\"value\":0}', 15),
(177, 1, 'id_area', 'text', 'Id Area', 0, 1, 1, 1, 1, 1, '{}', 16),
(178, 1, 'oficina', 'text', 'Oficina', 0, 1, 1, 1, 1, 1, '{}', 17),
(179, 1, 'empleado_dgr', 'checkbox', 'Empleado Dgr', 0, 1, 1, 1, 1, 1, '{}', 14),
(180, 16, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(181, 16, 'nombretabla', 'text', 'Nombretabla', 1, 1, 1, 1, 1, 1, '{}', 2),
(182, 16, 'accion', 'text', 'Accion', 0, 1, 1, 1, 1, 1, '{}', 3),
(183, 16, 'valores_nuevos', 'text', 'Valores Nuevos', 0, 1, 1, 1, 1, 1, '{}', 4),
(184, 16, 'valores_viejos', 'text', 'Valores Viejos', 0, 1, 1, 1, 1, 1, '{}', 5),
(185, 16, 'id_modificado', 'text', 'Id Modificado', 0, 1, 1, 1, 1, 1, '{}', 6),
(186, 16, 'estado', 'text', 'Estado', 0, 1, 1, 1, 1, 1, '{}', 7),
(187, 16, 'created_by', 'text', 'Created By', 0, 1, 1, 1, 1, 1, '{}', 8),
(188, 16, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, '{}', 9),
(189, 16, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 10),
(190, 16, 'deleted_at', 'timestamp', 'Deleted At', 0, 0, 0, 0, 0, 0, '{}', 11),
(191, 15, 'finalizo', 'checkbox', 'Finalizo', 0, 1, 1, 0, 0, 0, '{}', 27),
(192, 13, 'orden', 'text', 'Orden', 0, 1, 1, 1, 1, 1, '{}', 2),
(193, 13, 'comentario', 'text', 'Comentario', 1, 1, 1, 1, 1, 1, '{}', 5),
(194, 13, 'confirmado', 'text', 'Confirmado', 0, 1, 1, 1, 1, 1, '{}', 12),
(195, 13, 'fecha_confirmacion', 'text', 'Fecha Confirmacion', 0, 1, 1, 1, 1, 1, '{}', 13),
(196, 13, 'quien_confirmacion', 'text', 'Quien Confirmacion', 0, 1, 1, 1, 1, 1, '{}', 14),
(197, 13, 'comentario_confirmacion', 'text', 'Comentario Confirmacion', 0, 1, 1, 1, 1, 1, '{}', 15);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `data_types`
--

CREATE TABLE `data_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_singular` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_plural` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `policy_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `controller` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `generate_permissions` tinyint(1) NOT NULL DEFAULT 0,
  `server_side` tinyint(4) NOT NULL DEFAULT 0,
  `details` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `data_types`
--

INSERT INTO `data_types` (`id`, `name`, `slug`, `display_name_singular`, `display_name_plural`, `icon`, `model_name`, `policy_name`, `controller`, `description`, `generate_permissions`, `server_side`, `details`, `created_at`, `updated_at`) VALUES
(1, 'users', 'users', 'User', 'Users', 'voyager-person', 'TCG\\Voyager\\Models\\User', 'TCG\\Voyager\\Policies\\UserPolicy', 'TCG\\Voyager\\Http\\Controllers\\VoyagerUserController', NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"desc\",\"default_search_key\":null,\"scope\":null}', '2021-01-12 00:02:21', '2021-01-28 22:51:18'),
(2, 'menus', 'menus', 'Menu', 'Menus', 'voyager-list', 'TCG\\Voyager\\Models\\Menu', NULL, '', '', 1, 0, NULL, '2021-01-12 00:02:21', '2021-01-12 00:02:21'),
(3, 'roles', 'roles', 'Role', 'Roles', 'voyager-lock', 'TCG\\Voyager\\Models\\Role', NULL, 'TCG\\Voyager\\Http\\Controllers\\VoyagerRoleController', '', 1, 0, NULL, '2021-01-12 00:02:21', '2021-01-12 00:02:21'),
(4, 'categories', 'categories', 'Category', 'Categories', 'voyager-categories', 'TCG\\Voyager\\Models\\Category', NULL, '', '', 1, 0, NULL, '2021-01-12 00:02:25', '2021-01-12 00:02:25'),
(5, 'posts', 'posts', 'Post', 'Posts', 'voyager-news', 'TCG\\Voyager\\Models\\Post', 'TCG\\Voyager\\Policies\\PostPolicy', '', '', 1, 0, NULL, '2021-01-12 00:02:26', '2021-01-12 00:02:26'),
(6, 'pages', 'pages', 'Page', 'Pages', 'voyager-file-text', 'TCG\\Voyager\\Models\\Page', NULL, '', '', 1, 0, NULL, '2021-01-12 00:02:27', '2021-01-12 00:02:27'),
(7, 'tramites', 'tramites', 'Tramite', 'Tramites', 'voyager-archive', 'App\\Tramite', NULL, NULL, 'este es el menu por defecto para hacer el abm de tipos de tramites', 1, 1, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2021-01-12 00:40:15', '2021-01-26 20:02:45'),
(8, 'personas', 'personas', 'Persona', 'Personas', 'voyager-person', 'App\\Persona', NULL, NULL, NULL, 1, 1, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2021-01-12 01:20:55', '2021-01-12 16:18:34'),
(10, 'areaempleados', 'areaempleados', 'Areaempleado', 'Areaempleados', 'voyager-people', 'App\\Areaempleado', NULL, NULL, 'En este bread se administran los empleados de las distintas areas', 1, 1, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2021-01-12 16:06:50', '2021-01-26 20:00:47'),
(11, 'areas', 'areas', 'Area', 'Areas', 'voyager-company', 'App\\Area', NULL, NULL, NULL, 1, 1, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2021-01-12 16:44:26', '2021-01-12 16:46:48'),
(13, 'movimientos', 'movimientos', 'Movimiento', 'Movimientos', 'voyager-list', 'App\\Movimiento', NULL, NULL, 'Em este bread se administran los movimientos de todos los expedientes', 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2021-01-12 17:05:24', '2021-02-16 22:02:09'),
(14, 'contacts', 'contacts', 'Contact', 'Contacts', 'voyager-mail', 'App\\Contact', NULL, NULL, 'este bread es para administrar los emails que mandan los visitantes de la pagina', 1, 1, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2021-01-14 16:43:12', '2021-01-14 19:59:58'),
(15, 'expedientes', 'expedientes', 'Expediente', 'Expedientes', 'voyager-archive', 'App\\Expediente', NULL, NULL, 'en este bread se administran los expdientes', 1, 1, '{\"order_column\":null,\"order_display_column\":\"numero_expediente\",\"order_direction\":\"desc\",\"default_search_key\":null,\"scope\":null}', '2021-01-15 15:25:05', '2021-02-13 19:26:49'),
(16, 'logs', 'logs', 'Log', 'Logs', 'voyager-logbook', 'App\\Log', NULL, NULL, 'Con este bread se espera poder gestionar los logs del sistema', 1, 1, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2021-02-12 00:03:21', '2021-02-12 00:11:32');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `expedientes`
--

CREATE TABLE `expedientes` (
  `id` int(10) UNSIGNED NOT NULL,
  `numero_expediente` int(11) NOT NULL,
  `path_papeles` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_tramite` int(11) DEFAULT NULL,
  `id_persona` int(11) DEFAULT NULL,
  `file1` text CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `file2` text CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `file3` text CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `file4` text CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `file5` text CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `file6` text CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `file7` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `file8` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `file9` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `file10` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `file11` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `file12` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `file13` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `file14` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `file15` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `file16` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `file17` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `created_by` int(11) DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `finalizo` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `expedientes`
--

INSERT INTO `expedientes` (`id`, `numero_expediente`, `path_papeles`, `id_tramite`, `id_persona`, `file1`, `file2`, `file3`, `file4`, `file5`, `file6`, `file7`, `file8`, `file9`, `file10`, `file11`, `file12`, `file13`, `file14`, `file15`, `file16`, `file17`, `created_by`, `created_at`, `updated_at`, `deleted_at`, `finalizo`) VALUES
(1, 20210115, 'algun/path', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2021-01-15 16:03:11', '2021-01-15 16:03:11', NULL, 0),
(2, 1242, '/path/alguno', 2, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2021-01-16 01:00:48', '2021-01-16 01:00:48', NULL, 0),
(3, 1233, 'path/prueba', 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2021-01-16 18:39:07', '2021-01-16 18:39:07', NULL, 0),
(4, 23123, 'adasdasd', 2, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2021-01-18 21:10:10', '2021-01-18 21:10:10', NULL, 0),
(5, 88888822, NULL, 2, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2021-01-22 19:00:40', '2021-01-22 19:37:42', '2021-01-22 19:37:42', 0),
(6, 123123123, 'sdadsadas', 2, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2021-01-22 19:01:38', '2021-01-22 19:02:11', '2021-01-22 19:02:11', 0),
(7, 888888222, NULL, 1, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2021-01-22 19:06:22', '2021-01-22 19:12:10', '2021-01-22 19:12:10', 0),
(8, 3123, 'sdadsadas', 2, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2021-01-22 19:11:59', '2021-01-22 19:12:05', '2021-01-22 19:12:05', 0),
(9, 312333322, 'sddasdsa', 2, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2021-01-22 19:26:55', '2021-01-22 19:32:26', '2021-01-22 19:32:26', 0),
(10, 312322441, 'sddasdsa', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2021-01-22 19:29:16', '2021-01-22 19:32:19', '2021-01-22 19:32:19', 0),
(11, 222444, 'sddasdsa', 2, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2021-01-22 19:32:51', '2021-01-22 19:37:38', '2021-01-22 19:37:38', 0),
(12, 22244433, 'sddasdsa', 2, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2021-01-22 19:33:57', '2021-01-22 19:37:35', '2021-01-22 19:37:35', 0),
(13, 2224311, 'sddasdsa', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2021-01-22 19:36:46', '2021-01-22 19:37:31', '2021-01-22 19:37:31', 0),
(14, 1818, 'files_expedientes/exp14', 2, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2021-01-22 19:38:00', '2021-01-23 04:18:13', '2021-01-23 04:18:13', 0),
(15, 777, 'files_expedientes/exp15', 2, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2021-01-23 04:18:30', '2021-01-23 04:18:30', NULL, 0),
(16, 777, 'files_expedientes/exp16', 2, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2021-01-23 04:18:56', '2021-01-23 04:18:56', NULL, 0),
(17, 789, 'files_expedientes/exp17', 2, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2021-01-23 04:19:18', '2021-01-23 04:19:18', NULL, 0),
(18, 888, 'files_expedientes/exp18', 2, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2021-01-23 04:20:02', '2021-01-23 04:20:02', NULL, 0),
(19, 889, 'files_expedientes/exp19', 2, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2021-01-23 04:22:39', '2021-01-23 04:22:39', NULL, 0),
(20, 890, 'files_expedientes/exp20', 2, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2021-01-23 04:25:08', '2021-01-23 04:25:08', NULL, 0),
(21, 891, 'files_expedientes/exp21', 2, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2021-01-23 04:26:47', '2021-01-23 04:26:47', NULL, 0),
(22, 892, 'files_expedientes/exp22', 2, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2021-01-23 04:28:23', '2021-01-23 04:28:23', NULL, 0),
(23, 893, 'files_expedientes/exp23', 2, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2021-01-23 04:29:14', '2021-01-23 04:29:14', NULL, 0),
(24, 31233, 'files_expedientes/exp24', 2, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2021-01-23 16:16:16', '2021-01-23 16:16:16', NULL, 0),
(25, 9898, 'files_expedientes/exp25', 2, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2021-01-23 19:20:03', '2021-01-23 19:20:03', NULL, 0),
(26, 75575, 'files_expedientes/exp26', 4, 3, '[{\"download_link\":\"expedientes\\\\January2021\\\\HSgI9oR1crOaTyCUUAxY.jpg\",\"original_name\":\"2020_11_18 12_57 Office Lens (1).jpg\"}]', '[{\"download_link\":\"expedientes\\\\January2021\\\\eXpbJ0m2BMoYkbcPEDba.jpg\",\"original_name\":\"2020_11_18 12_57 Office Lens (2).jpg\"}]', '[{\"download_link\":\"expedientes\\\\January2021\\\\D7qYGR7sb1ZG6EyjWGan.jpg\",\"original_name\":\"2020_11_18 12_57 Office Lens (3).jpg\"}]', '[{\"download_link\":\"expedientes\\\\January2021\\\\xzYvcOaVoQfPachrUH6P.jpg\",\"original_name\":\"2020_11_18 12_57 Office Lens (5).jpg\"}]', '[{\"download_link\":\"expedientes\\\\January2021\\\\uMJJIeX4FcqI3PvSuyFL.jpg\",\"original_name\":\"2020_11_11 17_38 Office Lens.jpg\"}]', '[{\"download_link\":\"expedientes\\\\January2021\\\\LzKtUgZrLTIhREPT1C6G.jpg\",\"original_name\":\"2020_11_13 17_23 Office Lens.jpg\"}]', '[]', '[]', '[]', '[]', '[]', '[]', '[]', '[]', '[]', '[]', NULL, 1, '2021-01-26 18:00:55', '2021-01-26 18:00:55', NULL, 0),
(27, 4321, NULL, 5, 13, '[{\"download_link\":\"expedientes\\\\February2021\\\\zKABOqREz3hzC7nibd1S.jpg\",\"original_name\":\"847o.jpg\"},{\"download_link\":\"expedientes\\\\February2021\\\\5fgmErr7HtgI7DMdMXIA.jpg\",\"original_name\":\"agri2.jpg\"},{\"download_link\":\"expedientes\\\\February2021\\\\rYgTFf4bBkwlXAaQooZ7.jpg\",\"original_name\":\"agrimensor.jpg\"}]', '[{\"download_link\":\"expedientes\\\\February2021\\\\JRZXCYyfyClxxK53Kl6D.png\",\"original_name\":\"descarga.png\"},{\"download_link\":\"expedientes\\\\February2021\\\\5EQ7G21UZilOkkqDaBZX.jpg\",\"original_name\":\"unnamed.jpg\"},{\"download_link\":\"expedientes\\\\February2021\\\\24E0TTBBKCntfB9qF37J.bmp\",\"original_name\":\"xbox-x-theme-1.bmp\"},{\"download_link\":\"expedientes\\\\February2021\\\\tadD1uiq06FwrU0VhDuS.jpg\",\"original_name\":\"xbox-x-theme-1.jpg\"}]', '[{\"download_link\":\"expedientes\\\\February2021\\\\UHVli6Q8mRZTTpbCPkr6.jpg\",\"original_name\":\"asado1.jpg\"},{\"download_link\":\"expedientes\\\\February2021\\\\LJ852igCyNvI1w9dIRrd.jpg\",\"original_name\":\"asado2.jpg\"},{\"download_link\":\"expedientes\\\\February2021\\\\ukf784N5vZ2hEdPhVBSw.jpg\",\"original_name\":\"asado3.jpg\"},{\"download_link\":\"expedientes\\\\February2021\\\\xi9urtAgsn2ONoj01D56.jpg\",\"original_name\":\"asado4.jpg\"},{\"download_link\":\"expedientes\\\\February2021\\\\PjWe35OMeOlhDzGcdlcU.jpg\",\"original_name\":\"asado5.jpg\"}]', '[{\"download_link\":\"expedientes\\\\February2021\\\\9iTI2EYgoZBAMZA20SJ2.jpg\",\"original_name\":\"asadologo.jpg\"},{\"download_link\":\"expedientes\\\\February2021\\\\o9dSsFrfhQgXu8Wv3nek.jpeg\",\"original_name\":\"empanada3.jpeg\"},{\"download_link\":\"expedientes\\\\February2021\\\\CKsC0P7aWBB2AzclbgG7.jpg\",\"original_name\":\"empanda4.jpg\"},{\"download_link\":\"expedientes\\\\February2021\\\\hiryABbECPPz2Ni5Btfw.jpg\",\"original_name\":\"empanda5.jpg\"}]', '[{\"download_link\":\"expedientes\\\\February2021\\\\w3n1Hv7MAX9ZF0cInOb2.jpg\",\"original_name\":\"empanda8.jpg\"},{\"download_link\":\"expedientes\\\\February2021\\\\CqidI6I7DbMKtS7cv0hj.jpg\",\"original_name\":\"empanda9.jpg\"},{\"download_link\":\"expedientes\\\\February2021\\\\B5Z0ABeiAdnqaXQZTuWj.jpg\",\"original_name\":\"empanda10.jpg\"},{\"download_link\":\"expedientes\\\\February2021\\\\n83DFx63JbiK2KSNOmwj.png\",\"original_name\":\"empandachica.png\"}]', '[]', '[]', '[]', '[]', '[]', '[]', '[]', '[]', '[]', '[]', '[]', NULL, 1, '2021-02-06 03:41:09', '2021-02-07 03:06:57', '2021-02-07 03:06:57', 0),
(28, 4321, 'files_expedientes/exp28', NULL, NULL, '[{\"download_link\":\"expedientes\\\\February2021\\\\IZGhDEAdfM8H2o6TNaut.jpg\",\"original_name\":\"847o.jpg\"},{\"download_link\":\"expedientes\\\\February2021\\\\Q7Goadsr17aodl1YnTpN.jpg\",\"original_name\":\"agri2.jpg\"},{\"download_link\":\"expedientes\\\\February2021\\\\zwxTRqwvItSUlGGG83f6.jpg\",\"original_name\":\"agrimensor.jpg\"}]', '[{\"download_link\":\"expedientes\\\\February2021\\\\TGkLZvFqlibNkiEjlq3C.jpg\",\"original_name\":\"empanda10.jpg\"}]', '[{\"download_link\":\"expedientes\\\\February2021\\\\tGL2ExCucqzBQmSlsCCC.jpg\",\"original_name\":\"asado2.jpg\"},{\"download_link\":\"expedientes\\\\February2021\\\\zV7bW8Zt3gMMSXid8HGj.jpg\",\"original_name\":\"asado3.jpg\"}]', '[{\"download_link\":\"expedientes\\\\February2021\\\\3HzHNynkc6NNZfHiSXPM.jpg\",\"original_name\":\"empanda8.jpg\"},{\"download_link\":\"expedientes\\\\February2021\\\\kTqOAAgOXQaxlCLOdazX.jpg\",\"original_name\":\"empanda9.jpg\"},{\"download_link\":\"expedientes\\\\February2021\\\\mfHaI30SKFUSZWGUf972.jpg\",\"original_name\":\"empanda10.jpg\"}]', '[{\"download_link\":\"expedientes\\\\February2021\\\\M3tGZoNOdxqSOf6GBizR.jpg\",\"original_name\":\"lomo2.jpg\"},{\"download_link\":\"expedientes\\\\February2021\\\\4hFUMwrTLkeER2TP5Ezm.jpg\",\"original_name\":\"lomo3.jpg\"},{\"download_link\":\"expedientes\\\\February2021\\\\WpYgBeT0wlCQXFhLW9GG.jpg\",\"original_name\":\"lomo4.jpg\"},{\"download_link\":\"expedientes\\\\February2021\\\\9bjV9GykoUTwvFI5rplt.jpg\",\"original_name\":\"lomo5.jpg\"}]', '[]', '[]', '[]', '[]', '[]', '[]', '[]', '[]', '[]', '[]', '[]', NULL, 1, '2021-02-06 03:54:44', '2021-02-07 03:06:25', '2021-02-07 03:06:25', 0),
(29, 4321, 'files_expedientes/exp29', 4, 13, '[{\"download_link\":\"expedientes\\\\February2021\\\\zc08FtvoSp5MOKP3C4iy.jpg\",\"original_name\":\"asado1.jpg\"},{\"download_link\":\"expedientes\\\\February2021\\\\sAfmtyGqe3K2gghojss5.jpg\",\"original_name\":\"asado2.jpg\"}]', '[{\"download_link\":\"expedientes\\\\February2021\\\\nbXv0w8SgrL7dcL2RtfY.jpg\",\"original_name\":\"asado3.jpg\"},{\"download_link\":\"expedientes\\\\February2021\\\\c3OIw9FUZAc0LRUwqBqU.jpg\",\"original_name\":\"asado4.jpg\"}]', '[{\"download_link\":\"expedientes\\\\February2021\\\\TPKNhwF1maS4jJ2B7iVg.jpg\",\"original_name\":\"asado5.jpg\"},{\"download_link\":\"expedientes\\\\February2021\\\\iPzNLUYhg68hjfpAOkyp.jpg\",\"original_name\":\"asado6.jpg\"}]', '[{\"download_link\":\"expedientes\\\\February2021\\\\K0edsyCXuCvih33Taasi.jpg\",\"original_name\":\"asado8.jpg\"},{\"download_link\":\"expedientes\\\\February2021\\\\T0qOUub2HJIjnPZV40Ac.jpg\",\"original_name\":\"asadologo.jpg\"},{\"download_link\":\"expedientes\\\\February2021\\\\Oe5lQjwUsVXl7F3A5Ntu.jpeg\",\"original_name\":\"empanada3.jpeg\"}]', '[{\"download_link\":\"expedientes\\\\February2021\\\\RCSnz85kWXfkWjfRj1yk.jpg\",\"original_name\":\"empanda4.jpg\"},{\"download_link\":\"expedientes\\\\February2021\\\\1meRixqURgIRYYZJ4mDV.jpg\",\"original_name\":\"empanda5.jpg\"},{\"download_link\":\"expedientes\\\\February2021\\\\6K73zEqeD9CZo0Yr6gRj.jpg\",\"original_name\":\"empanda7.jpg\"}]', '[]', '[]', '[]', '[]', '[]', '[]', '[]', '[]', '[]', '[]', '[]', NULL, 1, '2021-02-06 03:55:15', '2021-02-07 03:06:41', '2021-02-07 03:06:41', 0),
(30, 4321, 'files_expedientes/exp30', 2, 12, '[{\"download_link\":\"expedientes\\\\February2021\\\\g3gHfIQcHVTVqDc5mzho.jpg\",\"original_name\":\"asado1.jpg\"},{\"download_link\":\"expedientes\\\\February2021\\\\mGVu1hdjCYEMz9OvK6Zy.jpg\",\"original_name\":\"asado2.jpg\"}]', '[{\"download_link\":\"expedientes\\\\February2021\\\\YdfdMjRDd11rEDW9LsNy.jpg\",\"original_name\":\"asado3.jpg\"},{\"download_link\":\"expedientes\\\\February2021\\\\gUAA5HJkjjP9fZyl8GAu.jpg\",\"original_name\":\"asado4.jpg\"},{\"download_link\":\"expedientes\\\\February2021\\\\OcGaDDXYqYNghoqULDpy.jpg\",\"original_name\":\"asado5.jpg\"}]', '[{\"download_link\":\"expedientes\\\\February2021\\\\OhgmgooolkLIbSSzXiZl.jpg\",\"original_name\":\"asado6.jpg\"},{\"download_link\":\"expedientes\\\\February2021\\\\ny8GkPBfKCmk06rWzz3P.jpg\",\"original_name\":\"asado7.jpg\"}]', '[{\"download_link\":\"expedientes\\\\February2021\\\\C4rHFPjBZ4cIPp0Vrst4.jpg\",\"original_name\":\"asado8.jpg\"},{\"download_link\":\"expedientes\\\\February2021\\\\FI7hrCoLAu6jMjvGHkCZ.jpg\",\"original_name\":\"asadologo.jpg\"},{\"download_link\":\"expedientes\\\\February2021\\\\OXg2wvczR4dGDTWoFiLC.jpeg\",\"original_name\":\"empanada3.jpeg\"}]', '[]', '[]', '[]', '[]', '[]', '[]', '[]', '[]', '[]', '[]', '[]', '[]', NULL, 1, '2021-02-06 03:56:25', '2021-02-06 03:56:25', NULL, 0),
(31, 312377, 'files_expedientes/exp31', 4, 14, '[{\"download_link\":\"expedientes\\\\February2021\\\\nnjUbjvx66iO26SkfIPe.jpg\",\"original_name\":\"asado1.jpg\"},{\"download_link\":\"expedientes\\\\February2021\\\\yIkzN1XMGZIJF2a5TB7v.jpg\",\"original_name\":\"asado2.jpg\"}]', '[{\"download_link\":\"expedientes\\\\February2021\\\\xaC9EudPgm3Jcs5at6nO.pdf\",\"original_name\":\"Fac Enero 2021 PNUD 20343289457_011_00003_00000004.pdf\"},{\"download_link\":\"expedientes\\\\February2021\\\\2KWNeVKtpqUKouupvOTd.pdf\",\"original_name\":\"FC-Dar\\u00edo-Noviembre.pdf\"}]', '[{\"download_link\":\"expedientes\\\\February2021\\\\8bfRG1SsIpRSqFP7ifyk.pdf\",\"original_name\":\"Pago Enero 2021 Ing Brutos ComprobantePagPagooRealizado.pdf\"},{\"download_link\":\"expedientes\\\\February2021\\\\d5KqqGZiIB7xe1mYrmot.pdf\",\"original_name\":\"20343289457_011_00003_00000004.pdf\"},{\"download_link\":\"expedientes\\\\February2021\\\\4lSKm1QBevQqwOYsxH6Q.pdf\",\"original_name\":\"Contrato CHECCARELLI.pdf\"}]', '[]', '[]', '[]', '[]', '[]', '[]', '[]', '[]', '[]', '[]', '[]', '[]', '[]', NULL, 1, '2021-02-09 00:24:58', '2021-02-09 00:30:32', '2021-02-09 00:30:32', 0),
(32, 3123779, 'files_expedientes/exp32', 5, 12, '[{\"download_link\":\"expedientes\\\\February2021\\\\Fb9HSJgeQIV9RU6Tpn9X.png\",\"original_name\":\"banner_vcsp_calc_1600x800.png\"},{\"download_link\":\"expedientes\\\\February2021\\\\3kA6VzUNPVOzzczIdmyx.jpg\",\"original_name\":\"OIP (veeam 3).jpg\"}]', '[{\"download_link\":\"expedientes\\\\February2021\\\\stJ82ajSYjK2rPFDU4cZ.pdf\",\"original_name\":\"Pago Enero 2021 Ing Brutos ComprobantePagPagooRealizado.pdf\"},{\"download_link\":\"expedientes\\\\February2021\\\\dVfQlbYzRoVYtppUWn5q.pdf\",\"original_name\":\"20343289457_011_00003_00000004.pdf\"},{\"download_link\":\"expedientes\\\\February2021\\\\E0zPIfamL23DZcrSrQbD.pdf\",\"original_name\":\"Fac Enero 2021 PNUD 20343289457_011_00003_00000004.pdf\"}]', '[{\"download_link\":\"expedientes\\\\February2021\\\\ljum3w1AuG1pKJT84tbn.pdf\",\"original_name\":\"FC-Dar\\u00edo-Noviembre.pdf\"},{\"download_link\":\"expedientes\\\\February2021\\\\QBN0Gidd9NFKEDz9u4M1.pdf\",\"original_name\":\"Contrato CHECCARELLI.pdf\"}]', '[]', '[]', '[]', '[]', '[]', '[]', '[]', '[]', '[]', '[]', '[]', '[]', '[]', NULL, 1, '2021-02-09 00:27:36', '2021-02-09 00:30:26', '2021-02-09 00:30:26', 0),
(33, 3123779, 'files_expedientes/exp33', 5, 12, '[{\"download_link\":\"expedientes\\\\February2021\\\\xA0F5R5JePKMH2L4yuvl.png\",\"original_name\":\"banner_vcsp_calc_1600x800.png\"},{\"download_link\":\"expedientes\\\\February2021\\\\yBgXKfHkJN1BRR8kHZ3Q.jpg\",\"original_name\":\"OIP (veeam 3).jpg\"}]', '[{\"download_link\":\"expedientes\\\\February2021\\\\hrSSNWNu1lRJFx4teZMw.pdf\",\"original_name\":\"Pago Enero 2021 Ing Brutos ComprobantePagPagooRealizado.pdf\"},{\"download_link\":\"expedientes\\\\February2021\\\\ovhwhGhMVIhW2WB7XDal.pdf\",\"original_name\":\"20343289457_011_00003_00000004.pdf\"},{\"download_link\":\"expedientes\\\\February2021\\\\tULvBEuki4nqPGTiuz8V.pdf\",\"original_name\":\"Fac Enero 2021 PNUD 20343289457_011_00003_00000004.pdf\"}]', '[{\"download_link\":\"expedientes\\\\February2021\\\\5By7W4iL3KbCfIBKltUi.pdf\",\"original_name\":\"FC-Dar\\u00edo-Noviembre.pdf\"},{\"download_link\":\"expedientes\\\\February2021\\\\NVfwvK7s9CnqhWlmjt8Z.pdf\",\"original_name\":\"Contrato CHECCARELLI.pdf\"}]', '[]', '[]', '[]', '[]', '[]', '[]', '[]', '[]', '[]', '[]', '[]', '[]', '[]', NULL, 1, '2021-02-09 00:28:29', '2021-02-09 00:30:22', '2021-02-09 00:30:22', 0),
(34, 4557, 'files_expedientes/exp34', 1, 14, '[{\"download_link\":\"expedientes\\\\February2021\\\\kUyXHWfxp17897OjNwXU.png\",\"original_name\":\"banner_vcsp_calc_1600x800.png\"},{\"download_link\":\"expedientes\\\\February2021\\\\AKjJDkc6nXykOthGfMZU.jpg\",\"original_name\":\"OIP (veeam 3).jpg\"}]', '[{\"download_link\":\"expedientes\\\\February2021\\\\oDzgeq2NVKucwYE3CL9X.pdf\",\"original_name\":\"Pago Enero 2021 Ing Brutos ComprobantePagPagooRealizado.pdf\"},{\"download_link\":\"expedientes\\\\February2021\\\\kYNMhgHxT9T9oZiA877f.pdf\",\"original_name\":\"20343289457_011_00003_00000004.pdf\"},{\"download_link\":\"expedientes\\\\February2021\\\\aE4e0mynZlBBkyYJml6F.pdf\",\"original_name\":\"Fac Enero 2021 PNUD 20343289457_011_00003_00000004.pdf\"}]', '[{\"download_link\":\"expedientes\\\\February2021\\\\cly9Ukd5VhLqE5d4ucEX.pdf\",\"original_name\":\"FC-Dar\\u00edo-Noviembre.pdf\"},{\"download_link\":\"expedientes\\\\February2021\\\\3FV78FhZiEXeeDNNHEY2.pdf\",\"original_name\":\"Contrato CHECCARELLI.pdf\"}]', '[]', '[]', '[]', '[]', '[]', '[]', '[]', '[]', '[]', '[]', '[]', '[]', '[]', NULL, 1, '2021-02-09 00:31:23', '2021-02-09 00:31:24', NULL, 0),
(35, 12, 'files_expedientes/exp35', 3, 12, '[{\"download_link\":\"expedientes\\\\February2021\\\\uW4etkeZ7TjjiGBInb54.png\",\"original_name\":\"avatar01.png\"}]', '[{\"download_link\":\"expedientes\\\\February2021\\\\7R8UA2LdGpxIvQpDebCR.jpeg\",\"original_name\":\"avatar1.jpeg\"},{\"download_link\":\"expedientes\\\\February2021\\\\tQp8XmGmIA7FkrhnPZk7.png\",\"original_name\":\"avatar02.png\"}]', '[{\"download_link\":\"expedientes\\\\February2021\\\\F7OdhhHK2u5G1Lvn0m6K.pdf\",\"original_name\":\"evaluacion LPS.pdf\"}]', '[]', '[]', '[]', '[]', '[]', '[]', '[]', '[]', '[]', '[]', '[]', '[]', '[]', NULL, 1, '2021-02-11 16:46:00', '2021-02-16 19:50:36', NULL, 0),
(36, 1478, 'files_expedientes/exp36', 2, 13, '[{\"download_link\":\"expedientes\\\\February2021\\\\yhqn8ZzEsiF3waUs5w9l.pdf\",\"original_name\":\"Clase 1 - Seminario de Tesis.pdf\"}]', '[{\"download_link\":\"expedientes\\\\February2021\\\\LZdxbUJiLcTGkFcLLOc5.pdf\",\"original_name\":\"Clase 2 Seminario de Tesis.pdf\"},{\"download_link\":\"expedientes\\\\February2021\\\\C7J1eEtpGq5q5nUROytC.pdf\",\"original_name\":\"clase 4.pdf\"},{\"download_link\":\"expedientes\\\\February2021\\\\W0n2oMgnolEDpKwAlN5s.pdf\",\"original_name\":\"clase 5.pdf\"}]', '[{\"download_link\":\"expedientes\\\\February2021\\\\RTI3XtBF1o9CfhamQifu.pdf\",\"original_name\":\"Esquema.pdf\"}]', '[{\"download_link\":\"expedientes\\\\February2021\\\\GLqXypqNX1EUpZBjanNd.png\",\"original_name\":\"Screenshot at 2019-06-12 12-27-38.png\"}]', '[{\"download_link\":\"expedientes\\\\February2021\\\\c3C7PjOiO1sh2tCaygpd.pdf\",\"original_name\":\"Aval Institucional 1ra Jornada de Tecnolog\\u00eda de Inform\\u00e1tica y Comunicaci\\u00f3n Resol. 683-2020 (1).pdf\"}]', '[]', '[]', '[]', '[]', '[]', '[]', '[]', '[]', '[]', '[]', '[]', NULL, 1, '2021-02-13 01:55:07', '2021-02-13 18:50:01', NULL, 1),
(37, 1479, 'files_expedientes/exp37', 1, 12, '[{\"download_link\":\"expedientes\\\\February2021\\\\GNzOpLpSaibXjdKekoP4.pdf\",\"original_name\":\"Ontology_Development_using_Enterprise_Architect_and_ODM.pdf\"}]', '[{\"download_link\":\"expedientes\\\\February2021\\\\9l4IywwCFZlrm0koIaWg.pdf\",\"original_name\":\"Aval Institucional 1ra Jornada de Tecnolog\\u00eda de Inform\\u00e1tica y Comunicaci\\u00f3n Resol. 683-2020 (1).pdf\"}]', '[]', '[]', '[]', '[]', '[]', '[]', '[]', '[]', '[]', '[]', '[]', '[]', '[]', '[]', NULL, 1, '2021-02-13 19:25:55', '2021-02-15 22:39:15', NULL, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `logs`
--

CREATE TABLE `logs` (
  `id` int(10) UNSIGNED NOT NULL,
  `nombretabla` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `accion` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `valores_nuevos` text CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `valores_viejos` text CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `id_modificado` int(11) DEFAULT NULL,
  `estado` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `logs`
--

INSERT INTO `logs` (`id`, `nombretabla`, `accion`, `valores_nuevos`, `valores_viejos`, `id_modificado`, `estado`, `created_by`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'user', 'add', 'asdasd', 'asdasd', 1, 'en proceso', 1, '2021-02-12 00:11:48', '2021-02-12 00:11:48', NULL),
(2, 'user', 'add', 'asdasd', 'asdasd', 1, 'en proceso', 1, '2021-02-12 00:14:11', '2021-02-12 00:14:11', NULL),
(3, 'Movimiento', 'add', '\r\n        {\r\n            \'orden\': 2,\r\n            \'fecha_entrada\': \'2021-02-12 23:52:43\',\r\n            \'fecha_salida\': \'\',\r\n            \'comentario\': \'transfiero por orden de tramite\',\r\n            \'bandera_observacion\': ,\r\n            \'observacion\': \'\',\r\n            \'subsanacion\': \'\',\r\n            \'id_area\': 7,\r\n            \'id_expediente\': 36,\r\n            \'tramite_finalizado\': ,\r\n            \'confirmado\': 0,\r\n            \'fecha_confirmacion\': \'\',\r\n            \'quien_confirmacion\': ,\r\n            \'comentario_confirmacion\': \'\',\r\n            \'created_by\': 17,\r\n        }', NULL, 60, 'sin ver', 17, '2021-02-13 02:52:43', '2021-02-13 02:52:43', NULL),
(4, 'Movimiento', 'add', '\r\n        {\r\n            \'orden\': 3,\r\n            \'fecha_entrada\': \'2021-02-13 00:26:44\',\r\n            \'fecha_salida\': \'\',\r\n            \'comentario\': \'para ser analizado por personal\',\r\n            \'bandera_observacion\': ,\r\n            \'observacion\': \'\',\r\n            \'subsanacion\': \'\',\r\n            \'id_area\': 8,\r\n            \'id_expediente\': 36,\r\n            \'tramite_finalizado\': ,\r\n            \'confirmado\': 0,\r\n            \'fecha_confirmacion\': \'\',\r\n            \'quien_confirmacion\': ,\r\n            \'comentario_confirmacion\': \'\',\r\n            \'created_by\': 9,\r\n        }', NULL, 61, 'sin ver', 9, '2021-02-13 03:26:44', '2021-02-13 03:26:44', NULL),
(5, 'Movimiento', 'add', '\r\n        {\r\n            \'orden\': 4,\r\n            \'fecha_entrada\': \'2021-02-13 00:39:52\',\r\n            \'fecha_salida\': \'\',\r\n            \'comentario\': \'para que lo vean los auditores\',\r\n            \'bandera_observacion\': ,\r\n            \'observacion\': \'\',\r\n            \'subsanacion\': \'\',\r\n            \'id_area\': 4,\r\n            \'id_expediente\': 36,\r\n            \'tramite_finalizado\': ,\r\n            \'confirmado\': 0,\r\n            \'fecha_confirmacion\': \'\',\r\n            \'quien_confirmacion\': ,\r\n            \'comentario_confirmacion\': \'\',\r\n            \'created_by\': 10,\r\n        }', NULL, 62, 'sin ver', 10, '2021-02-13 03:39:52', '2021-02-13 03:39:52', NULL),
(6, 'Movimiento', 'delete', NULL, '\r\n        {\r\n            \'orden\': 4,\r\n            \'fecha_entrada\': \'2021-02-13 00:39:52\',\r\n            \'fecha_salida\': \'\',\r\n            \'comentario\': \'para que lo vean los auditores\',\r\n            \'bandera_observacion\': 0,\r\n            \'observacion\': \'\',\r\n            \'subsanacion\': \'\',\r\n            \'id_area\': 4,\r\n            \'id_expediente\': 36,\r\n            \'tramite_finalizado\': 0,\r\n            \'confirmado\': 0,\r\n            \'fecha_confirmacion\': \'\',\r\n            \'quien_confirmacion\': ,\r\n            \'comentario_confirmacion\': \'\',\r\n            \'created_by\': 10,\r\n        }', 62, 'sin ver', 13, '2021-02-13 03:42:32', '2021-02-13 03:42:32', NULL),
(7, 'Movimiento', 'add', '\r\n        {\r\n            \'orden\': 4,\r\n            \'fecha_entrada\': \'2021-02-13 00:50:03\',\r\n            \'fecha_salida\': \'\',\r\n            \'comentario\': \'se lo paso a secretaria para ser analizado\',\r\n            \'bandera_observacion\': ,\r\n            \'observacion\': \'\',\r\n            \'subsanacion\': \'\',\r\n            \'id_area\': 5,\r\n            \'id_expediente\': 36,\r\n            \'tramite_finalizado\': ,\r\n            \'confirmado\': 0,\r\n            \'fecha_confirmacion\': \'\',\r\n            \'quien_confirmacion\': ,\r\n            \'comentario_confirmacion\': \'\',\r\n            \'created_by\': 10,\r\n        }', NULL, 63, 'sin ver', 10, '2021-02-13 03:50:03', '2021-02-13 03:50:03', NULL),
(8, 'Movimiento', 'add', '\r\n        {\r\n            \'orden\': 5,\r\n            \'fecha_entrada\': \'2021-02-13 00:58:45\',\r\n            \'fecha_salida\': \'\',\r\n            \'comentario\': \'para guardar\',\r\n            \'bandera_observacion\': ,\r\n            \'observacion\': \'\',\r\n            \'subsanacion\': \'\',\r\n            \'id_area\': 9,\r\n            \'id_expediente\': 36,\r\n            \'tramite_finalizado\': ,\r\n            \'confirmado\': 0,\r\n            \'fecha_confirmacion\': \'\',\r\n            \'quien_confirmacion\': ,\r\n            \'comentario_confirmacion\': \'\',\r\n            \'created_by\': 6,\r\n        }', NULL, 64, 'sin ver', 6, '2021-02-13 03:58:45', '2021-02-13 03:58:45', NULL),
(9, 'Expedientes', 'edit', '\n            {\n                \'id\': \'36\',\n                \'numero_expediente\': \'1478\',\n                \'path_papeles\': ,\n                \'id_tramite\': 2,\n                \'id_persona\': \'13\',\n                \'file1\': ,\n                \'file2\': ,\n                \'file3\': ,\n                \'file4\': ,\n                \'file5\': ,\n                \'file6\': ,\n                \'file7\': ,\n                \'file8\': ,\n                \'file9\': ,\n                \'file10\': ,\n                \'file11\': ,\n                \'file12\': ,\n                \'file13\': ,\n                \'file14\': ,\n                \'file15\': ,\n                \'file16\': ,\n                \'file17\': ,\n                \'finalizo\': ,\n                \'created_by\': ,\n                \'comentario_de_log\': \'valores del expediente antes de ser marcado como finalizado\'\n            }', NULL, 36, 'sin ver', 20, '2021-02-13 18:39:48', '2021-02-13 18:39:48', NULL),
(10, 'Movimientos', 'edit', '\n            {\n                \'orden\': 5,\n                \'fecha_entrada\': \'2021-02-13 00:58:45\',\n                \'fecha_salida\': \'\',\n                \'comentario\': \'para guardar\',\n                \'bandera_observacion\': 0,\n                \'observacion\': \'\',\n                \'subsanacion\': \'\',\n                \'id_area\': 9,\n                \'id_expediente\': 36,\n                \'tramite_finalizado\': 0,\n                \'confirmado\': 1,\n                \'fecha_confirmacion\': \'2021-02-13 01:09:09\',\n                \'quien_confirmacion\': 20,\n                \'comentario_confirmacion\': \'\',\n                \'created_by\': 6,\n                \'comentario_de_log\': \'valores del ultimo movimiento del expediente antes de ser marcado como tramite_finalizado\'\n            }', NULL, 64, 'sin ver', 20, '2021-02-13 18:39:48', '2021-02-13 18:39:48', NULL),
(11, 'Expedientes', 'edit', '\n            {\n                \'id\': \'36\',\n                \'numero_expediente\': \'1478\',\n                \'path_papeles\': ,\n                \'id_tramite\': 2,\n                \'id_persona\': \'13\',\n                \'file1\': ,\n                \'file2\': ,\n                \'file3\': ,\n                \'file4\': ,\n                \'file5\': ,\n                \'file6\': ,\n                \'file7\': ,\n                \'file8\': ,\n                \'file9\': ,\n                \'file10\': ,\n                \'file11\': ,\n                \'file12\': ,\n                \'file13\': ,\n                \'file14\': ,\n                \'file15\': ,\n                \'file16\': ,\n                \'file17\': ,\n                \'finalizo\': ,\n                \'created_by\': ,\n                \'comentario_de_log\': \'valores del expediente antes de ser marcado como finalizado\'\n            }', NULL, 36, 'sin ver', 20, '2021-02-13 18:43:52', '2021-02-13 18:43:52', NULL),
(12, 'Movimientos', 'edit', '\n            {\n                \'orden\': 5,\n                \'fecha_entrada\': \'2021-02-13 00:58:45\',\n                \'fecha_salida\': \'\',\n                \'comentario\': \'para guardar\',\n                \'bandera_observacion\': 0,\n                \'observacion\': \'\',\n                \'subsanacion\': \'\',\n                \'id_area\': 9,\n                \'id_expediente\': 36,\n                \'tramite_finalizado\': 0,\n                \'confirmado\': 1,\n                \'fecha_confirmacion\': \'2021-02-13 01:09:09\',\n                \'quien_confirmacion\': 20,\n                \'comentario_confirmacion\': \'\',\n                \'created_by\': 6,\n                \'comentario_de_log\': \'valores del ultimo movimiento del expediente antes de ser marcado como tramite_finalizado\'\n            }', NULL, 64, 'sin ver', 20, '2021-02-13 18:43:52', '2021-02-13 18:43:52', NULL),
(13, 'Expedientes', 'edit', '\n            {\n                \'id\': \'36\',\n                \'numero_expediente\': \'1478\',\n                \'path_papeles\': ,\n                \'id_tramite\': 2,\n                \'id_persona\': \'13\',\n                \'file1\': ,\n                \'file2\': ,\n                \'file3\': ,\n                \'file4\': ,\n                \'file5\': ,\n                \'file6\': ,\n                \'file7\': ,\n                \'file8\': ,\n                \'file9\': ,\n                \'file10\': ,\n                \'file11\': ,\n                \'file12\': ,\n                \'file13\': ,\n                \'file14\': ,\n                \'file15\': ,\n                \'file16\': ,\n                \'file17\': ,\n                \'finalizo\': ,\n                \'created_by\': ,\n                \'comentario_de_log\': \'valores del expediente antes de ser marcado como finalizado\'\n            }', NULL, 36, 'sin ver', 20, '2021-02-13 18:46:16', '2021-02-13 18:46:16', NULL),
(14, 'Movimientos', 'edit', '\n            {\n                \'orden\': 5,\n                \'fecha_entrada\': \'2021-02-13 00:58:45\',\n                \'fecha_salida\': \'\',\n                \'comentario\': \'para guardar\',\n                \'bandera_observacion\': 0,\n                \'observacion\': \'\',\n                \'subsanacion\': \'\',\n                \'id_area\': 9,\n                \'id_expediente\': 36,\n                \'tramite_finalizado\': 0,\n                \'confirmado\': 1,\n                \'fecha_confirmacion\': \'2021-02-13 01:09:09\',\n                \'quien_confirmacion\': 20,\n                \'comentario_confirmacion\': \'\',\n                \'created_by\': 6,\n                \'comentario_de_log\': \'valores del ultimo movimiento del expediente antes de ser marcado como tramite_finalizado\'\n            }', NULL, 64, 'sin ver', 20, '2021-02-13 18:46:16', '2021-02-13 18:46:16', NULL),
(15, 'Expedientes', 'edit', '\n            {\n                \'id\': \'36\',\n                \'numero_expediente\': \'1478\',\n                \'path_papeles\': ,\n                \'id_tramite\': 2,\n                \'id_persona\': \'13\',\n                \'file1\': ,\n                \'file2\': ,\n                \'file3\': ,\n                \'file4\': ,\n                \'file5\': ,\n                \'file6\': ,\n                \'file7\': ,\n                \'file8\': ,\n                \'file9\': ,\n                \'file10\': ,\n                \'file11\': ,\n                \'file12\': ,\n                \'file13\': ,\n                \'file14\': ,\n                \'file15\': ,\n                \'file16\': ,\n                \'file17\': ,\n                \'finalizo\': ,\n                \'created_by\': ,\n                \'comentario_de_log\': \'valores del expediente antes de ser marcado como finalizado\'\n            }', NULL, 36, 'sin ver', 20, '2021-02-13 18:47:12', '2021-02-13 18:47:12', NULL),
(16, 'Movimientos', 'edit', '\n            {\n                \'orden\': 5,\n                \'fecha_entrada\': \'2021-02-13 00:58:45\',\n                \'fecha_salida\': \'\',\n                \'comentario\': \'para guardar\',\n                \'bandera_observacion\': 0,\n                \'observacion\': \'\',\n                \'subsanacion\': \'\',\n                \'id_area\': 9,\n                \'id_expediente\': 36,\n                \'tramite_finalizado\': 0,\n                \'confirmado\': 1,\n                \'fecha_confirmacion\': \'2021-02-13 01:09:09\',\n                \'quien_confirmacion\': 20,\n                \'comentario_confirmacion\': \'\',\n                \'created_by\': 6,\n                \'comentario_de_log\': \'valores del ultimo movimiento del expediente antes de ser marcado como tramite_finalizado\'\n            }', NULL, 64, 'sin ver', 20, '2021-02-13 18:47:12', '2021-02-13 18:47:12', NULL),
(17, 'Expedientes', 'edit', '\n            {\n                \'id\': \'36\',\n                \'numero_expediente\': \'1478\',\n                \'path_papeles\': ,\n                \'id_tramite\': 2,\n                \'id_persona\': \'13\',\n                \'file1\': ,\n                \'file2\': ,\n                \'file3\': ,\n                \'file4\': ,\n                \'file5\': ,\n                \'file6\': ,\n                \'file7\': ,\n                \'file8\': ,\n                \'file9\': ,\n                \'file10\': ,\n                \'file11\': ,\n                \'file12\': ,\n                \'file13\': ,\n                \'file14\': ,\n                \'file15\': ,\n                \'file16\': ,\n                \'file17\': ,\n                \'finalizo\': ,\n                \'created_by\': ,\n                \'comentario_de_log\': \'valores del expediente antes de ser marcado como finalizado\'\n            }', NULL, 36, 'sin ver', 20, '2021-02-13 18:48:55', '2021-02-13 18:48:55', NULL),
(18, 'Movimientos', 'edit', '\n            {\n                \'orden\': 5,\n                \'fecha_entrada\': \'2021-02-13 00:58:45\',\n                \'fecha_salida\': \'\',\n                \'comentario\': \'para guardar\',\n                \'bandera_observacion\': 0,\n                \'observacion\': \'\',\n                \'subsanacion\': \'\',\n                \'id_area\': 9,\n                \'id_expediente\': 36,\n                \'tramite_finalizado\': 0,\n                \'confirmado\': 1,\n                \'fecha_confirmacion\': \'2021-02-13 01:09:09\',\n                \'quien_confirmacion\': 20,\n                \'comentario_confirmacion\': \'\',\n                \'created_by\': 6,\n                \'comentario_de_log\': \'valores del ultimo movimiento del expediente antes de ser marcado como tramite_finalizado\'\n            }', NULL, 64, 'sin ver', 20, '2021-02-13 18:48:55', '2021-02-13 18:48:55', NULL),
(19, 'Expedientes', 'edit', '\n            {\n                \'id\': \'36\',\n                \'numero_expediente\': \'1478\',\n                \'path_papeles\': ,\n                \'id_tramite\': 2,\n                \'id_persona\': \'13\',\n                \'file1\': ,\n                \'file2\': ,\n                \'file3\': ,\n                \'file4\': ,\n                \'file5\': ,\n                \'file6\': ,\n                \'file7\': ,\n                \'file8\': ,\n                \'file9\': ,\n                \'file10\': ,\n                \'file11\': ,\n                \'file12\': ,\n                \'file13\': ,\n                \'file14\': ,\n                \'file15\': ,\n                \'file16\': ,\n                \'file17\': ,\n                \'finalizo\': ,\n                \'created_by\': ,\n                \'comentario_de_log\': \'valores del expediente antes de ser marcado como finalizado\'\n            }', NULL, 36, 'sin ver', 20, '2021-02-13 18:49:57', '2021-02-13 18:49:57', NULL),
(20, 'Movimientos', 'edit', '\n            {\n                \'orden\': 5,\n                \'fecha_entrada\': \'2021-02-13 00:58:45\',\n                \'fecha_salida\': \'\',\n                \'comentario\': \'para guardar\',\n                \'bandera_observacion\': 0,\n                \'observacion\': \'\',\n                \'subsanacion\': \'\',\n                \'id_area\': 9,\n                \'id_expediente\': 36,\n                \'tramite_finalizado\': 0,\n                \'confirmado\': 1,\n                \'fecha_confirmacion\': \'2021-02-13 01:09:09\',\n                \'quien_confirmacion\': 20,\n                \'comentario_confirmacion\': \'\',\n                \'created_by\': 6,\n                \'comentario_de_log\': \'valores del ultimo movimiento del expediente antes de ser marcado como tramite_finalizado\'\n            }', NULL, 64, 'sin ver', 20, '2021-02-13 18:49:57', '2021-02-13 18:49:57', NULL),
(21, 'Expedientes', 'edit', '\n            {\n                \'id\': \'36\',\n                \'numero_expediente\': \'1478\',\n                \'path_papeles\': ,\n                \'id_tramite\': 2,\n                \'id_persona\': \'13\',\n                \'file1\': ,\n                \'file2\': ,\n                \'file3\': ,\n                \'file4\': ,\n                \'file5\': ,\n                \'file6\': ,\n                \'file7\': ,\n                \'file8\': ,\n                \'file9\': ,\n                \'file10\': ,\n                \'file11\': ,\n                \'file12\': ,\n                \'file13\': ,\n                \'file14\': ,\n                \'file15\': ,\n                \'file16\': ,\n                \'file17\': ,\n                \'finalizo\': ,\n                \'created_by\': ,\n                \'comentario_de_log\': \'valores del expediente antes de ser marcado como finalizado\'\n            }', NULL, 36, 'sin ver', 20, '2021-02-13 18:50:01', '2021-02-13 18:50:01', NULL),
(22, 'Movimientos', 'edit', '\n            {\n                \'orden\': 5,\n                \'fecha_entrada\': \'2021-02-13 00:58:45\',\n                \'fecha_salida\': \'2021-02-13 15:49:57\',\n                \'comentario\': \'para guardar\',\n                \'bandera_observacion\': 0,\n                \'observacion\': \'\',\n                \'subsanacion\': \'\',\n                \'id_area\': 9,\n                \'id_expediente\': 36,\n                \'tramite_finalizado\': 1,\n                \'confirmado\': 1,\n                \'fecha_confirmacion\': \'2021-02-13 01:09:09\',\n                \'quien_confirmacion\': 20,\n                \'comentario_confirmacion\': \'\',\n                \'created_by\': 6,\n                \'comentario_de_log\': \'valores del ultimo movimiento del expediente antes de ser marcado como tramite_finalizado\'\n            }', NULL, 64, 'sin ver', 20, '2021-02-13 18:50:01', '2021-02-13 18:50:01', NULL),
(23, 'Movimiento', 'add', '\r\n        {\r\n            \'orden\': 2,\r\n            \'fecha_entrada\': \'2021-02-15 18:52:11\',\r\n            \'fecha_salida\': \'\',\r\n            \'comentario\': \'para que lo revisen\',\r\n            \'bandera_observacion\': ,\r\n            \'observacion\': \'esta poco claro el requisito\',\r\n            \'subsanacion\': \'\',\r\n            \'id_area\': 8,\r\n            \'id_expediente\': 37,\r\n            \'tramite_finalizado\': ,\r\n            \'confirmado\': 0,\r\n            \'fecha_confirmacion\': \'\',\r\n            \'quien_confirmacion\': ,\r\n            \'comentario_confirmacion\': \'\',\r\n            \'created_by\': 17,\r\n        }', NULL, 66, 'sin ver', 17, '2021-02-15 21:52:11', '2021-02-15 21:52:11', NULL),
(24, 'Movimiento', 'delete', NULL, '\r\n        {\r\n            \'orden\': 2,\r\n            \'fecha_entrada\': \'2021-02-15 18:52:11\',\r\n            \'fecha_salida\': \'\',\r\n            \'comentario\': \'para que lo revisen\',\r\n            \'bandera_observacion\': 0,\r\n            \'observacion\': \'esta poco claro el requisito\',\r\n            \'subsanacion\': \'\',\r\n            \'id_area\': 8,\r\n            \'id_expediente\': 37,\r\n            \'tramite_finalizado\': 0,\r\n            \'confirmado\': 0,\r\n            \'fecha_confirmacion\': \'\',\r\n            \'quien_confirmacion\': ,\r\n            \'comentario_confirmacion\': \'\',\r\n            \'created_by\': 17,\r\n        }', 66, 'sin ver', 11, '2021-02-15 21:52:53', '2021-02-15 21:52:53', NULL),
(25, 'Movimiento', 'add', '\r\n        {\r\n            \'orden\': 2,\r\n            \'fecha_entrada\': \'2021-02-15 18:55:46\',\r\n            \'fecha_salida\': \'\',\r\n            \'comentario\': \'para que  lo revisen las secretarias\',\r\n            \'bandera_observacion\': ,\r\n            \'observacion\': \'\',\r\n            \'subsanacion\': \'\',\r\n            \'id_area\': 5,\r\n            \'id_expediente\': 37,\r\n            \'tramite_finalizado\': ,\r\n            \'confirmado\': 0,\r\n            \'fecha_confirmacion\': \'\',\r\n            \'quien_confirmacion\': ,\r\n            \'comentario_confirmacion\': \'\',\r\n            \'created_by\': 17,\r\n        }', NULL, 67, 'sin ver', 17, '2021-02-15 21:55:46', '2021-02-15 21:55:46', NULL),
(26, 'Movimiento', 'add', '\r\n        {\r\n            \'orden\': 3,\r\n            \'fecha_entrada\': \'2021-02-15 19:25:23\',\r\n            \'fecha_salida\': \'\',\r\n            \'comentario\': \'para q lo vea la auditoria\',\r\n            \'bandera_observacion\': ,\r\n            \'observacion\': \'\',\r\n            \'subsanacion\': \'\',\r\n            \'id_area\': 4,\r\n            \'id_expediente\': 37,\r\n            \'tramite_finalizado\': ,\r\n            \'confirmado\': 0,\r\n            \'fecha_confirmacion\': \'\',\r\n            \'quien_confirmacion\': ,\r\n            \'comentario_confirmacion\': \'\',\r\n            \'created_by\': 5,\r\n        }', NULL, 68, 'sin ver', 5, '2021-02-15 22:25:23', '2021-02-15 22:25:23', NULL),
(27, 'Expedientes', 'edit', '\n            {\n                \'id\': \'37\',\n                \'numero_expediente\': \'1479\',\n                \'path_papeles\': ,\n                \'id_tramite\': 1,\n                \'id_persona\': \'12\',\n                \'file1\': ,\n                \'file2\': ,\n                \'file3\': ,\n                \'file4\': ,\n                \'file5\': ,\n                \'file6\': ,\n                \'file7\': ,\n                \'file8\': ,\n                \'file9\': ,\n                \'file10\': ,\n                \'file11\': ,\n                \'file12\': ,\n                \'file13\': ,\n                \'file14\': ,\n                \'file15\': ,\n                \'file16\': ,\n                \'file17\': ,\n                \'finalizo\': ,\n                \'created_by\': ,\n                \'comentario_de_log\': \'valores del expediente antes de ser marcado como finalizado\'\n            }', NULL, 37, 'sin ver', 4, '2021-02-15 22:39:15', '2021-02-15 22:39:15', NULL),
(28, 'Movimientos', 'edit', '\n            {\n                \'orden\': 3,\n                \'fecha_entrada\': \'2021-02-15 19:25:23\',\n                \'fecha_salida\': \'\',\n                \'comentario\': \'para q lo vea la auditoria\',\n                \'bandera_observacion\': 0,\n                \'observacion\': \'\',\n                \'subsanacion\': \'\',\n                \'id_area\': 4,\n                \'id_expediente\': 37,\n                \'tramite_finalizado\': 0,\n                \'confirmado\': 1,\n                \'fecha_confirmacion\': \'2021-02-15 19:32:52\',\n                \'quien_confirmacion\': 4,\n                \'comentario_confirmacion\': \'\',\n                \'created_by\': 5,\n                \'comentario_de_log\': \'valores del ultimo movimiento del expediente antes de ser marcado como tramite_finalizado\'\n            }', NULL, 68, 'sin ver', 4, '2021-02-15 22:39:15', '2021-02-15 22:39:15', NULL),
(29, 'Movimiento', 'add', '\r\n        {\r\n            \'orden\': 2,\r\n            \'fecha_entrada\': \'2021-02-16 01:42:49\',\r\n            \'fecha_salida\': \'\',\r\n            \'comentario\': \'paso a personal para que lo revisen\',\r\n            \'bandera_observacion\': ,\r\n            \'observacion\': \'\',\r\n            \'subsanacion\': \'\',\r\n            \'id_area\': 8,\r\n            \'id_expediente\': 23,\r\n            \'tramite_finalizado\': ,\r\n            \'confirmado\': 0,\r\n            \'fecha_confirmacion\': \'\',\r\n            \'quien_confirmacion\': ,\r\n            \'comentario_confirmacion\': \'\',\r\n            \'created_by\': 17,\r\n        }', NULL, 69, 'sin ver', 17, '2021-02-16 04:42:49', '2021-02-16 04:42:49', NULL),
(30, 'Users', 'add', '\r\n            {\r\n                \'id\': \'21\',\r\n                \'role_id\': \'4\',\r\n                \'name\': Dra Ana Laura Gomez,\r\n                \'email\': dcheccarelli@sanjuan.gov.ar,\r\n                \'avatar\': \'users\\February2021\\b7inZUKDgFNcc5ly5ZeV.png\',\r\n                \'confirmed\': ,\r\n                \'confirmation_code\': glehTwzdRP4VRDs2q24ni9vuR,\r\n                \'email_verified_at\': ,\r\n                \'settings\': {\"locale\":\"es\"},\r\n                \'created_at\': 2021-02-16 15:50:35,\r\n                \'updated_at\': 2021-02-16 15:50:35,\r\n                \'domicilio\': Calle libertadores 1423 oeste,\r\n                \'cuil\': 20523699875,\r\n                \'empleado_dgr\': 1,\r\n                \'created_by\': ,\r\n                \'id_area\': 2,\r\n                \'oficina\': Oficina de Revision,\r\n                \'comentario_log\': \'se creo un nuevo expediente desde mesa de entrada\'\r\n            }', NULL, 21, 'sin ver', 1, '2021-02-16 18:50:38', '2021-02-16 18:50:38', NULL),
(31, 'Movimiento', 'delete', NULL, '\r\n        {\r\n            \'orden\': 2,\r\n            \'fecha_entrada\': \'2021-02-11 13:46:29\',\r\n            \'fecha_salida\': \'\',\r\n            \'comentario\': \'para que lo vean los abogados\',\r\n            \'bandera_observacion\': 0,\r\n            \'observacion\': \'\',\r\n            \'subsanacion\': \'\',\r\n            \'id_area\': 2,\r\n            \'id_expediente\': 35,\r\n            \'tramite_finalizado\': 0,\r\n            \'confirmado\': 0,\r\n            \'fecha_confirmacion\': \'\',\r\n            \'quien_confirmacion\': ,\r\n            \'comentario_confirmacion\': \'\',\r\n            \'created_by\': 17,\r\n        }', 58, 'sin ver', 21, '2021-02-16 19:28:18', '2021-02-16 19:28:18', NULL),
(32, 'Movimiento', 'add', '\r\n        {\r\n            \'orden\': 2,\r\n            \'fecha_entrada\': \'2021-02-16 16:47:32\',\r\n            \'fecha_salida\': \'\',\r\n            \'comentario\': \'para ser analizado por los abogados\',\r\n            \'bandera_observacion\': ,\r\n            \'observacion\': \'\',\r\n            \'subsanacion\': \'\',\r\n            \'id_area\': 2,\r\n            \'id_expediente\': 35,\r\n            \'tramite_finalizado\': ,\r\n            \'confirmado\': 0,\r\n            \'fecha_confirmacion\': \'\',\r\n            \'quien_confirmacion\': ,\r\n            \'comentario_confirmacion\': \'\',\r\n            \'created_by\': 17,\r\n        }', NULL, 70, 'sin ver', 17, '2021-02-16 19:47:32', '2021-02-16 19:47:32', NULL),
(33, 'Movimiento', 'add', '\r\n        {\r\n            \'orden\': 3,\r\n            \'fecha_entrada\': \'2021-02-16 17:15:56\',\r\n            \'fecha_salida\': \'\',\r\n            \'comentario\': \'para mesa de entrada\',\r\n            \'bandera_observacion\': ,\r\n            \'observacion\': \'He revisado la documentación presentada y no posee la firma del profesional de la agrimensura\',\r\n            \'subsanacion\': \'\',\r\n            \'id_area\': 3,\r\n            \'id_expediente\': 35,\r\n            \'tramite_finalizado\': ,\r\n            \'confirmado\': 0,\r\n            \'fecha_confirmacion\': \'\',\r\n            \'quien_confirmacion\': ,\r\n            \'comentario_confirmacion\': \'\',\r\n            \'created_by\': 21,\r\n        }', NULL, 71, 'sin ver', 21, '2021-02-16 20:15:56', '2021-02-16 20:15:56', NULL),
(34, 'Movimientos', 'subsanar', NULL, '\r\n        {\r\n            \'orden\': 3,\r\n            \'fecha_entrada\': \'2021-02-16 17:15:56\',\r\n            \'fecha_salida\': \'\',\r\n            \'comentario\': \'para mesa de entrada\',\r\n            \'bandera_observacion\': 0,\r\n            \'observacion\': \'He revisado la documentación presentada y no posee la firma del profesional de la agrimensura\',\r\n            \'subsanacion\': \'\',\r\n            \'id_area\': 3,\r\n            \'id_expediente\': 35,\r\n            \'tramite_finalizado\': 0,\r\n            \'confirmado\': 0,\r\n            \'fecha_confirmacion\': \'\',\r\n            \'quien_confirmacion\': ,\r\n            \'comentario_confirmacion\': \'\',\r\n            \'created_by\': 21,\r\n        }', 71, 'sin ver', 17, '2021-02-16 22:33:47', '2021-02-16 22:33:47', NULL),
(35, 'Movimientos', 'subsanar', NULL, '\r\n        {\r\n            \'orden\': 3,\r\n            \'fecha_entrada\': \'2021-02-16 17:15:56\',\r\n            \'fecha_salida\': \'\',\r\n            \'comentario\': \'para mesa de entrada\',\r\n            \'bandera_observacion\': 0,\r\n            \'observacion\': \'He revisado la documentación presentada y no posee la firma del profesional de la agrimensura\',\r\n            \'subsanacion\': \'\',\r\n            \'id_area\': 3,\r\n            \'id_expediente\': 35,\r\n            \'tramite_finalizado\': 0,\r\n            \'confirmado\': 0,\r\n            \'fecha_confirmacion\': \'\',\r\n            \'quien_confirmacion\': ,\r\n            \'comentario_confirmacion\': \'\',\r\n            \'created_by\': 21,\r\n        }', 71, 'sin ver', 17, '2021-02-16 22:35:43', '2021-02-16 22:35:43', NULL),
(36, 'Movimientos', 'subsanar', NULL, '\r\n        {\r\n            \'orden\': 3,\r\n            \'fecha_entrada\': \'2021-02-16 17:15:56\',\r\n            \'fecha_salida\': \'\',\r\n            \'comentario\': \'para mesa de entrada\',\r\n            \'bandera_observacion\': 0,\r\n            \'observacion\': \'He revisado la documentación presentada y no posee la firma del profesional de la agrimensura\',\r\n            \'subsanacion\': \'\',\r\n            \'id_area\': 3,\r\n            \'id_expediente\': 35,\r\n            \'tramite_finalizado\': 0,\r\n            \'confirmado\': 0,\r\n            \'fecha_confirmacion\': \'\',\r\n            \'quien_confirmacion\': ,\r\n            \'comentario_confirmacion\': \'\',\r\n            \'created_by\': 21,\r\n        }', 71, 'sin ver', 17, '2021-02-16 22:36:19', '2021-02-16 22:36:19', NULL),
(37, 'Movimientos', 'subsanar', NULL, '\r\n        {\r\n            \'orden\': 3,\r\n            \'fecha_entrada\': \'2021-02-16 17:15:56\',\r\n            \'fecha_salida\': \'\',\r\n            \'comentario\': \'para mesa de entrada\',\r\n            \'bandera_observacion\': 0,\r\n            \'observacion\': \'He revisado la documentación presentada y no posee la firma del profesional de la agrimensura\',\r\n            \'subsanacion\': \'\',\r\n            \'id_area\': 3,\r\n            \'id_expediente\': 35,\r\n            \'tramite_finalizado\': 0,\r\n            \'confirmado\': 0,\r\n            \'fecha_confirmacion\': \'\',\r\n            \'quien_confirmacion\': ,\r\n            \'comentario_confirmacion\': \'\',\r\n            \'created_by\': 21,\r\n        }', 71, 'sin ver', 17, '2021-02-16 22:37:32', '2021-02-16 22:37:32', NULL),
(38, 'Movimientos', 'subsanar', NULL, '\r\n        {\r\n            \'orden\': 3,\r\n            \'fecha_entrada\': \'2021-02-16 17:15:56\',\r\n            \'fecha_salida\': \'\',\r\n            \'comentario\': \'para mesa de entrada\',\r\n            \'bandera_observacion\': 0,\r\n            \'observacion\': \'He revisado la documentación presentada y no posee la firma del profesional de la agrimensura\',\r\n            \'subsanacion\': \'\',\r\n            \'id_area\': 3,\r\n            \'id_expediente\': 35,\r\n            \'tramite_finalizado\': 0,\r\n            \'confirmado\': 0,\r\n            \'fecha_confirmacion\': \'\',\r\n            \'quien_confirmacion\': ,\r\n            \'comentario_confirmacion\': \'\',\r\n            \'created_by\': 21,\r\n        }', 71, 'sin ver', 17, '2021-02-16 22:40:16', '2021-02-16 22:40:16', NULL),
(39, 'Movimientos', 'subsanar', NULL, '\r\n        {\r\n            \'orden\': 3,\r\n            \'fecha_entrada\': \'2021-02-16 17:15:56\',\r\n            \'fecha_salida\': \'\',\r\n            \'comentario\': \'para mesa de entrada\',\r\n            \'bandera_observacion\': 0,\r\n            \'observacion\': \'He revisado la documentación presentada y no posee la firma del profesional de la agrimensura\',\r\n            \'subsanacion\': \'\',\r\n            \'id_area\': 3,\r\n            \'id_expediente\': 35,\r\n            \'tramite_finalizado\': 0,\r\n            \'confirmado\': 0,\r\n            \'fecha_confirmacion\': \'\',\r\n            \'quien_confirmacion\': ,\r\n            \'comentario_confirmacion\': \'\',\r\n            \'created_by\': 21,\r\n        }', 71, 'sin ver', 17, '2021-02-16 22:54:08', '2021-02-16 22:54:08', NULL),
(40, 'Movimiento', 'add', '\r\n        {\r\n            \'orden\': 4,\r\n            \'fecha_entrada\': \'2021-02-16 21:39:44\',\r\n            \'fecha_salida\': \'\',\r\n            \'comentario\': \'para revision\',\r\n            \'bandera_observacion\': ,\r\n            \'observacion\': \'\',\r\n            \'subsanacion\': \'\',\r\n            \'id_area\': 4,\r\n            \'id_expediente\': 35,\r\n            \'tramite_finalizado\': ,\r\n            \'confirmado\': 0,\r\n            \'fecha_confirmacion\': \'\',\r\n            \'quien_confirmacion\': ,\r\n            \'comentario_confirmacion\': \'\',\r\n            \'created_by\': 17,\r\n        }', NULL, 72, 'sin ver', 17, '2021-02-17 00:39:44', '2021-02-17 00:39:44', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `menus`
--

CREATE TABLE `menus` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `menus`
--

INSERT INTO `menus` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'admin', '2021-01-12 00:02:22', '2021-01-12 00:02:22');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `menu_items`
--

CREATE TABLE `menu_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `menu_id` int(10) UNSIGNED DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `target` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '_self',
  `icon_class` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `order` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `route` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parameters` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `menu_items`
--

INSERT INTO `menu_items` (`id`, `menu_id`, `title`, `url`, `target`, `icon_class`, `color`, `parent_id`, `order`, `created_at`, `updated_at`, `route`, `parameters`) VALUES
(1, 1, 'Dashboard', '', '_self', 'voyager-boat', NULL, NULL, 1, '2021-01-12 00:02:22', '2021-01-12 00:02:22', 'voyager.dashboard', NULL),
(2, 1, 'Media', '', '_self', 'voyager-images', NULL, NULL, 5, '2021-01-12 00:02:22', '2021-01-12 00:02:22', 'voyager.media.index', NULL),
(3, 1, 'Users', '', '_self', 'voyager-person', NULL, NULL, 3, '2021-01-12 00:02:22', '2021-01-12 00:02:22', 'voyager.users.index', NULL),
(4, 1, 'Roles', '', '_self', 'voyager-lock', NULL, NULL, 2, '2021-01-12 00:02:22', '2021-01-12 00:02:22', 'voyager.roles.index', NULL),
(5, 1, 'Tools', '', '_self', 'voyager-tools', NULL, NULL, 9, '2021-01-12 00:02:22', '2021-01-12 00:02:22', NULL, NULL),
(6, 1, 'Menu Builder', '', '_self', 'voyager-list', NULL, 5, 10, '2021-01-12 00:02:22', '2021-01-12 00:02:22', 'voyager.menus.index', NULL),
(7, 1, 'Database', '', '_self', 'voyager-data', NULL, 5, 11, '2021-01-12 00:02:22', '2021-01-12 00:02:22', 'voyager.database.index', NULL),
(8, 1, 'Compass', '', '_self', 'voyager-compass', NULL, 5, 12, '2021-01-12 00:02:22', '2021-01-12 00:02:22', 'voyager.compass.index', NULL),
(9, 1, 'BREAD', '', '_self', 'voyager-bread', NULL, 5, 13, '2021-01-12 00:02:22', '2021-01-12 00:02:22', 'voyager.bread.index', NULL),
(10, 1, 'Settings', '', '_self', 'voyager-settings', NULL, NULL, 14, '2021-01-12 00:02:22', '2021-01-12 00:02:22', 'voyager.settings.index', NULL),
(11, 1, 'Categories', '', '_self', 'voyager-categories', NULL, NULL, 8, '2021-01-12 00:02:25', '2021-01-12 00:02:25', 'voyager.categories.index', NULL),
(12, 1, 'Posts', '', '_self', 'voyager-news', NULL, NULL, 6, '2021-01-12 00:02:26', '2021-01-12 00:02:26', 'voyager.posts.index', NULL),
(13, 1, 'Pages', '', '_self', 'voyager-file-text', NULL, NULL, 7, '2021-01-12 00:02:27', '2021-01-12 00:02:27', 'voyager.pages.index', NULL),
(14, 1, 'Hooks', '', '_self', 'voyager-hook', NULL, 5, 13, '2021-01-12 00:02:28', '2021-01-12 00:02:28', 'voyager.hooks', NULL),
(15, 1, 'Tramites', '', '_self', 'voyager-archive', NULL, NULL, 15, '2021-01-12 00:40:15', '2021-01-12 00:40:15', 'voyager.tramites.index', NULL),
(16, 1, 'Personas', '', '_self', 'voyager-person', NULL, NULL, 16, '2021-01-12 01:20:55', '2021-01-12 01:20:55', 'voyager.personas.index', NULL),
(18, 1, 'Areaempleados', '', '_self', 'voyager-people', NULL, NULL, 17, '2021-01-12 16:06:50', '2021-01-12 16:06:50', 'voyager.areaempleados.index', NULL),
(19, 1, 'Areas', '', '_self', 'voyager-company', NULL, NULL, 18, '2021-01-12 16:44:26', '2021-01-12 16:44:26', 'voyager.areas.index', NULL),
(21, 1, 'Movimientos', '', '_self', 'voyager-list', NULL, NULL, 19, '2021-01-12 17:05:24', '2021-01-12 17:05:24', 'voyager.movimientos.index', NULL),
(22, 1, 'Contacts', '', '_self', 'voyager-mail', NULL, NULL, 20, '2021-01-14 16:43:12', '2021-01-14 16:43:12', 'voyager.contacts.index', NULL),
(23, 1, 'Expedientes', '', '_self', 'voyager-archive', NULL, NULL, 21, '2021-01-15 15:25:05', '2021-01-15 15:25:05', 'voyager.expedientes.index', NULL),
(24, 1, 'Logs', '', '_self', 'voyager-logbook', NULL, NULL, 22, '2021-02-12 00:03:21', '2021-02-12 00:03:21', 'voyager.logs.index', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2016_01_01_000000_add_voyager_user_fields', 1),
(4, '2016_01_01_000000_create_data_types_table', 1),
(5, '2016_05_19_173453_create_menu_table', 1),
(6, '2016_10_21_190000_create_roles_table', 1),
(7, '2016_10_21_190000_create_settings_table', 1),
(8, '2016_11_30_135954_create_permission_table', 1),
(9, '2016_11_30_141208_create_permission_role_table', 1),
(10, '2016_12_26_201236_data_types__add__server_side', 1),
(11, '2017_01_13_000000_add_route_to_menu_items_table', 1),
(12, '2017_01_14_005015_create_translations_table', 1),
(13, '2017_01_15_000000_make_table_name_nullable_in_permissions_table', 1),
(14, '2017_03_06_000000_add_controller_to_data_types_table', 1),
(15, '2017_04_21_000000_add_order_to_data_rows_table', 1),
(16, '2017_07_05_210000_add_policyname_to_data_types_table', 1),
(17, '2017_08_05_000000_add_group_to_settings_table', 1),
(18, '2017_11_26_013050_add_user_role_relationship', 1),
(19, '2017_11_26_015000_create_user_roles_table', 1),
(20, '2018_03_11_000000_add_user_settings', 1),
(21, '2018_03_14_000000_add_details_to_data_types_table', 1),
(22, '2018_03_16_000000_make_settings_value_nullable', 1),
(23, '2019_08_19_000000_create_failed_jobs_table', 1),
(24, '2016_01_01_000000_create_pages_table', 2),
(25, '2016_01_01_000000_create_posts_table', 2),
(26, '2016_02_15_204651_create_categories_table', 2),
(27, '2017_04_11_000000_alter_post_nullable_fields_table', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `movimientos`
--

CREATE TABLE `movimientos` (
  `id` int(10) UNSIGNED NOT NULL,
  `orden` int(11) DEFAULT 1,
  `fecha_entrada` datetime NOT NULL,
  `fecha_salida` datetime DEFAULT NULL,
  `comentario` text CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci NOT NULL,
  `bandera_observacion` bit(1) DEFAULT NULL,
  `observacion` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subsanacion` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_area` int(11) NOT NULL,
  `id_expediente` int(11) NOT NULL,
  `tramite_finalizado` bit(1) DEFAULT NULL,
  `confirmado` tinyint(1) DEFAULT 0,
  `fecha_confirmacion` datetime DEFAULT NULL,
  `quien_confirmacion` int(11) DEFAULT NULL,
  `comentario_confirmacion` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` int(11) DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `movimientos`
--

INSERT INTO `movimientos` (`id`, `orden`, `fecha_entrada`, `fecha_salida`, `comentario`, `bandera_observacion`, `observacion`, `subsanacion`, `id_area`, `id_expediente`, `tramite_finalizado`, `confirmado`, `fecha_confirmacion`, `quien_confirmacion`, `comentario_confirmacion`, `created_by`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, '2021-01-16 12:47:00', '2021-01-18 11:13:09', '', b'1', 'alguna observacion', NULL, 1, 3, b'0', 0, NULL, NULL, NULL, 1, '2021-01-16 18:47:32', '2021-01-16 18:47:32', NULL),
(2, 1, '2021-01-16 12:51:00', '2021-01-19 11:13:18', '', b'0', 'todo bien, pero debe seguir', NULL, 2, 3, b'0', 0, NULL, NULL, NULL, 1, '2021-01-16 18:48:06', '2021-01-16 18:48:06', NULL),
(3, 1, '2021-01-20 14:02:38', '2021-01-21 11:13:27', 'aaaaaaaaaaaaaaaaaaaaaa', b'1', NULL, 'eeeeeeeeeeeee', 1, 3, b'1', 0, NULL, NULL, NULL, 1, '2021-01-20 17:02:38', '2021-01-20 17:02:38', NULL),
(4, 1, '2021-01-20 14:06:27', '2021-01-20 15:13:54', 'wwwwwwwwwwwwwww', b'1', NULL, 'qqrrrrrrrrrrrr', 2, 3, b'1', 0, NULL, NULL, NULL, 1, '2021-01-20 17:06:27', '2021-01-20 17:06:27', NULL),
(6, 1, '2021-01-20 14:09:57', '2021-01-20 14:14:02', 'dddddddddddddd', b'1', NULL, 'aaaaaaaaaaaaaa', 1, 3, b'1', 0, NULL, NULL, NULL, 1, '2021-01-20 17:09:57', '2021-01-20 17:09:57', NULL),
(7, 1, '2021-01-20 14:11:17', '2021-01-20 15:14:12', 'eeeeeeeeeeeee', b'1', NULL, 'wwwwwwwwwwwwww', 2, 3, b'1', 0, NULL, NULL, NULL, 1, '2021-01-20 17:11:17', '2021-01-20 17:11:17', NULL),
(8, 1, '2021-01-20 14:17:19', '2021-01-20 15:49:13', 'qqqqqqqqq', b'1', NULL, 'eeeeeeeeeee', 3, 3, b'0', 0, NULL, NULL, NULL, 1, '2021-01-20 17:17:19', '2021-01-20 17:17:19', NULL),
(9, 1, '2021-01-20 14:18:09', '2021-01-20 15:44:07', 'dsfsdfsdf', b'1', NULL, 'fwefwfwe332', 2, 3, b'0', 0, NULL, NULL, NULL, 1, '2021-01-20 17:18:09', '2021-01-20 17:18:09', NULL),
(10, 1, '2021-01-20 14:30:32', '2021-01-20 14:43:56', 'opppopooppo', b'1', NULL, 'egergerg', 1, 3, b'0', 0, NULL, NULL, NULL, 1, '2021-01-20 17:30:32', '2021-01-20 17:30:32', NULL),
(11, 1, '2021-01-20 14:32:59', '2021-01-20 16:44:25', 'erreerwrw', b'1', NULL, 'rwefwefwe', 3, 3, b'0', 0, NULL, NULL, NULL, 1, '2021-01-20 17:32:59', '2021-01-20 17:32:59', NULL),
(12, 1, '2021-01-20 14:33:56', NULL, 'weqwqeq', b'1', NULL, 'r23fc3f2f', 2, 3, b'0', 0, NULL, NULL, NULL, 1, '2021-01-20 17:33:56', '2021-01-20 17:33:56', NULL),
(13, 1, '2021-01-20 14:34:45', NULL, 'rthrthrthrt', b'1', NULL, '45y45y45t', 3, 3, b'0', 0, NULL, NULL, NULL, 1, '2021-01-20 17:34:45', '2021-01-20 17:34:45', NULL),
(14, 1, '2021-01-20 14:36:32', NULL, 'qwqwdqwd', b'1', NULL, 'wdee3e322', 2, 3, b'0', 0, NULL, NULL, NULL, 1, '2021-01-20 17:36:32', '2021-01-20 17:36:32', NULL),
(15, 1, '2021-01-20 14:37:03', NULL, 'asdasdas', b'1', NULL, 'qwdqwd', 1, 3, b'0', 0, NULL, NULL, NULL, 1, '2021-01-20 17:37:03', '2021-01-20 17:37:03', NULL),
(16, 1, '2021-01-20 14:37:54', '2021-01-20 17:29:41', 'dqwdqdqw', b'1', NULL, '324234', 3, 3, b'0', 0, NULL, NULL, NULL, 1, '2021-01-20 17:37:54', '2021-01-20 20:29:41', NULL),
(17, 1, '2021-01-20 17:29:41', '2021-01-20 17:30:42', 'este es el comentario a mandar por email', b'0', NULL, NULL, 2, 3, b'0', 0, NULL, NULL, NULL, 1, '2021-01-20 20:29:41', '2021-01-20 20:30:42', NULL),
(18, 1, '2021-01-20 17:30:42', '2021-01-20 17:31:30', 'comentario a enviar por email', b'0', NULL, NULL, 1, 3, b'0', 0, NULL, NULL, NULL, 1, '2021-01-20 20:30:42', '2021-01-20 20:31:30', NULL),
(19, 1, '2021-01-20 17:31:30', '2021-01-20 17:32:33', 'esta es el comentario a  enviar por email', b'0', NULL, NULL, 2, 3, b'0', 0, NULL, NULL, NULL, 1, '2021-01-20 20:31:30', '2021-01-20 20:32:33', NULL),
(20, 1, '2021-01-20 17:32:33', '2021-01-20 17:33:11', 'este es el super comentario a amandar por email', b'0', NULL, NULL, 3, 3, b'0', 0, NULL, NULL, NULL, 1, '2021-01-20 20:32:33', '2021-01-20 20:33:11', NULL),
(21, 1, '2021-01-20 17:33:11', '2021-01-20 17:33:44', 'name esrte es el suepr comentarioname', b'0', NULL, NULL, 1, 3, b'0', 0, NULL, NULL, NULL, 1, '2021-01-20 20:33:11', '2021-01-20 20:33:44', NULL),
(22, 1, '2021-01-20 17:33:44', '2021-01-20 17:45:41', 'name esrte es el suepr comentarioname', b'0', NULL, NULL, 2, 3, b'0', 0, NULL, NULL, NULL, 1, '2021-01-20 20:33:44', '2021-01-20 20:45:41', NULL),
(23, 1, '2021-01-20 17:45:41', '2021-01-20 17:46:21', 'asdasdasdasd', b'0', NULL, NULL, 3, 3, b'0', 0, NULL, NULL, NULL, 1, '2021-01-20 20:45:41', '2021-01-20 20:46:21', NULL),
(24, 1, '2021-01-20 17:46:21', '2021-01-22 15:16:39', 'dascascascascasc', b'0', NULL, NULL, 2, 3, b'0', 1, '2021-01-22 15:11:45', 1, 'ddddddddddddddd', 1, '2021-01-20 20:46:21', '2021-01-22 18:16:39', NULL),
(25, 1, '2021-01-22 15:16:39', '2021-01-23 16:07:51', 'esta listo para mandarse a mesa de entrada', b'0', 'si tenen super obsercacion', NULL, 3, 3, b'0', 0, NULL, NULL, NULL, 1, '2021-01-22 18:16:39', '2021-01-23 19:07:51', NULL),
(26, 1, '2021-01-23 01:29:14', '2021-02-16 01:42:49', 'primer movimiento | generado automaticamente', b'0', NULL, NULL, 3, 23, b'0', 1, '2021-02-16 00:08:55', 17, 'las hojas estan medias rotas', 1, '2021-01-23 04:29:18', '2021-02-16 04:42:49', NULL),
(27, 1, '2021-01-23 13:16:16', '2021-02-02 22:14:19', 'primer movimiento | generado automaticamente', b'0', NULL, NULL, 3, 24, b'0', 0, NULL, NULL, NULL, 1, '2021-01-23 16:16:21', '2021-02-03 01:14:19', NULL),
(28, 1, '2021-01-23 16:07:51', NULL, 'falta balence de impuestos', b'0', 'observo que el expediente esta medio roto', NULL, 1, 3, b'0', 1, '2021-01-23 16:16:49', 1, 'esta en el escritorio del director', 1, '2021-01-23 19:07:51', '2021-01-23 19:16:49', NULL),
(29, 1, '2021-01-23 16:20:03', '2021-02-02 22:13:59', 'primer movimiento | generado automaticamente', b'0', NULL, NULL, 3, 25, b'0', 0, NULL, NULL, NULL, 1, '2021-01-23 19:20:06', '2021-02-03 01:13:59', NULL),
(30, 1, '2021-01-26 15:00:55', '2021-01-30 14:29:20', 'primer movimiento | generado automaticamente', b'0', NULL, NULL, 2, 26, b'0', 1, '2021-01-29 12:15:48', 1, NULL, 1, '2021-01-26 18:00:59', '2021-01-30 17:29:20', NULL),
(31, 2, '2021-01-30 14:29:20', '2021-01-30 21:21:27', 'por que ya fue visto', b'0', NULL, NULL, 3, 26, b'0', 1, '2021-01-30 15:14:14', 1, 'lo recibi varios minutos mas tarde', 1, '2021-01-30 17:29:20', '2021-01-31 00:21:27', NULL),
(32, 3, '2021-01-30 21:21:27', '2021-02-02 21:17:20', 'la paso xq ya termine', b'0', 'si ,tengo una  observacion en la hoja 4, revisar xfavor', NULL, 1, 26, b'0', 0, NULL, NULL, NULL, 1, '2021-01-31 00:21:27', '2021-02-03 00:17:20', NULL),
(33, 4, '2021-02-02 21:17:20', '2021-02-02 22:11:12', 'porque si', b'0', NULL, NULL, 4, 26, b'0', 0, NULL, NULL, NULL, 1, '2021-02-03 00:17:20', '2021-02-03 01:11:12', NULL),
(34, 5, '2021-02-02 22:11:12', '2021-02-02 22:12:08', 'lo termine de ver', b'0', NULL, NULL, 8, 26, b'0', 0, NULL, NULL, NULL, 1, '2021-02-03 01:11:12', '2021-02-03 01:12:08', NULL),
(35, 6, '2021-02-02 22:12:08', '2021-02-02 22:33:34', 'por que ya lo analice', b'0', NULL, NULL, 7, 26, b'0', 0, NULL, NULL, NULL, 1, '2021-02-03 01:12:08', '2021-02-03 01:33:34', NULL),
(36, 2, '2021-02-02 22:13:59', '2021-02-03 00:51:31', 'por que si', b'0', 'observame esta', NULL, 7, 25, b'0', 0, NULL, NULL, NULL, 1, '2021-02-03 01:13:59', '2021-02-03 03:51:31', NULL),
(37, 2, '2021-02-02 22:14:19', NULL, 'para darle mas trabajo a beatriz', b'0', 'es a modo de prueba', NULL, 7, 24, b'0', 0, NULL, NULL, NULL, 1, '2021-02-03 01:14:19', '2021-02-03 01:14:19', NULL),
(38, 7, '2021-02-02 22:33:34', '2021-02-02 22:34:01', 'por que si', b'0', NULL, NULL, 4, 26, b'0', 0, NULL, NULL, NULL, 1, '2021-02-03 01:33:34', '2021-02-03 01:34:01', NULL),
(39, 8, '2021-02-02 22:34:01', '2021-02-03 00:32:03', 'para probar', b'0', NULL, NULL, 7, 26, b'0', 0, NULL, NULL, NULL, 1, '2021-02-03 01:43:01', '2021-02-03 03:32:03', NULL),
(40, 9, '2021-02-03 00:32:03', '2021-02-03 00:32:21', 'asdasd', b'0', NULL, NULL, 3, 26, b'0', 0, NULL, NULL, NULL, 1, '2021-02-03 03:32:03', '2021-02-03 03:32:21', NULL),
(41, 10, '2021-02-03 00:32:21', '2021-02-03 18:16:52', 'para hacer la prueba mas dificil', b'0', NULL, NULL, 7, 26, b'0', 0, NULL, NULL, NULL, 1, '2021-02-03 03:32:21', '2021-02-03 21:16:52', NULL),
(42, 3, '2021-02-03 00:51:32', '2021-02-03 00:51:38', 'fsdfsdf', b'0', NULL, NULL, 4, 25, b'0', 0, NULL, NULL, NULL, 1, '2021-02-03 03:51:32', '2021-02-03 03:51:38', NULL),
(43, 4, '2021-02-03 00:51:38', '2021-02-03 13:05:52', 'qqqqqqqqqqqqqqqqq', b'0', NULL, NULL, 7, 25, b'0', 0, NULL, NULL, NULL, 1, '2021-02-03 03:51:38', '2021-02-03 16:05:52', NULL),
(44, 5, '2021-02-03 13:05:52', '2021-02-03 13:07:11', 'sadasd', b'0', NULL, NULL, 2, 25, b'0', 0, NULL, NULL, NULL, 1, '2021-02-03 16:05:52', '2021-02-03 16:07:11', NULL),
(45, 6, '2021-02-03 13:07:11', '2021-02-11 01:00:32', 'asdasdasdasdasdasdds', b'0', NULL, NULL, 7, 25, b'0', 1, '2021-02-11 00:35:41', 9, NULL, 1, '2021-02-03 16:07:11', '2021-02-11 04:00:32', NULL),
(46, 11, '2021-02-03 18:16:52', '2021-02-03 18:43:14', 'lo revise y lo mando a personal para que lo revisen', b'0', 'es una observacion sencilla', NULL, 8, 26, b'0', 1, '2021-02-04 16:11:46', 1, NULL, 9, '2021-02-03 21:16:52', '2021-02-03 21:43:14', NULL),
(47, 12, '2021-02-03 18:43:14', NULL, 'para q auditen este exp', b'0', NULL, NULL, 4, 26, b'0', 0, NULL, NULL, NULL, 11, '2021-02-03 21:43:14', '2021-02-05 22:56:00', NULL),
(48, 13, '2021-02-05 18:11:37', NULL, 'dasdasd', b'0', NULL, NULL, 7, 26, b'0', 0, NULL, NULL, NULL, 1, '2021-02-05 21:11:37', '2021-02-05 22:56:40', '2021-02-05 22:56:40'),
(49, 1, '2021-02-06 00:56:25', '2021-02-07 01:17:39', 'primer movimiento | generado automaticamente', b'0', NULL, NULL, 3, 30, b'0', 1, '2021-02-06 00:56:29', 1, 'confirmacion automatica', 1, '2021-02-06 03:56:29', '2021-02-07 04:17:39', NULL),
(50, 2, '2021-02-07 01:17:39', NULL, 'probando que no se envie el email cuando muevo el expediente', b'0', 'si,m tiene varias observaciones hechas en papel', NULL, 6, 30, b'0', 1, '2021-02-07 01:27:05', 8, 'las hojas estan medias sucias', NULL, '2021-02-07 04:17:39', '2021-02-07 04:27:05', NULL),
(51, 1, '2021-02-08 21:31:23', '2021-02-10 21:18:41', 'primer movimiento | generado automaticamente', b'0', NULL, NULL, 3, 34, b'0', 1, '2021-02-10 21:14:09', 16, NULL, 1, '2021-02-09 00:31:28', '2021-02-11 00:18:41', NULL),
(52, 2, '2021-02-10 21:08:09', NULL, 'se lo paso para que lo revisen', b'0', 'alguna observacion', NULL, 7, 34, b'0', 0, NULL, NULL, NULL, 1, '2021-02-11 00:08:09', '2021-02-11 00:10:38', '2021-02-11 00:10:38'),
(53, 2, '2021-02-10 21:18:41', NULL, 'para que revise personal', b'0', NULL, NULL, 8, 34, b'0', 0, NULL, NULL, NULL, 16, '2021-02-11 00:18:41', '2021-02-11 00:18:41', NULL),
(54, 7, '2021-02-11 01:00:32', '2021-02-11 02:07:38', 'esta medio raro este expediente', b'0', NULL, 'encuentro que es necesario que el agrimensor declare los metros cuadrados nuevamente', 3, 25, b'0', 1, '2021-02-11 01:05:23', 16, NULL, 9, '2021-02-11 04:00:32', '2021-02-11 05:07:38', NULL),
(55, 8, '2021-02-11 02:07:38', '2021-02-11 02:15:07', 'ya esta todo subsanado', b'0', NULL, NULL, 5, 25, b'0', 1, '2021-02-11 02:11:51', 5, NULL, 16, '2021-02-11 05:07:38', '2021-02-11 05:15:07', NULL),
(56, 9, '2021-02-11 02:15:07', NULL, 'por que es necesario que las secretarias lo revisen', b'0', 'los numeros no cierran', NULL, 5, 25, b'0', 1, '2021-02-11 02:16:09', 5, NULL, 5, '2021-02-11 05:15:07', '2021-02-11 05:16:09', NULL),
(57, 1, '2021-02-11 13:46:00', '2021-02-16 16:47:32', 'primer movimiento | generado automaticamente', b'0', NULL, NULL, 3, 35, b'0', 1, '2021-02-16 16:45:08', 17, NULL, 17, '2021-02-11 16:46:03', '2021-02-16 19:47:32', NULL),
(58, 2, '2021-02-11 13:46:29', NULL, 'para que lo vean los abogados', b'0', NULL, NULL, 2, 35, b'0', 0, NULL, NULL, NULL, 17, '2021-02-11 16:46:29', '2021-02-16 19:28:18', '2021-02-16 19:28:18'),
(59, 1, '2021-02-12 22:55:07', '2021-02-12 23:52:43', 'primer movimiento | generado automaticamente', b'0', NULL, NULL, 3, 36, b'0', 1, '2021-02-12 22:55:09', 17, 'confirmacion automatica', 17, '2021-02-13 01:55:09', '2021-02-13 02:52:43', NULL),
(60, 2, '2021-02-12 23:52:43', '2021-02-13 00:26:44', 'transfiero por orden de tramite', b'0', NULL, NULL, 7, 36, b'0', 1, '2021-02-13 00:13:56', 9, 'llegó bien', 17, '2021-02-13 02:52:43', '2021-02-13 03:26:44', NULL),
(61, 3, '2021-02-13 00:26:44', '2021-02-13 00:50:03', 'para ser analizado por personal', b'0', NULL, NULL, 8, 36, b'0', 1, '2021-02-13 00:49:00', 10, NULL, 9, '2021-02-13 03:26:44', '2021-02-13 03:50:03', NULL),
(62, 4, '2021-02-13 00:39:52', NULL, 'para que lo vean los auditores', b'0', NULL, NULL, 4, 36, b'0', 0, NULL, NULL, NULL, 10, '2021-02-13 03:39:52', '2021-02-13 03:42:32', '2021-02-13 03:42:32'),
(63, 4, '2021-02-13 00:50:03', '2021-02-13 00:58:45', 'se lo paso a secretaria para ser analizado', b'0', NULL, NULL, 5, 36, b'0', 1, '2021-02-13 00:54:37', 6, NULL, 10, '2021-02-13 03:50:03', '2021-02-13 03:58:45', NULL),
(64, 5, '2021-02-13 00:58:45', '2021-02-13 15:50:01', 'para guardar', b'0', NULL, NULL, 9, 36, b'1', 1, '2021-02-13 01:09:09', 20, NULL, 6, '2021-02-13 03:58:45', '2021-02-13 18:50:01', NULL),
(65, 1, '2021-02-13 16:25:55', '2021-02-15 18:55:46', 'primer movimiento | generado automaticamente', b'0', NULL, NULL, 3, 37, b'0', 1, '2021-02-15 18:55:13', 17, 'me equivoque hace rato', 17, '2021-02-13 19:25:57', '2021-02-15 21:55:46', NULL),
(66, 2, '2021-02-15 18:52:11', NULL, 'para que lo revisen', b'0', 'esta poco claro el requisito', NULL, 8, 37, b'0', 0, NULL, NULL, NULL, 17, '2021-02-15 21:52:11', '2021-02-15 21:52:53', '2021-02-15 21:52:53'),
(67, 2, '2021-02-15 18:55:46', '2021-02-15 19:25:23', 'para que  lo revisen las secretarias', b'0', NULL, NULL, 5, 37, b'0', 1, '2021-02-15 18:57:05', 6, NULL, 17, '2021-02-15 21:55:46', '2021-02-15 22:25:23', NULL),
(68, 3, '2021-02-15 19:25:23', '2021-02-15 19:39:15', 'para q lo vea la auditoria', b'0', NULL, NULL, 4, 37, b'1', 1, '2021-02-15 19:32:52', 4, NULL, 5, '2021-02-15 22:25:23', '2021-02-15 22:39:15', NULL),
(69, 2, '2021-02-16 01:42:49', NULL, 'paso a personal para que lo revisen', b'0', NULL, NULL, 8, 23, b'0', 1, '2021-02-16 01:50:03', 10, 'el expdiente viene manchado', 17, '2021-02-16 04:42:49', '2021-02-16 04:50:03', NULL),
(70, 2, '2021-02-16 16:47:32', '2021-02-16 17:15:56', 'para ser analizado por los abogados', b'0', NULL, NULL, 2, 35, b'0', 1, '2021-02-16 16:50:09', 21, NULL, 17, '2021-02-16 19:47:32', '2021-02-16 20:15:56', NULL),
(71, 3, '2021-02-16 17:15:56', '2021-02-16 21:39:44', 'para mesa de entrada', b'0', 'He revisado la documentación presentada y no posee la firma del profesional de la agrimensura', 'nueva subsanacion q q q a a a 2021', 3, 35, b'0', 1, '2021-02-16 20:19:29', 17, NULL, 21, '2021-02-16 20:15:56', '2021-02-17 00:39:44', NULL),
(72, 4, '2021-02-16 21:39:44', NULL, 'para revision', b'0', NULL, NULL, 4, 35, b'0', 0, NULL, NULL, NULL, 17, '2021-02-17 00:39:44', '2021-02-17 00:39:44', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pages`
--

CREATE TABLE `pages` (
  `id` int(10) UNSIGNED NOT NULL,
  `author_id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `excerpt` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `body` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_keywords` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('ACTIVE','INACTIVE') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'INACTIVE',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `pages`
--

INSERT INTO `pages` (`id`, `author_id`, `title`, `excerpt`, `body`, `image`, `slug`, `meta_description`, `meta_keywords`, `status`, `created_at`, `updated_at`) VALUES
(1, 0, 'Hello World', 'Hang the jib grog grog blossom grapple dance the hempen jig gangway pressgang bilge rat to go on account lugger. Nelsons folly gabion line draught scallywag fire ship gaff fluke fathom case shot. Sea Legs bilge rat sloop matey gabion long clothes run a shot across the bow Gold Road cog league.', '<p>Hello World. Scallywag grog swab Cat o\'nine tails scuttle rigging hardtack cable nipper Yellow Jack. Handsomely spirits knave lad killick landlubber or just lubber deadlights chantey pinnace crack Jennys tea cup. Provost long clothes black spot Yellow Jack bilged on her anchor league lateen sail case shot lee tackle.</p>\r\n<p>Ballast spirits fluke topmast me quarterdeck schooner landlubber or just lubber gabion belaying pin. Pinnace stern galleon starboard warp carouser to go on account dance the hempen jig jolly boat measured fer yer chains. Man-of-war fire in the hole nipperkin handsomely doubloon barkadeer Brethren of the Coast gibbet driver squiffy.</p>', 'pages/page1.jpg', 'hello-world', 'Yar Meta Description', 'Keyword1, Keyword2', 'ACTIVE', '2021-01-12 00:02:27', '2021-01-12 00:02:27');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `password_resets`
--

INSERT INTO `password_resets` (`email`, `token`, `created_at`) VALUES
('diegochecarelli@hotmail.com', '$2y$10$VO9Nwexw/HqSPrCLxTBohOy0BpiWxGt7/zFxnAB2biw3UXp70RU8u', '2021-02-13 00:47:37');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `table_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `permissions`
--

INSERT INTO `permissions` (`id`, `key`, `table_name`, `created_at`, `updated_at`) VALUES
(1, 'browse_admin', NULL, '2021-01-12 00:02:22', '2021-01-12 00:02:22'),
(2, 'browse_bread', NULL, '2021-01-12 00:02:22', '2021-01-12 00:02:22'),
(3, 'browse_database', NULL, '2021-01-12 00:02:22', '2021-01-12 00:02:22'),
(4, 'browse_media', NULL, '2021-01-12 00:02:22', '2021-01-12 00:02:22'),
(5, 'browse_compass', NULL, '2021-01-12 00:02:22', '2021-01-12 00:02:22'),
(6, 'browse_menus', 'menus', '2021-01-12 00:02:22', '2021-01-12 00:02:22'),
(7, 'read_menus', 'menus', '2021-01-12 00:02:22', '2021-01-12 00:02:22'),
(8, 'edit_menus', 'menus', '2021-01-12 00:02:22', '2021-01-12 00:02:22'),
(9, 'add_menus', 'menus', '2021-01-12 00:02:22', '2021-01-12 00:02:22'),
(10, 'delete_menus', 'menus', '2021-01-12 00:02:23', '2021-01-12 00:02:23'),
(11, 'browse_roles', 'roles', '2021-01-12 00:02:23', '2021-01-12 00:02:23'),
(12, 'read_roles', 'roles', '2021-01-12 00:02:23', '2021-01-12 00:02:23'),
(13, 'edit_roles', 'roles', '2021-01-12 00:02:23', '2021-01-12 00:02:23'),
(14, 'add_roles', 'roles', '2021-01-12 00:02:23', '2021-01-12 00:02:23'),
(15, 'delete_roles', 'roles', '2021-01-12 00:02:23', '2021-01-12 00:02:23'),
(16, 'browse_users', 'users', '2021-01-12 00:02:23', '2021-01-12 00:02:23'),
(17, 'read_users', 'users', '2021-01-12 00:02:23', '2021-01-12 00:02:23'),
(18, 'edit_users', 'users', '2021-01-12 00:02:23', '2021-01-12 00:02:23'),
(19, 'add_users', 'users', '2021-01-12 00:02:23', '2021-01-12 00:02:23'),
(20, 'delete_users', 'users', '2021-01-12 00:02:23', '2021-01-12 00:02:23'),
(21, 'browse_settings', 'settings', '2021-01-12 00:02:23', '2021-01-12 00:02:23'),
(22, 'read_settings', 'settings', '2021-01-12 00:02:23', '2021-01-12 00:02:23'),
(23, 'edit_settings', 'settings', '2021-01-12 00:02:23', '2021-01-12 00:02:23'),
(24, 'add_settings', 'settings', '2021-01-12 00:02:23', '2021-01-12 00:02:23'),
(25, 'delete_settings', 'settings', '2021-01-12 00:02:23', '2021-01-12 00:02:23'),
(26, 'browse_categories', 'categories', '2021-01-12 00:02:25', '2021-01-12 00:02:25'),
(27, 'read_categories', 'categories', '2021-01-12 00:02:25', '2021-01-12 00:02:25'),
(28, 'edit_categories', 'categories', '2021-01-12 00:02:25', '2021-01-12 00:02:25'),
(29, 'add_categories', 'categories', '2021-01-12 00:02:25', '2021-01-12 00:02:25'),
(30, 'delete_categories', 'categories', '2021-01-12 00:02:25', '2021-01-12 00:02:25'),
(31, 'browse_posts', 'posts', '2021-01-12 00:02:26', '2021-01-12 00:02:26'),
(32, 'read_posts', 'posts', '2021-01-12 00:02:26', '2021-01-12 00:02:26'),
(33, 'edit_posts', 'posts', '2021-01-12 00:02:26', '2021-01-12 00:02:26'),
(34, 'add_posts', 'posts', '2021-01-12 00:02:26', '2021-01-12 00:02:26'),
(35, 'delete_posts', 'posts', '2021-01-12 00:02:26', '2021-01-12 00:02:26'),
(36, 'browse_pages', 'pages', '2021-01-12 00:02:27', '2021-01-12 00:02:27'),
(37, 'read_pages', 'pages', '2021-01-12 00:02:27', '2021-01-12 00:02:27'),
(38, 'edit_pages', 'pages', '2021-01-12 00:02:27', '2021-01-12 00:02:27'),
(39, 'add_pages', 'pages', '2021-01-12 00:02:27', '2021-01-12 00:02:27'),
(40, 'delete_pages', 'pages', '2021-01-12 00:02:27', '2021-01-12 00:02:27'),
(41, 'browse_hooks', NULL, '2021-01-12 00:02:28', '2021-01-12 00:02:28'),
(42, 'browse_tramites', 'tramites', '2021-01-12 00:40:15', '2021-01-12 00:40:15'),
(43, 'read_tramites', 'tramites', '2021-01-12 00:40:15', '2021-01-12 00:40:15'),
(44, 'edit_tramites', 'tramites', '2021-01-12 00:40:15', '2021-01-12 00:40:15'),
(45, 'add_tramites', 'tramites', '2021-01-12 00:40:15', '2021-01-12 00:40:15'),
(46, 'delete_tramites', 'tramites', '2021-01-12 00:40:15', '2021-01-12 00:40:15'),
(47, 'browse_personas', 'personas', '2021-01-12 01:20:55', '2021-01-12 01:20:55'),
(48, 'read_personas', 'personas', '2021-01-12 01:20:55', '2021-01-12 01:20:55'),
(49, 'edit_personas', 'personas', '2021-01-12 01:20:55', '2021-01-12 01:20:55'),
(50, 'add_personas', 'personas', '2021-01-12 01:20:55', '2021-01-12 01:20:55'),
(51, 'delete_personas', 'personas', '2021-01-12 01:20:55', '2021-01-12 01:20:55'),
(57, 'browse_areaempleados', 'areaempleados', '2021-01-12 16:06:50', '2021-01-12 16:06:50'),
(58, 'read_areaempleados', 'areaempleados', '2021-01-12 16:06:50', '2021-01-12 16:06:50'),
(59, 'edit_areaempleados', 'areaempleados', '2021-01-12 16:06:50', '2021-01-12 16:06:50'),
(60, 'add_areaempleados', 'areaempleados', '2021-01-12 16:06:50', '2021-01-12 16:06:50'),
(61, 'delete_areaempleados', 'areaempleados', '2021-01-12 16:06:50', '2021-01-12 16:06:50'),
(62, 'browse_areas', 'areas', '2021-01-12 16:44:26', '2021-01-12 16:44:26'),
(63, 'read_areas', 'areas', '2021-01-12 16:44:26', '2021-01-12 16:44:26'),
(64, 'edit_areas', 'areas', '2021-01-12 16:44:26', '2021-01-12 16:44:26'),
(65, 'add_areas', 'areas', '2021-01-12 16:44:26', '2021-01-12 16:44:26'),
(66, 'delete_areas', 'areas', '2021-01-12 16:44:26', '2021-01-12 16:44:26'),
(72, 'browse_movimientos', 'movimientos', '2021-01-12 17:05:24', '2021-01-12 17:05:24'),
(73, 'read_movimientos', 'movimientos', '2021-01-12 17:05:24', '2021-01-12 17:05:24'),
(74, 'edit_movimientos', 'movimientos', '2021-01-12 17:05:24', '2021-01-12 17:05:24'),
(75, 'add_movimientos', 'movimientos', '2021-01-12 17:05:24', '2021-01-12 17:05:24'),
(76, 'delete_movimientos', 'movimientos', '2021-01-12 17:05:24', '2021-01-12 17:05:24'),
(77, 'browse_contacts', 'contacts', '2021-01-14 16:43:12', '2021-01-14 16:43:12'),
(78, 'read_contacts', 'contacts', '2021-01-14 16:43:12', '2021-01-14 16:43:12'),
(79, 'edit_contacts', 'contacts', '2021-01-14 16:43:12', '2021-01-14 16:43:12'),
(80, 'add_contacts', 'contacts', '2021-01-14 16:43:12', '2021-01-14 16:43:12'),
(81, 'delete_contacts', 'contacts', '2021-01-14 16:43:12', '2021-01-14 16:43:12'),
(82, 'browse_expedientes', 'expedientes', '2021-01-15 15:25:05', '2021-01-15 15:25:05'),
(83, 'read_expedientes', 'expedientes', '2021-01-15 15:25:05', '2021-01-15 15:25:05'),
(84, 'edit_expedientes', 'expedientes', '2021-01-15 15:25:05', '2021-01-15 15:25:05'),
(85, 'add_expedientes', 'expedientes', '2021-01-15 15:25:05', '2021-01-15 15:25:05'),
(86, 'delete_expedientes', 'expedientes', '2021-01-15 15:25:05', '2021-01-15 15:25:05'),
(87, 'browse_logs', 'logs', '2021-02-12 00:03:21', '2021-02-12 00:03:21'),
(88, 'read_logs', 'logs', '2021-02-12 00:03:21', '2021-02-12 00:03:21'),
(89, 'edit_logs', 'logs', '2021-02-12 00:03:21', '2021-02-12 00:03:21'),
(90, 'add_logs', 'logs', '2021-02-12 00:03:21', '2021-02-12 00:03:21'),
(91, 'delete_logs', 'logs', '2021-02-12 00:03:21', '2021-02-12 00:03:21');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permission_role`
--

CREATE TABLE `permission_role` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `permission_role`
--

INSERT INTO `permission_role` (`permission_id`, `role_id`) VALUES
(1, 1),
(1, 3),
(1, 4),
(1, 5),
(1, 6),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(11, 5),
(12, 1),
(12, 5),
(13, 1),
(13, 5),
(14, 1),
(14, 5),
(15, 1),
(15, 5),
(16, 1),
(16, 4),
(16, 5),
(16, 6),
(17, 1),
(17, 5),
(17, 6),
(18, 1),
(18, 5),
(18, 6),
(19, 1),
(19, 5),
(19, 6),
(20, 1),
(20, 5),
(20, 6),
(21, 1),
(22, 1),
(23, 1),
(24, 1),
(25, 1),
(26, 1),
(27, 1),
(28, 1),
(29, 1),
(30, 1),
(31, 1),
(32, 1),
(33, 1),
(34, 1),
(35, 1),
(36, 1),
(37, 1),
(38, 1),
(39, 1),
(40, 1),
(42, 1),
(42, 4),
(42, 5),
(43, 1),
(43, 4),
(43, 5),
(44, 1),
(44, 5),
(45, 1),
(45, 5),
(46, 1),
(46, 5),
(47, 1),
(48, 1),
(49, 1),
(50, 1),
(51, 1),
(57, 1),
(58, 1),
(59, 1),
(60, 1),
(61, 1),
(62, 1),
(63, 1),
(64, 1),
(65, 1),
(66, 1),
(72, 1),
(72, 4),
(72, 5),
(72, 6),
(73, 1),
(73, 4),
(73, 5),
(73, 6),
(74, 1),
(74, 4),
(74, 5),
(74, 6),
(75, 1),
(75, 4),
(75, 5),
(75, 6),
(76, 1),
(76, 4),
(76, 5),
(76, 6),
(77, 1),
(77, 4),
(77, 5),
(77, 6),
(78, 1),
(78, 4),
(78, 5),
(78, 6),
(79, 1),
(79, 4),
(79, 5),
(79, 6),
(80, 1),
(80, 4),
(80, 5),
(80, 6),
(81, 1),
(81, 4),
(81, 5),
(81, 6),
(82, 1),
(82, 3),
(82, 4),
(82, 5),
(82, 6),
(83, 1),
(83, 3),
(83, 4),
(83, 5),
(83, 6),
(84, 1),
(84, 4),
(84, 5),
(84, 6),
(85, 1),
(85, 5),
(85, 6),
(86, 1),
(86, 5),
(87, 1),
(88, 1),
(89, 1),
(90, 1),
(91, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personas`
--

CREATE TABLE `personas` (
  `id` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `apellido` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dni` int(11) DEFAULT NULL,
  `cuit` bigint(14) NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `empleado_agrimensor` bit(1) DEFAULT b'0',
  `domicilio` varchar(75) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `personas`
--

INSERT INTO `personas` (`id`, `nombre`, `apellido`, `dni`, `cuit`, `email`, `empleado_agrimensor`, `domicilio`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Juan Martin', 'De San Martin', 12123456, 10121234569, 'sanmartin@gmail.com', b'1', 'Calle Mendoza al 1899 norte', '2021-01-12 01:26:44', '2021-01-12 01:27:32', NULL),
(2, 'Lionel', 'Messi', 12124542, 10141477419, 'messi@gmail.com', b'1', 'Madrid , en españa', '2021-01-12 16:17:28', '2021-01-12 16:17:28', NULL),
(3, 'Melisa', 'Rodriguez', 23123321, 20121233218, 'melisa@gmail.com', b'0', 'Calle Agustin Gomez 454 oeste', '2021-01-12 16:19:37', '2021-01-12 16:19:37', NULL),
(4, 'Jose', 'Perez', 23321456, 21233214560, 'juan@hotmail.com', b'1', 'Mendoza y Libertador', '2021-01-23 19:29:27', '2021-01-23 19:29:27', NULL),
(5, 'Anton', 'Martín', 15147741, 20151477412, 'antonmartin@gmail.com', b'1', 'calle mendoza 1151 norte', '2021-02-02 21:32:24', '2021-02-02 21:32:24', NULL),
(6, 'Natalia', 'Cervantes', 15147341, 20151473412, 'natalia@gmail.com', b'1', 'Calle Libertador 3231 este', '2021-02-02 21:33:04', '2021-02-02 21:33:04', NULL),
(7, 'Zahra', 'Mas', 14741145, 10147411453, 'Zahra@Zahra.com', b'1', 'Calle Lavalle 2312 norte', '2021-02-02 21:33:51', '2021-02-02 21:33:51', NULL),
(8, 'Rayan', 'Fraile', 47741147, 12477411470, 'Rayan@Rayan.com', b'1', 'Avendida circunvalacion 2312 este', '2021-02-02 21:34:34', '2021-02-02 21:34:34', NULL),
(9, 'Nina', 'Leiva', 45654456, 41454566547, 'leiva@gmail.com', b'1', 'calle de las moras 232 este', '2021-02-02 21:35:17', '2021-02-02 21:35:17', NULL),
(10, 'Martina', 'Parra', 15665432, 32156654321, 'martina@gmail.com', b'1', 'Avenida Candela Porras, Apto 5', '2021-02-02 21:36:34', '2021-02-02 21:37:41', NULL),
(11, 'Hugo', 'Peña', 21441452, 21214414521, 'hugo@gmail.com', b'1', 'Callejón Martin Garay, Apto 3', '2021-02-02 21:37:33', '2021-02-02 21:37:33', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `posts`
--

CREATE TABLE `posts` (
  `id` int(10) UNSIGNED NOT NULL,
  `author_id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `seo_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `excerpt` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_keywords` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('PUBLISHED','DRAFT','PENDING') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'DRAFT',
  `featured` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `posts`
--

INSERT INTO `posts` (`id`, `author_id`, `category_id`, `title`, `seo_title`, `excerpt`, `body`, `image`, `slug`, `meta_description`, `meta_keywords`, `status`, `featured`, `created_at`, `updated_at`) VALUES
(1, 0, NULL, 'Lorem Ipsum Post', NULL, 'This is the excerpt for the Lorem Ipsum Post', '<p>This is the body of the lorem ipsum post</p>', 'posts/post1.jpg', 'lorem-ipsum-post', 'This is the meta description', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2021-01-12 00:02:26', '2021-01-12 00:02:26'),
(2, 0, NULL, 'My Sample Post', NULL, 'This is the excerpt for the sample Post', '<p>This is the body for the sample post, which includes the body.</p>\r\n                <h2>We can use all kinds of format!</h2>\r\n                <p>And include a bunch of other stuff.</p>', 'posts/post2.jpg', 'my-sample-post', 'Meta Description for sample post', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2021-01-12 00:02:26', '2021-01-12 00:02:26'),
(3, 0, NULL, 'Latest Post', NULL, 'This is the excerpt for the latest post', '<p>This is the body for the latest post</p>', 'posts/post3.jpg', 'latest-post', 'This is the meta description', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2021-01-12 00:02:26', '2021-01-12 00:02:26'),
(4, 0, NULL, 'Yarr Post', NULL, 'Reef sails nipperkin bring a spring upon her cable coffer jury mast spike marooned Pieces of Eight poop deck pillage. Clipper driver coxswain galleon hempen halter come about pressgang gangplank boatswain swing the lead. Nipperkin yard skysail swab lanyard Blimey bilge water ho quarter Buccaneer.', '<p>Swab deadlights Buccaneer fire ship square-rigged dance the hempen jig weigh anchor cackle fruit grog furl. Crack Jennys tea cup chase guns pressgang hearties spirits hogshead Gold Road six pounders fathom measured fer yer chains. Main sheet provost come about trysail barkadeer crimp scuttle mizzenmast brig plunder.</p>\r\n<p>Mizzen league keelhaul galleon tender cog chase Barbary Coast doubloon crack Jennys tea cup. Blow the man down lugsail fire ship pinnace cackle fruit line warp Admiral of the Black strike colors doubloon. Tackle Jack Ketch come about crimp rum draft scuppers run a shot across the bow haul wind maroon.</p>\r\n<p>Interloper heave down list driver pressgang holystone scuppers tackle scallywag bilged on her anchor. Jack Tar interloper draught grapple mizzenmast hulk knave cable transom hogshead. Gaff pillage to go on account grog aft chase guns piracy yardarm knave clap of thunder.</p>', 'posts/post4.jpg', 'yarr-post', 'this be a meta descript', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2021-01-12 00:02:27', '2021-01-12 00:02:27');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`id`, `name`, `display_name`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'Administrator', '2021-01-12 00:02:22', '2021-01-12 00:02:22'),
(2, 'user', 'Normal User', '2021-01-12 00:02:22', '2021-01-12 00:02:22'),
(3, 'agrimensor', 'Profesional de la Agrimensura', '2021-01-26 20:10:20', '2021-01-26 20:10:20'),
(4, 'empleadodgr', 'Empleado DGR', '2021-02-02 21:26:27', '2021-02-02 21:26:27'),
(5, 'directivos', 'Directivos', '2021-02-10 15:29:24', '2021-02-10 15:29:24'),
(6, 'mesaentrada', 'Mesa de Entrada', '2021-02-11 00:04:41', '2021-02-11 00:04:41');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `settings`
--

CREATE TABLE `settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `details` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int(11) NOT NULL DEFAULT 1,
  `group` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `settings`
--

INSERT INTO `settings` (`id`, `key`, `display_name`, `value`, `details`, `type`, `order`, `group`) VALUES
(1, 'site.title', 'Site Title', 'CPASJ Expedientes', '', 'text', 1, 'Site'),
(2, 'site.description', 'Site Description', 'Administracion de Expdientes del Colegio de Profesionales de la Agrimensura de San Juan', '', 'text', 2, 'Site'),
(3, 'site.logo', 'Site Logo', 'settings\\January2021\\mz5nzmxtu3QoBRLLNWKR.jpg', '', 'image', 3, 'Site'),
(4, 'site.google_analytics_tracking_id', 'Google Analytics Tracking ID', NULL, '', 'text', 4, 'Site'),
(5, 'admin.bg_image', 'Admin Background Image', 'settings\\January2021\\lUgNWDltw2qwNcz7rm5G.jpg', '', 'image', 5, 'Admin'),
(6, 'admin.title', 'Admin Title', 'CPASJ', '', 'text', 1, 'Admin'),
(7, 'admin.description', 'Admin Description', 'Colegio de Profesionales de la Agrimensura de San Juan', '', 'text', 2, 'Admin'),
(8, 'admin.loader', 'Admin Loader', 'settings\\February2021\\wbfJUSl2X5RJeO8JtiGV.jpg', '', 'image', 3, 'Admin'),
(9, 'admin.icon_image', 'Admin Icon Image', 'settings\\January2021\\zDXXIYW3IisdF2QQCf3D.png', '', 'image', 4, 'Admin'),
(10, 'admin.google_analytics_client_id', 'Google Analytics Client ID (used for admin dashboard)', NULL, '', 'text', 1, 'Admin');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tramites`
--

CREATE TABLE `tramites` (
  `id` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file1` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `file2` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `file3` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `file4` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `file5` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `file6` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `file7` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `file8` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `file9` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `file10` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `file11` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `file12` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `file13` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `file14` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `file15` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `file16` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `file17` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `tramites`
--

INSERT INTO `tramites` (`id`, `nombre`, `descripcion`, `file1`, `file2`, `file3`, `file4`, `file5`, `file6`, `file7`, `file8`, `file9`, `file10`, `file11`, `file12`, `file13`, `file14`, `file15`, `file16`, `file17`, `created_by`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Prescripción Adquisitiva', 'cuando se desea dividir un terreno en tres', 'Orden de trabajo.', 'Memoria de Mensura.', 'Acta de Mensura.', 'Relación de Título.', 'Comunicación Web de Mensura para Usucapión.', 'Constancia de Citación de Colindantes con acuse de recibo (Fiscalía de Estado,', 'Municipalidad, Dpto. De Hidraúlica, I.P.V., AABE, etc...si correspondiere.', 'Copia de Minuta de Dominio.', 'Publicidad de Edicto.', 'Acta de Linea.', 'Planilla de Mejoras.', 'Copia Testigo.', 'Poliester.(no se admiten correcciones posteriores)', 'Factibilidad de Hidraúlica.', NULL, NULL, NULL, NULL, '2021-01-12 00:46:13', '2021-01-12 01:00:28', NULL),
(2, 'Mensura de Título', 'sirve para vender terrenos', 'Orden de trabajo.', 'Memoria de Mensura.', 'Acta de Mensura', 'Constancia de Citación de Colindantes con acuse de recibo.', 'Relación de Título.', 'Copia de Minuta de Dominio.', 'Publicidad de Edictos.', 'Planilla de Mejoras.', 'Factibilidad de Hidraúlica.', 'Poder de Titular o Boleto de Compra Venta ante Escribano Público.', 'Declaratoria de Herederos.', 'Intervención de Físcalia de Estado.', 'Copia Testigo.', 'Poliester.(no se admiten correcciones posteriores)', 'Acta de Linea si correspondiere.', 'otros', NULL, NULL, '2021-01-12 00:58:58', '2021-01-12 00:58:58', NULL),
(3, 'Mensura y División', 'Es para hacer su sucesion', 'Orden de trabajo.', 'Memoria de Mensura.', 'Acta de Mensura.', 'Anteproyecto de factibilidad otorgado por la D.P.D.U.', 'Acta de Linea.', 'Relación de Título.', 'Publicidad de Edictos-Constancia de citación de colindantes con acuse de recibo.', 'Planilla de Mejoras.', 'Factibilidad de Hidraúlica.', 'Poder de Titular o Boleto de Compra Venta ante Escribano Público.', 'Declaratoria de Herederos y Partición.', 'Intervención de Físcalia de Estado.', 'Copia Testigo.', 'Poliester.(no se admiten correcciones posteriores)', 'Libre deuda expedido por la Dirección General de Rentas', 'otros', NULL, NULL, '2021-01-23 19:27:20', '2021-01-23 19:27:20', NULL),
(4, 'Mensura PH', 'sin descripcion', 'Orden de trabajo.', 'Memoria de Mensura.', 'Acta de Mensura.', 'Constancia de Citación de Colindantes con acuse de recibo.', 'Relación de Título', 'Publicidad de Edictos', 'Plano de Obra.', 'Certificado Final de Obra.', 'Planilla de Mejoras.', 'Poder de Titular o Boleto de Compra Venta ante Escribano Público.', 'Declaratoria de Herederos y Partición.', 'Intervención de Físcalia de Estado.', 'Copia Testigo.', 'Poliester.(no se admiten correcciones posteriores)', 'Acta de Linea si correspondiere.', 'Libre deuda expedido por la Dirección General de Rentas.', NULL, NULL, NULL, NULL, NULL),
(5, 'Mensura CI', 'sin descripcion', 'Orden de trabajo.', 'Memoria de Mensura.', 'Acta de Mensura.', 'Constancia de Citación de Colindantes con acuse de recibo.', 'Relación de Título.', 'Publicidad de Edictos.', 'Anteproyecto de factibilidad ootorgado por la D.P.D.U.', 'Factibilidad de Uso de Suelo', 'Planilla de Mejoras.', 'Poder de Titular o Boleto de Compra Venta ante Escribano Público.', 'Declaratoria de Herederos y Partición.', 'Intervención de Físcalia de Estado.', 'Copia Testigo.', 'Poliester.(no se admiten correcciones posteriores)', 'Acta de Linea si correspondiere.', 'Certificado Final de O.S.S.E.', 'Libre deuda expedido por la Dirección General de Rentas.', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `translations`
--

CREATE TABLE `translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `table_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `column_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `foreign_key` int(10) UNSIGNED NOT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `translations`
--

INSERT INTO `translations` (`id`, `table_name`, `column_name`, `foreign_key`, `locale`, `value`, `created_at`, `updated_at`) VALUES
(1, 'data_types', 'display_name_singular', 5, 'pt', 'Post', '2021-01-12 00:02:27', '2021-01-12 00:02:27'),
(2, 'data_types', 'display_name_singular', 6, 'pt', 'Página', '2021-01-12 00:02:27', '2021-01-12 00:02:27'),
(3, 'data_types', 'display_name_singular', 1, 'pt', 'Utilizador', '2021-01-12 00:02:27', '2021-01-12 00:02:27'),
(4, 'data_types', 'display_name_singular', 4, 'pt', 'Categoria', '2021-01-12 00:02:27', '2021-01-12 00:02:27'),
(5, 'data_types', 'display_name_singular', 2, 'pt', 'Menu', '2021-01-12 00:02:27', '2021-01-12 00:02:27'),
(6, 'data_types', 'display_name_singular', 3, 'pt', 'Função', '2021-01-12 00:02:27', '2021-01-12 00:02:27'),
(7, 'data_types', 'display_name_plural', 5, 'pt', 'Posts', '2021-01-12 00:02:27', '2021-01-12 00:02:27'),
(8, 'data_types', 'display_name_plural', 6, 'pt', 'Páginas', '2021-01-12 00:02:27', '2021-01-12 00:02:27'),
(9, 'data_types', 'display_name_plural', 1, 'pt', 'Utilizadores', '2021-01-12 00:02:27', '2021-01-12 00:02:27'),
(10, 'data_types', 'display_name_plural', 4, 'pt', 'Categorias', '2021-01-12 00:02:27', '2021-01-12 00:02:27'),
(11, 'data_types', 'display_name_plural', 2, 'pt', 'Menus', '2021-01-12 00:02:27', '2021-01-12 00:02:27'),
(12, 'data_types', 'display_name_plural', 3, 'pt', 'Funções', '2021-01-12 00:02:27', '2021-01-12 00:02:27'),
(13, 'categories', 'slug', 1, 'pt', 'categoria-1', '2021-01-12 00:02:27', '2021-01-12 00:02:27'),
(14, 'categories', 'name', 1, 'pt', 'Categoria 1', '2021-01-12 00:02:27', '2021-01-12 00:02:27'),
(15, 'categories', 'slug', 2, 'pt', 'categoria-2', '2021-01-12 00:02:27', '2021-01-12 00:02:27'),
(16, 'categories', 'name', 2, 'pt', 'Categoria 2', '2021-01-12 00:02:27', '2021-01-12 00:02:27'),
(17, 'pages', 'title', 1, 'pt', 'Olá Mundo', '2021-01-12 00:02:27', '2021-01-12 00:02:27'),
(18, 'pages', 'slug', 1, 'pt', 'ola-mundo', '2021-01-12 00:02:27', '2021-01-12 00:02:27'),
(19, 'pages', 'body', 1, 'pt', '<p>Olá Mundo. Scallywag grog swab Cat o\'nine tails scuttle rigging hardtack cable nipper Yellow Jack. Handsomely spirits knave lad killick landlubber or just lubber deadlights chantey pinnace crack Jennys tea cup. Provost long clothes black spot Yellow Jack bilged on her anchor league lateen sail case shot lee tackle.</p>\r\n<p>Ballast spirits fluke topmast me quarterdeck schooner landlubber or just lubber gabion belaying pin. Pinnace stern galleon starboard warp carouser to go on account dance the hempen jig jolly boat measured fer yer chains. Man-of-war fire in the hole nipperkin handsomely doubloon barkadeer Brethren of the Coast gibbet driver squiffy.</p>', '2021-01-12 00:02:27', '2021-01-12 00:02:27'),
(20, 'menu_items', 'title', 1, 'pt', 'Painel de Controle', '2021-01-12 00:02:27', '2021-01-12 00:02:27'),
(21, 'menu_items', 'title', 2, 'pt', 'Media', '2021-01-12 00:02:27', '2021-01-12 00:02:27'),
(22, 'menu_items', 'title', 12, 'pt', 'Publicações', '2021-01-12 00:02:27', '2021-01-12 00:02:27'),
(23, 'menu_items', 'title', 3, 'pt', 'Utilizadores', '2021-01-12 00:02:27', '2021-01-12 00:02:27'),
(24, 'menu_items', 'title', 11, 'pt', 'Categorias', '2021-01-12 00:02:27', '2021-01-12 00:02:27'),
(25, 'menu_items', 'title', 13, 'pt', 'Páginas', '2021-01-12 00:02:27', '2021-01-12 00:02:27'),
(26, 'menu_items', 'title', 4, 'pt', 'Funções', '2021-01-12 00:02:27', '2021-01-12 00:02:27'),
(27, 'menu_items', 'title', 5, 'pt', 'Ferramentas', '2021-01-12 00:02:27', '2021-01-12 00:02:27'),
(28, 'menu_items', 'title', 6, 'pt', 'Menus', '2021-01-12 00:02:27', '2021-01-12 00:02:27'),
(29, 'menu_items', 'title', 7, 'pt', 'Base de dados', '2021-01-12 00:02:27', '2021-01-12 00:02:27'),
(30, 'menu_items', 'title', 10, 'pt', 'Configurações', '2021-01-12 00:02:27', '2021-01-12 00:02:27'),
(31, 'data_rows', 'display_name', 126, 'pt', 'Id', '2021-01-15 15:57:11', '2021-01-15 15:57:11'),
(32, 'data_rows', 'display_name', 126, 'es', 'Id', '2021-01-15 15:57:11', '2021-01-15 15:57:11'),
(33, 'data_rows', 'display_name', 127, 'pt', 'Numero Expediente', '2021-01-15 15:57:11', '2021-01-15 15:57:11'),
(34, 'data_rows', 'display_name', 127, 'es', 'Numero Expediente', '2021-01-15 15:57:11', '2021-01-15 15:57:11'),
(35, 'data_rows', 'display_name', 128, 'pt', 'Path Papeles', '2021-01-15 15:57:11', '2021-01-15 15:57:11'),
(36, 'data_rows', 'display_name', 128, 'es', 'Path Papeles', '2021-01-15 15:57:11', '2021-01-15 15:57:11'),
(37, 'data_rows', 'display_name', 129, 'pt', 'Id Tramite', '2021-01-15 15:57:11', '2021-01-15 15:57:11'),
(38, 'data_rows', 'display_name', 129, 'es', 'Id Tramite', '2021-01-15 15:57:11', '2021-01-15 15:57:11'),
(39, 'data_rows', 'display_name', 130, 'pt', 'Id Persona', '2021-01-15 15:57:11', '2021-01-15 15:57:11'),
(40, 'data_rows', 'display_name', 130, 'es', 'Id Persona', '2021-01-15 15:57:11', '2021-01-15 15:57:11'),
(41, 'data_rows', 'display_name', 131, 'pt', 'Created By', '2021-01-15 15:57:11', '2021-01-15 15:57:11'),
(42, 'data_rows', 'display_name', 131, 'es', 'Created By', '2021-01-15 15:57:11', '2021-01-15 15:57:11'),
(43, 'data_rows', 'display_name', 132, 'pt', 'Created At', '2021-01-15 15:57:11', '2021-01-15 15:57:11'),
(44, 'data_rows', 'display_name', 132, 'es', 'Created At', '2021-01-15 15:57:11', '2021-01-15 15:57:11'),
(45, 'data_rows', 'display_name', 133, 'pt', 'Updated At', '2021-01-15 15:57:11', '2021-01-15 15:57:11'),
(46, 'data_rows', 'display_name', 133, 'es', 'Updated At', '2021-01-15 15:57:11', '2021-01-15 15:57:11'),
(47, 'data_rows', 'display_name', 134, 'pt', 'Deleted At', '2021-01-15 15:57:11', '2021-01-15 15:57:11'),
(48, 'data_rows', 'display_name', 134, 'es', 'Deleted At', '2021-01-15 15:57:11', '2021-01-15 15:57:11'),
(49, 'data_rows', 'display_name', 135, 'pt', 'personas', '2021-01-15 15:57:11', '2021-01-15 15:57:11'),
(50, 'data_rows', 'display_name', 135, 'es', 'personas', '2021-01-15 15:57:11', '2021-01-15 15:57:11'),
(51, 'data_rows', 'display_name', 136, 'pt', 'tramites', '2021-01-15 15:57:11', '2021-01-15 15:57:11'),
(52, 'data_rows', 'display_name', 136, 'es', 'tramites', '2021-01-15 15:57:11', '2021-01-15 15:57:11'),
(53, 'data_types', 'display_name_singular', 15, 'pt', 'Expediente', '2021-01-15 15:57:11', '2021-01-15 15:57:11'),
(54, 'data_types', 'display_name_singular', 15, 'es', 'Expediente', '2021-01-15 15:57:11', '2021-01-15 15:57:11'),
(55, 'data_types', 'display_name_plural', 15, 'pt', 'Expedientes', '2021-01-15 15:57:11', '2021-01-15 15:57:11'),
(56, 'data_types', 'display_name_plural', 15, 'es', 'Expedientes', '2021-01-15 15:57:11', '2021-01-15 15:57:11'),
(57, 'data_rows', 'display_name', 104, 'pt', 'Id', '2021-01-16 18:47:07', '2021-01-16 18:47:07'),
(58, 'data_rows', 'display_name', 104, 'es', 'Id', '2021-01-16 18:47:07', '2021-01-16 18:47:07'),
(59, 'data_rows', 'display_name', 105, 'pt', 'Fecha Entrada', '2021-01-16 18:47:07', '2021-01-16 18:47:07'),
(60, 'data_rows', 'display_name', 105, 'es', 'Fecha Entrada', '2021-01-16 18:47:07', '2021-01-16 18:47:07'),
(61, 'data_rows', 'display_name', 106, 'pt', 'Fecha Salida', '2021-01-16 18:47:07', '2021-01-16 18:47:07'),
(62, 'data_rows', 'display_name', 106, 'es', 'Fecha Salida', '2021-01-16 18:47:07', '2021-01-16 18:47:07'),
(63, 'data_rows', 'display_name', 107, 'pt', 'Tiene Observacion?', '2021-01-16 18:47:07', '2021-01-16 18:47:07'),
(64, 'data_rows', 'display_name', 107, 'es', 'Tiene Observacion?', '2021-01-16 18:47:07', '2021-01-16 18:47:07'),
(65, 'data_rows', 'display_name', 108, 'pt', 'Observacion', '2021-01-16 18:47:07', '2021-01-16 18:47:07'),
(66, 'data_rows', 'display_name', 108, 'es', 'Observacion', '2021-01-16 18:47:07', '2021-01-16 18:47:07'),
(67, 'data_rows', 'display_name', 109, 'pt', 'Subsanacion', '2021-01-16 18:47:07', '2021-01-16 18:47:07'),
(68, 'data_rows', 'display_name', 109, 'es', 'Subsanacion', '2021-01-16 18:47:07', '2021-01-16 18:47:07'),
(69, 'data_rows', 'display_name', 110, 'pt', 'Id Area', '2021-01-16 18:47:07', '2021-01-16 18:47:07'),
(70, 'data_rows', 'display_name', 110, 'es', 'Id Area', '2021-01-16 18:47:07', '2021-01-16 18:47:07'),
(71, 'data_rows', 'display_name', 111, 'pt', 'Id Expediente', '2021-01-16 18:47:07', '2021-01-16 18:47:07'),
(72, 'data_rows', 'display_name', 111, 'es', 'Id Expediente', '2021-01-16 18:47:07', '2021-01-16 18:47:07'),
(73, 'data_rows', 'display_name', 112, 'pt', 'Finalizó?', '2021-01-16 18:47:07', '2021-01-16 18:47:07'),
(74, 'data_rows', 'display_name', 112, 'es', 'Finalizó?', '2021-01-16 18:47:07', '2021-01-16 18:47:07'),
(75, 'data_rows', 'display_name', 113, 'pt', 'Created By', '2021-01-16 18:47:07', '2021-01-16 18:47:07'),
(76, 'data_rows', 'display_name', 113, 'es', 'Created By', '2021-01-16 18:47:07', '2021-01-16 18:47:07'),
(77, 'data_rows', 'display_name', 114, 'pt', 'Created At', '2021-01-16 18:47:07', '2021-01-16 18:47:07'),
(78, 'data_rows', 'display_name', 114, 'es', 'Created At', '2021-01-16 18:47:07', '2021-01-16 18:47:07'),
(79, 'data_rows', 'display_name', 115, 'pt', 'Updated At', '2021-01-16 18:47:07', '2021-01-16 18:47:07'),
(80, 'data_rows', 'display_name', 115, 'es', 'Updated At', '2021-01-16 18:47:07', '2021-01-16 18:47:07'),
(81, 'data_rows', 'display_name', 116, 'pt', 'Deleted At', '2021-01-16 18:47:07', '2021-01-16 18:47:07'),
(82, 'data_rows', 'display_name', 116, 'es', 'Deleted At', '2021-01-16 18:47:07', '2021-01-16 18:47:07'),
(83, 'data_rows', 'display_name', 117, 'pt', 'areas', '2021-01-16 18:47:07', '2021-01-16 18:47:07'),
(84, 'data_rows', 'display_name', 117, 'es', 'areas', '2021-01-16 18:47:07', '2021-01-16 18:47:07'),
(85, 'data_types', 'display_name_singular', 13, 'pt', 'Movimiento', '2021-01-16 18:47:07', '2021-01-16 18:47:07'),
(86, 'data_types', 'display_name_singular', 13, 'es', 'Movimiento', '2021-01-16 18:47:07', '2021-01-16 18:47:07'),
(87, 'data_types', 'display_name_plural', 13, 'pt', 'Movimientos', '2021-01-16 18:47:07', '2021-01-16 18:47:07'),
(88, 'data_types', 'display_name_plural', 13, 'es', 'Movimientos', '2021-01-16 18:47:07', '2021-01-16 18:47:07'),
(89, 'data_rows', 'display_name', 137, 'pt', 'File1', '2021-01-26 15:59:44', '2021-01-26 15:59:44'),
(90, 'data_rows', 'display_name', 137, 'es', 'File1', '2021-01-26 15:59:44', '2021-01-26 15:59:44'),
(91, 'data_rows', 'display_name', 138, 'pt', 'File2', '2021-01-26 15:59:44', '2021-01-26 15:59:44'),
(92, 'data_rows', 'display_name', 138, 'es', 'File2', '2021-01-26 15:59:44', '2021-01-26 15:59:44'),
(93, 'data_rows', 'display_name', 139, 'pt', 'File3', '2021-01-26 15:59:44', '2021-01-26 15:59:44'),
(94, 'data_rows', 'display_name', 139, 'es', 'File3', '2021-01-26 15:59:44', '2021-01-26 15:59:44'),
(95, 'data_rows', 'display_name', 140, 'pt', 'File4', '2021-01-26 15:59:44', '2021-01-26 15:59:44'),
(96, 'data_rows', 'display_name', 140, 'es', 'File4', '2021-01-26 15:59:44', '2021-01-26 15:59:44'),
(97, 'data_rows', 'display_name', 141, 'pt', 'File5', '2021-01-26 15:59:44', '2021-01-26 15:59:44'),
(98, 'data_rows', 'display_name', 141, 'es', 'File5', '2021-01-26 15:59:44', '2021-01-26 15:59:44'),
(99, 'data_rows', 'display_name', 142, 'pt', 'File6', '2021-01-26 15:59:44', '2021-01-26 15:59:44'),
(100, 'data_rows', 'display_name', 142, 'es', 'File6', '2021-01-26 15:59:44', '2021-01-26 15:59:44'),
(101, 'data_rows', 'display_name', 143, 'pt', 'File7', '2021-01-26 15:59:44', '2021-01-26 15:59:44'),
(102, 'data_rows', 'display_name', 143, 'es', 'File7', '2021-01-26 15:59:44', '2021-01-26 15:59:44'),
(103, 'data_rows', 'display_name', 144, 'pt', 'File8', '2021-01-26 15:59:44', '2021-01-26 15:59:44'),
(104, 'data_rows', 'display_name', 144, 'es', 'File8', '2021-01-26 15:59:44', '2021-01-26 15:59:44'),
(105, 'data_rows', 'display_name', 145, 'pt', 'File9', '2021-01-26 15:59:44', '2021-01-26 15:59:44'),
(106, 'data_rows', 'display_name', 145, 'es', 'File9', '2021-01-26 15:59:44', '2021-01-26 15:59:44'),
(107, 'data_rows', 'display_name', 146, 'pt', 'File10', '2021-01-26 15:59:44', '2021-01-26 15:59:44'),
(108, 'data_rows', 'display_name', 146, 'es', 'File10', '2021-01-26 15:59:44', '2021-01-26 15:59:44'),
(109, 'data_rows', 'display_name', 147, 'pt', 'File11', '2021-01-26 15:59:44', '2021-01-26 15:59:44'),
(110, 'data_rows', 'display_name', 147, 'es', 'File11', '2021-01-26 15:59:44', '2021-01-26 15:59:44'),
(111, 'data_rows', 'display_name', 148, 'pt', 'File12', '2021-01-26 15:59:44', '2021-01-26 15:59:44'),
(112, 'data_rows', 'display_name', 148, 'es', 'File12', '2021-01-26 15:59:44', '2021-01-26 15:59:44'),
(113, 'data_rows', 'display_name', 149, 'pt', 'File13', '2021-01-26 15:59:44', '2021-01-26 15:59:44'),
(114, 'data_rows', 'display_name', 149, 'es', 'File13', '2021-01-26 15:59:44', '2021-01-26 15:59:44'),
(115, 'data_rows', 'display_name', 150, 'pt', 'File14', '2021-01-26 15:59:44', '2021-01-26 15:59:44'),
(116, 'data_rows', 'display_name', 150, 'es', 'File14', '2021-01-26 15:59:44', '2021-01-26 15:59:44'),
(117, 'data_rows', 'display_name', 151, 'pt', 'File15', '2021-01-26 15:59:44', '2021-01-26 15:59:44'),
(118, 'data_rows', 'display_name', 151, 'es', 'File15', '2021-01-26 15:59:44', '2021-01-26 15:59:44'),
(119, 'data_rows', 'display_name', 152, 'pt', 'File16', '2021-01-26 15:59:44', '2021-01-26 15:59:44'),
(120, 'data_rows', 'display_name', 152, 'es', 'File16', '2021-01-26 15:59:44', '2021-01-26 15:59:44'),
(121, 'data_rows', 'display_name', 153, 'pt', 'File17', '2021-01-26 15:59:44', '2021-01-26 15:59:44'),
(122, 'data_rows', 'display_name', 153, 'es', 'File17', '2021-01-26 15:59:44', '2021-01-26 15:59:44'),
(123, 'data_rows', 'display_name', 74, 'pt', 'Id', '2021-01-26 19:56:46', '2021-01-26 19:56:46'),
(124, 'data_rows', 'display_name', 74, 'es', 'Id', '2021-01-26 19:56:46', '2021-01-26 19:56:46'),
(125, 'data_rows', 'display_name', 75, 'pt', 'Oficina', '2021-01-26 19:56:46', '2021-01-26 19:56:46'),
(126, 'data_rows', 'display_name', 75, 'es', 'Oficina', '2021-01-26 19:56:46', '2021-01-26 19:56:46'),
(127, 'data_rows', 'display_name', 76, 'pt', 'Id Area', '2021-01-26 19:56:46', '2021-01-26 19:56:46'),
(128, 'data_rows', 'display_name', 76, 'es', 'Id Area', '2021-01-26 19:56:46', '2021-01-26 19:56:46'),
(129, 'data_rows', 'display_name', 77, 'pt', 'Id Persona', '2021-01-26 19:56:46', '2021-01-26 19:56:46'),
(130, 'data_rows', 'display_name', 77, 'es', 'Id Persona', '2021-01-26 19:56:46', '2021-01-26 19:56:46'),
(131, 'data_rows', 'display_name', 78, 'pt', 'Created By', '2021-01-26 19:56:46', '2021-01-26 19:56:46'),
(132, 'data_rows', 'display_name', 78, 'es', 'Created By', '2021-01-26 19:56:46', '2021-01-26 19:56:46'),
(133, 'data_rows', 'display_name', 79, 'pt', 'Created At', '2021-01-26 19:56:46', '2021-01-26 19:56:46'),
(134, 'data_rows', 'display_name', 79, 'es', 'Created At', '2021-01-26 19:56:46', '2021-01-26 19:56:46'),
(135, 'data_rows', 'display_name', 80, 'pt', 'Updated At', '2021-01-26 19:56:46', '2021-01-26 19:56:46'),
(136, 'data_rows', 'display_name', 80, 'es', 'Updated At', '2021-01-26 19:56:46', '2021-01-26 19:56:46'),
(137, 'data_rows', 'display_name', 81, 'pt', 'Deleted At', '2021-01-26 19:56:46', '2021-01-26 19:56:46'),
(138, 'data_rows', 'display_name', 81, 'es', 'Deleted At', '2021-01-26 19:56:46', '2021-01-26 19:56:46'),
(139, 'data_rows', 'display_name', 82, 'pt', 'personas', '2021-01-26 19:56:46', '2021-01-26 19:56:46'),
(140, 'data_rows', 'display_name', 82, 'es', 'personas', '2021-01-26 19:56:46', '2021-01-26 19:56:46'),
(141, 'data_rows', 'display_name', 90, 'pt', 'areas', '2021-01-26 19:56:46', '2021-01-26 19:56:46'),
(142, 'data_rows', 'display_name', 90, 'es', 'areas', '2021-01-26 19:56:46', '2021-01-26 19:56:46'),
(143, 'data_types', 'display_name_singular', 10, 'pt', 'Areaempleado', '2021-01-26 19:56:46', '2021-01-26 19:56:46'),
(144, 'data_types', 'display_name_singular', 10, 'es', 'Areaempleado', '2021-01-26 19:56:46', '2021-01-26 19:56:46'),
(145, 'data_types', 'display_name_plural', 10, 'pt', 'Areaempleados', '2021-01-26 19:56:46', '2021-01-26 19:56:46'),
(146, 'data_types', 'display_name_plural', 10, 'es', 'Areaempleados', '2021-01-26 19:56:46', '2021-01-26 19:56:46'),
(147, 'data_rows', 'display_name', 56, 'pt', 'Id', '2021-01-26 20:02:45', '2021-01-26 20:02:45'),
(148, 'data_rows', 'display_name', 56, 'es', 'Id', '2021-01-26 20:02:45', '2021-01-26 20:02:45'),
(149, 'data_rows', 'display_name', 57, 'pt', 'Nombre', '2021-01-26 20:02:45', '2021-01-26 20:02:45'),
(150, 'data_rows', 'display_name', 57, 'es', 'Nombre', '2021-01-26 20:02:45', '2021-01-26 20:02:45'),
(151, 'data_rows', 'display_name', 58, 'pt', 'Descripcion', '2021-01-26 20:02:45', '2021-01-26 20:02:45'),
(152, 'data_rows', 'display_name', 58, 'es', 'Descripcion', '2021-01-26 20:02:45', '2021-01-26 20:02:45'),
(153, 'data_rows', 'display_name', 59, 'pt', 'Created By', '2021-01-26 20:02:45', '2021-01-26 20:02:45'),
(154, 'data_rows', 'display_name', 59, 'es', 'Created By', '2021-01-26 20:02:45', '2021-01-26 20:02:45'),
(155, 'data_rows', 'display_name', 60, 'pt', 'Created At', '2021-01-26 20:02:45', '2021-01-26 20:02:45'),
(156, 'data_rows', 'display_name', 60, 'es', 'Created At', '2021-01-26 20:02:45', '2021-01-26 20:02:45'),
(157, 'data_rows', 'display_name', 61, 'pt', 'Updated At', '2021-01-26 20:02:45', '2021-01-26 20:02:45'),
(158, 'data_rows', 'display_name', 61, 'es', 'Updated At', '2021-01-26 20:02:45', '2021-01-26 20:02:45'),
(159, 'data_rows', 'display_name', 62, 'pt', 'Deleted At', '2021-01-26 20:02:45', '2021-01-26 20:02:45'),
(160, 'data_rows', 'display_name', 62, 'es', 'Deleted At', '2021-01-26 20:02:45', '2021-01-26 20:02:45'),
(161, 'data_types', 'display_name_singular', 7, 'pt', 'Tramite', '2021-01-26 20:02:45', '2021-01-26 20:02:45'),
(162, 'data_types', 'display_name_singular', 7, 'es', 'Tramite', '2021-01-26 20:02:45', '2021-01-26 20:02:45'),
(163, 'data_types', 'display_name_plural', 7, 'pt', 'Tramites', '2021-01-26 20:02:45', '2021-01-26 20:02:45'),
(164, 'data_types', 'display_name_plural', 7, 'es', 'Tramites', '2021-01-26 20:02:45', '2021-01-26 20:02:45'),
(165, 'data_rows', 'display_name', 1, 'pt', 'ID', '2021-01-28 16:33:46', '2021-01-28 16:33:46'),
(166, 'data_rows', 'display_name', 1, 'es', 'ID', '2021-01-28 16:33:46', '2021-01-28 16:33:46'),
(167, 'data_rows', 'display_name', 21, 'pt', 'Role', '2021-01-28 16:33:46', '2021-01-28 16:33:46'),
(168, 'data_rows', 'display_name', 21, 'es', 'Role', '2021-01-28 16:33:46', '2021-01-28 16:33:46'),
(169, 'data_rows', 'display_name', 2, 'pt', 'Name', '2021-01-28 16:33:46', '2021-01-28 16:33:46'),
(170, 'data_rows', 'display_name', 2, 'es', 'Name', '2021-01-28 16:33:46', '2021-01-28 16:33:46'),
(171, 'data_rows', 'display_name', 3, 'pt', 'Email', '2021-01-28 16:33:46', '2021-01-28 16:33:46'),
(172, 'data_rows', 'display_name', 3, 'es', 'Email', '2021-01-28 16:33:46', '2021-01-28 16:33:46'),
(173, 'data_rows', 'display_name', 8, 'pt', 'Avatar', '2021-01-28 16:33:46', '2021-01-28 16:33:46'),
(174, 'data_rows', 'display_name', 8, 'es', 'Avatar', '2021-01-28 16:33:46', '2021-01-28 16:33:46'),
(175, 'data_rows', 'display_name', 4, 'pt', 'Password', '2021-01-28 16:33:46', '2021-01-28 16:33:46'),
(176, 'data_rows', 'display_name', 4, 'es', 'Password', '2021-01-28 16:33:46', '2021-01-28 16:33:46'),
(177, 'data_rows', 'display_name', 5, 'pt', 'Remember Token', '2021-01-28 16:33:46', '2021-01-28 16:33:46'),
(178, 'data_rows', 'display_name', 5, 'es', 'Remember Token', '2021-01-28 16:33:46', '2021-01-28 16:33:46'),
(179, 'data_rows', 'display_name', 11, 'pt', 'Settings', '2021-01-28 16:33:46', '2021-01-28 16:33:46'),
(180, 'data_rows', 'display_name', 11, 'es', 'Settings', '2021-01-28 16:33:46', '2021-01-28 16:33:46'),
(181, 'data_rows', 'display_name', 6, 'pt', 'Created At', '2021-01-28 16:33:46', '2021-01-28 16:33:46'),
(182, 'data_rows', 'display_name', 6, 'es', 'Created At', '2021-01-28 16:33:46', '2021-01-28 16:33:46'),
(183, 'data_rows', 'display_name', 7, 'pt', 'Updated At', '2021-01-28 16:33:46', '2021-01-28 16:33:46'),
(184, 'data_rows', 'display_name', 7, 'es', 'Updated At', '2021-01-28 16:33:46', '2021-01-28 16:33:46'),
(185, 'data_rows', 'display_name', 9, 'pt', 'Role', '2021-01-28 16:33:46', '2021-01-28 16:33:46'),
(186, 'data_rows', 'display_name', 9, 'es', 'Role', '2021-01-28 16:33:46', '2021-01-28 16:33:46'),
(187, 'data_rows', 'display_name', 10, 'pt', 'Roles', '2021-01-28 16:33:46', '2021-01-28 16:33:46'),
(188, 'data_rows', 'display_name', 10, 'es', 'Roles', '2021-01-28 16:33:46', '2021-01-28 16:33:46'),
(189, 'data_rows', 'display_name', 171, 'pt', 'areas', '2021-01-28 16:33:46', '2021-01-28 16:33:46'),
(190, 'data_rows', 'display_name', 171, 'es', 'areas', '2021-01-28 16:33:46', '2021-01-28 16:33:46'),
(191, 'data_types', 'display_name_singular', 1, 'es', 'User', '2021-01-28 16:33:46', '2021-01-28 16:33:46'),
(192, 'data_types', 'display_name_plural', 1, 'es', 'Users', '2021-01-28 16:33:46', '2021-01-28 16:33:46'),
(193, 'data_rows', 'display_name', 172, 'pt', 'Email Verified At', '2021-01-28 18:28:17', '2021-01-28 18:28:17'),
(194, 'data_rows', 'display_name', 172, 'es', 'Email Verified At', '2021-01-28 18:28:17', '2021-01-28 18:28:17'),
(195, 'data_rows', 'display_name', 173, 'pt', 'Domicilio', '2021-01-28 18:28:17', '2021-01-28 18:28:17'),
(196, 'data_rows', 'display_name', 173, 'es', 'Domicilio', '2021-01-28 18:28:17', '2021-01-28 18:28:17'),
(197, 'data_rows', 'display_name', 174, 'pt', 'Cuil', '2021-01-28 18:28:17', '2021-01-28 18:28:17'),
(198, 'data_rows', 'display_name', 174, 'es', 'Cuil', '2021-01-28 18:28:17', '2021-01-28 18:28:17'),
(199, 'data_rows', 'display_name', 176, 'pt', 'Created By', '2021-01-28 18:28:17', '2021-01-28 18:28:17'),
(200, 'data_rows', 'display_name', 176, 'es', 'Created By', '2021-01-28 18:28:17', '2021-01-28 18:28:17'),
(201, 'data_rows', 'display_name', 177, 'pt', 'Id Area', '2021-01-28 18:28:17', '2021-01-28 18:28:17'),
(202, 'data_rows', 'display_name', 177, 'es', 'Id Area', '2021-01-28 18:28:17', '2021-01-28 18:28:17'),
(203, 'data_rows', 'display_name', 178, 'pt', 'Oficina', '2021-01-28 18:28:17', '2021-01-28 18:28:17'),
(204, 'data_rows', 'display_name', 178, 'es', 'Oficina', '2021-01-28 18:28:17', '2021-01-28 18:28:17'),
(205, 'data_rows', 'display_name', 179, 'pt', 'Empleado Dgr', '2021-01-28 18:42:39', '2021-01-28 18:42:39'),
(206, 'data_rows', 'display_name', 179, 'es', 'Empleado Dgr', '2021-01-28 18:42:39', '2021-01-28 18:42:39'),
(207, 'data_rows', 'display_name', 180, 'pt', 'Id', '2021-02-12 00:08:26', '2021-02-12 00:08:26'),
(208, 'data_rows', 'display_name', 180, 'es', 'Id', '2021-02-12 00:08:26', '2021-02-12 00:08:26'),
(209, 'data_rows', 'display_name', 181, 'pt', 'Nombretabla', '2021-02-12 00:08:26', '2021-02-12 00:08:26'),
(210, 'data_rows', 'display_name', 181, 'es', 'Nombretabla', '2021-02-12 00:08:26', '2021-02-12 00:08:26'),
(211, 'data_rows', 'display_name', 182, 'pt', 'Accion', '2021-02-12 00:08:26', '2021-02-12 00:08:26'),
(212, 'data_rows', 'display_name', 182, 'es', 'Accion', '2021-02-12 00:08:26', '2021-02-12 00:08:26'),
(213, 'data_rows', 'display_name', 183, 'pt', 'Valores Nuevos', '2021-02-12 00:08:26', '2021-02-12 00:08:26'),
(214, 'data_rows', 'display_name', 183, 'es', 'Valores Nuevos', '2021-02-12 00:08:26', '2021-02-12 00:08:26'),
(215, 'data_rows', 'display_name', 184, 'pt', 'Valores Viejos', '2021-02-12 00:08:26', '2021-02-12 00:08:26'),
(216, 'data_rows', 'display_name', 184, 'es', 'Valores Viejos', '2021-02-12 00:08:26', '2021-02-12 00:08:26'),
(217, 'data_rows', 'display_name', 185, 'pt', 'Id Modificado', '2021-02-12 00:08:26', '2021-02-12 00:08:26'),
(218, 'data_rows', 'display_name', 185, 'es', 'Id Modificado', '2021-02-12 00:08:26', '2021-02-12 00:08:26'),
(219, 'data_rows', 'display_name', 186, 'pt', 'Estado', '2021-02-12 00:08:26', '2021-02-12 00:08:26'),
(220, 'data_rows', 'display_name', 186, 'es', 'Estado', '2021-02-12 00:08:26', '2021-02-12 00:08:26'),
(221, 'data_rows', 'display_name', 187, 'pt', 'Created By', '2021-02-12 00:08:26', '2021-02-12 00:08:26'),
(222, 'data_rows', 'display_name', 187, 'es', 'Created By', '2021-02-12 00:08:26', '2021-02-12 00:08:26'),
(223, 'data_rows', 'display_name', 188, 'pt', 'Created At', '2021-02-12 00:08:26', '2021-02-12 00:08:26'),
(224, 'data_rows', 'display_name', 188, 'es', 'Created At', '2021-02-12 00:08:26', '2021-02-12 00:08:26'),
(225, 'data_rows', 'display_name', 189, 'pt', 'Updated At', '2021-02-12 00:08:26', '2021-02-12 00:08:26'),
(226, 'data_rows', 'display_name', 189, 'es', 'Updated At', '2021-02-12 00:08:26', '2021-02-12 00:08:26'),
(227, 'data_rows', 'display_name', 190, 'pt', 'Deleted At', '2021-02-12 00:08:26', '2021-02-12 00:08:26'),
(228, 'data_rows', 'display_name', 190, 'es', 'Deleted At', '2021-02-12 00:08:26', '2021-02-12 00:08:26'),
(229, 'data_types', 'display_name_singular', 16, 'pt', 'Log', '2021-02-12 00:08:26', '2021-02-12 00:08:26'),
(230, 'data_types', 'display_name_singular', 16, 'es', 'Log', '2021-02-12 00:08:26', '2021-02-12 00:08:26'),
(231, 'data_types', 'display_name_plural', 16, 'pt', 'Logs', '2021-02-12 00:08:26', '2021-02-12 00:08:26'),
(232, 'data_types', 'display_name_plural', 16, 'es', 'Logs', '2021-02-12 00:08:26', '2021-02-12 00:08:26'),
(233, 'data_rows', 'display_name', 191, 'pt', 'Finalizo', '2021-02-13 19:26:49', '2021-02-13 19:26:49'),
(234, 'data_rows', 'display_name', 191, 'es', 'Finalizo', '2021-02-13 19:26:49', '2021-02-13 19:26:49');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT 'users/default.png',
  `confirmed` tinyint(1) DEFAULT 0,
  `confirmation_code` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `settings` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `domicilio` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cuil` bigint(20) DEFAULT NULL,
  `empleado_dgr` binary(1) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `id_area` int(11) DEFAULT NULL,
  `oficina` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `role_id`, `name`, `email`, `avatar`, `confirmed`, `confirmation_code`, `email_verified_at`, `password`, `remember_token`, `settings`, `created_at`, `updated_at`, `domicilio`, `cuil`, `empleado_dgr`, `created_by`, `id_area`, `oficina`, `deleted_at`) VALUES
(1, 1, 'Admin', 'admin@admin.com', 'users/default.png', 0, NULL, NULL, '$2y$10$WB0qRl7iGnhZ6Un4c.pyceVUImRvLDR6jCp86vXS6zsQLLmnAXRjC', '7pTda8DP7HiO4YF26fQ50Y5rB60NcmfYzaVx1Dk2E8tk5453C8gTH8AIgcVg', NULL, '2021-01-12 00:02:26', '2021-01-12 00:02:26', '', NULL, NULL, NULL, NULL, NULL, NULL),
(3, 4, 'Pastora Hermoso', 'naia34@example.org', 'users\\February2021\\GVUR7k9m6nTf9iMbTLA7.png', 0, NULL, NULL, '$2y$10$L0yIciIf4NvKViIV785ifezR367xKAQpC9T6wL.Wu2O2vjlLqXSmG', NULL, '{\"locale\":\"en\"}', '2021-02-02 21:45:10', '2021-02-02 23:42:32', 'Callejón Martin Garay, Apto 3', 12366541238, 0x31, NULL, 1, 'Boletas', NULL),
(4, 4, 'Sr. Miguel Meza Hijo', 'giglesias@example.org', 'users\\February2021\\VAD8JIyl8N6c7rOko1Bj.jpg', 0, NULL, NULL, '$2y$10$Wp38uODFKK0fFPCKRXM5peSSL9JeWXej0DmOT.YlZ3yMw58RnKdLS', NULL, '{\"locale\":\"en\"}', '2021-02-02 21:48:48', '2021-02-02 23:42:16', 'Cl. Riojas, 80, Apto 04', 12547899632, 0x31, NULL, 4, 'Auditoria interna', NULL),
(5, 4, 'Sra. Laia Escribano Hijo', 'almanza.juan@example.org', 'users\\February2021\\NQeMyCUWaGP79oCxRUgQ.png', 0, NULL, NULL, '$2y$10$MuI3/t9LP2ohVIAYh0vQbuwFyoLxCNfkN1Mjl6yxvE0M7nfPfMo8O', NULL, '{\"locale\":\"en\"}', '2021-02-02 21:51:58', '2021-02-02 23:42:03', 'Av. Joel, 82, Piso 97', 22258524781, 0x31, NULL, 5, 'oficina sub director', NULL),
(6, 4, 'Alexia Nava', 'daniel70@example.net', 'users\\February2021\\JYKPnSnFMMrGaM3601hI.png', 0, NULL, NULL, '$2y$10$N9jsU37UgVyWgo7lKL2Cqe84nztsVjNndMRTAFSpMJMI2wPNfigRO', NULL, '{\"locale\":\"en\"}', '2021-02-02 21:52:52', '2021-02-02 23:41:51', 'Calle Valeria, 97, Apto 65', 21147411479, 0x31, NULL, 5, 'Oficina de director', NULL),
(7, 4, 'Antonio Pedro Verduzco', 'silva.eva@example.com', 'users\\February2021\\lA2Bg1SRoBbDFp4mVPgD.jpg', 0, NULL, NULL, '$2y$10$u0bXZHJyMpBdmdxCLbrCju21c5vtHrDLH.lwJ1YK3ozfXTAl784Au', NULL, '{\"locale\":\"en\"}', '2021-02-02 21:53:45', '2021-02-02 23:41:39', 'Av. Perea, 01, Piso 36', 78751239518, 0x31, NULL, 6, 'director', NULL),
(8, 4, 'Leire Concepción', 'arredondo.julia@example.com', 'users\\February2021\\RXpxsRsSVcSIAzflJirR.png', 0, NULL, NULL, '$2y$10$pdHg0nGyCyADNSm2jwXc7e1yFdxRwH.fjfpmLAwmMoXlKxFNUCHGW', NULL, '{\"locale\":\"en\"}', '2021-02-02 21:54:29', '2021-02-02 23:41:30', 'Avenida Almanza, Apto 6', 23659631472, 0x31, NULL, 6, 'sub directora', NULL),
(9, 4, 'Mara Cazares', 'jdelarosa@example.org', 'users\\February2021\\KDJKYXJt2Og29XNOTu7a.png', 0, NULL, NULL, '$2y$10$vrTQXkZpfi5.fVdVCUH2yOeMq8Usi74s.l3Wv/7UA8oXbvh7DxoZe', NULL, '{\"locale\":\"en\"}', '2021-02-02 21:58:22', '2021-02-04 16:53:37', 'Carretera Saul, Nro 6', 14255200146, 0x31, NULL, 7, 'Jefa de patrimonio', NULL),
(10, 4, 'Mario Ruíz Hijo', 'valentina71@example.com', 'users\\February2021\\MGKi2SZpD6aoDkQbuz91.png', 0, NULL, NULL, '$2y$10$iynpoljB4MXRacbJA/Ep0eTHyh.FiHOXHceZYa64BBIeleEv9Kk1m', NULL, '{\"locale\":\"en\"}', '2021-02-02 21:59:07', '2021-02-13 03:29:32', 'Avenida Bruno Montalvo, Hab. 16', 12321233214, 0x31, NULL, 8, 'alguna', NULL),
(11, 4, 'Beatriz Irene Jiménez', 'magana.francisco@example.org', 'users\\February2021\\Ra1TSaPI0vg8xZDUOuOu.png', 0, NULL, NULL, '$2y$10$MiwPs8xOMyxvnouNIIpL3OjclHZMOa.6xvSmygc0jLHzH8ZgfNoBG', NULL, '{\"locale\":\"en\"}', '2021-02-02 21:59:51', '2021-02-02 23:40:42', 'Cl. Eduardo, 40, Hab. 71', 12322344320, 0x31, NULL, 8, NULL, NULL),
(12, 3, 'Dn. Victor Tello Hijo', 'marti.rodriguez@example.com', 'users\\February2021\\Q9mdMPYEWzSQuX7UojOf.jpg', 0, NULL, NULL, '$2y$10$1.5ueZoEae7bB/yH1ETBH.NbVPiIQEWEDnlNn9Vlpq7WKtBEY6mpu', NULL, '{\"locale\":\"en\"}', '2021-02-02 22:06:03', '2021-02-02 23:39:32', 'Vereda Naia, 6, Apto 8', 23764567651, 0x30, NULL, 0, NULL, NULL),
(13, 3, 'Ivory H. Foxwell', 'IvoryHFoxwell@superrito.com', 'users\\February2021\\rOQS6XAhONPtOEIvRpDM.jpg', 0, NULL, NULL, '$2y$10$puI5BU975Hkx4MGp8nVt/evSdXl4D7ceK7R3.U9G1uwYbwrKbsYCu', NULL, '{\"locale\":\"en\"}', '2021-02-02 23:36:24', '2021-02-02 23:39:09', '2004 Mazda Tribute', 14523697412, 0x30, NULL, 0, NULL, NULL),
(14, 3, 'Patricia S. McCartney', 'PatriciaSMcCartney@gustr.com', 'users\\February2021\\4Z7GNRODPRzH48MSdc8F.jpg', 0, NULL, NULL, '$2y$10$D60yaXgcktJdn.vDljUDq.secZyyqlOVmSZBL9.m7SNKVIA44GXwu', NULL, '{\"locale\":\"en\"}', '2021-02-02 23:37:16', '2021-02-02 23:38:58', '2575 Friendship Lane', 12234566541, 0x30, NULL, 0, NULL, NULL),
(15, 3, 'Theodora A. Anderson', 'TheodoraAAnderson@gustr.com', 'users\\February2021\\U4GQBH6vnbd4Wk2em7YJ.jpeg', 0, NULL, NULL, '$2y$10$UJ0QE.mURNVByvVyvhEDsu7JOyJVkvl3L3DwmECWdp8ROqk3a8Do.', NULL, '{\"locale\":\"en\"}', '2021-02-02 23:38:00', '2021-02-10 04:34:57', '2009 Medical Center Drive', 23789877890, 0x30, NULL, NULL, NULL, NULL),
(16, 4, 'Roberto Castro', 'robertocastro@gmail.com', 'users\\February2021\\cs5cs3fe4ZsSeEdQEZfS.png', 0, NULL, NULL, '$2y$10$HH72yE6Y0FXMJ9ULyBQ1d.oEJJBg/.SrcB9iU7f4WOAg0JCxKS8me', NULL, '{\"locale\":\"en\"}', '2021-02-04 16:58:51', '2021-02-04 16:58:51', 'calle de las manzandas 445 este', 20366321458, 0x31, NULL, 3, 'mesa 4', NULL),
(17, 6, 'Betty Gomez', 'betty@gmail.com', 'users\\February2021\\GYtnkcMh2SvA0Qa5iwT4.png', 0, NULL, NULL, '$2y$10$hgS5uhpsS6KfckaHQ.RPwOFxMAm1U/dhfObaMYMxJo4qPtt/yqf2G', NULL, '{\"locale\":\"en\"}', '2021-02-11 16:23:30', '2021-02-11 16:23:30', 'calle de los enamorados 114 norte', 20145236549, 0x30, NULL, 3, NULL, NULL),
(19, 1, 'diegocheca', 'diegochecarelli@hotmail.com', 'users\\February2021\\Kdzyt4LiRc3SpmJ04oLx.png', 0, 'LwyUQlS3NL7oKXI8JgZZObzP7', NULL, '$2y$10$BGPHB4zCUKjPpw6.DsJ9n.1et21lC8Koh0dmnqXdYEnRsNpJXeNum', NULL, '{\"locale\":\"en\"}', '2021-02-11 23:19:38', '2021-02-11 23:19:38', 'calle mendoza 232 este', 23434321239, 0x30, NULL, 0, NULL, NULL),
(20, 4, 'Juan Lopez', 'juancitolopez@gmail.com', 'users\\February2021\\IMEXZ3dc5ndcinWkyaah.png', 0, 'JXxhRorR7mJIADQRcAf8s0gM9', NULL, '$2y$10$7I6OLc4BX7WWHiRbSCj8p.WzP8YGihkLC6AeQKA6hBIaI68OXRWE.', NULL, '{\"locale\":\"en\"}', '2021-02-13 04:00:33', '2021-02-13 04:00:33', 'calle que te importa', 23988982341, 0x31, NULL, 9, 'archivo de  subsuelo', NULL),
(21, 4, 'Dra Ana Laura Gomez', 'dcheccarelli@sanjuan.gov.ar', 'users\\February2021\\b7inZUKDgFNcc5ly5ZeV.png', 1, NULL, '2021-02-16 19:04:34', '$2y$10$Vb2JAeuKK3oQGThRhlU5p.ch/Q41acQFaIAAeb0DMo5kk9UeFVU72', NULL, '{\"locale\":\"es\"}', '2021-02-16 18:50:35', '2021-02-16 19:04:34', 'Calle libertadores 1423 oeste', 20523699875, 0x31, NULL, 2, 'Oficina de Revision', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user_roles`
--

CREATE TABLE `user_roles` (
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `areaempleados`
--
ALTER TABLE `areaempleados`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `areas`
--
ALTER TABLE `areas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_slug_unique` (`slug`),
  ADD KEY `categories_parent_id_foreign` (`parent_id`);

--
-- Indices de la tabla `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `data_rows`
--
ALTER TABLE `data_rows`
  ADD PRIMARY KEY (`id`),
  ADD KEY `data_rows_data_type_id_foreign` (`data_type_id`);

--
-- Indices de la tabla `data_types`
--
ALTER TABLE `data_types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `data_types_name_unique` (`name`),
  ADD UNIQUE KEY `data_types_slug_unique` (`slug`);

--
-- Indices de la tabla `expedientes`
--
ALTER TABLE `expedientes`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indices de la tabla `logs`
--
ALTER TABLE `logs`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `menus_name_unique` (`name`);

--
-- Indices de la tabla `menu_items`
--
ALTER TABLE `menu_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `menu_items_menu_id_foreign` (`menu_id`);

--
-- Indices de la tabla `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `movimientos`
--
ALTER TABLE `movimientos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `pages_slug_unique` (`slug`);

--
-- Indices de la tabla `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indices de la tabla `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `permissions_key_index` (`key`);

--
-- Indices de la tabla `permission_role`
--
ALTER TABLE `permission_role`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `permission_role_permission_id_index` (`permission_id`),
  ADD KEY `permission_role_role_id_index` (`role_id`);

--
-- Indices de la tabla `personas`
--
ALTER TABLE `personas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `posts_slug_unique` (`slug`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_unique` (`name`);

--
-- Indices de la tabla `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `settings_key_unique` (`key`);

--
-- Indices de la tabla `tramites`
--
ALTER TABLE `tramites`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `translations`
--
ALTER TABLE `translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `translations_table_name_column_name_foreign_key_locale_unique` (`table_name`,`column_name`,`foreign_key`,`locale`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_role_id_foreign` (`role_id`);

--
-- Indices de la tabla `user_roles`
--
ALTER TABLE `user_roles`
  ADD PRIMARY KEY (`user_id`,`role_id`),
  ADD KEY `user_roles_user_id_index` (`user_id`),
  ADD KEY `user_roles_role_id_index` (`role_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `areaempleados`
--
ALTER TABLE `areaempleados`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `areas`
--
ALTER TABLE `areas`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `data_rows`
--
ALTER TABLE `data_rows`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=198;

--
-- AUTO_INCREMENT de la tabla `data_types`
--
ALTER TABLE `data_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `expedientes`
--
ALTER TABLE `expedientes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `logs`
--
ALTER TABLE `logs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT de la tabla `menus`
--
ALTER TABLE `menus`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `menu_items`
--
ALTER TABLE `menu_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT de la tabla `movimientos`
--
ALTER TABLE `movimientos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- AUTO_INCREMENT de la tabla `pages`
--
ALTER TABLE `pages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=92;

--
-- AUTO_INCREMENT de la tabla `personas`
--
ALTER TABLE `personas`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `tramites`
--
ALTER TABLE `tramites`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `translations`
--
ALTER TABLE `translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=235;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Filtros para la tabla `data_rows`
--
ALTER TABLE `data_rows`
  ADD CONSTRAINT `data_rows_data_type_id_foreign` FOREIGN KEY (`data_type_id`) REFERENCES `data_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `menu_items`
--
ALTER TABLE `menu_items`
  ADD CONSTRAINT `menu_items_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `permission_role`
--
ALTER TABLE `permission_role`
  ADD CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);

--
-- Filtros para la tabla `user_roles`
--
ALTER TABLE `user_roles`
  ADD CONSTRAINT `user_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_roles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
