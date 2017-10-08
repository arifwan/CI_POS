-- phpMyAdmin SQL Dump
-- version 4.4.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Sep 17, 2017 at 08:11 PM
-- Server version: 5.6.26
-- PHP Version: 5.6.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_ci_pos`
--

-- --------------------------------------------------------

--
-- Table structure for table `sma_adjustments`
--

CREATE TABLE IF NOT EXISTS `sma_adjustments` (
  `id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `product_id` int(11) NOT NULL,
  `option_id` int(11) DEFAULT NULL,
  `quantity` decimal(15,4) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `note` varchar(1000) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `type` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_calendar`
--

CREATE TABLE IF NOT EXISTS `sma_calendar` (
  `date` date NOT NULL,
  `data` varchar(255) NOT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_captcha`
--

CREATE TABLE IF NOT EXISTS `sma_captcha` (
  `captcha_id` bigint(13) unsigned NOT NULL,
  `captcha_time` int(10) unsigned NOT NULL,
  `ip_address` varchar(16) CHARACTER SET latin1 NOT NULL DEFAULT '0',
  `word` varchar(20) CHARACTER SET latin1 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_categories`
--

CREATE TABLE IF NOT EXISTS `sma_categories` (
  `id` int(11) NOT NULL,
  `code` varchar(55) NOT NULL,
  `name` varchar(55) NOT NULL,
  `image` varchar(55) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_categories`
--

INSERT INTO `sma_categories` (`id`, `code`, `name`, `image`) VALUES
(1, 'C1', 'Category 1', NULL),
(2, 'LAPTOP', 'LAPTOP', NULL),
(3, 'CAMERA', 'CAMERA', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sma_combo_items`
--

CREATE TABLE IF NOT EXISTS `sma_combo_items` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `item_code` varchar(20) NOT NULL,
  `quantity` decimal(12,4) NOT NULL,
  `unit_price` decimal(25,4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_companies`
--

CREATE TABLE IF NOT EXISTS `sma_companies` (
  `id` int(11) NOT NULL,
  `group_id` int(10) unsigned DEFAULT NULL,
  `group_name` varchar(20) NOT NULL,
  `customer_group_id` int(11) DEFAULT NULL,
  `customer_group_name` varchar(100) DEFAULT NULL,
  `name` varchar(55) NOT NULL,
  `company` varchar(255) NOT NULL,
  `vat_no` varchar(100) DEFAULT NULL,
  `address` varchar(255) NOT NULL,
  `city` varchar(55) NOT NULL,
  `state` varchar(55) DEFAULT NULL,
  `postal_code` varchar(8) DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL,
  `phone` varchar(20) NOT NULL,
  `email` varchar(100) NOT NULL,
  `cf1` varchar(100) DEFAULT NULL,
  `cf2` varchar(100) DEFAULT NULL,
  `cf3` varchar(100) DEFAULT NULL,
  `cf4` varchar(100) DEFAULT NULL,
  `cf5` varchar(100) DEFAULT NULL,
  `cf6` varchar(100) DEFAULT NULL,
  `invoice_footer` text,
  `payment_term` int(11) DEFAULT '0',
  `logo` varchar(255) DEFAULT 'logo.png',
  `award_points` int(11) DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_companies`
--

INSERT INTO `sma_companies` (`id`, `group_id`, `group_name`, `customer_group_id`, `customer_group_name`, `name`, `company`, `vat_no`, `address`, `city`, `state`, `postal_code`, `country`, `phone`, `email`, `cf1`, `cf2`, `cf3`, `cf4`, `cf5`, `cf6`, `invoice_footer`, `payment_term`, `logo`, `award_points`) VALUES
(1, 3, 'customer', 1, 'General', 'Walk-in Customer', 'Walk-in Customer', '', 'Customer Address', 'Petaling Jaya', 'Selangor', '46000', 'Malaysia', '0123456789', 'customer@tecdiary.com', '', '', '', '', '', '', NULL, 0, 'logo.png', 0),
(2, 4, 'supplier', NULL, NULL, 'Test Supplier', 'Supplier Company Name', NULL, 'Supplier Address', 'Petaling Jaya', 'Selangor', '46050', 'Malaysia', '0123456789', 'supplier@tecdiary.com', '-', '-', '-', '-', '-', '-', NULL, 0, 'logo.png', 0),
(3, NULL, 'biller', NULL, NULL, 'Mian Saleem', 'Test Biller', '5555', 'Biller adddress', 'City', '', '', 'Country', '012345678', 'saleem@tecdiary.com', '', '', '', '', '', '', ' Thank you for shopping with us. Please come again', 0, 'logo1.png', 0),
(4, 4, 'supplier', NULL, NULL, 'MUSA', 'TECH ZONE', '1212', 'Multiplan City', 'Dhaka', 'Dhaka', '1207', 'Bangladesh', '01761913331', 'nusa@gmail.com', '', '', '', '', '', '', NULL, 0, 'logo.png', 0);

-- --------------------------------------------------------

--
-- Table structure for table `sma_costing`
--

CREATE TABLE IF NOT EXISTS `sma_costing` (
  `id` int(11) NOT NULL,
  `date` date NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `sale_item_id` int(11) NOT NULL,
  `sale_id` int(11) DEFAULT NULL,
  `purchase_item_id` int(11) DEFAULT NULL,
  `quantity` decimal(15,4) NOT NULL,
  `purchase_net_unit_cost` decimal(25,4) DEFAULT NULL,
  `purchase_unit_cost` decimal(25,4) DEFAULT NULL,
  `sale_net_unit_price` decimal(25,4) NOT NULL,
  `sale_unit_price` decimal(25,4) NOT NULL,
  `quantity_balance` decimal(15,4) DEFAULT NULL,
  `inventory` tinyint(1) DEFAULT '0',
  `overselling` tinyint(1) DEFAULT '0',
  `option_id` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_costing`
--

INSERT INTO `sma_costing` (`id`, `date`, `product_id`, `sale_item_id`, `sale_id`, `purchase_item_id`, `quantity`, `purchase_net_unit_cost`, `purchase_unit_cost`, `sale_net_unit_price`, `sale_unit_price`, `quantity_balance`, `inventory`, `overselling`, `option_id`) VALUES
(1, '2017-03-10', 1, 1, 1, 1, '2.0000', '150.0000', '150.0000', '42000.0000', '42000.0000', '23.0000', 1, 0, 1),
(2, '2017-03-10', 1, 2, 2, 2, '1.0000', '150.0000', '150.0000', '42000.0000', '42000.0000', '0.0000', 1, 0, 1),
(3, '2017-03-11', 1, 3, 3, 4, '1.0000', '150.0000', '150.0000', '42000.0000', '42000.0000', '0.0000', 1, 0, 1),
(4, '2017-03-11', 1, 3, 3, 1, '5.0000', '150.0000', '150.0000', '42000.0000', '42000.0000', '17.0000', 1, 0, 1),
(5, '2017-04-07', 1, 4, 4, 1, '1.0000', '150.0000', '150.0000', '42000.0000', '42000.0000', '16.0000', 1, 0, 1),
(6, '2017-04-07', 1, 5, 4, 1, '1.0000', '150.0000', '150.0000', '42000.0000', '42000.0000', '16.0000', 1, 0, 1),
(7, '2017-04-07', 1, 6, 5, 1, '1.0000', '150.0000', '150.0000', '42000.0000', '42000.0000', '14.0000', 1, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `sma_currencies`
--

CREATE TABLE IF NOT EXISTS `sma_currencies` (
  `id` int(11) NOT NULL,
  `code` varchar(5) NOT NULL,
  `name` varchar(55) NOT NULL,
  `rate` decimal(12,4) NOT NULL,
  `auto_update` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_currencies`
--

INSERT INTO `sma_currencies` (`id`, `code`, `name`, `rate`, `auto_update`) VALUES
(1, 'USD', 'US Dollar', '1.0000', 0),
(2, 'ERU', 'EURO', '0.7340', 0),
(3, 'TK', 'TK', '0.0800', 0);

-- --------------------------------------------------------

--
-- Table structure for table `sma_customer_groups`
--

CREATE TABLE IF NOT EXISTS `sma_customer_groups` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `percent` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_customer_groups`
--

INSERT INTO `sma_customer_groups` (`id`, `name`, `percent`) VALUES
(1, 'General', 0),
(2, 'Reseller', -5),
(3, 'Distributor', -15),
(4, 'New Customer (+10)', 10);

-- --------------------------------------------------------

--
-- Table structure for table `sma_date_format`
--

CREATE TABLE IF NOT EXISTS `sma_date_format` (
  `id` int(11) NOT NULL,
  `js` varchar(20) NOT NULL,
  `php` varchar(20) NOT NULL,
  `sql` varchar(20) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_date_format`
--

INSERT INTO `sma_date_format` (`id`, `js`, `php`, `sql`) VALUES
(1, 'mm-dd-yyyy', 'm-d-Y', '%m-%d-%Y'),
(2, 'mm/dd/yyyy', 'm/d/Y', '%m/%d/%Y'),
(3, 'mm.dd.yyyy', 'm.d.Y', '%m.%d.%Y'),
(4, 'dd-mm-yyyy', 'd-m-Y', '%d-%m-%Y'),
(5, 'dd/mm/yyyy', 'd/m/Y', '%d/%m/%Y'),
(6, 'dd.mm.yyyy', 'd.m.Y', '%d.%m.%Y');

-- --------------------------------------------------------

--
-- Table structure for table `sma_deliveries`
--

CREATE TABLE IF NOT EXISTS `sma_deliveries` (
  `id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `sale_id` int(11) NOT NULL,
  `do_reference_no` varchar(50) NOT NULL,
  `sale_reference_no` varchar(50) NOT NULL,
  `customer` varchar(55) NOT NULL,
  `address` varchar(1000) NOT NULL,
  `note` varchar(1000) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_expenses`
--

CREATE TABLE IF NOT EXISTS `sma_expenses` (
  `id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `reference` varchar(50) NOT NULL,
  `amount` decimal(25,4) NOT NULL,
  `note` varchar(1000) DEFAULT NULL,
  `created_by` varchar(55) NOT NULL,
  `attachment` varchar(55) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_expenses`
--

INSERT INTO `sma_expenses` (`id`, `date`, `reference`, `amount`, `note`, `created_by`, `attachment`) VALUES
(1, '2017-03-10 20:47:00', 'NAWAZ', '400.0000', '', '1', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sma_gift_cards`
--

CREATE TABLE IF NOT EXISTS `sma_gift_cards` (
  `id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `card_no` varchar(20) NOT NULL,
  `value` decimal(25,4) NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `customer` varchar(255) DEFAULT NULL,
  `balance` decimal(25,4) NOT NULL,
  `expiry` date DEFAULT NULL,
  `created_by` varchar(55) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_groups`
--

CREATE TABLE IF NOT EXISTS `sma_groups` (
  `id` mediumint(8) unsigned NOT NULL,
  `name` varchar(20) NOT NULL,
  `description` varchar(100) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_groups`
--

INSERT INTO `sma_groups` (`id`, `name`, `description`) VALUES
(1, 'owner', 'Owner'),
(2, 'admin', 'Administrator'),
(3, 'customer', 'Customer'),
(4, 'supplier', 'Supplier'),
(5, 'sales', 'Sales Staff');

-- --------------------------------------------------------

--
-- Table structure for table `sma_login_attempts`
--

CREATE TABLE IF NOT EXISTS `sma_login_attempts` (
  `id` mediumint(8) unsigned NOT NULL,
  `ip_address` varbinary(16) NOT NULL,
  `login` varchar(100) NOT NULL,
  `time` int(11) unsigned DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_migrations`
--

CREATE TABLE IF NOT EXISTS `sma_migrations` (
  `version` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_migrations`
--

INSERT INTO `sma_migrations` (`version`) VALUES
(306);

-- --------------------------------------------------------

--
-- Table structure for table `sma_notifications`
--

CREATE TABLE IF NOT EXISTS `sma_notifications` (
  `id` int(11) NOT NULL,
  `comment` text NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `from_date` datetime DEFAULT NULL,
  `till_date` datetime DEFAULT NULL,
  `scope` tinyint(1) NOT NULL DEFAULT '3'
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_notifications`
--

INSERT INTO `sma_notifications` (`id`, `comment`, `date`, `from_date`, `till_date`, `scope`) VALUES
(1, '<p>Thank you for purchasing Stock Manager Advance. Please don''t forget to check the documentation in help folder. If you find any error/bug, please email to support@tecdiary.com with details. You can send us your valued suggestions/feedback too.</p><p>Please rate Stock Manager Advance on your download page of codecanyon.net</p>', '2014-08-15 00:00:57', '2015-01-01 00:00:00', '2017-01-01 00:00:00', 3);

-- --------------------------------------------------------

--
-- Table structure for table `sma_order_ref`
--

CREATE TABLE IF NOT EXISTS `sma_order_ref` (
  `ref_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `so` int(11) NOT NULL DEFAULT '1',
  `qu` int(11) NOT NULL DEFAULT '1',
  `po` int(11) NOT NULL DEFAULT '1',
  `to` int(11) NOT NULL DEFAULT '1',
  `pos` int(11) NOT NULL DEFAULT '1',
  `do` int(11) NOT NULL DEFAULT '1',
  `pay` int(11) NOT NULL DEFAULT '1',
  `re` int(11) NOT NULL DEFAULT '1',
  `ex` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_order_ref`
--

INSERT INTO `sma_order_ref` (`ref_id`, `date`, `so`, `qu`, `po`, `to`, `pos`, `do`, `pay`, `re`, `ex`) VALUES
(1, '2015-03-01', 2, 2, 1, 2, 5, 1, 12, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `sma_payments`
--

CREATE TABLE IF NOT EXISTS `sma_payments` (
  `id` int(11) NOT NULL,
  `date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `sale_id` int(11) DEFAULT NULL,
  `return_id` int(11) DEFAULT NULL,
  `purchase_id` int(11) DEFAULT NULL,
  `reference_no` varchar(50) NOT NULL,
  `transaction_id` varchar(50) DEFAULT NULL,
  `paid_by` varchar(20) NOT NULL,
  `cheque_no` varchar(20) DEFAULT NULL,
  `cc_no` varchar(20) DEFAULT NULL,
  `cc_holder` varchar(25) DEFAULT NULL,
  `cc_month` varchar(2) DEFAULT NULL,
  `cc_year` varchar(4) DEFAULT NULL,
  `cc_type` varchar(20) DEFAULT NULL,
  `amount` decimal(25,4) NOT NULL,
  `currency` varchar(3) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `attachment` varchar(55) DEFAULT NULL,
  `type` varchar(20) NOT NULL,
  `note` varchar(1000) DEFAULT NULL,
  `pos_paid` decimal(25,4) DEFAULT '0.0000',
  `pos_balance` decimal(25,4) DEFAULT '0.0000'
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_payments`
--

INSERT INTO `sma_payments` (`id`, `date`, `sale_id`, `return_id`, `purchase_id`, `reference_no`, `transaction_id`, `paid_by`, `cheque_no`, `cc_no`, `cc_holder`, `cc_month`, `cc_year`, `cc_type`, `amount`, `currency`, `created_by`, `attachment`, `type`, `note`, `pos_paid`, `pos_balance`) VALUES
(1, '2017-03-10 15:42:18', 1, NULL, NULL, 'IPAY/2017/03/0001', NULL, 'cash', '', '', '', '', '', '', '83000.0000', NULL, 1, NULL, 'received', '', '85000.0000', '2000.0000'),
(2, '2017-03-10 20:49:00', 2, NULL, NULL, 'IPAY/2017/03/0003', NULL, 'cash', '', '', '', '', '', 'Visa', '42000.0000', NULL, 1, NULL, 'received', '', '0.0000', '0.0000'),
(3, '2017-03-11 09:16:20', 3, NULL, NULL, 'IPAY/2017/03/0004', NULL, 'cash', '', '', '', '', '', '', '209000.0000', NULL, 1, NULL, 'received', '', '209000.0000', '0.0000'),
(4, '2017-04-07 04:19:40', 4, NULL, NULL, 'IPAY/2017/04/0008', NULL, 'cash', '', '', '', '', '', '', '50000.0000', NULL, 1, NULL, 'received', '', '50000.0000', '-34000.0000'),
(5, '2017-04-07 04:21:54', 5, NULL, NULL, 'IPAY/2017/04/0010', NULL, 'cash', '', '', '', '', '', '', '42000.0000', NULL, 1, NULL, 'received', '', '43000.0000', '1000.0000');

-- --------------------------------------------------------

--
-- Table structure for table `sma_paypal`
--

CREATE TABLE IF NOT EXISTS `sma_paypal` (
  `id` int(11) NOT NULL,
  `active` tinyint(4) NOT NULL,
  `account_email` varchar(255) NOT NULL,
  `paypal_currency` varchar(3) NOT NULL DEFAULT 'USD',
  `fixed_charges` decimal(25,4) NOT NULL DEFAULT '2.0000',
  `extra_charges_my` decimal(25,4) NOT NULL DEFAULT '3.9000',
  `extra_charges_other` decimal(25,4) NOT NULL DEFAULT '4.4000'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_paypal`
--

INSERT INTO `sma_paypal` (`id`, `active`, `account_email`, `paypal_currency`, `fixed_charges`, `extra_charges_my`, `extra_charges_other`) VALUES
(1, 1, 'mypaypal@paypal.com', 'USD', '0.0000', '0.0000', '0.0000');

-- --------------------------------------------------------

--
-- Table structure for table `sma_permissions`
--

CREATE TABLE IF NOT EXISTS `sma_permissions` (
  `id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `products-index` tinyint(1) DEFAULT '0',
  `products-add` tinyint(1) DEFAULT '0',
  `products-edit` tinyint(1) DEFAULT '0',
  `products-delete` tinyint(1) DEFAULT '0',
  `products-cost` tinyint(1) DEFAULT '0',
  `products-price` tinyint(1) DEFAULT '0',
  `quotes-index` tinyint(1) DEFAULT '0',
  `quotes-add` tinyint(1) DEFAULT '0',
  `quotes-edit` tinyint(1) DEFAULT '0',
  `quotes-pdf` tinyint(1) DEFAULT '0',
  `quotes-email` tinyint(1) DEFAULT '0',
  `quotes-delete` tinyint(1) DEFAULT '0',
  `sales-index` tinyint(1) DEFAULT '0',
  `sales-add` tinyint(1) DEFAULT '0',
  `sales-edit` tinyint(1) DEFAULT '0',
  `sales-pdf` tinyint(1) DEFAULT '0',
  `sales-email` tinyint(1) DEFAULT '0',
  `sales-delete` tinyint(1) DEFAULT '0',
  `purchases-index` tinyint(1) DEFAULT '0',
  `purchases-add` tinyint(1) DEFAULT '0',
  `purchases-edit` tinyint(1) DEFAULT '0',
  `purchases-pdf` tinyint(1) DEFAULT '0',
  `purchases-email` tinyint(1) DEFAULT '0',
  `purchases-delete` tinyint(1) DEFAULT '0',
  `transfers-index` tinyint(1) DEFAULT '0',
  `transfers-add` tinyint(1) DEFAULT '0',
  `transfers-edit` tinyint(1) DEFAULT '0',
  `transfers-pdf` tinyint(1) DEFAULT '0',
  `transfers-email` tinyint(1) DEFAULT '0',
  `transfers-delete` tinyint(1) DEFAULT '0',
  `customers-index` tinyint(1) DEFAULT '0',
  `customers-add` tinyint(1) DEFAULT '0',
  `customers-edit` tinyint(1) DEFAULT '0',
  `customers-delete` tinyint(1) DEFAULT '0',
  `suppliers-index` tinyint(1) DEFAULT '0',
  `suppliers-add` tinyint(1) DEFAULT '0',
  `suppliers-edit` tinyint(1) DEFAULT '0',
  `suppliers-delete` tinyint(1) DEFAULT '0',
  `sales-deliveries` tinyint(1) DEFAULT '0',
  `sales-add_delivery` tinyint(1) DEFAULT '0',
  `sales-edit_delivery` tinyint(1) DEFAULT '0',
  `sales-delete_delivery` tinyint(1) DEFAULT '0',
  `sales-email_delivery` tinyint(1) DEFAULT '0',
  `sales-pdf_delivery` tinyint(1) DEFAULT '0',
  `sales-gift_cards` tinyint(1) DEFAULT '0',
  `sales-add_gift_card` tinyint(1) DEFAULT '0',
  `sales-edit_gift_card` tinyint(1) DEFAULT '0',
  `sales-delete_gift_card` tinyint(1) DEFAULT '0',
  `pos-index` tinyint(1) DEFAULT '0',
  `sales-return_sales` tinyint(1) DEFAULT '0',
  `reports-index` tinyint(1) DEFAULT '0',
  `reports-warehouse_stock` tinyint(1) DEFAULT '0',
  `reports-quantity_alerts` tinyint(1) DEFAULT '0',
  `reports-expiry_alerts` tinyint(1) DEFAULT '0',
  `reports-products` tinyint(1) DEFAULT '0',
  `reports-daily_sales` tinyint(1) DEFAULT '0',
  `reports-monthly_sales` tinyint(1) DEFAULT '0',
  `reports-sales` tinyint(1) DEFAULT '0',
  `reports-payments` tinyint(1) DEFAULT '0',
  `reports-purchases` tinyint(1) DEFAULT '0',
  `reports-profit_loss` tinyint(1) DEFAULT '0',
  `reports-customers` tinyint(1) DEFAULT '0',
  `reports-suppliers` tinyint(1) DEFAULT '0',
  `reports-staff` tinyint(1) DEFAULT '0',
  `reports-register` tinyint(1) DEFAULT '0',
  `sales-payments` tinyint(1) DEFAULT '0',
  `purchases-payments` tinyint(1) DEFAULT '0',
  `purchases-expenses` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_permissions`
--

INSERT INTO `sma_permissions` (`id`, `group_id`, `products-index`, `products-add`, `products-edit`, `products-delete`, `products-cost`, `products-price`, `quotes-index`, `quotes-add`, `quotes-edit`, `quotes-pdf`, `quotes-email`, `quotes-delete`, `sales-index`, `sales-add`, `sales-edit`, `sales-pdf`, `sales-email`, `sales-delete`, `purchases-index`, `purchases-add`, `purchases-edit`, `purchases-pdf`, `purchases-email`, `purchases-delete`, `transfers-index`, `transfers-add`, `transfers-edit`, `transfers-pdf`, `transfers-email`, `transfers-delete`, `customers-index`, `customers-add`, `customers-edit`, `customers-delete`, `suppliers-index`, `suppliers-add`, `suppliers-edit`, `suppliers-delete`, `sales-deliveries`, `sales-add_delivery`, `sales-edit_delivery`, `sales-delete_delivery`, `sales-email_delivery`, `sales-pdf_delivery`, `sales-gift_cards`, `sales-add_gift_card`, `sales-edit_gift_card`, `sales-delete_gift_card`, `pos-index`, `sales-return_sales`, `reports-index`, `reports-warehouse_stock`, `reports-quantity_alerts`, `reports-expiry_alerts`, `reports-products`, `reports-daily_sales`, `reports-monthly_sales`, `reports-sales`, `reports-payments`, `reports-purchases`, `reports-profit_loss`, `reports-customers`, `reports-suppliers`, `reports-staff`, `reports-register`, `sales-payments`, `purchases-payments`, `purchases-expenses`) VALUES
(1, 5, 1, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 1, 1, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `sma_pos_register`
--

CREATE TABLE IF NOT EXISTS `sma_pos_register` (
  `id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user_id` int(11) NOT NULL,
  `cash_in_hand` decimal(25,4) NOT NULL,
  `status` varchar(10) NOT NULL,
  `total_cash` decimal(25,4) DEFAULT NULL,
  `total_cheques` int(11) DEFAULT NULL,
  `total_cc_slips` int(11) DEFAULT NULL,
  `total_cash_submitted` decimal(25,4) NOT NULL,
  `total_cheques_submitted` int(11) NOT NULL,
  `total_cc_slips_submitted` int(11) NOT NULL,
  `note` text,
  `closed_at` timestamp NULL DEFAULT NULL,
  `transfer_opened_bills` varchar(50) DEFAULT NULL,
  `closed_by` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_pos_register`
--

INSERT INTO `sma_pos_register` (`id`, `date`, `user_id`, `cash_in_hand`, `status`, `total_cash`, `total_cheques`, `total_cc_slips`, `total_cash_submitted`, `total_cheques_submitted`, `total_cc_slips_submitted`, `note`, `closed_at`, `transfer_opened_bills`, `closed_by`) VALUES
(1, '2017-03-05 08:13:44', 1, '100.0000', 'open', NULL, NULL, NULL, '0.0000', 0, 0, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sma_pos_settings`
--

CREATE TABLE IF NOT EXISTS `sma_pos_settings` (
  `pos_id` int(1) NOT NULL,
  `cat_limit` int(11) NOT NULL,
  `pro_limit` int(11) NOT NULL,
  `default_category` int(11) NOT NULL,
  `default_customer` int(11) NOT NULL,
  `default_biller` int(11) NOT NULL,
  `display_time` varchar(3) NOT NULL DEFAULT 'yes',
  `cf_title1` varchar(255) DEFAULT NULL,
  `cf_title2` varchar(255) DEFAULT NULL,
  `cf_value1` varchar(255) DEFAULT NULL,
  `cf_value2` varchar(255) DEFAULT NULL,
  `receipt_printer` varchar(55) DEFAULT NULL,
  `cash_drawer_codes` varchar(55) DEFAULT NULL,
  `focus_add_item` varchar(55) DEFAULT NULL,
  `add_manual_product` varchar(55) DEFAULT NULL,
  `customer_selection` varchar(55) DEFAULT NULL,
  `add_customer` varchar(55) DEFAULT NULL,
  `toggle_category_slider` varchar(55) DEFAULT NULL,
  `toggle_subcategory_slider` varchar(55) DEFAULT NULL,
  `cancel_sale` varchar(55) DEFAULT NULL,
  `suspend_sale` varchar(55) DEFAULT NULL,
  `print_items_list` varchar(55) DEFAULT NULL,
  `finalize_sale` varchar(55) DEFAULT NULL,
  `today_sale` varchar(55) DEFAULT NULL,
  `open_hold_bills` varchar(55) DEFAULT NULL,
  `close_register` varchar(55) DEFAULT NULL,
  `keyboard` tinyint(1) NOT NULL,
  `pos_printers` varchar(255) DEFAULT NULL,
  `java_applet` tinyint(1) NOT NULL,
  `product_button_color` varchar(20) NOT NULL DEFAULT 'default',
  `tooltips` tinyint(1) DEFAULT '1',
  `paypal_pro` tinyint(1) DEFAULT '0',
  `stripe` tinyint(1) DEFAULT '0',
  `rounding` tinyint(1) DEFAULT '0',
  `char_per_line` tinyint(4) DEFAULT '42',
  `pin_code` varchar(20) DEFAULT NULL,
  `purchase_code` varchar(100) DEFAULT 'purchase_code',
  `envato_username` varchar(50) DEFAULT 'envato_username',
  `version` varchar(10) DEFAULT '3.0.1.13'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_pos_settings`
--

INSERT INTO `sma_pos_settings` (`pos_id`, `cat_limit`, `pro_limit`, `default_category`, `default_customer`, `default_biller`, `display_time`, `cf_title1`, `cf_title2`, `cf_value1`, `cf_value2`, `receipt_printer`, `cash_drawer_codes`, `focus_add_item`, `add_manual_product`, `customer_selection`, `add_customer`, `toggle_category_slider`, `toggle_subcategory_slider`, `cancel_sale`, `suspend_sale`, `print_items_list`, `finalize_sale`, `today_sale`, `open_hold_bills`, `close_register`, `keyboard`, `pos_printers`, `java_applet`, `product_button_color`, `tooltips`, `paypal_pro`, `stripe`, `rounding`, `char_per_line`, `pin_code`, `purchase_code`, `envato_username`, `version`) VALUES
(1, 22, 20, 1, 1, 3, '1', 'GST Reg', 'VAT Reg', '123456789', '987654321', 'BIXOLON SRP-350II', 'x1C', 'Ctrl+F3', 'Ctrl+Shift+M', 'Ctrl+Shift+C', 'Ctrl+Shift+A', 'Ctrl+F11', 'Ctrl+F12', 'F4', 'F7', 'F9', 'F8', 'Ctrl+F1', 'Ctrl+F2', 'Ctrl+F10', 1, 'BIXOLON SRP-350II, BIXOLON SRP-350II', 0, 'default', 1, 0, 0, 0, 42, NULL, 'purchase_code', 'envato_username', '3.0.1.13');

-- --------------------------------------------------------

--
-- Table structure for table `sma_products`
--

CREATE TABLE IF NOT EXISTS `sma_products` (
  `id` int(11) NOT NULL,
  `code` varchar(50) NOT NULL,
  `name` char(255) NOT NULL,
  `unit` varchar(50) DEFAULT NULL,
  `cost` decimal(25,4) DEFAULT NULL,
  `price` decimal(25,4) NOT NULL,
  `alert_quantity` decimal(15,4) DEFAULT '20.0000',
  `image` varchar(255) DEFAULT 'no_image.png',
  `category_id` int(11) NOT NULL,
  `subcategory_id` int(11) DEFAULT NULL,
  `cf1` varchar(255) DEFAULT NULL,
  `cf2` varchar(255) DEFAULT NULL,
  `cf3` varchar(255) DEFAULT NULL,
  `cf4` varchar(255) DEFAULT NULL,
  `cf5` varchar(255) DEFAULT NULL,
  `cf6` varchar(255) DEFAULT NULL,
  `quantity` decimal(15,4) DEFAULT '0.0000',
  `tax_rate` int(11) DEFAULT NULL,
  `track_quantity` tinyint(1) DEFAULT '1',
  `details` varchar(1000) DEFAULT NULL,
  `warehouse` int(11) DEFAULT NULL,
  `barcode_symbology` varchar(55) NOT NULL DEFAULT 'code128',
  `file` varchar(100) DEFAULT NULL,
  `product_details` text,
  `tax_method` tinyint(1) DEFAULT '0',
  `type` varchar(55) NOT NULL DEFAULT 'standard',
  `supplier1` int(11) DEFAULT NULL,
  `supplier1price` decimal(25,4) DEFAULT NULL,
  `supplier2` int(11) DEFAULT NULL,
  `supplier2price` decimal(25,4) DEFAULT NULL,
  `supplier3` int(11) DEFAULT NULL,
  `supplier3price` decimal(25,4) DEFAULT NULL,
  `supplier4` int(11) DEFAULT NULL,
  `supplier4price` decimal(25,4) DEFAULT NULL,
  `supplier5` int(11) DEFAULT NULL,
  `supplier5price` decimal(25,4) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_products`
--

INSERT INTO `sma_products` (`id`, `code`, `name`, `unit`, `cost`, `price`, `alert_quantity`, `image`, `category_id`, `subcategory_id`, `cf1`, `cf2`, `cf3`, `cf4`, `cf5`, `cf6`, `quantity`, `tax_rate`, `track_quantity`, `details`, `warehouse`, `barcode_symbology`, `file`, `product_details`, `tax_method`, `type`, `supplier1`, `supplier1price`, `supplier2`, `supplier2price`, `supplier3`, `supplier3price`, `supplier4`, `supplier4price`, `supplier5`, `supplier5price`) VALUES
(1, 'D3400', 'NIKON D3400', '42000', '150.0000', '42000.0000', '15.0000', '1e5392994bbea033cf511484bf7e88fa.png', 3, 2, '', '', '', '', '', '', '15.0000', 1, 1, '<ul><li>24.2-megapixel DX-format CMOS image sensor with no optical low-pass filter for breathtaking image quality</li><li>Always connected with Nikon SnapBridge and a compatible smartphone or tablet</li><li>Compact, lightweight and very easy to use, regardless of skill level</li><li>Learn as you go with Nikon''s innovative Guide Mode</li></ul>', NULL, 'code128', NULL, '<ul><li>24.2-megapixel DX-format CMOS image sensor with no optical low-pass filter for breathtaking image quality</li><li>Always connected with Nikon SnapBridge and a compatible smartphone or tablet</li><li>Compact, lightweight and very easy to use, regardless of skill level</li><li>Learn as you go with Nikon''s innovative Guide Mode</li></ul>', 0, 'standard', 4, '40000.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sma_product_photos`
--

CREATE TABLE IF NOT EXISTS `sma_product_photos` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `photo` varchar(100) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_product_photos`
--

INSERT INTO `sma_product_photos` (`id`, `product_id`, `photo`) VALUES
(1, 1, '3e6f4461726f016b1728518b0fd8d399.png'),
(2, 1, '745d1877d3e5dd58df77c32742e9f71b.png'),
(3, 1, '12a31432f4ebd2dbf3acb281b6d9b5a2.png'),
(4, 1, '01713c686fdba1d6039378c9b2961aaf.png'),
(5, 1, 'ff360358e82f7684742db53de3e8508b.png'),
(6, 1, '1472fbda2d6fcd872ee74547eedf730d.png');

-- --------------------------------------------------------

--
-- Table structure for table `sma_product_variants`
--

CREATE TABLE IF NOT EXISTS `sma_product_variants` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `name` varchar(55) NOT NULL,
  `cost` decimal(25,4) DEFAULT NULL,
  `price` decimal(25,4) DEFAULT NULL,
  `quantity` decimal(15,4) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_product_variants`
--

INSERT INTO `sma_product_variants` (`id`, `product_id`, `name`, `cost`, `price`, `quantity`) VALUES
(1, 1, 'COLOR', '150.0000', '42000.0000', '15.0000'),
(2, 1, 'SIZE', '0.0000', '0.0000', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sma_purchases`
--

CREATE TABLE IF NOT EXISTS `sma_purchases` (
  `id` int(11) NOT NULL,
  `reference_no` varchar(55) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `supplier_id` int(11) NOT NULL,
  `supplier` varchar(55) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `note` varchar(1000) NOT NULL,
  `total` decimal(25,4) DEFAULT NULL,
  `product_discount` decimal(25,4) DEFAULT NULL,
  `order_discount_id` varchar(20) DEFAULT NULL,
  `order_discount` decimal(25,4) DEFAULT NULL,
  `total_discount` decimal(25,4) DEFAULT NULL,
  `product_tax` decimal(25,4) DEFAULT NULL,
  `order_tax_id` int(11) DEFAULT NULL,
  `order_tax` decimal(25,4) DEFAULT NULL,
  `total_tax` decimal(25,4) DEFAULT '0.0000',
  `shipping` decimal(25,4) DEFAULT '0.0000',
  `grand_total` decimal(25,4) NOT NULL,
  `paid` decimal(25,4) NOT NULL DEFAULT '0.0000',
  `status` varchar(55) DEFAULT '',
  `payment_status` varchar(20) DEFAULT 'pending',
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `attachment` varchar(55) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_purchases`
--

INSERT INTO `sma_purchases` (`id`, `reference_no`, `date`, `supplier_id`, `supplier`, `warehouse_id`, `note`, `total`, `product_discount`, `order_discount_id`, `order_discount`, `total_discount`, `product_tax`, `order_tax_id`, `order_tax`, `total_tax`, `shipping`, `grand_total`, `paid`, `status`, `payment_status`, `created_by`, `updated_by`, `updated_at`, `attachment`) VALUES
(1, '101', '2017-03-10 20:46:00', 4, 'TECH ZONE', 1, '', '150.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 0, '0.0000', '0.0000', '0.0000', '150.0000', '0.0000', 'received', 'pending', 1, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sma_purchase_items`
--

CREATE TABLE IF NOT EXISTS `sma_purchase_items` (
  `id` int(11) NOT NULL,
  `purchase_id` int(11) DEFAULT NULL,
  `transfer_id` int(11) DEFAULT NULL,
  `product_id` int(11) NOT NULL,
  `product_code` varchar(50) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `option_id` int(11) DEFAULT NULL,
  `net_unit_cost` decimal(25,4) NOT NULL,
  `quantity` decimal(15,4) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `item_tax` decimal(25,4) DEFAULT NULL,
  `tax_rate_id` int(11) DEFAULT NULL,
  `tax` varchar(20) DEFAULT NULL,
  `discount` varchar(20) DEFAULT NULL,
  `item_discount` decimal(25,4) DEFAULT NULL,
  `expiry` date DEFAULT NULL,
  `subtotal` decimal(25,4) NOT NULL,
  `quantity_balance` decimal(15,4) DEFAULT '0.0000',
  `date` date NOT NULL,
  `status` varchar(50) NOT NULL,
  `unit_cost` decimal(25,4) DEFAULT NULL,
  `real_unit_cost` decimal(25,4) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_purchase_items`
--

INSERT INTO `sma_purchase_items` (`id`, `purchase_id`, `transfer_id`, `product_id`, `product_code`, `product_name`, `option_id`, `net_unit_cost`, `quantity`, `warehouse_id`, `item_tax`, `tax_rate_id`, `tax`, `discount`, `item_discount`, `expiry`, `subtotal`, `quantity_balance`, `date`, `status`, `unit_cost`, `real_unit_cost`) VALUES
(1, NULL, NULL, 1, 'D3400', 'NIKON D3400', 1, '150.0000', '25.0000', 1, '0.0000', 1, '0.0000', NULL, NULL, NULL, '3750.0000', '14.0000', '2017-03-10', 'received', '150.0000', NULL),
(2, NULL, 1, 1, 'D3400', 'NIKON D3400', 1, '150.0000', '1.0000', 2, '0.0000', 1, '0.0000', NULL, NULL, NULL, '150.0000', '0.0000', '2017-03-10', 'received', '150.0000', '150.0000'),
(3, NULL, 1, 1, 'D3400', 'NIKON D3400', 1, '150.0000', '1.0000', 2, '0.0000', 1, '0.0000', NULL, NULL, NULL, '150.0000', '1.0000', '2017-03-10', 'received', '150.0000', '150.0000'),
(4, 1, NULL, 1, 'D3400', 'NIKON D3400', 1, '150.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', NULL, '150.0000', '0.0000', '2017-03-11', 'received', '150.0000', '150.0000');

-- --------------------------------------------------------

--
-- Table structure for table `sma_quotes`
--

CREATE TABLE IF NOT EXISTS `sma_quotes` (
  `id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `reference_no` varchar(55) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `customer` varchar(55) NOT NULL,
  `warehouse_id` int(11) DEFAULT NULL,
  `biller_id` int(11) NOT NULL,
  `biller` varchar(55) NOT NULL,
  `note` varchar(1000) DEFAULT NULL,
  `internal_note` varchar(1000) DEFAULT NULL,
  `total` decimal(25,4) NOT NULL,
  `product_discount` decimal(25,4) DEFAULT '0.0000',
  `order_discount` decimal(25,4) DEFAULT NULL,
  `order_discount_id` varchar(20) DEFAULT NULL,
  `total_discount` decimal(25,4) DEFAULT '0.0000',
  `product_tax` decimal(25,4) DEFAULT '0.0000',
  `order_tax_id` int(11) DEFAULT NULL,
  `order_tax` decimal(25,4) DEFAULT NULL,
  `total_tax` decimal(25,4) DEFAULT NULL,
  `shipping` decimal(25,4) DEFAULT '0.0000',
  `grand_total` decimal(25,4) NOT NULL,
  `status` varchar(20) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `attachment` varchar(55) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_quotes`
--

INSERT INTO `sma_quotes` (`id`, `date`, `reference_no`, `customer_id`, `customer`, `warehouse_id`, `biller_id`, `biller`, `note`, `internal_note`, `total`, `product_discount`, `order_discount`, `order_discount_id`, `total_discount`, `product_tax`, `order_tax_id`, `order_tax`, `total_tax`, `shipping`, `grand_total`, `status`, `created_by`, `updated_by`, `updated_at`, `attachment`) VALUES
(1, '2017-03-10 20:48:00', 'QUOTE/2017/03/0001', 1, 'Walk-in Customer', 2, 3, 'Test Biller', '', NULL, '42000.0000', '0.0000', '0.0000', NULL, '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '42000.0000', 'completed', 1, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sma_quote_items`
--

CREATE TABLE IF NOT EXISTS `sma_quote_items` (
  `id` int(11) NOT NULL,
  `quote_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_code` varchar(55) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_type` varchar(20) DEFAULT NULL,
  `option_id` int(11) DEFAULT NULL,
  `net_unit_price` decimal(25,4) NOT NULL,
  `unit_price` decimal(25,4) DEFAULT NULL,
  `quantity` decimal(15,4) NOT NULL,
  `warehouse_id` int(11) DEFAULT NULL,
  `item_tax` decimal(25,4) DEFAULT NULL,
  `tax_rate_id` int(11) DEFAULT NULL,
  `tax` varchar(55) DEFAULT NULL,
  `discount` varchar(55) DEFAULT NULL,
  `item_discount` decimal(25,4) DEFAULT NULL,
  `subtotal` decimal(25,4) NOT NULL,
  `serial_no` varchar(255) DEFAULT NULL,
  `real_unit_price` decimal(25,4) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_quote_items`
--

INSERT INTO `sma_quote_items` (`id`, `quote_id`, `product_id`, `product_code`, `product_name`, `product_type`, `option_id`, `net_unit_price`, `unit_price`, `quantity`, `warehouse_id`, `item_tax`, `tax_rate_id`, `tax`, `discount`, `item_discount`, `subtotal`, `serial_no`, `real_unit_price`) VALUES
(1, 1, 1, 'D3400', 'NIKON D3400', 'standard', 1, '42000.0000', '42000.0000', '1.0000', 2, '0.0000', 1, '0.0000', '0', '0.0000', '42000.0000', NULL, '42000.0000');

-- --------------------------------------------------------

--
-- Table structure for table `sma_return_items`
--

CREATE TABLE IF NOT EXISTS `sma_return_items` (
  `id` int(11) NOT NULL,
  `sale_id` int(11) unsigned NOT NULL,
  `return_id` int(11) unsigned NOT NULL,
  `sale_item_id` int(11) DEFAULT NULL,
  `product_id` int(11) unsigned NOT NULL,
  `product_code` varchar(55) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_type` varchar(20) DEFAULT NULL,
  `option_id` int(11) DEFAULT NULL,
  `net_unit_price` decimal(25,4) NOT NULL,
  `quantity` decimal(15,4) DEFAULT '0.0000',
  `warehouse_id` int(11) DEFAULT NULL,
  `item_tax` decimal(25,4) DEFAULT NULL,
  `tax_rate_id` int(11) DEFAULT NULL,
  `tax` varchar(55) DEFAULT NULL,
  `discount` varchar(55) DEFAULT NULL,
  `item_discount` decimal(25,4) DEFAULT NULL,
  `subtotal` decimal(25,4) NOT NULL,
  `serial_no` varchar(255) DEFAULT NULL,
  `real_unit_price` decimal(25,4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_return_sales`
--

CREATE TABLE IF NOT EXISTS `sma_return_sales` (
  `id` int(11) NOT NULL,
  `sale_id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `reference_no` varchar(55) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `customer` varchar(55) NOT NULL,
  `biller_id` int(11) NOT NULL,
  `biller` varchar(55) NOT NULL,
  `warehouse_id` int(11) DEFAULT NULL,
  `note` varchar(1000) DEFAULT NULL,
  `total` decimal(25,4) NOT NULL,
  `product_discount` decimal(25,4) DEFAULT '0.0000',
  `order_discount_id` varchar(20) DEFAULT NULL,
  `total_discount` decimal(25,4) DEFAULT '0.0000',
  `order_discount` decimal(25,4) DEFAULT '0.0000',
  `product_tax` decimal(25,4) DEFAULT '0.0000',
  `order_tax_id` int(11) DEFAULT NULL,
  `order_tax` decimal(25,4) DEFAULT '0.0000',
  `total_tax` decimal(25,4) DEFAULT '0.0000',
  `surcharge` decimal(25,4) DEFAULT '0.0000',
  `grand_total` decimal(25,4) NOT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `attachment` varchar(55) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_sales`
--

CREATE TABLE IF NOT EXISTS `sma_sales` (
  `id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `reference_no` varchar(55) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `customer` varchar(55) NOT NULL,
  `biller_id` int(11) NOT NULL,
  `biller` varchar(55) NOT NULL,
  `warehouse_id` int(11) DEFAULT NULL,
  `note` varchar(1000) DEFAULT NULL,
  `staff_note` varchar(1000) DEFAULT NULL,
  `total` decimal(25,4) NOT NULL,
  `product_discount` decimal(25,4) DEFAULT '0.0000',
  `order_discount_id` varchar(20) DEFAULT NULL,
  `total_discount` decimal(25,4) DEFAULT '0.0000',
  `order_discount` decimal(25,4) DEFAULT '0.0000',
  `product_tax` decimal(25,4) DEFAULT '0.0000',
  `order_tax_id` int(11) DEFAULT NULL,
  `order_tax` decimal(25,4) DEFAULT '0.0000',
  `total_tax` decimal(25,4) DEFAULT '0.0000',
  `shipping` decimal(25,4) DEFAULT '0.0000',
  `grand_total` decimal(25,4) NOT NULL,
  `sale_status` varchar(20) DEFAULT NULL,
  `payment_status` varchar(20) DEFAULT NULL,
  `payment_term` tinyint(4) DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `total_items` tinyint(4) DEFAULT NULL,
  `pos` tinyint(1) NOT NULL DEFAULT '0',
  `paid` decimal(25,4) DEFAULT '0.0000',
  `return_id` int(11) DEFAULT NULL,
  `surcharge` decimal(25,4) NOT NULL DEFAULT '0.0000',
  `attachment` varchar(55) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_sales`
--

INSERT INTO `sma_sales` (`id`, `date`, `reference_no`, `customer_id`, `customer`, `biller_id`, `biller`, `warehouse_id`, `note`, `staff_note`, `total`, `product_discount`, `order_discount_id`, `total_discount`, `order_discount`, `product_tax`, `order_tax_id`, `order_tax`, `total_tax`, `shipping`, `grand_total`, `sale_status`, `payment_status`, `payment_term`, `due_date`, `created_by`, `updated_by`, `updated_at`, `total_items`, `pos`, `paid`, `return_id`, `surcharge`, `attachment`) VALUES
(1, '2017-03-10 15:42:18', 'SALE/POS/2017/03/0001', 1, 'Walk-in Customer', 3, 'Test Biller', 1, '', '', '84000.0000', '0.0000', '1000', '1000.0000', '1000.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '83000.0000', 'completed', 'paid', 0, NULL, 1, NULL, NULL, 2, 1, '83000.0000', NULL, '0.0000', NULL),
(2, '2017-03-10 20:48:00', 'SALE/2017/03/0001', 1, 'Walk-in Customer', 3, 'Test Biller', 2, '', '', '42000.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '42000.0000', 'completed', 'paid', 0, NULL, 1, NULL, NULL, 1, 0, '42000.0000', NULL, '0.0000', NULL),
(3, '2017-03-11 09:16:20', 'SALE/POS/2017/03/0002', 1, 'Walk-in Customer', 3, 'Test Biller', 1, '', '', '210000.0000', '0.0000', '1000', '1000.0000', '1000.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '209000.0000', 'completed', 'paid', 0, NULL, 1, NULL, NULL, 5, 1, '209000.0000', NULL, '0.0000', NULL),
(4, '2017-04-07 04:19:40', 'SALE/POS/2017/04/0003', 1, 'Walk-in Customer', 3, 'Test Biller', 1, '', '', '84000.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '84000.0000', 'completed', 'partial', 0, NULL, 1, NULL, NULL, 2, 1, '50000.0000', NULL, '0.0000', NULL),
(5, '2017-04-07 04:21:54', 'SALE/POS/2017/04/0004', 1, 'Walk-in Customer', 3, 'Test Biller', 1, '', '', '42000.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '42000.0000', 'completed', 'paid', 0, NULL, 1, NULL, NULL, 1, 1, '42000.0000', NULL, '0.0000', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sma_sale_items`
--

CREATE TABLE IF NOT EXISTS `sma_sale_items` (
  `id` int(11) NOT NULL,
  `sale_id` int(11) unsigned NOT NULL,
  `product_id` int(11) unsigned NOT NULL,
  `product_code` varchar(55) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_type` varchar(20) DEFAULT NULL,
  `option_id` int(11) DEFAULT NULL,
  `net_unit_price` decimal(25,4) NOT NULL,
  `unit_price` decimal(25,4) DEFAULT NULL,
  `quantity` decimal(15,4) NOT NULL,
  `warehouse_id` int(11) DEFAULT NULL,
  `item_tax` decimal(25,4) DEFAULT NULL,
  `tax_rate_id` int(11) DEFAULT NULL,
  `tax` varchar(55) DEFAULT NULL,
  `discount` varchar(55) DEFAULT NULL,
  `item_discount` decimal(25,4) DEFAULT NULL,
  `subtotal` decimal(25,4) NOT NULL,
  `serial_no` varchar(255) DEFAULT NULL,
  `real_unit_price` decimal(25,4) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_sale_items`
--

INSERT INTO `sma_sale_items` (`id`, `sale_id`, `product_id`, `product_code`, `product_name`, `product_type`, `option_id`, `net_unit_price`, `unit_price`, `quantity`, `warehouse_id`, `item_tax`, `tax_rate_id`, `tax`, `discount`, `item_discount`, `subtotal`, `serial_no`, `real_unit_price`) VALUES
(1, 1, 1, 'D3400', 'NIKON D3400', 'standard', 1, '42000.0000', '42000.0000', '2.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '84000.0000', '', '42000.0000'),
(2, 2, 1, 'D3400', 'NIKON D3400', 'standard', 1, '42000.0000', '42000.0000', '1.0000', 2, '0.0000', 1, '0.0000', '0', '0.0000', '42000.0000', '', '42000.0000'),
(3, 3, 1, 'D3400', 'NIKON D3400', 'standard', 1, '42000.0000', '42000.0000', '5.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '210000.0000', '', '42000.0000'),
(4, 4, 1, 'D3400', 'NIKON D3400', 'standard', 1, '42000.0000', '42000.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '42000.0000', '', '42000.0000'),
(5, 4, 1, 'D3400', 'NIKON D3400', 'standard', 1, '42000.0000', '42000.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '42000.0000', '', '42000.0000'),
(6, 5, 1, 'D3400', 'NIKON D3400', 'standard', 1, '42000.0000', '42000.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '42000.0000', '', '42000.0000');

-- --------------------------------------------------------

--
-- Table structure for table `sma_sessions`
--

CREATE TABLE IF NOT EXISTS `sma_sessions` (
  `id` varchar(40) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `timestamp` int(10) unsigned NOT NULL DEFAULT '0',
  `data` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_sessions`
--

INSERT INTO `sma_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES
('08e567bf9e4f9079217a490a44173a4df0872f55', '::1', 1489175922, 0x5f5f63695f6c6173745f726567656e65726174657c693a313438393137353632363b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a31393a226d736e6177617a626440676d61696c2e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31393a226d736e6177617a626440676d61696c2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343838393830363334223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313438393137353739383b),
('09068ff30d98f4ef707dae10cdd4346258a01fa6', '::1', 1491554451, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439313535343435303b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a31393a226d736e6177617a626440676d61696c2e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31393a226d736e6177617a626440676d61696c2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343930393238363531223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a32353a2262616e6e6572735f6e617261796e676f6e675f5f312e706e67223b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313439313535343435303b72656769737465725f69647c733a313a2231223b636173685f696e5f68616e647c733a383a223130302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30332d30352031343a31333a3434223b757365725f637372667c733a32303a22467a58564f6c4d346e4945784267755068716177223b),
('1be895f1a65f033dd3ff96383f08572e881f2c72', '::1', 1488702996, 0x5f5f63695f6c6173745f726567656e65726174657c693a313438383730323937333b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a31393a226d736e6177617a626440676d61696c2e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31393a226d736e6177617a626440676d61696c2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343838363236353635223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('2007360ffd63deb06462dfed7fe1914cdd89baa8', '::1', 1488731190, 0x5f5f63695f6c6173745f726567656e65726174657c693a313438383733313138383b7265717565737465645f706167657c733a333a22706f73223b),
('27c6db3a8103a82a49b4184e1eac8786d3a7756f', '::1', 1488742302, 0x5f5f63695f6c6173745f726567656e65726174657c693a313438383734323132343b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a31393a226d736e6177617a626440676d61696c2e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31393a226d736e6177617a626440676d61696c2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343838373139333235223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313438383734323136303b72656769737465725f69647c733a313a2231223b636173685f696e5f68616e647c733a383a223130302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30332d30352031343a31333a3434223b),
('2d016bf2ffa281a6ea14fd41ecc16a24beafafb5', '::1', 1489177550, 0x5f5f63695f6c6173745f726567656e65726174657c693a313438393137373237353b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a31393a226d736e6177617a626440676d61696c2e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31393a226d736e6177617a626440676d61696c2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343838393830363334223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313438393137373431363b757365725f637372667c733a32303a2250625558475436676f5256684c6d76724f4b6e79223b72656769737465725f69647c733a313a2231223b636173685f696e5f68616e647c733a383a223130302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30332d30352031343a31333a3434223b),
('2d070e0f2d00aba29adabe716d5d1bcd5ff26715', '::1', 1490622727, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439303632323731313b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a31393a226d736e6177617a626440676d61696c2e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31393a226d736e6177617a626440676d61696c2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343930353636313030223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a32353a2262616e6e6572735f6e617261796e676f6e675f5f312e706e67223b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('3100381ac6acf0014f07df104f3ac1c35c0a1a57', '::1', 1490623414, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439303632333431343b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a31393a226d736e6177617a626440676d61696c2e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31393a226d736e6177617a626440676d61696c2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343930353636313030223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a32353a2262616e6e6572735f6e617261796e676f6e675f5f312e706e67223b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('3f2c10553d916deb6f490492896e7970ac884b38', '::1', 1489177889, 0x5f5f63695f6c6173745f726567656e65726174657c693a313438393137373634363b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a31393a226d736e6177617a626440676d61696c2e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31393a226d736e6177617a626440676d61696c2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343838393830363334223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313438393137373637373b757365725f637372667c733a32303a2250625558475436676f5256684c6d76724f4b6e79223b72656769737465725f69647c733a313a2231223b636173685f696e5f68616e647c733a383a223130302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30332d30352031343a31333a3434223b),
('4230ec70b4ba3f04d07774e5e8d547a8eb122445', '::1', 1488721787, 0x5f5f63695f6c6173745f726567656e65726174657c693a313438383732313738373b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a31393a226d736e6177617a626440676d61696c2e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31393a226d736e6177617a626440676d61696c2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343838373139333233223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313438383731393636353b72656769737465725f69647c733a313a2231223b636173685f696e5f68616e647c733a383a223130302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30332d30352031343a31333a3434223b),
('42a1cb1f6d09ece296ade253e99d00725aa44d59', '::1', 1489681668, 0x5f5f63695f6c6173745f726567656e65726174657c693a313438393638313334313b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a31393a226d736e6177617a626440676d61696c2e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31393a226d736e6177617a626440676d61696c2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343839323431353137223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313438393638313432393b72656769737465725f69647c733a313a2231223b636173685f696e5f68616e647c733a383a223130302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30332d30352031343a31333a3434223b),
('44815c7f355679bd4b0dda0bd404f688e7481db2', '::1', 1488626184, 0x5f5f63695f6c6173745f726567656e65726174657c693a313438383632363130323b7265717565737465645f706167657c733a373a2277656c636f6d65223b),
('46c19cb40be492a38d64eff74707707ec23240a6', '::1', 1488704425, 0x5f5f63695f6c6173745f726567656e65726174657c693a313438383730343432343b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a31393a226d736e6177617a626440676d61696c2e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31393a226d736e6177617a626440676d61696c2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343838363236353635223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('471dc8198a7bc71c40046b1669d0b02588bcc36a', '::1', 1488626003, 0x5f5f63695f6c6173745f726567656e65726174657c693a313438383632353830313b7265717565737465645f706167657c733a303a22223b),
('4903b9f950eb5e8366b7eda877d5edc260a19358', '::1', 1489242103, 0x5f5f63695f6c6173745f726567656e65726174657c693a313438393234313834333b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a31393a226d736e6177617a626440676d61696c2e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31393a226d736e6177617a626440676d61696c2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343839313734383835223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313438393234313933313b72656769737465725f69647c733a313a2231223b636173685f696e5f68616e647c733a383a223130302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30332d30352031343a31333a3434223b),
('4918c2db0162b57ec5cb5ff469535971a3049e8e', '::1', 1491553478, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439313535333138303b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a31393a226d736e6177617a626440676d61696c2e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31393a226d736e6177617a626440676d61696c2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343930393238363531223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a32353a2262616e6e6572735f6e617261796e676f6e675f5f312e706e67223b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313439313535333435323b72656769737465725f69647c733a313a2231223b636173685f696e5f68616e647c733a383a223130302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30332d30352031343a31333a3434223b),
('4c418aec0e19755262632459a80feea1b8184b66', '::1', 1488704460, 0x5f5f63695f6c6173745f726567656e65726174657c693a313438383730343432353b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a31393a226d736e6177617a626440676d61696c2e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31393a226d736e6177617a626440676d61696c2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343838363236353635223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313438383730343434303b),
('4ccb0be51b5f492f55d51be6912b18e1a567c6cf', '::1', 1490302824, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439303330323831373b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a31393a226d736e6177617a626440676d61696c2e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31393a226d736e6177617a626440676d61696c2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343839363831333539223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a32353a2262616e6e6572735f6e617261796e676f6e675f5f312e706e67223b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313439303330323831373b),
('573d5a6a2a43a6c35181ca73f0bb51d908602454', '::1', 1490467253, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439303436373230303b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a31393a226d736e6177617a626440676d61696c2e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31393a226d736e6177617a626440676d61696c2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343930333936363331223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a32353a2262616e6e6572735f6e617261796e676f6e675f5f312e706e67223b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('576bef16fed0c8afb51d7ab0c79796d656f9151c', '::1', 1490352390, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439303335323337393b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a31393a226d736e6177617a626440676d61696c2e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31393a226d736e6177617a626440676d61696c2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343930323930323732223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a32353a2262616e6e6572735f6e617261796e676f6e675f5f312e706e67223b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('5af748f5f9475652239add39dce70d45eb31deee', '::1', 1490290737, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439303239303235383b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a31393a226d736e6177617a626440676d61696c2e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31393a226d736e6177617a626440676d61696c2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343839363831333539223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('5f749156e165a6ba52b60b753e259962f19b273f', '::1', 1488985626, 0x5f5f63695f6c6173745f726567656e65726174657c693a313438383938353632353b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a31393a226d736e6177617a626440676d61696c2e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31393a226d736e6177617a626440676d61696c2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343838373432313333223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('62608cf0f16c1af23042a146fb025c943db33a91', '::1', 1490300060, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439303330303035393b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a31393a226d736e6177617a626440676d61696c2e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31393a226d736e6177617a626440676d61696c2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343839363831333539223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a32353a2262616e6e6572735f6e617261796e676f6e675f5f312e706e67223b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('63ddb4d91eb0c26be38a5a8623658f17eb37fe3c', '::1', 1491552475, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439313535323232323b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a31393a226d736e6177617a626440676d61696c2e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31393a226d736e6177617a626440676d61696c2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343930393238363531223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a32353a2262616e6e6572735f6e617261796e676f6e675f5f312e706e67223b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313439313535323332313b72656769737465725f69647c733a313a2231223b636173685f696e5f68616e647c733a383a223130302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30332d30352031343a31333a3434223b),
('67d5c506310cc1d80a31a48e77d8c39628e81bdb', '::1', 1488719612, 0x5f5f63695f6c6173745f726567656e65726174657c693a313438383731393331333b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a31393a226d736e6177617a626440676d61696c2e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31393a226d736e6177617a626440676d61696c2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343838373139333233223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313438383731393631323b6572726f727c733a38323a225265676973746572206973206e6f74206f70656e2c20506c6561736520656e74657220746865206361736820696e2068616e6420616d6f756e7420616e6420636c69636b206f70656e207265676973746572223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226f6c64223b7d),
('67ebba1dd4afc7928a29e012ea1b181033a88951', '::1', 1490651355, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439303635313131353b7265717565737465645f706167657c733a31323a2270726f64756374732f616464223b6964656e746974797c733a31393a226d736e6177617a626440676d61696c2e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31393a226d736e6177617a626440676d61696c2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343930363232373139223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a32353a2262616e6e6572735f6e617261796e676f6e675f5f312e706e67223b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313439303635313335343b),
('68ab291e81becd464edb6f75f3f33aaa77c4458a', '::1', 1488719713, 0x5f5f63695f6c6173745f726567656e65726174657c693a313438383731393632343b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a31393a226d736e6177617a626440676d61696c2e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31393a226d736e6177617a626440676d61696c2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343838373139333233223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313438383731393636353b72656769737465725f69647c733a313a2231223b636173685f696e5f68616e647c733a383a223130302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30332d30352031343a31333a3434223b),
('68b4b1fccd3b14afbbd85f029ab57370b1a1ed91', '::1', 1490295015, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439303239353031353b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a31393a226d736e6177617a626440676d61696c2e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31393a226d736e6177617a626440676d61696c2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343839363831333539223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a32353a2262616e6e6572735f6e617261796e676f6e675f5f312e706e67223b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('6b9021fc799190dba94f82b6d5220ad220c7f115', '::1', 1490302814, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439303330313938323b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a31393a226d736e6177617a626440676d61696c2e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31393a226d736e6177617a626440676d61696c2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343839363831333539223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a32353a2262616e6e6572735f6e617261796e676f6e675f5f312e706e67223b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('6c9995235c709ffa1bd1d207dc20052daffb219a', '::1', 1489178814, 0x5f5f63695f6c6173745f726567656e65726174657c693a313438393137383439383b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a31393a226d736e6177617a626440676d61696c2e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31393a226d736e6177617a626440676d61696c2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343838393830363334223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313438393137383635303b757365725f637372667c733a32303a2247443051726e526b493859503155337554655367223b72656769737465725f69647c733a313a2231223b636173685f696e5f68616e647c733a383a223130302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30332d30352031343a31333a3434223b72656d6f76655f706f736c737c693a313b72656d6f76655f746f6c737c693a313b),
('70a60c91f5482516d98b55951f1adafe062f087e', '::1', 1489176957, 0x5f5f63695f6c6173745f726567656e65726174657c693a313438393137363536383b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a31393a226d736e6177617a626440676d61696c2e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31393a226d736e6177617a626440676d61696c2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343838393830363334223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313438393137353739383b757365725f637372667c733a32303a2250625558475436676f5256684c6d76724f4b6e79223b),
('8caf08d1ec28443bf9d957b50fa9a70a29a7d221', '::1', 1488705637, 0x5f5f63695f6c6173745f726567656e65726174657c693a313438383730353633373b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a31393a226d736e6177617a626440676d61696c2e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31393a226d736e6177617a626440676d61696c2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343838363236353635223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313438383730343434303b),
('8d3b71ff99a01d1c58d29ba233830e1667d32965', '::1', 1491554397, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439313535343132333b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a31393a226d736e6177617a626440676d61696c2e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31393a226d736e6177617a626440676d61696c2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343930393238363531223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a32353a2262616e6e6572735f6e617261796e676f6e675f5f312e706e67223b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313439313535343339363b72656769737465725f69647c733a313a2231223b636173685f696e5f68616e647c733a383a223130302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30332d30352031343a31333a3434223b757365725f637372667c733a32303a22467a58564f6c4d346e4945784267755068716177223b),
('93414b84da6fb4d847d6e07fec944efbfa2941a1', '::1', 1489176219, 0x5f5f63695f6c6173745f726567656e65726174657c693a313438393137353933393b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a31393a226d736e6177617a626440676d61696c2e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31393a226d736e6177617a626440676d61696c2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343838393830363334223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313438393137353739383b),
('986dfb4c567f81b74bf9aaa00863e1addbd5dd44', '::1', 1491554051, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439313535333831373b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a31393a226d736e6177617a626440676d61696c2e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31393a226d736e6177617a626440676d61696c2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343930393238363531223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a32353a2262616e6e6572735f6e617261796e676f6e675f5f312e706e67223b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313439313535333832373b72656769737465725f69647c733a313a2231223b636173685f696e5f68616e647c733a383a223130302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30332d30352031343a31333a3434223b757365725f637372667c733a32303a22467a58564f6c4d346e4945784267755068716177223b),
('9b11c9ea7ea586e89a02a701edf7ae2174abf60e', '::1', 1488728243, 0x5f5f63695f6c6173745f726567656e65726174657c693a313438383732383233393b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a31393a226d736e6177617a626440676d61696c2e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31393a226d736e6177617a626440676d61696c2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343838373139333233223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313438383732383234303b72656769737465725f69647c733a313a2231223b636173685f696e5f68616e647c733a383a223130302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30332d30352031343a31333a3434223b),
('9b22b0d51923f726f462e2bec72c2ecf7162d868', '::1', 1489681830, 0x5f5f63695f6c6173745f726567656e65726174657c693a313438393638313639333b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a31393a226d736e6177617a626440676d61696c2e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31393a226d736e6177617a626440676d61696c2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343839323431353137223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313438393638313731303b72656769737465725f69647c733a313a2231223b636173685f696e5f68616e647c733a383a223130302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30332d30352031343a31333a3434223b),
('9de0f59fe8a622a33ed5f4f226011dabbc5c70be', '::1', 1490359326, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439303335393330333b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a31393a226d736e6177617a626440676d61696c2e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31393a226d736e6177617a626440676d61696c2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343930323930323732223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a32353a2262616e6e6572735f6e617261796e676f6e675f5f312e706e67223b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('a0334f3ab5389c9bf7fc64e38732b203276d2ae3', '::1', 1490928695, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439303932383634333b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a31393a226d736e6177617a626440676d61696c2e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31393a226d736e6177617a626440676d61696c2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343930363531313232223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a32353a2262616e6e6572735f6e617261796e676f6e675f5f312e706e67223b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313439303932383637393b),
('ac0cd58c68287c3968cdd3da2acd766bcf947a49', '::1', 1490566120, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439303536363039333b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a31393a226d736e6177617a626440676d61696c2e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31393a226d736e6177617a626440676d61696c2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343930343637323038223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a32353a2262616e6e6572735f6e617261796e676f6e675f5f312e706e67223b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b637372666b65797c733a383a226474375756474551223b5f5f63695f766172737c613a323a7b733a373a22637372666b6579223b733a333a226e6577223b733a393a226373726676616c7565223b733a333a226e6577223b7d6373726676616c75657c733a32303a225948664f45445a544d644e6778686233386b4276223b),
('b4d301179dad2fe3aec856988a7dd6661a0ebefa', '::1', 1489174899, 0x5f5f63695f6c6173745f726567656e65726174657c693a313438393137343837323b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a31393a226d736e6177617a626440676d61696c2e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31393a226d736e6177617a626440676d61696c2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343838393830363334223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('bbe3e261988fb46dea79a9d532fcc663f00ca63d', '::1', 1489150296, 0x5f5f63695f6c6173745f726567656e65726174657c693a313438393135303239353b7265717565737465645f706167657c733a303a22223b),
('bcd37c6f7761e4b8e724e29d0eef98dca62513f1', '::1', 1490396734, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439303339363632343b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a31393a226d736e6177617a626440676d61696c2e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31393a226d736e6177617a626440676d61696c2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343930333532333836223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a32353a2262616e6e6572735f6e617261796e676f6e675f5f312e706e67223b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313439303339363733313b),
('c0ac9e1a1fae712d32cc05bc99252e5f1faea709', '::1', 1488742786, 0x5f5f63695f6c6173745f726567656e65726174657c693a313438383734323737323b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a31393a226d736e6177617a626440676d61696c2e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31393a226d736e6177617a626440676d61696c2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343838373139333235223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313438383734323136303b72656769737465725f69647c733a313a2231223b636173685f696e5f68616e647c733a383a223130302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30332d30352031343a31333a3434223b),
('c6dbd8d5779c0e0eb1b77c97f416697822ab6ff1', '::1', 1489179109, 0x5f5f63695f6c6173745f726567656e65726174657c693a313438393137383832383b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a31393a226d736e6177617a626440676d61696c2e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31393a226d736e6177617a626440676d61696c2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343838393830363334223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313438393137393030383b757365725f637372667c733a32303a2247443051726e526b493859503155337554655367223b72656769737465725f69647c733a313a2231223b636173685f696e5f68616e647c733a383a223130302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30332d30352031343a31333a3434223b72656d6f76655f746f6c737c693a313b),
('cd0038224fbe828c655300225fc9d40b514acbeb', '::1', 1489242353, 0x5f5f63695f6c6173745f726567656e65726174657c693a313438393234323237323b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a31393a226d736e6177617a626440676d61696c2e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31393a226d736e6177617a626440676d61696c2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343839313734383835223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313438393234313933313b72656769737465725f69647c733a313a2231223b636173685f696e5f68616e647c733a383a223130302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30332d30352031343a31333a3434223b),
('d50f124a80329aa498a297c9e792a85f12bdbcfd', '::1', 1490467852, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439303436373833343b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a31393a226d736e6177617a626440676d61696c2e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31393a226d736e6177617a626440676d61696c2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343930333936363331223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a32353a2262616e6e6572735f6e617261796e676f6e675f5f312e706e67223b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('d9748d89f1f7bbc4abade171c8c079ec75459f9a', '::1', 1488981153, 0x5f5f63695f6c6173745f726567656e65726174657c693a313438383938313035343b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a31393a226d736e6177617a626440676d61696c2e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31393a226d736e6177617a626440676d61696c2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343838373432313333223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('db5562d4c5d6c50952cefff6cbb8d019716e9e44', '::1', 1488626894, 0x5f5f63695f6c6173745f726567656e65726174657c693a313438383632363838383b6964656e746974797c733a31393a226d736e6177617a626440676d61696c2e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31393a226d736e6177617a626440676d61696c2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343838363236343137223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313438383632363737333b),
('db7e8fb3662267c7761cee9b9f217b43ecf5ddf4', '::1', 1491553027, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439313535323836373b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a31393a226d736e6177617a626440676d61696c2e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31393a226d736e6177617a626440676d61696c2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343930393238363531223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a32353a2262616e6e6572735f6e617261796e676f6e675f5f312e706e67223b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313439313535323533363b72656769737465725f69647c733a313a2231223b636173685f696e5f68616e647c733a383a223130302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30332d30352031343a31333a3434223b),
('dc09eb19d344e89db849f852e8e4788b9fe2fda2', '::1', 1491552537, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439313535323533363b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a31393a226d736e6177617a626440676d61696c2e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31393a226d736e6177617a626440676d61696c2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343930393238363531223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a32353a2262616e6e6572735f6e617261796e676f6e675f5f312e706e67223b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313439313535323533363b72656769737465725f69647c733a313a2231223b636173685f696e5f68616e647c733a383a223130302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30332d30352031343a31333a3434223b),
('dc51e41368cb57d7b7e3a03da83a31612843892e', '::1', 1488626802, 0x5f5f63695f6c6173745f726567656e65726174657c693a313438383632363535323b6964656e746974797c733a31393a226d736e6177617a626440676d61696c2e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31393a226d736e6177617a626440676d61696c2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343838363236343137223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313438383632363737333b),
('df95796475b143eb7ba5faf9d44048f96ef64e89', '::1', 1491553723, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439313535333439323b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a31393a226d736e6177617a626440676d61696c2e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31393a226d736e6177617a626440676d61696c2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343930393238363531223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a32353a2262616e6e6572735f6e617261796e676f6e675f5f312e706e67223b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313439313535333435323b72656769737465725f69647c733a313a2231223b636173685f696e5f68616e647c733a383a223130302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30332d30352031343a31333a3434223b),
('dfa138057ec2ce8cd553e1640c70ef9a782f3407', '::1', 1490628900, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439303632383839393b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a31393a226d736e6177617a626440676d61696c2e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31393a226d736e6177617a626440676d61696c2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343930353636313030223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a32353a2262616e6e6572735f6e617261796e676f6e675f5f312e706e67223b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('dff0a0d9b45f094e4aba0b1885c82ad2a9536184', '::1', 1490292108, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439303239323130383b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a31393a226d736e6177617a626440676d61696c2e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31393a226d736e6177617a626440676d61696c2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343839363831333539223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a32353a2262616e6e6572735f6e617261796e676f6e675f5f312e706e67223b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('eb1fd50c5ca1cf5dd4828ddff2dfe93287851c92', '::1', 1488980833, 0x5f5f63695f6c6173745f726567656e65726174657c693a313438383938303632383b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a31393a226d736e6177617a626440676d61696c2e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31393a226d736e6177617a626440676d61696c2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343838373432313333223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('f3b30a11ae880d1516c585823ea6363198b46b46', '::1', 1490290973, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439303239303734313b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a31393a226d736e6177617a626440676d61696c2e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31393a226d736e6177617a626440676d61696c2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343839363831333539223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a32353a2262616e6e6572735f6e617261796e676f6e675f5f312e706e67223b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('f80615f9e656016ac8d56d898caedef426c09707', '::1', 1489241781, 0x5f5f63695f6c6173745f726567656e65726174657c693a313438393234313530333b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a31393a226d736e6177617a626440676d61696c2e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31393a226d736e6177617a626440676d61696c2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343839313734383835223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313438393234313738303b72656769737465725f69647c733a313a2231223b636173685f696e5f68616e647c733a383a223130302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30332d30352031343a31333a3434223b72656d6f76655f706f736c737c693a313b6d6573736167657c733a32373a22504f532053616c65207375636365737366756c6c79206164646564223b5f5f63695f766172737c613a313a7b733a373a226d657373616765223b733a333a226f6c64223b7d);
INSERT INTO `sma_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES
('fd2c386341bf1e8ba6a50648ad51b130db1d79d5', '::1', 1489177247, 0x5f5f63695f6c6173745f726567656e65726174657c693a313438393137363937313b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a31393a226d736e6177617a626440676d61696c2e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31393a226d736e6177617a626440676d61696c2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343838393830363334223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313438393137353739383b757365725f637372667c733a32303a2250625558475436676f5256684c6d76724f4b6e79223b),
('fde49af783c57dc64d30de3f585925d72217cfdd', '::1', 1489176531, 0x5f5f63695f6c6173745f726567656e65726174657c693a313438393137363234313b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a31393a226d736e6177617a626440676d61696c2e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31393a226d736e6177617a626440676d61696c2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343838393830363334223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313438393137353739383b757365725f637372667c733a32303a2250625558475436676f5256684c6d76724f4b6e79223b);

-- --------------------------------------------------------

--
-- Table structure for table `sma_settings`
--

CREATE TABLE IF NOT EXISTS `sma_settings` (
  `setting_id` int(1) NOT NULL,
  `logo` varchar(255) NOT NULL,
  `logo2` varchar(255) NOT NULL,
  `site_name` varchar(55) NOT NULL,
  `language` varchar(20) NOT NULL,
  `default_warehouse` int(2) NOT NULL,
  `accounting_method` tinyint(4) NOT NULL DEFAULT '0',
  `default_currency` varchar(3) NOT NULL,
  `default_tax_rate` int(2) NOT NULL,
  `rows_per_page` int(2) NOT NULL,
  `version` varchar(10) NOT NULL DEFAULT '1.0',
  `default_tax_rate2` int(11) NOT NULL DEFAULT '0',
  `dateformat` int(11) NOT NULL,
  `sales_prefix` varchar(20) DEFAULT NULL,
  `quote_prefix` varchar(20) DEFAULT NULL,
  `purchase_prefix` varchar(20) DEFAULT NULL,
  `transfer_prefix` varchar(20) DEFAULT NULL,
  `delivery_prefix` varchar(20) DEFAULT NULL,
  `payment_prefix` varchar(20) DEFAULT NULL,
  `return_prefix` varchar(20) DEFAULT NULL,
  `expense_prefix` varchar(20) DEFAULT NULL,
  `item_addition` tinyint(1) NOT NULL DEFAULT '0',
  `theme` varchar(20) NOT NULL,
  `product_serial` tinyint(4) NOT NULL,
  `default_discount` int(11) NOT NULL,
  `product_discount` tinyint(1) NOT NULL DEFAULT '0',
  `discount_method` tinyint(4) NOT NULL,
  `tax1` tinyint(4) NOT NULL,
  `tax2` tinyint(4) NOT NULL,
  `overselling` tinyint(1) NOT NULL DEFAULT '0',
  `restrict_user` tinyint(4) NOT NULL DEFAULT '0',
  `restrict_calendar` tinyint(4) NOT NULL DEFAULT '0',
  `timezone` varchar(100) DEFAULT NULL,
  `iwidth` int(11) NOT NULL DEFAULT '0',
  `iheight` int(11) NOT NULL,
  `twidth` int(11) NOT NULL,
  `theight` int(11) NOT NULL,
  `watermark` tinyint(1) DEFAULT NULL,
  `reg_ver` tinyint(1) DEFAULT NULL,
  `allow_reg` tinyint(1) DEFAULT NULL,
  `reg_notification` tinyint(1) DEFAULT NULL,
  `auto_reg` tinyint(1) DEFAULT NULL,
  `protocol` varchar(20) NOT NULL DEFAULT 'mail',
  `mailpath` varchar(55) DEFAULT '/usr/sbin/sendmail',
  `smtp_host` varchar(100) DEFAULT NULL,
  `smtp_user` varchar(100) DEFAULT NULL,
  `smtp_pass` varchar(255) DEFAULT NULL,
  `smtp_port` varchar(10) DEFAULT '25',
  `smtp_crypto` varchar(10) DEFAULT NULL,
  `corn` datetime DEFAULT NULL,
  `customer_group` int(11) NOT NULL,
  `default_email` varchar(100) NOT NULL,
  `mmode` tinyint(1) NOT NULL,
  `bc_fix` tinyint(4) NOT NULL DEFAULT '0',
  `auto_detect_barcode` tinyint(1) NOT NULL DEFAULT '0',
  `captcha` tinyint(1) NOT NULL DEFAULT '1',
  `reference_format` tinyint(1) NOT NULL DEFAULT '1',
  `racks` tinyint(1) DEFAULT '0',
  `attributes` tinyint(1) NOT NULL DEFAULT '0',
  `product_expiry` tinyint(1) NOT NULL DEFAULT '0',
  `decimals` tinyint(2) NOT NULL DEFAULT '2',
  `decimals_sep` varchar(2) NOT NULL DEFAULT '.',
  `thousands_sep` varchar(2) NOT NULL DEFAULT ',',
  `invoice_view` tinyint(1) DEFAULT '0',
  `default_biller` int(11) DEFAULT NULL,
  `envato_username` varchar(50) DEFAULT NULL,
  `purchase_code` varchar(100) DEFAULT NULL,
  `rtl` tinyint(1) DEFAULT '0',
  `each_spent` decimal(15,4) DEFAULT NULL,
  `ca_point` tinyint(4) DEFAULT NULL,
  `each_sale` decimal(15,4) DEFAULT NULL,
  `sa_point` tinyint(4) DEFAULT NULL,
  `update` tinyint(1) DEFAULT '0',
  `sac` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_settings`
--

INSERT INTO `sma_settings` (`setting_id`, `logo`, `logo2`, `site_name`, `language`, `default_warehouse`, `accounting_method`, `default_currency`, `default_tax_rate`, `rows_per_page`, `version`, `default_tax_rate2`, `dateformat`, `sales_prefix`, `quote_prefix`, `purchase_prefix`, `transfer_prefix`, `delivery_prefix`, `payment_prefix`, `return_prefix`, `expense_prefix`, `item_addition`, `theme`, `product_serial`, `default_discount`, `product_discount`, `discount_method`, `tax1`, `tax2`, `overselling`, `restrict_user`, `restrict_calendar`, `timezone`, `iwidth`, `iheight`, `twidth`, `theight`, `watermark`, `reg_ver`, `allow_reg`, `reg_notification`, `auto_reg`, `protocol`, `mailpath`, `smtp_host`, `smtp_user`, `smtp_pass`, `smtp_port`, `smtp_crypto`, `corn`, `customer_group`, `default_email`, `mmode`, `bc_fix`, `auto_detect_barcode`, `captcha`, `reference_format`, `racks`, `attributes`, `product_expiry`, `decimals`, `decimals_sep`, `thousands_sep`, `invoice_view`, `default_biller`, `envato_username`, `purchase_code`, `rtl`, `each_spent`, `ca_point`, `each_sale`, `sa_point`, `update`, `sac`) VALUES
(1, 'logo2.png', 'logo3.png', 'Point of Sale', 'english', 1, 0, 'USD', 1, 10, '3.0.1.13', 1, 5, 'SALE', 'QUOTE', 'PO', 'TR', 'DO', 'IPAY', 'RETURNSL', NULL, 0, 'default', 1, 1, 1, 1, 1, 1, 0, 1, 0, 'Asia/Kuala_Lumpur', 800, 800, 60, 60, 0, 0, 0, 0, NULL, 'mail', '/usr/sbin/sendmail', 'pop.gmail.com', 'contact@tecdiary.com', 'jEFTM4T63AiQ9dsidxhPKt9CIg4HQjCN58n/RW9vmdC/UDXCzRLR469ziZ0jjpFlbOg43LyoSmpJLBkcAHh0Yw==', '25', NULL, NULL, 1, 'contact@tecdiary.com', 0, 4, 1, 0, 2, 1, 1, 0, 2, '.', ',', 0, NULL, '', '', 0, NULL, NULL, NULL, NULL, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `sma_skrill`
--

CREATE TABLE IF NOT EXISTS `sma_skrill` (
  `id` int(11) NOT NULL,
  `active` tinyint(4) NOT NULL,
  `account_email` varchar(255) NOT NULL DEFAULT 'testaccount2@moneybookers.com',
  `secret_word` varchar(20) NOT NULL DEFAULT 'mbtest',
  `skrill_currency` varchar(3) NOT NULL DEFAULT 'USD',
  `fixed_charges` decimal(25,4) NOT NULL DEFAULT '0.0000',
  `extra_charges_my` decimal(25,4) NOT NULL DEFAULT '0.0000',
  `extra_charges_other` decimal(25,4) NOT NULL DEFAULT '0.0000'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_skrill`
--

INSERT INTO `sma_skrill` (`id`, `active`, `account_email`, `secret_word`, `skrill_currency`, `fixed_charges`, `extra_charges_my`, `extra_charges_other`) VALUES
(1, 1, 'testaccount2@moneybookers.com', 'mbtest', 'USD', '0.0000', '0.0000', '0.0000');

-- --------------------------------------------------------

--
-- Table structure for table `sma_subcategories`
--

CREATE TABLE IF NOT EXISTS `sma_subcategories` (
  `id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `code` varchar(55) NOT NULL,
  `name` varchar(55) NOT NULL,
  `image` varchar(55) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_subcategories`
--

INSERT INTO `sma_subcategories` (`id`, `category_id`, `code`, `name`, `image`) VALUES
(1, 3, 'CANNON', 'CANNON', NULL),
(2, 3, 'NIKON', 'NIKON', NULL),
(3, 2, 'ASUS', 'ASUS', NULL),
(4, 2, 'HP', 'HP', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sma_suspended_bills`
--

CREATE TABLE IF NOT EXISTS `sma_suspended_bills` (
  `id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `customer_id` int(11) NOT NULL,
  `customer` varchar(55) DEFAULT NULL,
  `count` int(11) NOT NULL,
  `order_discount_id` varchar(20) DEFAULT NULL,
  `order_tax_id` int(11) DEFAULT NULL,
  `total` decimal(25,4) NOT NULL,
  `biller_id` int(11) DEFAULT NULL,
  `warehouse_id` int(11) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `suspend_note` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_suspended_items`
--

CREATE TABLE IF NOT EXISTS `sma_suspended_items` (
  `id` int(11) NOT NULL,
  `suspend_id` int(11) unsigned NOT NULL,
  `product_id` int(11) unsigned NOT NULL,
  `product_code` varchar(55) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `net_unit_price` decimal(25,4) NOT NULL,
  `unit_price` decimal(25,4) NOT NULL,
  `quantity` decimal(15,4) DEFAULT '0.0000',
  `warehouse_id` int(11) DEFAULT NULL,
  `item_tax` decimal(25,4) DEFAULT NULL,
  `tax_rate_id` int(11) DEFAULT NULL,
  `tax` varchar(55) DEFAULT NULL,
  `discount` varchar(55) DEFAULT NULL,
  `item_discount` decimal(25,4) DEFAULT NULL,
  `subtotal` decimal(25,4) NOT NULL,
  `serial_no` varchar(255) DEFAULT NULL,
  `option_id` int(11) DEFAULT NULL,
  `product_type` varchar(20) DEFAULT NULL,
  `real_unit_price` decimal(25,4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_tax_rates`
--

CREATE TABLE IF NOT EXISTS `sma_tax_rates` (
  `id` int(11) NOT NULL,
  `name` varchar(55) NOT NULL,
  `code` varchar(10) DEFAULT NULL,
  `rate` decimal(12,4) NOT NULL,
  `type` varchar(50) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_tax_rates`
--

INSERT INTO `sma_tax_rates` (`id`, `name`, `code`, `rate`, `type`) VALUES
(1, 'No Tax', 'NT', '0.0000', '2'),
(2, 'VAT @10%', 'VAT10', '10.0000', '1'),
(3, 'GST @6%', 'GST', '6.0000', '1'),
(4, 'VAT @20%', 'VT20', '20.0000', '1');

-- --------------------------------------------------------

--
-- Table structure for table `sma_transfers`
--

CREATE TABLE IF NOT EXISTS `sma_transfers` (
  `id` int(11) NOT NULL,
  `transfer_no` varchar(55) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `from_warehouse_id` int(11) NOT NULL,
  `from_warehouse_code` varchar(55) NOT NULL,
  `from_warehouse_name` varchar(55) NOT NULL,
  `to_warehouse_id` int(11) NOT NULL,
  `to_warehouse_code` varchar(55) NOT NULL,
  `to_warehouse_name` varchar(55) NOT NULL,
  `note` varchar(1000) DEFAULT NULL,
  `total` decimal(25,4) DEFAULT NULL,
  `total_tax` decimal(25,4) DEFAULT NULL,
  `grand_total` decimal(25,4) DEFAULT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `status` varchar(55) NOT NULL DEFAULT 'pending',
  `shipping` decimal(25,4) NOT NULL DEFAULT '0.0000',
  `attachment` varchar(55) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_transfers`
--

INSERT INTO `sma_transfers` (`id`, `transfer_no`, `date`, `from_warehouse_id`, `from_warehouse_code`, `from_warehouse_name`, `to_warehouse_id`, `to_warehouse_code`, `to_warehouse_name`, `note`, `total`, `total_tax`, `grand_total`, `created_by`, `status`, `shipping`, `attachment`) VALUES
(1, 'TR/2017/03/0001', '2017-03-10 20:45:00', 1, 'WHI', 'Warehouse 1', 2, 'WHII', 'Warehouse 2', '', '300.0000', '0.0000', '300.0000', '1', 'completed', '0.0000', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sma_transfer_items`
--

CREATE TABLE IF NOT EXISTS `sma_transfer_items` (
  `id` int(11) NOT NULL,
  `transfer_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_code` varchar(55) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `option_id` int(11) DEFAULT NULL,
  `expiry` date DEFAULT NULL,
  `quantity` decimal(15,4) NOT NULL,
  `tax_rate_id` int(11) DEFAULT NULL,
  `tax` varchar(55) DEFAULT NULL,
  `item_tax` decimal(25,4) DEFAULT NULL,
  `net_unit_cost` decimal(25,4) DEFAULT NULL,
  `subtotal` decimal(25,4) DEFAULT NULL,
  `quantity_balance` decimal(15,4) NOT NULL,
  `unit_cost` decimal(25,4) DEFAULT NULL,
  `real_unit_cost` decimal(25,4) DEFAULT NULL,
  `date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_users`
--

CREATE TABLE IF NOT EXISTS `sma_users` (
  `id` int(11) unsigned NOT NULL,
  `last_ip_address` varbinary(45) DEFAULT NULL,
  `ip_address` varbinary(45) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(40) NOT NULL,
  `salt` varchar(40) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `activation_code` varchar(40) DEFAULT NULL,
  `forgotten_password_code` varchar(40) DEFAULT NULL,
  `forgotten_password_time` int(11) unsigned DEFAULT NULL,
  `remember_code` varchar(40) DEFAULT NULL,
  `created_on` int(11) unsigned NOT NULL,
  `last_login` int(11) unsigned DEFAULT NULL,
  `active` tinyint(1) unsigned DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `company` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `avatar` varchar(55) DEFAULT NULL,
  `gender` varchar(20) DEFAULT NULL,
  `group_id` int(10) unsigned NOT NULL,
  `warehouse_id` int(10) unsigned DEFAULT NULL,
  `biller_id` int(10) unsigned DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL,
  `show_cost` tinyint(1) DEFAULT '0',
  `show_price` tinyint(1) DEFAULT '0',
  `award_points` int(11) DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_users`
--

INSERT INTO `sma_users` (`id`, `last_ip_address`, `ip_address`, `username`, `password`, `salt`, `email`, `activation_code`, `forgotten_password_code`, `forgotten_password_time`, `remember_code`, `created_on`, `last_login`, `active`, `first_name`, `last_name`, `company`, `phone`, `avatar`, `gender`, `group_id`, `warehouse_id`, `biller_id`, `company_id`, `show_cost`, `show_price`, `award_points`) VALUES
(1, 0x3a3a31, 0x0000, 'owner', '2c8ab736b2ccab4f50e72d5fd7d21020cbb77ae7', NULL, 'msnawazbd@gmail.com', NULL, '67db7f784f3ec7a39e91f03595665870008c68e4', 1488626102, NULL, 1351661704, 1491552250, 1, 'Owner', 'Owner', 'Stock Manager', '012345678', 'banners_narayngong__1.png', 'male', 1, NULL, NULL, NULL, 0, 0, 0),
(2, NULL, 0x3a3a31, 'nusa', 'c045a8181f7b4e605711865cee36afabf8ed1029', NULL, 'nusa@gmail.com', NULL, NULL, NULL, NULL, 1489177045, 1489177045, 1, 'MUSA', 'MIYA', 'TECH ZONE', '1761913331', NULL, 'male', 3, NULL, NULL, 4, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `sma_user_logins`
--

CREATE TABLE IF NOT EXISTS `sma_user_logins` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `company_id` int(11) DEFAULT NULL,
  `ip_address` varbinary(16) NOT NULL,
  `login` varchar(100) NOT NULL,
  `time` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_user_logins`
--

INSERT INTO `sma_user_logins` (`id`, `user_id`, `company_id`, `ip_address`, `login`, `time`) VALUES
(0, 1, NULL, 0x3a3a31, 'msnawazbd@gmail.com', '2017-04-07 08:04:10'),
(1, 1, NULL, 0x3a3a31, 'owner@tecdiary.com', '2017-03-03 09:14:01'),
(2, 1, NULL, 0x3a3a31, 'owner@tecdiary.com', '2017-03-03 09:14:45'),
(3, 1, NULL, 0x3a3a31, 'owner@tecdiary.com', '2017-03-04 11:20:17'),
(4, 1, NULL, 0x3a3a31, 'msnawazbd@gmail.com', '2017-03-04 11:22:45'),
(5, 1, NULL, 0x3a3a31, 'msnawazbd@gmail.com', '2017-03-05 08:36:26'),
(6, 1, NULL, 0x3a3a31, 'msnawazbd@gmail.com', '2017-03-05 13:08:43'),
(7, 1, NULL, 0x3a3a31, 'msnawazbd@gmail.com', '2017-03-05 13:08:45'),
(8, 1, NULL, 0x3a3a31, 'msnawazbd@gmail.com', '2017-03-05 19:28:53'),
(9, 1, NULL, 0x3a3a31, 'msnawazbd@gmail.com', '2017-03-08 13:43:54'),
(10, 1, NULL, 0x3a3a31, 'msnawazbd@gmail.com', '2017-03-10 19:41:25'),
(11, 1, NULL, 0x3a3a31, 'msnawazbd@gmail.com', '2017-03-11 14:11:58'),
(12, 1, NULL, 0x3a3a31, 'msnawazbd@gmail.com', '2017-03-16 16:22:39'),
(13, 1, NULL, 0x3a3a31, 'msnawazbd@gmail.com', '2017-03-23 17:31:12'),
(14, 1, NULL, 0x3a3a31, 'msnawazbd@gmail.com', '2017-03-24 10:46:26'),
(15, 1, NULL, 0x3a3a31, 'msnawazbd@gmail.com', '2017-03-24 23:03:51'),
(16, 1, NULL, 0x3a3a31, 'msnawazbd@gmail.com', '2017-03-25 18:40:08'),
(17, 1, NULL, 0x3a3a31, 'msnawazbd@gmail.com', '2017-03-26 22:08:20'),
(18, 1, NULL, 0x3a3a31, 'msnawazbd@gmail.com', '2017-03-27 13:51:59'),
(19, 1, NULL, 0x3a3a31, 'msnawazbd@gmail.com', '2017-03-27 21:45:22'),
(20, 1, NULL, 0x3a3a31, 'msnawazbd@gmail.com', '2017-03-31 02:50:52');

-- --------------------------------------------------------

--
-- Table structure for table `sma_variants`
--

CREATE TABLE IF NOT EXISTS `sma_variants` (
  `id` int(11) NOT NULL,
  `name` varchar(55) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_variants`
--

INSERT INTO `sma_variants` (`id`, `name`) VALUES
(1, 'COLOR'),
(2, 'SIZE');

-- --------------------------------------------------------

--
-- Table structure for table `sma_warehouses`
--

CREATE TABLE IF NOT EXISTS `sma_warehouses` (
  `id` int(11) NOT NULL,
  `code` varchar(50) NOT NULL,
  `name` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `map` varchar(255) DEFAULT NULL,
  `phone` varchar(55) DEFAULT NULL,
  `email` varchar(55) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_warehouses`
--

INSERT INTO `sma_warehouses` (`id`, `code`, `name`, `address`, `map`, `phone`, `email`) VALUES
(1, 'WHI', 'Warehouse 1', '<p>Address, City</p>', NULL, '012345678', 'whi@tecdiary.com'),
(2, 'WHII', 'Warehouse 2', '<p>Warehouse 2, Jalan Sultan Ismail, 54000, Kuala Lumpur</p>', NULL, '0105292122', 'whii@tecdiary.com');

-- --------------------------------------------------------

--
-- Table structure for table `sma_warehouses_products`
--

CREATE TABLE IF NOT EXISTS `sma_warehouses_products` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `quantity` decimal(15,4) NOT NULL,
  `rack` varchar(55) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_warehouses_products`
--

INSERT INTO `sma_warehouses_products` (`id`, `product_id`, `warehouse_id`, `quantity`, `rack`) VALUES
(1, 1, 1, '14.0000', NULL),
(2, 1, 2, '1.0000', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sma_warehouses_products_variants`
--

CREATE TABLE IF NOT EXISTS `sma_warehouses_products_variants` (
  `id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `quantity` decimal(15,4) NOT NULL,
  `rack` varchar(55) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_warehouses_products_variants`
--

INSERT INTO `sma_warehouses_products_variants` (`id`, `option_id`, `product_id`, `warehouse_id`, `quantity`, `rack`) VALUES
(1, 1, 1, 1, '14.0000', NULL),
(2, 1, 1, 2, '1.0000', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `sma_adjustments`
--
ALTER TABLE `sma_adjustments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_calendar`
--
ALTER TABLE `sma_calendar`
  ADD PRIMARY KEY (`date`);

--
-- Indexes for table `sma_captcha`
--
ALTER TABLE `sma_captcha`
  ADD PRIMARY KEY (`captcha_id`),
  ADD KEY `word` (`word`);

--
-- Indexes for table `sma_categories`
--
ALTER TABLE `sma_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `sma_combo_items`
--
ALTER TABLE `sma_combo_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_companies`
--
ALTER TABLE `sma_companies`
  ADD PRIMARY KEY (`id`),
  ADD KEY `group_id` (`group_id`),
  ADD KEY `group_id_2` (`group_id`);

--
-- Indexes for table `sma_costing`
--
ALTER TABLE `sma_costing`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_currencies`
--
ALTER TABLE `sma_currencies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_customer_groups`
--
ALTER TABLE `sma_customer_groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_date_format`
--
ALTER TABLE `sma_date_format`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_deliveries`
--
ALTER TABLE `sma_deliveries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_expenses`
--
ALTER TABLE `sma_expenses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_gift_cards`
--
ALTER TABLE `sma_gift_cards`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `card_no` (`card_no`);

--
-- Indexes for table `sma_groups`
--
ALTER TABLE `sma_groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_login_attempts`
--
ALTER TABLE `sma_login_attempts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_notifications`
--
ALTER TABLE `sma_notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_order_ref`
--
ALTER TABLE `sma_order_ref`
  ADD PRIMARY KEY (`ref_id`);

--
-- Indexes for table `sma_payments`
--
ALTER TABLE `sma_payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_paypal`
--
ALTER TABLE `sma_paypal`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_permissions`
--
ALTER TABLE `sma_permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_pos_register`
--
ALTER TABLE `sma_pos_register`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_pos_settings`
--
ALTER TABLE `sma_pos_settings`
  ADD PRIMARY KEY (`pos_id`);

--
-- Indexes for table `sma_products`
--
ALTER TABLE `sma_products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`),
  ADD KEY `category_id` (`category_id`),
  ADD KEY `id` (`id`),
  ADD KEY `id_2` (`id`),
  ADD KEY `category_id_2` (`category_id`);

--
-- Indexes for table `sma_product_photos`
--
ALTER TABLE `sma_product_photos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_product_variants`
--
ALTER TABLE `sma_product_variants`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_purchases`
--
ALTER TABLE `sma_purchases`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `sma_purchase_items`
--
ALTER TABLE `sma_purchase_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `purchase_id` (`purchase_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `sma_quotes`
--
ALTER TABLE `sma_quotes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `sma_quote_items`
--
ALTER TABLE `sma_quote_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `quote_id` (`quote_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `sma_return_items`
--
ALTER TABLE `sma_return_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sale_id` (`sale_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `product_id_2` (`product_id`,`sale_id`),
  ADD KEY `sale_id_2` (`sale_id`,`product_id`);

--
-- Indexes for table `sma_return_sales`
--
ALTER TABLE `sma_return_sales`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `sma_sales`
--
ALTER TABLE `sma_sales`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `sma_sale_items`
--
ALTER TABLE `sma_sale_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sale_id` (`sale_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `product_id_2` (`product_id`,`sale_id`),
  ADD KEY `sale_id_2` (`sale_id`,`product_id`);

--
-- Indexes for table `sma_sessions`
--
ALTER TABLE `sma_sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ci_sessions_timestamp` (`timestamp`);

--
-- Indexes for table `sma_settings`
--
ALTER TABLE `sma_settings`
  ADD PRIMARY KEY (`setting_id`);

--
-- Indexes for table `sma_skrill`
--
ALTER TABLE `sma_skrill`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_subcategories`
--
ALTER TABLE `sma_subcategories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_suspended_bills`
--
ALTER TABLE `sma_suspended_bills`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_suspended_items`
--
ALTER TABLE `sma_suspended_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_tax_rates`
--
ALTER TABLE `sma_tax_rates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_transfers`
--
ALTER TABLE `sma_transfers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `sma_transfer_items`
--
ALTER TABLE `sma_transfer_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transfer_id` (`transfer_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `sma_users`
--
ALTER TABLE `sma_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `group_id` (`group_id`,`warehouse_id`,`biller_id`),
  ADD KEY `group_id_2` (`group_id`,`company_id`);

--
-- Indexes for table `sma_user_logins`
--
ALTER TABLE `sma_user_logins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_variants`
--
ALTER TABLE `sma_variants`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_warehouses`
--
ALTER TABLE `sma_warehouses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `sma_warehouses_products`
--
ALTER TABLE `sma_warehouses_products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `warehouse_id` (`warehouse_id`);

--
-- Indexes for table `sma_warehouses_products_variants`
--
ALTER TABLE `sma_warehouses_products_variants`
  ADD PRIMARY KEY (`id`),
  ADD KEY `option_id` (`option_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `warehouse_id` (`warehouse_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `sma_adjustments`
--
ALTER TABLE `sma_adjustments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sma_captcha`
--
ALTER TABLE `sma_captcha`
  MODIFY `captcha_id` bigint(13) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sma_categories`
--
ALTER TABLE `sma_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `sma_combo_items`
--
ALTER TABLE `sma_combo_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sma_companies`
--
ALTER TABLE `sma_companies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `sma_costing`
--
ALTER TABLE `sma_costing`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `sma_currencies`
--
ALTER TABLE `sma_currencies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `sma_customer_groups`
--
ALTER TABLE `sma_customer_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `sma_date_format`
--
ALTER TABLE `sma_date_format`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `sma_deliveries`
--
ALTER TABLE `sma_deliveries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sma_expenses`
--
ALTER TABLE `sma_expenses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `sma_gift_cards`
--
ALTER TABLE `sma_gift_cards`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sma_groups`
--
ALTER TABLE `sma_groups`
  MODIFY `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `sma_login_attempts`
--
ALTER TABLE `sma_login_attempts`
  MODIFY `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sma_notifications`
--
ALTER TABLE `sma_notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `sma_order_ref`
--
ALTER TABLE `sma_order_ref`
  MODIFY `ref_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `sma_payments`
--
ALTER TABLE `sma_payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `sma_permissions`
--
ALTER TABLE `sma_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `sma_pos_register`
--
ALTER TABLE `sma_pos_register`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `sma_products`
--
ALTER TABLE `sma_products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `sma_product_photos`
--
ALTER TABLE `sma_product_photos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `sma_product_variants`
--
ALTER TABLE `sma_product_variants`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `sma_purchases`
--
ALTER TABLE `sma_purchases`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `sma_purchase_items`
--
ALTER TABLE `sma_purchase_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `sma_quotes`
--
ALTER TABLE `sma_quotes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `sma_quote_items`
--
ALTER TABLE `sma_quote_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `sma_return_items`
--
ALTER TABLE `sma_return_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sma_return_sales`
--
ALTER TABLE `sma_return_sales`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sma_sales`
--
ALTER TABLE `sma_sales`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `sma_sale_items`
--
ALTER TABLE `sma_sale_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `sma_subcategories`
--
ALTER TABLE `sma_subcategories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `sma_suspended_bills`
--
ALTER TABLE `sma_suspended_bills`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sma_suspended_items`
--
ALTER TABLE `sma_suspended_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sma_tax_rates`
--
ALTER TABLE `sma_tax_rates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `sma_transfers`
--
ALTER TABLE `sma_transfers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `sma_transfer_items`
--
ALTER TABLE `sma_transfer_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sma_users`
--
ALTER TABLE `sma_users`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `sma_user_logins`
--
ALTER TABLE `sma_user_logins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT for table `sma_variants`
--
ALTER TABLE `sma_variants`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `sma_warehouses`
--
ALTER TABLE `sma_warehouses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `sma_warehouses_products`
--
ALTER TABLE `sma_warehouses_products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `sma_warehouses_products_variants`
--
ALTER TABLE `sma_warehouses_products_variants`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
