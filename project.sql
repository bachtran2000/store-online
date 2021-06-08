-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th7 21, 2020 lúc 09:17 AM
-- Phiên bản máy phục vụ: 10.4.11-MariaDB
-- Phiên bản PHP: 7.2.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `project`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `status` tinyint(3) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `categories`
--

INSERT INTO `categories` (`id`, `name`, `avatar`, `description`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Áo thun(phông) nam', '1592110878-a28352692a43538da898d033de25f351.jpg', '<p>#&aacute;o_thun #&aacute;o_ph&ocirc;ng</p>\r\n', 1, '2020-06-14 05:01:18', '2020-06-14 14:17:59'),
(2, 'Quần nam', '1592121890-8add182357ddd2a36b398d99bd568c50.jpg', '', 1, '2020-06-14 05:08:30', '2020-06-14 15:04:50'),
(3, 'Áo sơ mi nam', '1592405836-unnamed.jpg', '', 1, '2020-06-14 07:19:02', '2020-06-17 21:57:16'),
(4, 'Áo thun(phông) nữ', '1592131015-7WDeYH_simg_de2fe0_500x500_maxb.jpg', '', 1, '2020-06-14 10:36:55', NULL),
(5, 'Quần nữ', '1592229617-ce04ae2ff182ce218a13e0f65fe13964.jpg_600x600q80.jpg', '', 1, '2020-06-15 14:00:17', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `customer`
--

CREATE TABLE `customer` (
  `id` int(11) NOT NULL,
  `fullname` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `mobile` int(11) NOT NULL,
  `email` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `customer`
--

INSERT INTO `customer` (`id`, `fullname`, `address`, `mobile`, `email`) VALUES
(2, 'Bùi Thu P', 'Hải Phòng', 344139959, 'at140350@actvn.edu.vn'),
(4, 'abc', 'Thường Tín', 968824797, 'darkprince411999@gmail.com');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL COMMENT 'id của customer tương ứng, là khóa ngoại liên kết với bảng customer',
  `price_total` int(11) DEFAULT NULL COMMENT 'Tổng giá trị đơn hàng',
  `payment_status` tinyint(2) DEFAULT NULL COMMENT 'Trạng thái đơn hàng: 0 - Chưa thành toán, 1 - Đã thành toán',
  `orders_status` tinyint(2) DEFAULT NULL COMMENT 'Trạng thái đơn hàng',
  `note` varchar(255) DEFAULT NULL COMMENT 'Ghi chú thêm của khách khi đặt hàng',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Ngày tạo đơn',
  `updated_at` datetime DEFAULT NULL COMMENT 'Ngày cập nhật cuối'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order_details`
--

CREATE TABLE `order_details` (
  `order_id` int(11) DEFAULT NULL COMMENT 'Id của order tương ứng, là khóa ngoại liên kết với bảng orders',
  `product_id` int(11) DEFAULT NULL COMMENT 'Id của product tương ứng, là khóa ngoại liên kết với bảng products',
  `quality` int(11) DEFAULT NULL COMMENT 'Số sản phẩm đã đặt'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL COMMENT 'Id của danh mục mà sản phẩm thuộc về, là khóa ngoại liên kết với bảng categories',
  `title` varchar(255) NOT NULL COMMENT 'Tên sản phẩm',
  `avatar` varchar(255) DEFAULT NULL COMMENT 'Tên file ảnh sản phẩm',
  `price` int(11) DEFAULT NULL COMMENT 'Giá sản phẩm',
  `summary` varchar(255) DEFAULT NULL COMMENT 'Mô tả ngắn cho sản phẩm',
  `content` text DEFAULT NULL COMMENT 'Mô tả chi tiết cho sản phẩm',
  `status` tinyint(3) DEFAULT 0 COMMENT 'Trạng thái danh mục: 0 - Inactive, 1 - Active',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Ngày tạo',
  `updated_at` datetime DEFAULT NULL COMMENT 'Ngày cập nhật cuối'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`id`, `category_id`, `title`, `avatar`, `price`, `summary`, `content`, `status`, `created_at`, `updated_at`) VALUES
(6, 1, 'Áo Thun Nam Có Cổ', '1592111738-product-images.jpg', 299000, '', '<p>&Aacute;o thun cổ may từ chất liệu co giản tốt, mịn m&aacute;t v&agrave; thấm h&uacute;t mồ h&ocirc;i.</p>\r\n\r\n<p>Sản phẩm dễ d&agrave;ng phối với quần ngắn quần d&agrave;i, th&iacute;ch hợp mang trong mọi hoạt động.</p>\r\n\r\n<p>Kiểu d&aacute;ng thể thao, hết sức năng động c&oacute; thể diện khi đi l&agrave;m, đi dạo, picnic c&ugrave;ng bạn b&egrave;, độ bền cao, giặt nhanh kh&ocirc;,..</p>\r\n', 1, '2020-06-14 05:15:38', '2020-06-29 12:08:35'),
(7, 1, 'Áo Thun Nam GARENA NGẮN TAY cổ sơ mi cao cấp', '1592111980-product-images (1).jpg', 299000, '', '<p>Những chiếc &aacute;o thun lu&ocirc;n l&agrave; sự lựa chọn h&agrave;ng đầu đối với hầu hết mọi người bởi sự tiện lợi v&agrave; t&iacute;nh thời trang của n&oacute;.</p>\r\n\r\n<p>&Aacute;o GARENA được xem l&agrave; chuẩn mực cho d&ograve;ng &aacute;o ngắn tay c&oacute; cổ.</p>\r\n\r\n<p>&Aacute;o Thun Nam GARENA Thời Trang với kiểu d&aacute;ng thiết kế đơn giản, kh&ocirc;ng cầu k&igrave;, dễ d&agrave;ng để bạn phối đồ trong nhiều ho&agrave;n cảnh.</p>\r\n\r\n<p>Logo th&ecirc;u tỉ mỉ, tinh tế, bền đẹp.</p>\r\n\r\n<p>Chất liệu thun c&aacute; sấu co d&atilde;n, thấm h&uacute;t mồ h&ocirc;i cực tốt.</p>\r\n', 1, '2020-06-14 05:19:40', '2020-06-17 00:00:00'),
(9, 1, 'Áo thun nam sọc xám trắng có cổ ngắn tay ', '1592112484-product-images (16).jpg', 299000, '', '<p>&Aacute;o thun nam đẹp sọc x&aacute;m trắng c&oacute; cổ ngắn tay với chất liệu 100% l&agrave; vải thun cotton tho&aacute;ng m&aacute;t, gi&uacute;p người mặc thoải m&aacute;i khi vận động, thấm mồ h&ocirc;i tốt, rất th&iacute;ch hợp cho c&aacute;c bạn nam y&ecirc;u th&iacute;ch sự nam t&iacute;nh, trẻ trung, năng động, &aacute;o thun nam c&oacute; cổ ngắn tay cũng dễ phối với c&aacute;c m&oacute;n thời trang kh&aacute;c như quần jean nam, quần t&acirc;y nam, quần short, gi&uacute;p c&aacute;c bạn nam th&ecirc;m phần tự tin v&agrave;o mẫu thiết kế n&agrave;y.</p>\r\n', 1, '2020-06-14 05:27:54', '2020-06-14 00:00:00'),
(10, 1, 'Áo thun nam cọc tay cổ tàu thoáng mát', '1592112803-product-images.jpg', 299000, '', '<p>&Aacute;o ph&ocirc;ng nam cổ t&agrave;u trẻ trung, năng động chắc chắn sẽ tạo cảm gi&aacute;c thoải m&aacute;i v&agrave; tự tin cho c&aacute;c ch&agrave;ng trai</p>\r\n\r\n<p>&Aacute;o nam cổ t&agrave;u trơn với m&agrave;u sắc v&agrave; thiết kế trang nh&atilde;, lịch sự ph&ugrave; hợp cho cả đi chơi v&agrave; đi l&agrave;m&nbsp;</p>\r\n\r\n<p>Chất liệu mềm, tho&aacute;ng m&aacute;t tạo cảm gi&aacute;c thoải m&aacute;i cho mọi hoạt động</p>\r\n', 1, '2020-06-14 05:33:23', '2020-06-18 00:00:00'),
(11, 1, 'Áo thun nam cổ tròn tay ngắn', '1592112975-product-ao-thun-co-tron-nhan-con-ngua-min-500x629.jpg', 299000, '', '<p>&nbsp;<strong><em>H&agrave;ng tự xưởng may, kh&ocirc;ng qua trung gian. H&agrave;ng chất lượng &ndash; gi&aacute; cả xanh tranh</em></strong></p>\r\n\r\n<p><strong>&ndash; Thiết kế</strong>&nbsp;trang nh&atilde;, tiện dụng, thoải m&aacute;i, kiểu d&aacute;ng sang trọng, thanh lịch. Th&iacute;ch hợp khi dạo phố, đi l&agrave;m, đi tiệc, tập Gym ..đều mang đến sự tự tin cho người mặc</p>\r\n\r\n<p><strong>&ndash; Form</strong>&nbsp;&aacute;o ph&ugrave; hợp với mọi v&oacute;c d&aacute;ng, độ tuổi</p>\r\n\r\n<p><strong>&ndash; Chất liệu:</strong>&nbsp;thun cotton 100%, kh&ocirc;ng nhăn , thấm h&uacute;t mồ h&ocirc;i, chất mềm v&agrave; d&agrave;y dặn, kh&ocirc;ng phai m&agrave;u</p>\r\n', 1, '2020-06-14 05:36:15', NULL),
(12, 1, 'Áo Thun Nam Cổ Tròn', '1592113066-product-images (1).jpg', 299000, '', '', 1, '2020-06-14 05:37:46', NULL),
(13, 1, 'Áo Thun Nam Cổ Tròn Banana Republic', '1592113203-product-cabin-brown.jpg', 299000, '', '<p>&Aacute;o c&oacute; chất liệu 100% cotton đặc trưng nhẹ, m&aacute;t v&agrave; sang trọng.</p>\r\n\r\n<p>Form &aacute;o xuất Mỹ kh&aacute; to n&ecirc;n kh&aacute;ch h&agrave;ng vui l&ograve;ng b&aacute;o chiều cao c&acirc;n trặng trực tiếp để được tư vấn size</p>\r\n', 1, '2020-06-14 05:40:03', NULL),
(14, 1, 'Áo Thun Nam Cổ Tròn Hollister Màu Ghi', '1592113888-product-ao-thun-nam-co-tron-xuat-khau-hollister-15.jpg', 299000, '', '<p>&Aacute;o thun nam cổ tr&ograve;n Hollister tại linhvnxk l&agrave; h&agrave;ng ch&iacute;nh h&atilde;ng 100%. &Aacute;o thuộc d&ograve;ng must haved (tức l&agrave; ai cũng phải c&oacute;). Chiếc &aacute;p thun cổ tr&ograve;n&nbsp; n&agrave;y l&agrave; chiếc &aacute;o đơn giản, tiện dụng, thời trang v&agrave; cực m&aacute;t, nhẹ</p>\r\n', 1, '2020-06-14 05:42:46', '2020-06-14 00:00:00'),
(15, 1, 'Áo thun nam cổ tròn tay ngắn dáng dài vạt bầu The Cosmo (Xám)', '1592113574-product-images (2).jpg', 299000, '', '<p><strong><em>&Aacute;o thun cổ tr&ograve;n</em></strong>, tay ngắn, d&aacute;ng d&agrave;i, vạt bầu. &Aacute;o được may tr&ecirc;n chất liệu cotton mềm mịn, đem lại cảm gi&aacute;c thoải m&aacute;i v&agrave; dễ chịu suốt cả ng&agrave;y. Th&iacute;ch hợp để kết hợp với quần jeans, quần short hoặc khaki.</p>\r\n', 1, '2020-06-14 05:46:14', '2020-06-14 00:00:00'),
(16, 1, 'Áo thun form rộng tay lỡ nam', '1592113668-product-17.jpg', 299000, '', '<p><img alt=\"Hình chụp thật hàng có sẵn tại kho\" src=\"https://namlongfashion.com/wp-content/uploads/2019/07/5-2.jpg\" /></p>\r\n\r\n<p><img alt=\"Hình thật\" src=\"https://namlongfashion.com/wp-content/uploads/2019/07/4-2.jpg\" /></p>\r\n', 1, '2020-06-14 05:47:48', '2020-06-14 00:00:00'),
(17, 1, 'Áo thun man form rộng tay lỡ in hình ngôi sao', '1592113844-product-Áo-thun-nam-form-rộng-tay-lỡ-in-hình-NGÔI-SAO-cá-tính-600x440.jpeg', 299000, '', '<p><img alt=\"Áo thun nam giá rẻ form rộng tay lỡ in hình NGÔI SAO\" src=\"https://cdn.ira.vn/2020/04/%C3%81o-thun-nam-form-r%E1%BB%99ng-tay-l%E1%BB%A1-in-h%C3%ACnh-NG%C3%94I-SAO-c%C3%A1-t%C3%ADnh2-600x440.jpeg\" /></p>\r\n\r\n<p>Chất liệu thun&nbsp;mềm mại co gi&atilde;n tốt , tho&aacute;ng m&aacute;t<br />\r\nThiết kế thời trang ph&ugrave; hợp xu hướng hiện nay<br />\r\nKiểu d&aacute;ng đa phong c&aacute;ch<br />\r\nĐường may tinh tế sắc sảo<br />\r\n&Aacute;o thun nam gi&aacute; rẻ thời trang được thi&ecirc;́t k&ecirc;́ v&ecirc;̉ đẹp trẻ trung năng đ&ocirc;̣ng nhưng kh&ocirc;ng kém ph&acirc;̀n duy&ecirc;n dáng.<br />\r\n&Aacute;o thun nam gi&aacute; rẻ thời trang được thi&ecirc;́t k&ecirc;́ đẹp, chu&acirc;̉n form, đường may sắc xảo, vải cotton dày, mịn, th&acirc;́m hút m&ocirc;̀ h&ocirc;i tạo sự thoải mái khi mặc!<br />\r\nDễ d&agrave;ng phối trang phục , th&iacute;ch hợp đi chơi đi l&agrave;m đi dạo phố<br />\r\nThích hợp cho sự k&ecirc;́t hợp vứi qu&acirc;̀n jean, sọt , legging!</p>\r\n', 1, '2020-06-14 05:50:44', '2020-06-14 00:00:00'),
(18, 1, 'Ao thun nam tay lở in mặt buồn chữ X to cực chất', '1592114089-product-dc7796a0-5ff2-11e9-9876-c9474088cfcb.jpg', 299000, '', '', 1, '2020-06-14 05:54:49', NULL),
(19, 1, 'Áo Thun Stee Tay Lỡ Unisex Vải Nhun đen', '1592114243-product-df6c07eba6cf68503cae762764ce15c5.jpg', 299000, '', '<p>Thiết kế đơn giản, nam t&iacute;nh</p>\r\n\r\n<p>Thiết kế cổ tr&ograve;n, tay ngắn mang lại cho ph&aacute;i mạnh phong c&aacute;ch nam t&iacute;nh v&agrave; lịch l&atilde;m khi mặc h&agrave;ng ng&agrave;y.Form &aacute;o &ocirc;m vừa vặn thoải m&aacute;i khi mặc chơi thể thao hay c&aacute;c hoạt động mang lại sự tự tin v&agrave; năng động cho ph&aacute;i mạnh.&nbsp;&aacute;o thun nam, &aacute;o thun tay lỡ&nbsp;&nbsp; l&agrave; loại trang phục tiện dụng nhất d&agrave;nh cho nam giới.&nbsp;&aacute;o thun nam, &aacute;o thun tay lỡ&nbsp;&nbsp;được xem l&agrave; một m&oacute;n đồ thời trang đặc biệt &ndash; đặc biệt do b&ecirc;n trong tủ đồ của bất cứ anh ch&agrave;ng n&agrave;o cũng c&oacute; m&oacute;n đồ n&agrave;y</p>\r\n\r\n<p><img alt=\"	Áo Thun	áo thun tay lỡ,áo thun tay lỡ nam,áo thun tay lỡ nữ,áo thun tay lỡ form rộng,áo thun tay lỡ hàn quốc,áo thun tay lỡ form rộng facebook,áo phông tay lỡ nữ,áo thun tay lỡ trơn,sỉ áo thun tay lỡ form rộng,áo thun tay lỡ nữ giá rẻ,áo thun tay lỡ giá rẻ,áo thun nam tay lỡ rộng,áo thun tay lỡ unisex,áo thun tay lỡ form rộng nam, áo thun nam,áo thun nam đẹp,áo thun nam có cổ,áo thun nam cao cấp,áo thun nam tay dài,áo thun nam hàn quốc,áo thun nam cổ tròn,áo thun nam lazada,áo thun nam dài tay,áo thun nam tay lỡ,áo thun nam body,áo thun nam lớn tuổi,áo thun nam giá rẻ,áo thun nam cá sấu,áo thun nam 2018,áo thun nam adidas,áo thun nam có cổ cao cấp,áo thun nam trơn,áo thun nam an phước,áo thun nam hàng hiệu,áo thun nam cổ trụ,áo thun nam người lớn tuổi,quần jean áo thun nam,áo thun nam trắng,áo thun nam gucci,áo thun nam levis,áo thun nam pierre cardin,áo thun nam có túi,áo thun nam chất,áo thun nam xuất khẩu,áo thun nam polo\" src=\"https://salt.tikicdn.com/ts/tmp/e9/30/30/4415ff8c696160b0ba35d5e113c5bc94.jpg\" style=\"height:900px; width:643px\" /></p>\r\n\r\n<p>Chất liệu thun mềm mại</p>\r\n\r\n<p>Chất liệu thun mềm mại, tho&aacute;ng m&aacute;t, thấm h&uacute;t tốt, kh&ocirc;ng lo hầm b&iacute; khi mặc.Theo xu hướng thời trang hiện nay &aacute;o với chất liệu thun theo phong c&aacute;ch thể thao t&ocirc;n vinh n&eacute;t đẹp menly, kiểu &aacute;o đơn giản dễ phối đồ khi mặc lu&ocirc;n lu&ocirc;n l&agrave; lựa chọn h&agrave;ng đầu của c&aacute;nh m&agrave;y r&acirc;u s&agrave;nh điệu, c&aacute; t&iacute;nh v&agrave; y&ecirc;u th&iacute;ch thời trang. Những ch&agrave;ng trai sẽ lấy đi bao &aacute;nh mắt của c&aacute;c n&agrave;ng khi mặc chiếc &aacute;o tinh tế n&agrave;y.</p>\r\n\r\n<p>Với thiết kế&nbsp;&aacute;o thun nam, &aacute;o thun tay lỡ&nbsp;,bạn thoả sức trưng diện v&agrave; phối đồ theo phong c&aacute;ch ri&ecirc;ng m&agrave; kh&ocirc;ng cần một quy chuẩn nhất định n&agrave;o. C&oacute; thể kết hợp h&agrave;i h&ograve;a được với c&aacute;c trang phục từ bụi bặm c&aacute; t&iacute;nh như quần short, quần jean kaki, jogger, pants&hellip; đến , những phong c&aacute;ch đơn giản cổ điển như quần t&acirc;y quần kaki,..Thử Style đa phong c&aacute;ch của chiếc &aacute;o thun n&agrave;y c&ugrave;ng ch&uacute;ng t&ocirc;i n&agrave;o!</p>\r\n', 0, '2020-06-14 05:57:23', NULL),
(20, 1, 'Ao thun tay lỡ nam', '1592114518-product-epWeDD_simg_de2fe0_500x500_maxb.jpg', 299000, '', '<p><img alt=\"Nc38V9_simg_d0daf0_800x1200_max.jpg\" src=\"https://media3.scdn.vn/img3/2019/3_25/Nc38V9_simg_d0daf0_800x1200_max.jpg\" /></p>\r\n\r\n<p><img alt=\"7JpZmV_simg_d0daf0_800x1200_max.jpg\" src=\"https://media3.scdn.vn/img3/2019/3_25/7JpZmV_simg_d0daf0_800x1200_max.jpg\" /></p>\r\n\r\n<p>CHẤT LIỆU THUN DA C&Aacute;<br />\r\n<br />\r\nĐƯỜNG MAY TINH TẾ TỈ MỈ<br />\r\n<br />\r\nVẢI CO GI&Atilde;N M&Aacute;T MỊN<br />\r\n<br />\r\nTHIẾT KẾ THỜI TRANG<br />\r\n<br />\r\nPH&Ugrave; HỢP VỚI C&Aacute;C BẠN TRẺ NĂNG ĐỘNG<br />\r\n<br />\r\nFREE SIZE DƯỚI 60KG T&Ugrave;Y CHIỀU CAO</p>\r\n', 1, '2020-06-14 06:01:58', '2020-06-14 00:00:00'),
(21, 1, 'Ao thun mèo unisex tay lỡ', '1592114672-product-tải xuống.jpg', 299000, '', '<p><img alt=\"alt\" src=\"https://scdn.thitruongsi.com/image/cached/size/w800-h0/img/product/2019/04/10/84843310-5b6d-11e9-bca8-41feddf7a636.jpg\" /></p>\r\n\r\n<p><img alt=\"alt\" src=\"https://scdn.thitruongsi.com/image/cached/size/w800-h0/img/product/2019/04/10/848348b0-5b6d-11e9-bca8-41feddf7a636.jpg\" /></p>\r\n', 1, '2020-06-14 06:04:32', NULL),
(22, 1, 'Áo thun nam tay lỡ, in chữ nổi bật, phong cách Hàn Quốc trẻ trung', '1592114836-product-2286449943_19830222.400x400.jpg', 299000, '', '', 1, '2020-06-14 06:07:16', NULL),
(23, 1, 'Áo thun sọc ngang unisex', '1592132078-product-e6681052e4188b360e18626081c7fe7f.jpg', 299000, '', '<p><img src=\"https://cf.shopee.vn/file/e6681052e4188b360e18626081c7fe7f\" /></p>\r\n\r\n<p><img src=\"https://cf.shopee.vn/file/aa66532f02f22864035c8f217bf2963e\" /></p>\r\n', 1, '2020-06-14 06:10:52', '2020-06-14 00:00:00'),
(24, 1, 'Áo thun vàng sọc ngang đen unisex', '1592115145-product-images (5).jpg', 299000, '', '', 1, '2020-06-14 06:12:25', NULL),
(25, 1, 'Áo Thun Stee Tay Lỡ Unisex Nam Nữ PlusMan Caro', '1592132113-product-fb8ce0c5871850ace9a73b3acfc265cd.jpg', 299000, '', '<p><img src=\"https://salt.tikicdn.com/cache/w390/ts/product/e3/e7/13/9a07539a197828eca316a010064dccd7.jpg\" /></p>\r\n\r\n<p><img src=\"https://salt.tikicdn.com/cache/w390/ts/product/c4/a1/c9/522dcbf0b1792a52802ace0fb94ed057.jpg\" /></p>\r\n', 1, '2020-06-14 06:16:22', '2020-06-14 00:00:00'),
(26, 1, 'Áo Phông Nam (Áo Thun Nam) Tay Lỡ Hàn Quốc Kẻ Ngang', '1592115521-product-f7839393020ba2ac6027a055499eef31.jpg', 299000, '', '<p>D&ugrave; bạn ở lứa tuổi n&agrave;o th&igrave; thời trang kẻ sọc cũng lu&ocirc;n mang đến cho bạn một h&igrave;nh ảnh trẻ trung, năng động v&agrave; c&aacute; t&iacute;nh hơn. Xu hướng thời trang thay đổi kh&ocirc;ng ngừng, bạn cũng thể n&agrave;o c&oacute; đủ điều kiện để c&oacute; thể chạy theo mốt v&agrave; bắt kịp trend. Vậy th&igrave; để kh&ocirc;ng bị lạc hậu hay lỗi thời, h&atilde;y sắm cho bản th&acirc;n những chiếc &aacute;o kẻ sọc ngang hợp với mọi phong c&aacute;ch ngay n&agrave;o</p>\r\n', 1, '2020-06-14 06:18:41', NULL),
(27, 3, 'Áo Sơ Mi Nam Trắng cúc trắng dài tay', '1592115839-product-ef00a63789f971264840977050e50105.jpg', 299000, '', '<p>Lịch l&atilde;m đẳng cấp. Kh&ocirc;ng phai mầu khi giặt. Gi&aacute; cả hợp t&uacute;i tiền.</p>\r\n\r\n<p>Kiểu d&aacute;ng body theo phong c&aacute;ch H&agrave;n Quốc. H&igrave;nh ảnh ch&acirc;n thật, sản phẩm giống như m&ocirc; tả</p>\r\n\r\n<p><img src=\"https://vn-test-11.slatic.net/shop/e4dd2b6e347408216ecabd1df417ccc2.jpeg\" style=\"width:600px\" /></p>\r\n\r\n<p><img src=\"https://vn-test-11.slatic.net/shop/0ac75399e7f21f3dbbb52db95e7a40c6.jpeg\" style=\"width:600px\" /></p>\r\n', 1, '2020-06-14 06:23:59', '2020-06-14 00:00:00'),
(28, 3, 'Áo sơ mi nam M.a.n.g.o Slim Fit VNXK', '1592116455-product-0c3a263d37b371eb34efbed45cf3f224.jpg', 299000, '', '<p>&nbsp;</p>\r\n\r\n<p>&Aacute;O SƠ MI M.A.N.G.O SLIM FIT Chất liệu cotton lụa với 9 gam m&agrave;u v&ocirc; c&ugrave;ng trẻ trung c&aacute; t&iacute;nh. L&agrave; đ&agrave;n &ocirc;ng con trai th&igrave; anh n&agrave;o cũng nhất định phải c&oacute; 1 c&aacute;i đ&oacute; ạ.</p>\r\n', 1, '2020-06-14 06:34:15', '2020-06-14 00:00:00'),
(29, 3, 'Áo Sơ Mi Nam Dài Tay KOJIBA - Màu Đen Trơn', '1592116524-product-images.jpg', 299000, '', '<p>Chất liệu vải lụa th&aacute;i mềm mịn, kh&ocirc;ng bai gi&atilde;o, &iacute;t b&aacute;m bụi, &iacute;t nhăn</p>\r\n\r\n<p>&Aacute;o sơ mi c&oacute; phom d&aacute;ng &ocirc;m cơ thể, cổ bẻ &ocirc;m vừa phải</p>\r\n\r\n<p>Đường may chắc chắn thoải m&aacute;i cho người sử dụng c&oacute; thể vận động</p>\r\n\r\n<p>M&agrave;u đen gi&uacute;p người mặc dễ d&agrave;ng phối đồ</p>\r\n', 1, '2020-06-14 06:35:24', '2020-06-14 00:00:00'),
(30, 3, 'Áo sơ mi nam A07', '1592117922-product-images (1).jpg', 299000, '', '<p>C&oacute; lẽ, ch&uacute;ng ta kh&ocirc;ng cần phải đề cập qu&aacute; nhiều t&iacute;nh ứng dụng của một chiếc &aacute;o sơ mi trong cuộc sống ng&agrave;y nay. &Aacute;nh Dương cam kết chắc rằng, trong tủ đồ của bất cứ gia đ&igrave;nh n&agrave;o đều c&oacute; v&agrave;i ba chiếc &aacute;o sơ mi kh&aacute;c nhau về kiểu d&aacute;ng, mẫu m&atilde;. Mỗi một kiểu &aacute;o đều được may bằng chất liệu kh&aacute;c nhau. Lựa chọn ch&iacute;nh x&aacute;c vải may &aacute;o sơ mi nam đẹp sẽ gi&uacute;p t&ocirc;n l&ecirc;n được v&oacute;c d&aacute;ng, vẻ đẹp của ch&iacute;nh bản th&acirc;n người mặc.</p>\r\n', 1, '2020-06-14 06:58:42', '2020-06-14 00:00:00'),
(31, 3, 'Áo Sơ Mi Nam Công Sở – Collar', '1592118140-product-images (2).jpg', 299000, '', '', 1, '2020-06-14 07:02:20', '2020-06-14 00:00:00'),
(32, 3, 'Áo Sơ Mi Nam Kẻ Sọc Ngang Phong Cách', '1592118249-product-tải xuống.jpg', 299000, '', '<p>Ekko cung cấp &Aacute;o Sơ Mi Nam Kẻ Sọc Ngang Phong C&aacute;ch.&nbsp;<strong>ao so mi nam hang hieu</strong>&nbsp;đ&atilde; kh&ocirc;ng c&ograve;n qu&aacute; xa lạ đối với người ti&ecirc;u d&ugrave;ng hiện nay nhất l&agrave; những ch&agrave;ng trai c&ocirc;ng sở. Hoạt động v&agrave; l&agrave;m việc trong lĩnh vực văn ph&ograve;ng th&igrave; kh&ocirc;ng thể thiếu những chiếc&nbsp;<strong>&aacute;o sơ mi nam c&ocirc;ng sở</strong>&nbsp;đ&acirc;y được xem l&agrave; trang phục đa năng, thanh lịch th&iacute;ch hợp để mặc từ nh&agrave; ra ngo&agrave;i phố.</p>\r\n\r\n<p><strong>&Aacute;o sơ mi nam trắng&nbsp;</strong>được l&agrave;m từ chất liệu kaki cao cấp mang đến cho người mặc một phong c&aacute;ch thời trang vừa cổ điển lại trẻ trung, kiểu d&aacute;ng &ocirc;m body đầy nam t&iacute;nh v&agrave; quyến rũ l&ocirc;i cuốn &aacute;nh nh&igrave;n của mọi người xung quanh.</p>\r\n', 1, '2020-06-14 07:04:09', '2020-06-14 00:00:00'),
(33, 3, 'Áo Sơ Mi Nam Lụa Mềm Mịn Chống Nhăn Cao Cấp Phong Cách Hàn Quốc', '1592118658-product-images (3).jpg', 299000, '', '', 1, '2020-06-14 07:10:58', '2020-06-14 00:00:00'),
(34, 3, 'ÁO SƠ MI NAM CỘC TAY', '1592118924-product-KY70Ue_simg_de2fe0_500x500_maxb.jpg', 299000, '', '<p>&nbsp;&Aacute;o sơ mi l&agrave; m&oacute;n đồ kinh điển d&agrave;nh cho nam giới, đặc biệt l&agrave; những qu&yacute; &ocirc;ng c&ocirc;ng sở. Những chiếc &aacute;o sơ mi nam thiết kế đơn giản nhưng đ&atilde; định h&igrave;nh n&ecirc;n phong th&aacute;i, kh&iacute; chất mạnh mẽ nhất của một đấng m&agrave;y r&acirc;u. Chất liệu vải lụa trơn cao cấp, thấm h&uacute;t mồ h&ocirc;i cực tốt l&agrave; sự lựa chọn l&iacute; tưởng cho ng&agrave;y h&egrave; n&oacute;ng bức. &Aacute;o sơ mi lụa trơn đơn sắc nhẹ nh&agrave;ng với những gam m&agrave;u pastel&nbsp; tạo n&ecirc;n cảm gi&aacute;c tươi m&aacute;t, dễ chịu. &Aacute;o sơ mi nam trắng mix c&ugrave;ng với quần &acirc;u chưa bao giờ l&agrave; lỗi mốt. Sơ mi nam- quần jean l&agrave; cặp đ&ocirc;i ho&agrave;n hảo c&ugrave;ng ch&agrave;ng dạo phố. Đơn giản, vừa người, dễ mặc, dễ phối đồ, chiếc &aacute;o sơ mi nam d&agrave;i tay sẽ gi&uacute;p lấy đi những g&igrave; từng l&agrave; thiếu s&oacute;t trở th&agrave;nh dấu ấn độc đ&aacute;o, tạo n&ecirc;n triết l&yacute; trong c&aacute;ch ăn mặc cho nam giới. H&atilde;y SỞ HỮU NGAY 1 &Aacute;O SƠ MI C&Ocirc;NG SỞ THỜI TRANG:</p>\r\n\r\n<p>Chất lụa trơn, kh&ocirc;ng nhăn, kh&ocirc;ng x&ugrave;, kh&ocirc;ng bai, kh&ocirc;ng phai m&agrave;u</p>\r\n\r\n<p>Form body H&agrave;n Quốc mang lại phong c&aacute;ch trẻ trung, lịch l&atilde;m</p>\r\n\r\n<p>Đường may tinh tế, tỉ mỉ trong từng chi tiết.</p>\r\n\r\n<p>Chất lượng sản phẩm tốt, gi&aacute; cả hợp l&yacute;.</p>\r\n', 1, '2020-06-14 07:15:24', '2020-06-14 00:00:00'),
(35, 3, 'Áo Sơ Mi Kẻ Cộc Tay', '1592118982-product-images (4).jpg', 299000, '', '<p>&Aacute;o sơ mi kẻ của HASA sử dụng chất liệu cotton mềm mại thấm h&uacute;t mồ h&ocirc;i cực tốt, thoải m&aacute;i v&agrave; tiện dụng nhưng vẫn lịch l&atilde;m v&agrave; sang trọng. D&aacute;ng &aacute;o Slim Fit &ndash; &ocirc;m body thon gọn rất trẻ trung, c&oacute; thể kết hợp dễ d&agrave;ng đi l&agrave;m, dạo phố, đi chơi....</p>\r\n', 1, '2020-06-14 07:16:22', '2020-06-14 00:00:00'),
(36, 3, 'Áo Sơ Mi Nam Cộc Tay Cao Cấp Kẻ Ghi Xám VARDINO', '1592119841-product-35267365_664440440560190_1498223247274016768_n.png', 299000, '', '<p>Chất liệu: Cotton mềm mịn, bền m&agrave;u;</p>\r\n\r\n<p>Đặc t&iacute;nh: Chất vải nhẹ, mềm mịn, tho&aacute;ng m&aacute;t, thấm h&uacute;t mồ h&ocirc;i; kh&ocirc;ng nhăn; bền m&agrave;u với thời gian</p>\r\n\r\n<p>Kiểu d&aacute;ng: D&aacute;ng &aacute;o&nbsp;Regular fit, kh&ocirc;ng qu&aacute; bo hay qu&aacute; thụng n&ecirc;nc&oacute; thể mặc bu&ocirc;ng vạt &aacute;o thoải m&aacute;i, hoặc sơ vin đều l&ecirc;n form rất đẹp.</p>\r\n', 1, '2020-06-14 07:30:41', NULL),
(37, 3, 'Áo sơ mi nam Cộc Tay Đen dáng body Hàn Quốc không nhăn', '1592120051-product-images (6).jpg', 299000, '', '<p>-Chất vải sờ mịn kh&ocirc;ng bai, kh&ocirc;ng nhăn, kh&ocirc;ng x&ugrave;.</p>\r\n\r\n<p>-Mếch cổ v&agrave; tay l&agrave;m bằng chất liệu cao cấp, kh&ocirc;ng sợ bong tr&oacute;c.</p>\r\n\r\n<p>-Fom Body cực chuẩn, &ocirc;m trọn bờ vai mặc cực trẻ trung v&agrave; phong c&aacute;ch, ph&ugrave; hợp mọi ho&agrave;n cảnh kể cả đi chơi v&agrave; đi l&agrave;m.</p>\r\n', 1, '2020-06-14 07:34:11', NULL),
(38, 3, 'SƠ MI CỘC TAY TRƠN NAM', '1592120144-product-4-13.jpg', 299000, '', '<p>&Aacute;o sơ mi nam GEZO Body Slimfit được may từ chất liệu vải mềm m&aacute;t, tho&aacute;ng kh&iacute;, thấm h&uacute;t mồ h&ocirc;i tốt. Sản phẩm c&oacute; đường chỉ may tỉ mỉ, tinh tế. Thiết kể kiểu sơ mi cổ điển với cổ đức, tay d&agrave;i, c&agrave;i khuy, d&aacute;ng &ocirc;m s&aacute;t. &Aacute;o sơ mi đơn giản, dễ mặc, dễ kết hợp với nhiều kiểu trang phục kh&aacute;c nhau cho nhiều dịp v&agrave; nhiều ho&agrave;n cảnh chắc chắn sẽ gi&uacute;p bạn nam thể hiện phong c&aacute;ch lịch l&atilde;m, trẻ trung của m&igrave;nh mỗi khi ra ngo&agrave;i.</p>\r\n\r\n<p><strong>Chất liệu vải cao cấp</strong><br />\r\nThấm h&uacute;t mồ h&ocirc;i<br />\r\nKh&ocirc;ng nhăn nh&agrave;u<br />\r\nChống bụi bẩn<br />\r\nChống tia cực t&iacute;m<br />\r\nSản phẩm kh&ocirc;ng bị co khi giặt, chống nhăn v&agrave; chống k&eacute;o d&atilde;n<br />\r\nC&ocirc;ng ngh&ecirc;̣ Wrinkle free ch&ocirc;́ng nhăn nhàu đ&ecirc;́n 24 l&acirc;̀n giặt, giúp người sử dụng ti&ecirc;́t ki&ecirc;̣m thời gian và chi phí.<br />\r\nSản ph&acirc;̉m giặt xong chỉ c&acirc;̀n giũ mạnh là phẳng kh&ocirc;ng c&acirc;̀n tác dụng nhi&ecirc;̣t là</p>\r\n', 1, '2020-06-14 07:35:44', NULL),
(39, 2, 'Quần jogger nam vải kaki cao cấp', '1592120844-product-24d750429b3e69d3ef842dde86492c0e.jpg', 299000, '', '<p><img src=\"http://vn-test-11.slatic.net/p/f258629374ec763528e93f648539e6ab.jpg_720x720q80.jpg_.webp\" style=\"width:600px\" /></p>\r\n\r\n<p><img src=\"https://vn-test-11.slatic.net/shop/6397e22f0f351ec19f5e211193ad3458.jpeg\" style=\"width:600px\" /></p>\r\n\r\n<p><img src=\"https://vn-test-11.slatic.net/shop/f2dc18b1a012b57aca16f8b641af4aeb.jpeg\" style=\"width:600px\" /></p>\r\n', 1, '2020-06-14 07:47:24', NULL),
(40, 2, ' Quần tây nam xuất Hàn Quốc đẹp ống đứng,ống ngắn, ống côn hàng cao cấp thời trang nam Routine', '1592120935-product-8add182357ddd2a36b398d99bd568c50.jpg', 299000, '', '<p>Một trong những kiểu trang phục gi&uacute;p c&aacute;c ch&agrave;ng trai thể hiện được sự thanh lịch v&agrave; sang trọng của m&igrave;nh ch&iacute;nh l&agrave; quần &acirc;u nam v&agrave; &aacute;o sơ mi nam. Kh&ocirc;ng chỉ gi&uacute;p đem lại một phong c&aacute;ch thời trang lịch l&atilde;m của một qu&yacute; &ocirc;ng, m&agrave; quần t&acirc;y nam c&ocirc;ng sở c&ograve;n gi&uacute;p c&aacute;c ch&agrave;ng trai thể hiện được đẳng cấp của m&igrave;nh qua bộ trang phục. B&ecirc;n cạnh những kiểu quần t&acirc;y c&ocirc;ng sở chỉnh chu để mặc đi l&agrave;m mỗi ng&agrave;y, bạn c&ograve;n c&oacute; thể chọn cho m&igrave;nh những loại quần t&acirc;y nam ống c&ocirc;n thời trang để phối c&ugrave;ng &aacute;o ph&ocirc;ng nam, &aacute;o polo nam,&hellip; Nếu những kiểu quần jeans nam đem lại cho bạn cảm gi&aacute;c năng động, khỏe khoắn, th&igrave; khi diện quần t&acirc;y nam, bạn sẽ c&oacute; cho m&igrave;nh vẻ ngo&agrave;i tự tin v&agrave; nam t&iacute;nh. Kh&ocirc;ng chỉ c&oacute; thế, với c&aacute;c loại quần t&acirc;y nam đẹp, bạn c&ograve;n c&oacute; thể mặc ch&uacute;ng để đi đến những bữa tiệc hoặc sự kiện quan trọng kh&aacute;c</p>\r\n', 1, '2020-06-14 07:48:55', NULL),
(41, 2, 'Quần jean nam xanh trắng chất bò co giãn 4 chiều Form slim fit', '1592121089-product-images.jpg', 299000, '', '<p>Quần jean nam xanh trắng chất b&ograve; co gi&atilde;n 4 chiều, d&aacute;ng quần ống c&ocirc;n form chuẩn theo xu hướng phong c&aacute;ch thời trang trẻ, size quần b&ograve; nam ph&ugrave; hợp nhiều lứa tuổi. Vải d&agrave;y nhưng mềm mịn co d&atilde;n cực tốt v&agrave; tho&aacute;ng kh&iacute;</p>\r\n\r\n<p>- Vải jean nhập khẩu được kiểm tra tỉ mỉ qua nhiều c&ocirc;ng đoạn.</p>\r\n\r\n<p>- C&ocirc;ng nghệ sử l&yacute; m&agrave;u hiện đại hạn chế phai m&agrave;u tối đa - Chất liệu: 98% Cotton ( thấm h&uacute;t ) / 2% Spandex ( co gi&atilde;n )</p>\r\n\r\n<p>- Chất jean cotton co gi&atilde;n 4 chiều, kh&ocirc;ng bai d&aacute;ng, bền m&agrave;u quần.</p>\r\n\r\n<p>- Nguồn gốc xuất xứ: Việt Nam</p>\r\n\r\n<p>- Đạt chuẩn về độ độc hại, k&iacute;ch ứng da khi sử dụng</p>\r\n\r\n<p>&diams; Chất liệu vải jean cotton co gi&atilde;n gi&uacute;p thoải m&aacute;i trong mọi hoạt động. vải mềm mịn, &iacute;t nhăn, &iacute;t x&ugrave; l&ocirc;ng, giữ d&aacute;ng kh&ocirc;ng bai.</p>\r\n\r\n<p>&diams; Thiết kế thời trang jean nam ống c&ocirc;n lu&ocirc;n tạo được ấn tượng đặc biệt đối với người nh&igrave;n.</p>\r\n\r\n<p>&diams; Quần jean nam r&aacute;ch cao cấp chỉ may chắc chắn, tỉ mỉ, tinh tế cả những chi tiết nhỏ nhất.</p>\r\n\r\n<p>&diams; Quần bộ nam dễ d&agrave;ng Phối được với nhiều trang phục như &aacute;o sơ mi, &aacute;o thun...</p>\r\n', 1, '2020-06-14 07:51:29', '2020-06-17 00:00:00'),
(42, 2, 'QUẦN JEAN NAM CHẤT BÒ XANH CẠP RÁCH UNISEX TREND MỚI CAO CẤP', '1592121191-product-images (1).jpg', 299000, '', '<p>- C&oacute; hai t&uacute;i x&eacute;o trước v&agrave; hai t&uacute;i sau rất tiện dụng.</p>\r\n\r\n<p>- Kiểu d&aacute;ng thời trang, s&agrave;nh điệu.</p>\r\n\r\n<p>- Tổng thể m&agrave;u x&aacute;m h&agrave;i h&ograve;a phối r&aacute;ch t&aacute;o bạo tạo sự năng động, c&aacute; t&iacute;nh.</p>\r\n\r\n<p>- Chất liệu jean cotton bền đẹp, chắc chắn, kh&ocirc;ng phai m&agrave;u, kh&ocirc;ng co r&uacute;t khi giặc.</p>\r\n\r\n<p>- C&oacute; thể kết hợp c&ugrave;ng nhiều trang phục kh&aacute;c nhau để mang tới cho m&igrave;nh một phong c&aacute;ch c&aacute; t&iacute;nh ri&ecirc;ng.</p>\r\n', 1, '2020-06-14 07:53:11', NULL),
(43, 2, 'Quần jean nam xanh nhạt cao cấp ', '1592121719-product-images (2).jpg', 299000, '', '<p>Quần Jean Nam Xanh Nhạt Cao Cấp H&agrave;ng Việt Nam Xuất Khẩu&nbsp;</p>\r\n\r\n<p>Quần B&ograve; Nam Rẻ Đẹp Jean Co Gi&atilde;n Giặt Kh&ocirc;ng Bay M&agrave;u</p>\r\n\r\n<p>Quần jean Nam được Thiết kế v&agrave; xản xuất bời cty thời trang nam ROUTINE Sản xuất ngay tại Việt Nam tr&ecirc;n d&acirc;y truyền, c&ocirc;ng nghệ hiện đại nhất.</p>\r\n\r\n<p>- Nguy&ecirc;n liệu nhập khẩu được kiểm tra chọn lọc tỉ mỉ qua nhiều c&ocirc;ng đoạn.</p>\r\n\r\n<p>- Chất jean co gi&atilde;n nhẹ 4 chiều, kh&ocirc;ng bai d&aacute;ng, bền m&agrave;u quần.</p>\r\n\r\n<p>- Nguồn gốc xuất xứ r&otilde; r&agrave;ng.</p>\r\n\r\n<p>- Đạt chuẩn về độ độc hại, k&iacute;ch ứng da khi sử dụng</p>\r\n', 1, '2020-06-14 07:55:12', '2020-06-14 00:00:00'),
(44, 2, 'Quần Jogger Kaki Trơn Nam Đen', '1592121371-product-JG20-350-28-29-30-31-32-34-36.jpg', 299000, '', '', 1, '2020-06-14 07:56:11', NULL),
(45, 2, 'quần jogger kaki nam ống bó túi đập phong cách thời thượng', '1592121487-product-Quan-dai-nhieu-tui-phong-cach-quan-doi-cho-nam.jpg', 299000, '', '', 1, '2020-06-14 07:58:07', NULL),
(46, 2, 'Quần jogger thun BC nam túi hộp cao cấp chất siêu co giãn', '1592121545-product-images (3).jpg', 299000, '', '', 1, '2020-06-14 07:59:05', '2020-06-14 00:00:00'),
(47, 2, 'Quần Jogger Pants túi hộp', '1592121585-product-images (4).jpg', 299000, '', '', 1, '2020-06-14 07:59:45', NULL),
(48, 2, ' Quần jean nam màu bạc rách gối giá sỉ​, giá bán buôn Quần jean nam màu bạc rách gối', '1592121788-product-images (5).jpg', 299000, '', '', 1, '2020-06-14 08:03:08', '2020-06-14 00:00:00'),
(49, 4, 'Áo phông nữ tay lỡ cao cấp vạt sau dài', '1592131148-product-7WDeYH_simg_de2fe0_500x500_maxb.jpg', 299000, '', '<p><img alt=\"nOsk2X_simg_d0daf0_800x1200_max.jpg\" src=\"https://media3.scdn.vn/img3/2019/1_10/nOsk2X_simg_d0daf0_800x1200_max.jpg\" style=\"width:600px\" /></p>\r\n\r\n<p><img alt=\"0VktVi_simg_d0daf0_800x1200_max.jpg\" src=\"https://media3.scdn.vn/img3/2019/1_10/0VktVi_simg_d0daf0_800x1200_max.jpg\" style=\"width:600px\" /></p>\r\n\r\n<p><img alt=\"Bzvvc3_simg_d0daf0_800x1200_max.jpg\" src=\"https://media3.scdn.vn/img3/2019/1_10/Bzvvc3_simg_d0daf0_800x1200_max.jpg\" style=\"width:600px\" /></p>\r\n', 1, '2020-06-14 10:39:08', NULL),
(50, 4, 'Áo Phông Dáng Rộng Nam Nữ Màu Hồng In Hình', '1592131454-product-770f0d418c26e91d906af8980008d488.jpg', 299000, '', '<p><img src=\"https://cf.shopee.vn/file/0294e353a2d0957ffa3a7070d4f7badb\" style=\"width:600px\" /></p>\r\n\r\n<p><img src=\"https://cf.shopee.vn/file/58e98488a5a927cd49a42e814f4db267\" style=\"width:600px\" /></p>\r\n\r\n<p>&Aacute;o Ph&ocirc;ng Nữ D&aacute;ng Rộng M&agrave;u Hồng In H&igrave;nh Si&ecirc;u Kute quả l&agrave; một sản phẩm hấp dẫn v&agrave; tiện dụng . Ch&uacute;ng kh&ocirc;ng chỉ nổi bật về những đặch điểm như kiểu d&aacute;ng , m&agrave;u sắc, chất liệu,.. M&agrave; ch&uacute;ng c&ograve;n mang lại sự tiện &iacute;ch gi&uacute;p người mua dễ d&agrave;ng kết hợp với những bộ trang phục nhiều kiểu c&aacute;ch như trang nh&atilde; lịch sự quần legging, Jeans, v&aacute;y..... tạo nen vẻ trẻ trung, khoẻ khoắn.</p>\r\n', 1, '2020-06-14 10:44:15', NULL),
(51, 4, 'Áo phông nữ form rộng thêu chữ Hàn dễ thương', '1592131626-product-images.jpg', 299000, '', '<p>*Bạn sở hữu cả một tủ đồ chật cứng nhưng c&oacute; bao giờ bạn cảm thấy &quot;kh&ocirc;ng c&oacute; g&igrave; để mặc&quot;?</p>\r\n\r\n<p>*Bạn đang t&igrave;m kiếm 1 item c&oacute; thể dễ d&agrave;ng kết hợp với nhiều loại trang phục, hoặc đơn giản l&agrave; c&oacute; thể mặc trong bất cứ ho&agrave;n cảnh n&agrave;o?</p>\r\n\r\n<p>*Bạn c&oacute; biết item thời trang n&agrave;o lu&ocirc;n lu&ocirc;n hợp mốt?</p>\r\n\r\n<p>H&atilde;y để VIETCEN gợi &yacute; cho bạn sản phẩm&nbsp;mẫu &Aacute;o thun nữ form rộng th&ecirc;u chữ H&agrave;n đang khiến giới trẻ ph&aacute;t cuồng h&egrave; n&agrave;y.</p>\r\n\r\n<p>- 1.&nbsp;Đặc điểm &Aacute;o thun nữ form rộng th&ecirc;u chữ H&agrave;n dễ thương</p>\r\n\r\n<p>- &Aacute;o thun nữ form rộng th&ecirc;u chữ H&agrave;n dễ thương&nbsp;được may từ chất tici mịn m&aacute;t, mặc m&ugrave;a h&egrave; th&ocirc;ng tho&aacute;ng, kh&ocirc;ng khiến đổ mồ h&ocirc;i.</p>\r\n\r\n<p>- M&agrave;u sắc nữ t&iacute;nh, dễ d&agrave;ng kết hợp cũng như phối m&agrave;u với nhiều loại trang phục kh&aacute;c nhau.</p>\r\n\r\n<p>- &Aacute;o thun nữ được th&ecirc;u chữ H&agrave;n dễ thương mang đậm phong c&aacute;ch H&agrave;n Quốc</p>\r\n\r\n<p>- Cổ &aacute;o được thiết kế cổ bẻ vừa k&iacute;n đ&aacute;o lại vừa khẳn định được n&eacute;t trẻ trung</p>\r\n\r\n<p>- Trang phục gi&uacute;p bạn g&aacute;i khoe gu thời trang năng động.&nbsp;</p>\r\n\r\n<p>2. Th&ocirc;ng tin chi tiết sản phẩm</p>\r\n\r\n<p>- Chất liệu :chất tici m&aacute;t mịn&nbsp;</p>\r\n\r\n<p>- Đường chỉ may mịn đẹp, kh&ocirc;ng thừa đầu chỉ.</p>\r\n\r\n<p>- &Aacute;o c&oacute; độ bền m&agrave;u cao, chống x&ugrave; trong suốt thời gian sử dụng.</p>\r\n\r\n<p>- Kiểu d&aacute;ng hợp thời trang, dễ mặc, dễ phối đồ</p>\r\n\r\n<p>- M&agrave;u sắc: Hồng, Xanh ngọc</p>\r\n\r\n<p>- From 60 kg đổ lại</p>\r\n\r\n<p>C&ograve;n chần chờ g&igrave; m&agrave; kh&ocirc;ng đến VIETCEN sắm ngay cho tủ đồ của m&igrave;nh những chiếc &aacute;o xinh xắn, hợp thời trang ngay đi n&agrave;o!&nbsp;</p>\r\n', 1, '2020-06-14 10:47:06', NULL),
(52, 4, 'Áo phông nữ freesize phối dây tay rách', '1592131732-product-images (1).jpg', 299000, '', '<ul>\r\n	<li>&nbsp;THiết kế năng động c&aacute; t&iacute;nh nhiều m&agrave;u sắc lựa chọn</li>\r\n	<li>&nbsp;&Aacute;o freesize cho người từ 55kg trở xuống</li>\r\n	<li>&nbsp;Dễ phối đồ</li>\r\n</ul>\r\n', 1, '2020-06-14 10:48:52', NULL),
(53, 4, 'Áo Phông Nữ Xẻ Tà Tay Lỡ Form Rộng ', '1592131943-product-images (2).jpg', 299000, '', '<p><img src=\"https://vn-test-11.slatic.net/shop/ba6ebbeb77048bd696b4a4ccca9760ec.jpeg\" style=\"width:600px\" /></p>\r\n\r\n<p><img src=\"https://vn-test-11.slatic.net/shop/6db8770dc31b9ff532fa9735dce93ef8.jpeg\" style=\"width:600px\" /></p>\r\n\r\n<p><img src=\"https://vn-test-11.slatic.net/shop/511472eba78355d58906bdcc6b54ef52.jpeg\" style=\"width:600px\" /></p>\r\n\r\n<p><img src=\"https://vn-test-11.slatic.net/shop/919d498a66e2cd5145ca70f2d8ed1fbb.jpeg\" style=\"width:600px\" /></p>\r\n\r\n<p><img src=\"https://vn-test-11.slatic.net/shop/8971634048afed21cc4f07faaccc7d10.jpeg\" style=\"width:600px\" /></p>\r\n', 1, '2020-06-14 10:52:23', '2020-06-14 00:00:00'),
(54, 4, ' Áo Thun Nữ Tay Lỡ Form Rộng Thiết Kế Nối Vải 2 Màu Cách Điệu', '1592132283-product-3feaaec7614eb9ac929ee5ad5e0363ff.jpg_720x720q80.jpg', 299000, '', '<p>Chiếc &aacute;o ph&ocirc;ng c&aacute;ch điệu được may đo tr&ecirc;n chất liệu cotton thun c&ugrave;ng d&aacute;ng thiết kế ấn tượng sẽ cho bạn nữ một c&aacute; t&iacute;nh rất ri&ecirc;ng</p>\r\n\r\n<p><img src=\"https://vn-test-11.slatic.net/shop/8c90922550fb45fa77d7b6cc7041968b.jpeg\" /></p>\r\n\r\n<p><img src=\"https://vn-test-11.slatic.net/shop/7ae008ce963d37fe4d2314f3b3959615.jpeg\" /></p>\r\n', 1, '2020-06-14 10:58:03', NULL),
(55, 4, 'Áo phông nữ form thụng in gấu chất đẹp', '1592227814-product-images (3).jpg', 299000, '', '<p><img src=\"https://cf.shopee.vn/file/2ef6a116b70152c59d853f05750c6b49\" style=\"width:600px\" /></p>\r\n\r\n<p>+ Chất liệu : Cotton 100%</p>\r\n\r\n<p>+ &Aacute;o Freesize cho những c&ocirc; n&agrave;ng từ 62 kg đổ xuống</p>\r\n\r\n<p>+ M&agrave;u sắc : Trắng</p>\r\n\r\n<p>+ Cổ &aacute;o : Tr&ograve;n</p>\r\n', 1, '2020-06-15 13:30:14', NULL),
(56, 4, 'Áo phông nữ tăm nhỏ cổ tròn Uniqlo', '1592228127-product-ao_phong_ke_tam_nu_2_grande.jpg', 299000, '', '<p>Thiết kế đơn giản, cổ tr&ograve;n cộc tay, kết hợp với chất cotton sợi b&ocirc;ng &ecirc;m &aacute;i v&agrave; mềm mại c&oacute; những đường sọc tăm tinh tế nhỏ b&eacute;, khiến cho vẻ nữ t&iacute;nh của người mặc n&oacute; trở n&ecirc;n kh&ocirc;ng thể cưỡng nổi.</p>\r\n', 1, '2020-06-15 13:35:27', NULL),
(57, 4, 'Áo phông nữ giấu quần cá tính', '1592228344-product-20144239310F3846380L37121.jpg', 299000, '', '<p><img src=\"http://thoitrangxitin.com/Upload/2018-11/20144239310F3846380L37122.jpg\" /></p>\r\n\r\n<p><img src=\"http://thoitrangxitin.com/Upload/2018-11/20144239310F3846380L37123.jpg\" /></p>\r\n\r\n<p><img src=\"http://thoitrangxitin.com/Upload/2018-11/20144239310F3846380L37124.jpg\" /></p>\r\n', 1, '2020-06-15 13:39:04', NULL),
(58, 4, 'Áo thun tím mộng mơ form rộng dáng giấu quần', '1592365814-product-images (4).jpg', 299000, '', '', 1, '2020-06-15 13:42:25', '2020-06-17 00:00:00'),
(59, 4, 'Áo Thun Giấu Quần Cá Tính PHong Cách Hàn Quốc', '1592228694-product-images (5).jpg', 299000, '', '<p><img src=\"https://cf.shopee.vn/file/806c1d9626b2da50298e2000b7d4dcb9\" style=\"width:600px\" /></p>\r\n\r\n<p><img src=\"https://cf.shopee.vn/file/5f630ff5167f1fe7b6edfb45eb32c7bf\" style=\"width:600px\" /></p>\r\n\r\n<p><img src=\"https://cf.shopee.vn/file/64ddb9f1a54ba9178b91848a63b38413\" style=\"width:600px\" /></p>\r\n', 1, '2020-06-15 13:44:54', NULL),
(60, 5, 'Quần Kaki Nữ Xoắn Ống Ulzzang Hàn Quốc', '1592229782-product-3c42cb5924f59a906bc8b0859c4057d9.jpg', 299000, '', '<p>Quần Kaki Nữ Basic Teen Phong C&aacute;ch Với xu hướng diện quần kaki&nbsp;khi đi học, đi l&agrave;m, đi chơi,... của c&aacute;c sao tr&ecirc;n thế giới, những chiếc quần jogger n&agrave;y đ&atilde; trở th&agrave;nh hot-trend của năm nay.</p>\r\n\r\n<p><strong>Đặc điểm nổi bật </strong></p>\r\n\r\n<p>- Với thiết kế&nbsp;đơn giản kh&ocirc;ng qu&aacute; cầu k&igrave;, chiếc quần với một m&agrave;u tạo sự thanh lịch v&agrave; tao nh&atilde;.</p>\r\n\r\n<p>- Lưng thun co gi&atilde;n dễ mặc, form quần &ocirc;m nhẹ tạo cho bạn cảm gi&aacute;c thoải m&aacute;i trong mọi hoạt động hằng ng&agrave;y.</p>\r\n\r\n<p>- 2 t&uacute;i quần được kho&eacute;t s&acirc;u, tiện dụng khi đựng v&iacute; tiền, điện thoại,...</p>\r\n\r\n<p>- Chất liệu kaki mịn đẹp, nhưng kh&ocirc;ng g&acirc;y n&oacute;ng bức tạo sự dễ chịu cho người mặc.</p>\r\n\r\n<p>- Th&iacute;ch hợp phối với những item thời trang kh&aacute;c như &aacute;o thun, &aacute;o tay lỡ, denim...</p>\r\n\r\n<p>- Thiết kế theo phong c&aacute;ch unisex, ph&ugrave; hợp cho cả nam lẫn nữ.</p>\r\n\r\n<p><strong>Th&ocirc;ng tin sản phẩm: </strong></p>\r\n\r\n<p>- Size quần: M , L d&agrave;nh cho người từ 45-70kg.</p>\r\n\r\n<p>- M&agrave;u sắc: Trắng Ng&agrave;, N&acirc;u,&nbsp;Đen.</p>\r\n\r\n<p>- Chất liệu: kaki mịn, th&oacute;ang m&aacute;t.</p>\r\n\r\n<p>- Xuất xứ: Việt Nam.</p>\r\n\r\n<p>- Bảo h&agrave;nh: kh&ocirc;ng.</p>\r\n\r\n<p>- Thương hiệu: No Brand.</p>\r\n', 1, '2020-06-15 14:03:02', NULL),
(61, 5, 'Quần kaki nữ đen - trắng', '1592229936-product-3QAq2e_simg_de2fe0_500x500_maxb.jpg', 299000, '', '<p><img alt=\"Quần kaki nữ đen - trắng\" src=\"https://media3.scdn.vn/img2/2018/10_15/6FUXX9_simg_de2fe0_500x500_maxb.jpg\" /></p>\r\n\r\n<p><img alt=\"Quần kaki nữ đen - trắng\" src=\"https://media3.scdn.vn/img2/2018/10_15/PuH7ks_simg_de2fe0_500x500_maxb.jpg\" /></p>\r\n\r\n<p><img alt=\"Quần kaki nữ đen - trắng\" src=\"https://media3.scdn.vn/img2/2018/10_15/DnYVRt_simg_de2fe0_500x500_maxb.jpg\" /></p>\r\n', 1, '2020-06-15 14:05:36', NULL),
(62, 5, 'Quần kaki nữ ống rộng, quần ống suông', '1592230172-product-images.jpg', 299000, '', '<p><img src=\"https://cf.shopee.vn/file/2d1096b016e246d65f00e97503af4e05\" /></p>\r\n\r\n<p><img src=\"https://cf.shopee.vn/file/660d14c1428672e25d24ee26ca91f709\" /></p>\r\n\r\n<p>&nbsp;</p>\r\n', 1, '2020-06-15 14:09:32', NULL),
(63, 5, 'Quần jean nữ ống rộng đẹp', '1592230472-product-LQgNcA_simg_de2fe0_500x500_maxb.jpg', 299000, '', '<p><em><strong>Quần jean nữ ống rộng, quần jean nữ</strong></em></p>\r\n\r\n<p>!uần jean nữ ống rộng đ&atilde; về sẵn nhiều với m&agrave;u xanh ngọc cực đẹp</p>\r\n\r\n<p>Quần jean nữ ống rộng&nbsp; với thiết kế đ&uacute;ng t&ecirc;n phần cạp theo thiết kế chuẩn quần jean ph&iacute;a dưới quần được thiết kế loe rộng kiểu c&aacute;ch cực đẹp, ph&iacute;a dưới ống được thiết kế lộ rua chỉ ch&iacute;nh l&agrave; điểm nhấn tạo cho sản phẩm một điểm nhấn si&ecirc;u chất</p>\r\n\r\n<p>Quần được l&agrave;m từ chất liệu jean cao cấp co d&atilde;n nhẹ đảm bảo kh&ocirc;ng mất form d&aacute;ng khi mặc hay giặt giũ&nbsp;</p>\r\n\r\n<p>Quần jean nữ ống rộng thiết kế ống rộng ngắn để lộ mắt c&aacute; ch&acirc;n cực dễ phối với gi&agrave;y từ gi&agrave;y thể thao đến c&aacute;c mẫu gi&agrave;y lười hay c&aacute;c mẫu gi&agrave;y cao g&oacute;t đều cực kỳ chất</p>\r\n\r\n<p><img alt=\"quần jean nữ ống rộng đẹp\" src=\"https://media3.scdn.vn/img3/2019/6_24/DR7Z43_simg_de2fe0_500x500_maxb.jpg\" style=\"width:700px\" /></p>\r\n\r\n<p><img alt=\"rMB3dh_simg_d0daf0_800x1200_max.jpg\" src=\"https://media3.scdn.vn/img3/2019/6_24/rMB3dh_simg_d0daf0_800x1200_max.jpg\" /></p>\r\n\r\n<p><img alt=\"7jKFFm_simg_d0daf0_800x1200_max.png\" src=\"https://media3.scdn.vn/img3/2019/6_24/7jKFFm_simg_d0daf0_800x1200_max.png\" /></p>\r\n', 1, '2020-06-15 14:14:32', NULL),
(64, 5, 'QUẦN JEAN PAGGY NỮ ỐNG RỘNG', '1592231295-product-75063cd7-9cb6-4b41-b9a4-5ae285195d01_a956259dc8b64f43b6f6f044b63365dd_master.jpg', 299000, '', '<p><img alt=\" QJ012 - QUẦN JEAN PAGGY NỮ ỐNG RỘNG \" src=\"https://product.hstatic.net/1000285106/product/823aeb87-f593-42ad-a5d1-f4c945c2ec7f_356c9f6e77f34498a64cc0a6cf435e74_master.jpg\" style=\"width:600px\" /></p>\r\n\r\n<p><img alt=\" QJ012 - QUẦN JEAN PAGGY NỮ ỐNG RỘNG \" src=\"https://product.hstatic.net/1000285106/product/fba11b72-ae7a-40af-956e-28bd6930b276_857fde3641ff4403aa7977f5fb28123f_master.jpg\" style=\"width:600px\" /></p>\r\n\r\n<p><img alt=\" QJ012 - QUẦN JEAN PAGGY NỮ ỐNG RỘNG \" src=\"https://product.hstatic.net/1000285106/product/411745e1-2181-4337-9151-30a873b82ea3_cf715b9b8ee043e186c929e7f10638df_master.jpg\" style=\"width:600px\" /></p>\r\n', 1, '2020-06-15 14:28:15', NULL),
(65, 5, 'QUẦN JEAN ỐNG RỘNG LƯNG THUN', '1592231494-product-images (1).jpg', 299000, '', '<p><strong>Quần jean ống rộng lưng thun</strong>&nbsp;- Mẫu quần&nbsp;được thiết kế từ chất liệu jean kết hợp&nbsp;lưng thun&nbsp;co giản tốt , ống quần su&ocirc;ng rộng thể hiện sự c&aacute; t&iacute;nh v&agrave; trẻ trung năng động mang đến sự thoải m&aacute;i khi đi chơi dạo phố.<br />\r\n<img src=\"http://media3.scdn.vn/img2/2018/6_10/LkAPUA_simg_d0daf0_800x1200_max.jpg\" /><br />\r\n<img src=\"http://media3.scdn.vn/img2/2018/6_10/sYtibX_simg_d0daf0_800x1200_max.jpg\" /><br />\r\n<img src=\"http://media3.scdn.vn/img2/2018/6_10/Cq3AbB_simg_d0daf0_800x1200_max.jpg\" /><br />\r\n<img src=\"http://media3.scdn.vn/img2/2018/6_10/VoGdT9_simg_d0daf0_800x1200_max.jpg\" /><br />\r\n<img src=\"http://media3.scdn.vn/img2/2018/6_10/rhPyZA_simg_d0daf0_800x1200_max.jpg\" /><br />\r\n<img src=\"http://media3.scdn.vn/img2/2018/6_10/MOsUfO_simg_d0daf0_800x1200_max.jpg\" /><br />\r\n<img src=\"http://media3.scdn.vn/img2/2018/6_10/p9vB8A_simg_d0daf0_800x1200_max.jpg\" /></p>\r\n', 1, '2020-06-15 14:31:34', NULL),
(66, 5, 'QUẦN JEAN BAGGY NỮ BIG SIZE RÁCH KIỂU ỐNG SUÔNG RỘNG, MÀU XANH NHẠT THỜI TRANG', '1592231716-product-f2682d186a395e81d99c922bf7d61dc3.jpg', 299000, '', '<ul>\r\n	<li><strong>Quần Jean Big Size Nữ</strong>&nbsp;với đường may tinh xảo, tạo n&ecirc;n gu thời trang s&agrave;nh điệu cho bạn g&aacute;i.</li>\r\n	<li>M&agrave;u sắc trẻ trung, năng động, c&aacute; t&iacute;nh.</li>\r\n	<li>Dễ d&agrave;ng phối hợp c&ugrave;ng nhiều phụ kiện kh&aacute;c mang đến phong c&aacute;ch thời trang ri&ecirc;ng.</li>\r\n	<li>Kh&eacute;o l&eacute;o lựa chọn trang phục c&ugrave;ng phụ kiện ph&ugrave; hợp, bạn sẽ c&oacute; set đồ đẹp mắt.</li>\r\n	<li>Gợi &yacute;, bạn c&oacute; thể kết hợp c&ugrave;ng gi&agrave;y sandals, gi&agrave;y b&uacute;p b&ecirc;, gi&agrave;y cao g&oacute;t hoặc c&aacute;c kiểu d&eacute;p kh&aacute;c nhau sẽ</li>\r\n	<li>gi&uacute;p bạn th&ecirc;m phần tự tin khi dạo phố hay đi chơi c&ugrave;ng bạn b&egrave;.</li>\r\n	<li>Đ&acirc;y l&agrave; một sản phẩm kh&ocirc;ng thể thiếu trong tủ đồ của c&aacute;c bạn g&aacute;i.</li>\r\n</ul>\r\n\r\n<p><img src=\"https://salt.tikicdn.com/cache/w390/ts/product/c8/44/d1/6a80577dada849a6c57d9fa7174f95ad.jpg\" /></p>\r\n\r\n<p><img src=\"https://salt.tikicdn.com/cache/w390/ts/product/73/f3/2c/450dd2c49b82dfd5c169b429346cd572.jpg\" /></p>\r\n\r\n<p><img src=\"https://salt.tikicdn.com/cache/w390/ts/product/41/4d/8f/fadbad146e144914ffec3904b3295116.jpg\" /></p>\r\n', 1, '2020-06-15 14:35:16', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `slides`
--

CREATE TABLE `slides` (
  `id` int(11) NOT NULL,
  `avatar` varchar(255) DEFAULT NULL COMMENT 'File ảnh slide',
  `position` tinyint(3) DEFAULT NULL COMMENT 'Vị trí hiển thị của slide, ví dụ: = 0 hiển thị đầu tiên...',
  `status` tinyint(3) DEFAULT 0 COMMENT 'Trạng thái danh mục: 0 - Inactive, 1 - Active',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Ngày tạo',
  `updated_at` datetime DEFAULT NULL COMMENT 'Ngày cập nhật cuối'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL COMMENT 'Tên đăng nhập',
  `password` varchar(255) NOT NULL COMMENT 'Mật khẩu đăng nhập',
  `full_name` varchar(255) DEFAULT NULL COMMENT 'Họ tên admin',
  `avatar` varchar(255) DEFAULT NULL COMMENT 'File ảnh đại diện',
  `jobs` varchar(255) DEFAULT NULL COMMENT 'Nghề nghiệp',
  `status` tinyint(3) DEFAULT 0 COMMENT 'Trạng thái danh mục: 0 - Inactive, 1 - Active',
  `level` tinyint(3) NOT NULL DEFAULT 1 COMMENT 'Cấp độ user - 1 là Member, 2 là Admin, 3 là Super admin',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Ngày tạo',
  `updated_at` datetime DEFAULT NULL COMMENT 'Ngày cập nhật cuối',
  `phone` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `full_name`, `avatar`, `jobs`, `status`, `level`, `created_at`, `updated_at`, `phone`, `address`, `email`) VALUES
(3, 'thanhtrung', '45bc408d520bb584d53966efe0ff3018', 'Nguyễn Thành Trung', '1592231055-user-91795304_2546207752374021_1440680954774421504_n.jpg', 'Web dev', 1, 3, '2020-06-11 09:05:58', NULL, '0968824797', 'Thường Tín', 'darkprince411999@gmail.com'),
(4, 'trung1999', '45bc408d520bb584d53966efe0ff3018', 'NgThanhTrung', '1593580781-user-maxresdefault.jpg', '', 1, 1, '2020-06-11 16:08:31', NULL, '', '', ''),
(6, 'buithuphuong', 'c4ca4238a0b923820dcc509a6f75849b', 'Bùi Thu Phương', NULL, '', 1, 2, '2020-06-29 07:52:15', NULL, '', '', ''),
(7, 'hihihaha', 'c4ca4238a0b923820dcc509a6f75849b', 'chưa nghĩ ra tên', NULL, '', 1, 1, '2020-06-29 09:35:59', NULL, '', '', '');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `fk_order_customer` (`customer_id`) USING BTREE;

--
-- Chỉ mục cho bảng `order_details`
--
ALTER TABLE `order_details`
  ADD KEY `fk_order_details_orders` (`order_id`),
  ADD KEY `fk_order_details_products` (`product_id`);

--
-- Chỉ mục cho bảng `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `fk_products_categories` (`category_id`);

--
-- Chỉ mục cho bảng `slides`
--
ALTER TABLE `slides`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `customer`
--
ALTER TABLE `customer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;

--
-- AUTO_INCREMENT cho bảng `slides`
--
ALTER TABLE `slides`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `fk_customer_order` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `order_details`
--
ALTER TABLE `order_details`
  ADD CONSTRAINT `fk_order_details_orders` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_order_details_products` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Các ràng buộc cho bảng `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `fk_products_categories` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
