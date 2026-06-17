-- ============================================
-- AVUKAT / HUKUK BÜROSU TEMASI — Kurulum SQL
-- Tema Master (Kurumsal/Hizmet) tabanından türetildi.
-- Kullanım: phpMyAdmin > Import  (veya: mysql -u root < kurulum.sql)
-- ============================================
SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

CREATE DATABASE IF NOT EXISTS `avukat_db` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE `avukat_db`;

-- ============ AYARLAR ============
DROP TABLE IF EXISTS `ayarlar`;
CREATE TABLE `ayarlar` (
  `anahtar` VARCHAR(80) NOT NULL PRIMARY KEY,
  `deger` TEXT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `ayarlar` (`anahtar`,`deger`) VALUES
('site_adi','Adalet Hukuk Bürosu'),
('site_baslik','Adalet Hukuk Bürosu — Hakkınızı Güvenle Savunuyoruz'),
('site_aciklama','Ceza, aile, ticaret ve iş hukuku başta olmak üzere geniş bir yelpazede; deneyimli avukat kadromuzla hukuki haklarınızı titizlikle savunuyoruz.'),
('telefon','+90 212 000 00 00'),
('telefon2','+90 532 000 00 00'),
('mail','info@adalethukuk.com'),
('adres','Merkez Mah. Adalet Cad. No:1, Kat:5, Şişli / İstanbul'),
('calisma_saati','Pzt - Cmt: 09:00 - 18:00'),
('hakkimizda_kisa','Adalet Hukuk Bürosu olarak, müvekkillerimize hukukun her alanında güvenilir, çözüm odaklı ve etik temsil hizmeti sunuyoruz. Önceliğimiz hakkınızın eksiksiz korunmasıdır.'),
('hakkimizda_uzun','Adalet Hukuk Bürosu, alanında uzmanlaşmış avukatlardan oluşan kadrosuyla bireysel ve kurumsal müvekkillerine hukuki danışmanlık ve dava takip hizmeti vermektedir. Ceza hukuku, aile ve boşanma hukuku, ticaret ve şirketler hukuku, iş hukuku, gayrimenkul ve icra-iflas hukuku başta olmak üzere geniş bir yelpazede faaliyet gösteriyoruz. Her dosyaya özel strateji geliştiriyor, sürecin her aşamasında müvekkilimizi şeffaf biçimde bilgilendiriyoruz. Gizlilik, dürüstlük ve özen ilkelerimizden ödün vermeden, haklarınızı en üst düzeyde savunmak için çalışıyoruz.'),
('misyon','Müvekkillerimizin haklarını hukukun üstünlüğü çerçevesinde, en yüksek özen ve gizlilikle savunmak; her dosyada adil ve hızlı çözüme ulaşmak.'),
('vizyon','Güvenilirliği ve uzmanlığıyla ilk akla gelen, müvekkil memnuniyetini esas alan öncü bir hukuk bürosu olmak.'),
('yil','20'),
('proje_sayi','1500'),
('musteri_sayi','900'),
('personel_sayi','12'),
('facebook','#'),('instagram','#'),('twitter','#'),('linkedin','#'),('youtube','#');

-- ============ HİZMETLER (Çalışma Alanları) ============
DROP TABLE IF EXISTS `hizmetler`;
CREATE TABLE `hizmetler` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `baslik` VARCHAR(150) NOT NULL,
  `slug` VARCHAR(180),
  `ozet` TEXT,
  `icerik` LONGTEXT,
  `ikon` VARCHAR(60) DEFAULT 'bi-building',
  `gorsel` VARCHAR(255),
  `sira` INT DEFAULT 0,
  `durum` TINYINT DEFAULT 1,
  `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `hizmetler` (`baslik`,`slug`,`ozet`,`icerik`,`ikon`,`gorsel`,`sira`) VALUES
('Ceza Hukuku','ceza-hukuku','Soruşturma ve kovuşturma aşamasında etkin savunma, müdafilik ve müşteki vekilliği hizmetleri.','Ceza yargılamasının her aşamasında — gözaltı, soruşturma, ağır ceza ve istinaf — müvekkillerimize etkin savunma sağlıyoruz. Dosyayı titizlikle inceleyerek lehe delilleri ortaya koyuyor, hak kayıplarını önlüyoruz.','bi-shield-shaded','https://images.unsplash.com/photo-1589829545856-d10d557cf95f?w=800&q=80',1),
('Aile ve Boşanma Hukuku','aile-bosanma-hukuku','Anlaşmalı/çekişmeli boşanma, nafaka, velayet ve mal paylaşımı davalarında uzman temsil.','Boşanma, nafaka, velayet, mal rejiminin tasfiyesi ve aile içi uyuşmazlıklarda müvekkillerimizin menfaatlerini hassasiyetle koruyoruz. Süreci en az yıpranmayla yürütmeyi hedefliyoruz.','bi-house-heart','https://images.unsplash.com/photo-1450101499163-c8848c66ca85?w=800&q=80',2),
('Ticaret ve Şirketler Hukuku','ticaret-sirketler-hukuku','Şirket kuruluşu, sözleşmeler, ticari alacak ve uyuşmazlıkların çözümünde danışmanlık.','Şirket kuruluş ve birleşmeleri, ticari sözleşmelerin hazırlanması, alacak takibi ve ticari davalarda kurumsal müvekkillerimize uçtan uca hukuki destek sunuyoruz.','bi-briefcase','https://images.unsplash.com/photo-1450101499163-c8848c66ca85?w=800&q=80',3),
('İş ve Sosyal Güvenlik Hukuku','is-sosyal-guvenlik-hukuku','İşçi-işveren uyuşmazlıkları, kıdem-ihbar tazminatı ve işe iade davaları.','İşe iade, kıdem ve ihbar tazminatı, fazla mesai ve iş kazası tazminatı davalarında hem işçi hem işveren tarafına profesyonel temsil sağlıyoruz.','bi-people','https://images.unsplash.com/photo-1521791136064-7986c2920216?w=800&q=80',4),
('Gayrimenkul ve Kira Hukuku','gayrimenkul-kira-hukuku','Tapu iptal-tescil, kira tespiti, tahliye ve kat mülkiyeti uyuşmazlıkları.','Tapu iptali ve tescili, kira tespiti ve tahliye, kamulaştırma ve kat mülkiyeti davalarında haklarınızı güvence altına alıyoruz.','bi-building','https://images.unsplash.com/photo-1486406146926-c627a92ad1ab?w=800&q=80',5),
('İcra ve İflas Hukuku','icra-iflas-hukuku','Alacak takibi, haciz işlemleri, itirazın iptali ve iflas davalarında çözüm.','İcra takiplerinin başlatılması ve takibi, haciz ve satış işlemleri, itirazın iptali ve iflas süreçlerinde alacaklı ve borçlu vekilliği yapıyoruz.','bi-bank','https://images.unsplash.com/photo-1454165804606-c3d57bc86b40?w=800&q=80',6);

-- ============ PROJELER (Başarılarımız) ============
DROP TABLE IF EXISTS `projeler`;
CREATE TABLE `projeler` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `baslik` VARCHAR(150) NOT NULL,
  `slug` VARCHAR(180),
  `kategori` VARCHAR(60),
  `gorsel` VARCHAR(255),
  `aciklama` TEXT,
  `tarih` VARCHAR(40),
  `sira` INT DEFAULT 0,
  `durum` TINYINT DEFAULT 1,
  `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `projeler` (`baslik`,`slug`,`kategori`,`gorsel`,`aciklama`,`tarih`,`sira`) VALUES
('İşe İade Davasında Tam Kazanım','ise-iade-davasi','İş Hukuku','https://images.unsplash.com/photo-1521791136064-7986c2920216?w=800&q=80','Haksız feshe uğrayan müvekkilimizin işe iadesi ve tüm tazminat haklarının tahsili sağlandı.','2025',1),
('Çekişmeli Boşanmada Velayet','velayet-davasi','Aile Hukuku','https://images.unsplash.com/photo-1450101499163-c8848c66ca85?w=800&q=80','Müvekkilimiz lehine velayet ve uygun nafaka kararı elde edildi.','2025',2),
('Ticari Alacağın Tahsili','ticari-alacak','Ticaret Hukuku','https://images.unsplash.com/photo-1454165804606-c3d57bc86b40?w=800&q=80','Kurumsal müvekkilimizin yüksek tutarlı ticari alacağı icra yoluyla başarıyla tahsil edildi.','2024',3),
('Tapu İptal ve Tescil','tapu-iptal-tescil','Gayrimenkul','https://images.unsplash.com/photo-1486406146926-c627a92ad1ab?w=800&q=80','Hukuka aykırı devir işlemi iptal edilerek tapu müvekkilimiz adına tescil edildi.','2024',4),
('Ceza Davasında Beraat','ceza-beraat','Ceza Hukuku','https://images.unsplash.com/photo-1589829545856-d10d557cf95f?w=800&q=80','Etkin savunma ve lehe delillerin ortaya konmasıyla müvekkilimiz hakkında beraat kararı verildi.','2024',5),
('İtirazın İptali Davası','itirazin-iptali','İcra Hukuku','https://images.unsplash.com/photo-1521587760476-6c12a4b040da?w=800&q=80','Borçlunun haksız itirazı iptal edilerek alacağın icra takibi yoluyla tahsili sağlandı.','2023',6);

-- ============ BLOG (Makaleler) ============
DROP TABLE IF EXISTS `blog`;
CREATE TABLE `blog` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `baslik` VARCHAR(200) NOT NULL,
  `slug` VARCHAR(200),
  `kategori` VARCHAR(60),
  `ozet` TEXT,
  `icerik` LONGTEXT,
  `gorsel` VARCHAR(255),
  `tarih` DATE,
  `durum` TINYINT DEFAULT 1,
  `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `blog` (`baslik`,`slug`,`kategori`,`ozet`,`icerik`,`gorsel`,`tarih`) VALUES
('Boşanma Davası Açarken Bilinmesi Gerekenler','bosanma-davasi-rehberi','Aile Hukuku','Anlaşmalı ve çekişmeli boşanma arasındaki farklar, gerekli belgeler ve sürecin işleyişi hakkında temel bilgiler.','Boşanma süreci, anlaşmalı ve çekişmeli olmak üzere iki şekilde yürür. Bu yazımızda dava açmadan önce hazırlanması gereken belgeleri, nafaka ve velayet konularını ve sürecin ne kadar sürdüğünü açıklıyoruz. Her dosya kendine özgüdür; bir avukattan destek almanız hak kaybını önler.','https://images.unsplash.com/photo-1450101499163-c8848c66ca85?w=800&q=80','2026-05-10'),
('İşe İade Davasında Süreler ve Şartlar','ise-iade-sureleri','İş Hukuku','İş sözleşmesi feshedilen işçinin işe iade için bilmesi gereken yasal süreler ve şartlar.','İş sözleşmesi geçerli bir neden olmadan feshedilen işçi, fesih bildiriminin tebliğinden itibaren bir ay içinde işe iade davası açabilir. Bu yazımızda işe iade davasının şartlarını, arabuluculuk zorunluluğunu ve kazanılması halinde doğan hakları ele alıyoruz.','https://images.unsplash.com/photo-1521791136064-7986c2920216?w=800&q=80','2026-04-18'),
('Ticari Sözleşmelerde Dikkat Edilmesi Gerekenler','ticari-sozlesme-rehberi','Ticaret Hukuku','Şirketlerin ticari sözleşme imzalarken karşılaştığı yaygın riskler ve korunma yolları.','Ticari ilişkilerde sözleşmenin doğru kurgulanması, ileride doğabilecek uyuşmazlıkların önüne geçer. Cezai şart, yetki ve tahkim klozları ile ödeme koşullarının net biçimde düzenlenmesi büyük önem taşır. Bu yazıda en sık yapılan hataları ve çözüm önerilerini paylaşıyoruz.','https://images.unsplash.com/photo-1454165804606-c3d57bc86b40?w=800&q=80','2026-03-25');

-- ============ REFERANSLAR ============
DROP TABLE IF EXISTS `referanslar`;
CREATE TABLE `referanslar` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `ad` VARCHAR(100) NOT NULL,
  `unvan` VARCHAR(120),
  `yorum` TEXT,
  `foto` VARCHAR(255),
  `yildiz` TINYINT DEFAULT 5,
  `durum` TINYINT DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `referanslar` (`ad`,`unvan`,`yorum`,`foto`,`yildiz`) VALUES
('M. Yılmaz','Bireysel Müvekkil','Boşanma sürecimde hem hukuki hem manevi olarak yanımda oldular. Süreci sakin ve profesyonelce yönettiler, sonuçtan çok memnunum.','https://i.pravatar.cc/100?img=12',5),
('A. Demir','Şirket Sahibi','Ticari alacağımızın tahsilinde hızlı ve sonuç odaklı çalıştılar. Kurumsal işlerimiz için artık tek muhatabımız bu büro.','https://i.pravatar.cc/100?img=33',5),
('S. Kaya','Bireysel Müvekkil','İş davamda her aşamada bilgilendirildim, ne yapılacağını net anlattılar. Güvenilir ve ilgili bir ekip.','https://i.pravatar.cc/100?img=15',5);

-- ============ MESAJLAR ============
DROP TABLE IF EXISTS `mesajlar`;
CREATE TABLE `mesajlar` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `ad` VARCHAR(100),
  `mail` VARCHAR(150),
  `tel` VARCHAR(40),
  `konu` VARCHAR(200),
  `mesaj` TEXT,
  `okundu` TINYINT DEFAULT 0,
  `tarih` TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ============ TEKLİFLER (Randevu / Danışma Talepleri) ============
DROP TABLE IF EXISTS `teklifler`;
CREATE TABLE `teklifler` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `ad` VARCHAR(100),
  `mail` VARCHAR(150),
  `tel` VARCHAR(40),
  `hizmet` VARCHAR(120),
  `il` VARCHAR(60),
  `adres` VARCHAR(255),
  `alan` VARCHAR(60),
  `butce` VARCHAR(60),
  `baslangic` VARCHAR(60),
  `detay` TEXT,
  `durum` ENUM('yeni','degerlendiriliyor','teklif_verildi','kazanildi','kaybedildi') DEFAULT 'yeni',
  `notlar` TEXT,
  `tarih` TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ============ ADMIN ============
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `kullanici` VARCHAR(60) NOT NULL UNIQUE,
  `sifre_hash` VARCHAR(255) NOT NULL,
  `ad_soyad` VARCHAR(120),
  `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Şifre: admin123  (password_hash bcrypt) — CANLIDA MUTLAKA DEĞİŞTİR
INSERT INTO `admin` (`kullanici`,`sifre_hash`,`ad_soyad`) VALUES
('admin','$2y$10$6gNrpOXRLof.Toy.Ugy.yu4DrKP23OcnJa7UBhKOH1iMxbtH8GK0.','Yönetici');

SET FOREIGN_KEY_CHECKS = 1;
