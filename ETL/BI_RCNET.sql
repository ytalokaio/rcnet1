-- MySQL dump 10.13  Distrib 5.6.24, for osx10.8 (x86_64)
--
-- Host: 127.0.0.1    Database: datawarehouse
-- ------------------------------------------------------
-- Server version	5.6.25

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Temporary view structure for view `abc`
--

DROP TABLE IF EXISTS `abc`;
/*!50001 DROP VIEW IF EXISTS `abc`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `abc` AS SELECT 
 1 AS `id_produto`,
 1 AS `produto_desc`,
 1 AS `total_venda`,
 1 AS `percentual`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `d_data`
--

DROP TABLE IF EXISTS `d_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `d_data` (
  `id_data` int(10) unsigned NOT NULL,
  `data` datetime DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  `date_start` datetime DEFAULT NULL,
  `date_range` datetime DEFAULT NULL,
  `mes` smallint(2) DEFAULT NULL,
  `ano` smallint(4) DEFAULT NULL,
  `diasemana` smallint(1) DEFAULT NULL,
  `hora` smallint(2) DEFAULT NULL,
  `trimestre` smallint(1) DEFAULT NULL,
  `minuto` smallint(2) DEFAULT NULL,
  `dia` smallint(2) DEFAULT NULL,
  PRIMARY KEY (`id_data`),
  KEY `idx_d_data_lookup` (`data`),
  KEY `idx_d_data_lookup2` (`data`,`dia`,`mes`,`ano`,`diasemana`,`hora`,`trimestre`,`minuto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `d_icms`
--

DROP TABLE IF EXISTS `d_icms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `d_icms` (
  `id_icms` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `alq_icms` varchar(15) DEFAULT NULL,
  `icms_desc` varchar(45) DEFAULT NULL,
  `alq_percentual` decimal(4,2) DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  `date_start` datetime DEFAULT NULL,
  `date_range` datetime DEFAULT NULL,
  PRIMARY KEY (`id_icms`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `d_loja`
--

DROP TABLE IF EXISTS `d_loja`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `d_loja` (
  `id_loja` int(10) unsigned NOT NULL,
  `loja_desc` varchar(45) NOT NULL,
  PRIMARY KEY (`id_loja`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `d_produto`
--

DROP TABLE IF EXISTS `d_produto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `d_produto` (
  `id_produto` int(10) unsigned NOT NULL DEFAULT '0',
  `produto_desc` varchar(50) NOT NULL DEFAULT 'nao obtido',
  `produto_descvenda` varchar(45) NOT NULL DEFAULT 'nao obtido',
  `SKU` varchar(14) NOT NULL DEFAULT '0',
  `id_tipo_produto` int(10) unsigned NOT NULL DEFAULT '0',
  `produto_desativado` tinyint(1) DEFAULT NULL,
  `version` int(10) NOT NULL DEFAULT '0',
  `date_start` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_range` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_produto`),
  KEY `fk_d_tipo_produto` (`id_tipo_produto`) USING BTREE,
  KEY `index4` (`SKU`,`id_produto`),
  CONSTRAINT `fk_d_tipo_produto` FOREIGN KEY (`id_tipo_produto`) REFERENCES `d_tipo_produto` (`id_tipo_produto`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `d_tipo_produto`
--

DROP TABLE IF EXISTS `d_tipo_produto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `d_tipo_produto` (
  `id_tipo_produto` int(10) unsigned NOT NULL DEFAULT '0',
  `secao_id` tinyint(2) NOT NULL DEFAULT '-2',
  `secao_desc` varchar(45) NOT NULL DEFAULT 'teste',
  `categoria_id` smallint(3) NOT NULL DEFAULT '-2',
  `categoria_desc` varchar(45) NOT NULL DEFAULT 'teste',
  `sub_categoria_id` smallint(3) NOT NULL DEFAULT '-2',
  `sub_categoria_desc` varchar(45) NOT NULL DEFAULT 'teste',
  `version` int(10) NOT NULL DEFAULT '0',
  `date_start` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_range` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_tipo_produto`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `d_tipo_transacao`
--

DROP TABLE IF EXISTS `d_tipo_transacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `d_tipo_transacao` (
  `id_tipo_pagamento` int(11) NOT NULL,
  `cod1` smallint(2) NOT NULL,
  `cod2` smallint(2) NOT NULL,
  `tipo_pagamento_desc` varchar(45) NOT NULL,
  PRIMARY KEY (`id_tipo_pagamento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `f_transacao`
--

DROP TABLE IF EXISTS `f_transacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `f_transacao` (
  `CCF` int(11) NOT NULL,
  `COO` int(11) NOT NULL,
  `id_data` int(10) unsigned NOT NULL,
  `id_tipo_transacao` int(11) NOT NULL,
  `id_loja` int(10) unsigned NOT NULL,
  `transacao_valor` decimal(5,2) NOT NULL,
  `transacao_contador` smallint(1) NOT NULL,
  PRIMARY KEY (`CCF`,`COO`,`id_data`,`id_tipo_transacao`),
  KEY `fk_f_pagamentos_d_tipo_pagamento1_idx` (`id_tipo_transacao`),
  KEY `fk_f_pagamentos_d_data1` (`id_data`),
  KEY `fk_f_pagamentos_d_loja` (`id_loja`),
  CONSTRAINT `fk_f_pagamentos_d_data1` FOREIGN KEY (`id_data`) REFERENCES `d_data` (`id_data`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_f_pagamentos_d_loja` FOREIGN KEY (`id_loja`) REFERENCES `d_loja` (`id_loja`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_f_pagamentos_d_tipo_pagamento1` FOREIGN KEY (`id_tipo_transacao`) REFERENCES `d_tipo_transacao` (`id_tipo_pagamento`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `f_vendas`
--

DROP TABLE IF EXISTS `f_vendas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `f_vendas` (
  `COO` int(10) unsigned NOT NULL,
  `CCF` int(10) unsigned NOT NULL,
  `id_loja` int(10) unsigned NOT NULL,
  `id_produto` int(10) unsigned NOT NULL,
  `id_data` int(10) unsigned NOT NULL,
  `id_icms` int(10) unsigned NOT NULL,
  `qtd_produto` decimal(7,3) unsigned NOT NULL,
  `custo_produto` decimal(5,2) unsigned NOT NULL,
  `valor_produto` decimal(5,2) unsigned NOT NULL,
  `total_venda` decimal(7,2) unsigned NOT NULL,
  `total_custo` decimal(11,6) DEFAULT NULL,
  PRIMARY KEY (`COO`,`CCF`,`id_loja`,`id_produto`,`id_data`),
  KEY `fk_f_vendas_d_loja_idx` (`id_loja`),
  KEY `fk_f_vendas_d_produto1_idx` (`id_produto`),
  KEY `fk_f_vendas_d_data1_idx` (`id_data`),
  KEY `fk_f_vendas_d_icms` (`id_icms`),
  CONSTRAINT `fk_f_vendas_d_data1` FOREIGN KEY (`id_data`) REFERENCES `d_data` (`id_data`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_f_vendas_d_icms` FOREIGN KEY (`id_icms`) REFERENCES `d_icms` (`id_icms`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_f_vendas_d_loja` FOREIGN KEY (`id_loja`) REFERENCES `d_loja` (`id_loja`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_f_vendas_d_produto1` FOREIGN KEY (`id_produto`) REFERENCES `d_produto` (`id_produto`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary view structure for view `hora`
--

DROP TABLE IF EXISTS `hora`;
/*!50001 DROP VIEW IF EXISTS `hora`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `hora` AS SELECT 
 1 AS `datahora')`,
 1 AS `data`,
 1 AS `hora`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `minuto`
--

DROP TABLE IF EXISTS `minuto`;
/*!50001 DROP VIEW IF EXISTS `minuto`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `minuto` AS SELECT 
 1 AS `minute(utc_time())`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `venda_produto_ano`
--

DROP TABLE IF EXISTS `venda_produto_ano`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `venda_produto_ano` (
  `venda_produto_ano_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_loja` int(11) NOT NULL DEFAULT '-2',
  `id_produto` int(11) NOT NULL DEFAULT '-2',
  `ano` smallint(4) NOT NULL DEFAULT '-1',
  `valor_produto_minimo` decimal(9,2) NOT NULL DEFAULT '0.00',
  `valor_produto_medio` decimal(9,2) NOT NULL DEFAULT '0.00',
  `valor_produto_maximo` decimal(9,2) NOT NULL DEFAULT '0.00',
  `custo_produto_minimo` decimal(13,6) NOT NULL DEFAULT '0.000000',
  `custo_produto_medio` decimal(13,6) NOT NULL DEFAULT '0.000000',
  `custo_produto_maximo` decimal(13,6) NOT NULL DEFAULT '0.000000',
  `produto_desc` varchar(50) NOT NULL DEFAULT 'teste',
  `produto_descvenda` varchar(45) NOT NULL DEFAULT 'teste',
  `id_tipo_produto` int(11) NOT NULL DEFAULT '-2',
  `id_icms` int(10) unsigned NOT NULL,
  `produto_desativado` tinyint(1) NOT NULL DEFAULT '0',
  `qtd_produto` decimal(10,3) NOT NULL DEFAULT '0.000',
  `total_venda` decimal(10,2) NOT NULL DEFAULT '0.00',
  `total_custo` decimal(13,6) NOT NULL DEFAULT '0.000000',
  `lucro_total` decimal(13,6) NOT NULL DEFAULT '0.000000',
  `icms_venda` decimal(13,6) unsigned NOT NULL,
  PRIMARY KEY (`venda_produto_ano_id`),
  KEY `idx_venda_produto_ano_lookup` (`id_loja`,`id_produto`,`ano`)
) ENGINE=InnoDB AUTO_INCREMENT=9974 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `venda_produto_dia`
--

DROP TABLE IF EXISTS `venda_produto_dia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `venda_produto_dia` (
  `venda_produto_dia_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_loja` int(11) NOT NULL DEFAULT '-2',
  `id_produto` int(11) NOT NULL DEFAULT '-2',
  `ano` smallint(4) NOT NULL DEFAULT '-1',
  `trimestre` tinyint(2) NOT NULL DEFAULT '-1',
  `mes` tinyint(2) NOT NULL DEFAULT '-1',
  `data` date NOT NULL DEFAULT '1900-01-01',
  `diasemana` tinyint(2) NOT NULL,
  `dia` tinyint(2) NOT NULL DEFAULT '-1',
  `valor_produto_minimo` decimal(9,2) NOT NULL DEFAULT '0.00',
  `valor_produto_medio` decimal(9,2) NOT NULL DEFAULT '0.00',
  `valor_produto_maximo` decimal(9,2) NOT NULL DEFAULT '0.00',
  `custo_produto_minimo` decimal(13,6) NOT NULL DEFAULT '0.000000',
  `custo_produto_medio` decimal(13,6) NOT NULL DEFAULT '0.000000',
  `custo_produto_maximo` decimal(13,6) NOT NULL DEFAULT '0.000000',
  `produto_desc` varchar(50) NOT NULL DEFAULT 'teste',
  `produto_descvenda` varchar(45) NOT NULL DEFAULT 'teste',
  `id_tipo_produto` int(11) NOT NULL DEFAULT '-2',
  `id_icms` int(10) unsigned NOT NULL,
  `produto_desativado` tinyint(1) NOT NULL DEFAULT '0',
  `qtd_produto` decimal(10,3) NOT NULL DEFAULT '0.000',
  `total_venda` decimal(10,2) NOT NULL DEFAULT '0.00',
  `total_custo` decimal(13,6) NOT NULL DEFAULT '0.000000',
  `lucro_total` decimal(13,6) NOT NULL DEFAULT '0.000000',
  `icms_venda` decimal(13,6) NOT NULL DEFAULT '-2.000000',
  PRIMARY KEY (`venda_produto_dia_id`),
  KEY `idx_venda_produto_dia_lookup` (`id_loja`,`id_produto`,`ano`,`trimestre`,`mes`,`diasemana`,`dia`),
  KEY `idx_data` (`data`)
) ENGINE=InnoDB AUTO_INCREMENT=182762 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `venda_produto_diasemana`
--

DROP TABLE IF EXISTS `venda_produto_diasemana`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `venda_produto_diasemana` (
  `venda_produto_diasemana_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_loja` int(11) NOT NULL DEFAULT '-2',
  `id_produto` int(11) NOT NULL DEFAULT '-2',
  `ano` smallint(4) NOT NULL DEFAULT '-1',
  `trimestre` tinyint(2) NOT NULL DEFAULT '-1',
  `mes` tinyint(2) NOT NULL DEFAULT '-1',
  `diasemana` tinyint(2) NOT NULL,
  `valor_produto_minimo` decimal(9,2) NOT NULL DEFAULT '0.00',
  `valor_produto_medio` decimal(9,2) NOT NULL DEFAULT '0.00',
  `valor_produto_maximo` decimal(9,2) NOT NULL DEFAULT '0.00',
  `custo_produto_minimo` decimal(13,6) NOT NULL DEFAULT '0.000000',
  `custo_produto_medio` decimal(13,6) NOT NULL DEFAULT '0.000000',
  `custo_produto_maximo` decimal(13,6) NOT NULL DEFAULT '0.000000',
  `produto_desc` varchar(50) NOT NULL DEFAULT 'teste',
  `produto_descvenda` varchar(45) NOT NULL DEFAULT 'teste',
  `id_tipo_produto` int(11) NOT NULL DEFAULT '-2',
  `id_icms` int(10) NOT NULL DEFAULT '-2',
  `produto_desativado` tinyint(1) NOT NULL DEFAULT '0',
  `qtd_produto` decimal(10,3) NOT NULL DEFAULT '0.000',
  `total_venda` decimal(10,2) NOT NULL DEFAULT '0.00',
  `total_custo` decimal(13,6) NOT NULL DEFAULT '0.000000',
  `lucro_total` decimal(13,6) NOT NULL DEFAULT '0.000000',
  `icms_venda` decimal(13,6) NOT NULL DEFAULT '-2.000000',
  PRIMARY KEY (`venda_produto_diasemana_id`),
  KEY `idx_venda_produto_dia_lookup` (`id_loja`,`id_produto`,`ano`,`trimestre`,`mes`,`diasemana`)
) ENGINE=InnoDB AUTO_INCREMENT=162708 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `venda_produto_hora`
--

DROP TABLE IF EXISTS `venda_produto_hora`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `venda_produto_hora` (
  `venda_produto_hora_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_loja` int(11) NOT NULL DEFAULT '-2',
  `id_produto` int(11) NOT NULL DEFAULT '-2',
  `ano` smallint(4) NOT NULL DEFAULT '-1',
  `trimestre` tinyint(2) NOT NULL DEFAULT '-1',
  `mes` tinyint(2) NOT NULL DEFAULT '-1',
  `data` date DEFAULT NULL,
  `dia` tinyint(2) NOT NULL DEFAULT '-1',
  `hora` tinyint(2) NOT NULL DEFAULT '-1',
  `valor_produto_minimo` decimal(9,2) NOT NULL DEFAULT '0.00',
  `valor_produto_medio` decimal(9,2) NOT NULL DEFAULT '0.00',
  `valor_produto_maximo` decimal(9,2) NOT NULL DEFAULT '0.00',
  `custo_produto_minimo` decimal(13,6) NOT NULL DEFAULT '0.000000',
  `custo_produto_medio` decimal(13,6) NOT NULL DEFAULT '0.000000',
  `custo_produto_maximo` decimal(13,6) NOT NULL DEFAULT '0.000000',
  `produto_desc` varchar(50) NOT NULL DEFAULT 'teste',
  `produto_descvenda` varchar(45) NOT NULL DEFAULT 'teste',
  `id_tipo_produto` int(11) NOT NULL DEFAULT '-2',
  `id_icms` int(11) DEFAULT NULL,
  `produto_desativado` tinyint(1) NOT NULL DEFAULT '0',
  `qtd_produto` decimal(10,3) NOT NULL DEFAULT '0.000',
  `total_venda` decimal(10,2) NOT NULL DEFAULT '0.00',
  `total_custo` decimal(13,6) NOT NULL DEFAULT '0.000000',
  `lucro_total` decimal(13,6) NOT NULL DEFAULT '0.000000',
  `diasemana` tinyint(2) NOT NULL,
  `icms_venda` decimal(13,6) DEFAULT '-2.000000',
  PRIMARY KEY (`venda_produto_hora_id`),
  KEY `idx_venda_produto_hora_lookup` (`id_loja`,`id_produto`,`ano`,`trimestre`,`mes`,`dia`,`hora`,`diasemana`),
  KEY `idx_data` (`data`)
) ENGINE=InnoDB AUTO_INCREMENT=536244 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `venda_produto_mes`
--

DROP TABLE IF EXISTS `venda_produto_mes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `venda_produto_mes` (
  `venda_produto_mes_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_loja` int(11) NOT NULL DEFAULT '-2',
  `id_produto` int(11) NOT NULL DEFAULT '-2',
  `ano` smallint(4) NOT NULL DEFAULT '-1',
  `trimestre` tinyint(2) NOT NULL DEFAULT '-1',
  `mes` tinyint(2) NOT NULL DEFAULT '-1',
  `valor_produto_minimo` decimal(9,2) NOT NULL DEFAULT '0.00',
  `valor_produto_medio` decimal(9,2) NOT NULL DEFAULT '0.00',
  `valor_produto_maximo` decimal(9,2) NOT NULL DEFAULT '0.00',
  `custo_produto_minimo` decimal(13,6) NOT NULL DEFAULT '0.000000',
  `custo_produto_medio` decimal(13,6) NOT NULL DEFAULT '0.000000',
  `custo_produto_maximo` decimal(13,6) NOT NULL DEFAULT '0.000000',
  `produto_desc` varchar(50) NOT NULL DEFAULT 'teste',
  `produto_descvenda` varchar(45) NOT NULL DEFAULT 'teste',
  `id_tipo_produto` int(11) NOT NULL DEFAULT '-2',
  `id_icms` int(10) unsigned NOT NULL,
  `produto_desativado` tinyint(1) NOT NULL DEFAULT '0',
  `qtd_produto` decimal(10,3) NOT NULL DEFAULT '0.000',
  `total_venda` decimal(10,2) NOT NULL DEFAULT '0.00',
  `total_custo` decimal(13,6) NOT NULL DEFAULT '0.000000',
  `lucro_total` decimal(13,6) NOT NULL DEFAULT '0.000000',
  `icms_venda` decimal(13,6) unsigned NOT NULL,
  PRIMARY KEY (`venda_produto_mes_id`),
  KEY `idx_venda_produto_dia_lookup` (`id_loja`,`id_produto`,`ano`,`trimestre`,`mes`)
) ENGINE=InnoDB AUTO_INCREMENT=38733 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `venda_produto_trimestre`
--

DROP TABLE IF EXISTS `venda_produto_trimestre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `venda_produto_trimestre` (
  `venda_produto_trimestre_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_loja` int(11) NOT NULL DEFAULT '-2',
  `id_produto` int(11) NOT NULL DEFAULT '-2',
  `ano` smallint(4) NOT NULL DEFAULT '-1',
  `trimestre` tinyint(2) NOT NULL DEFAULT '-1',
  `valor_produto_minimo` decimal(9,2) NOT NULL DEFAULT '0.00',
  `valor_produto_medio` decimal(9,2) NOT NULL DEFAULT '0.00',
  `valor_produto_maximo` decimal(9,2) NOT NULL DEFAULT '0.00',
  `custo_produto_minimo` decimal(13,6) NOT NULL DEFAULT '0.000000',
  `custo_produto_medio` decimal(13,6) NOT NULL DEFAULT '0.000000',
  `custo_produto_maximo` decimal(13,6) NOT NULL DEFAULT '0.000000',
  `produto_desc` varchar(50) NOT NULL DEFAULT 'teste',
  `produto_descvenda` varchar(45) NOT NULL DEFAULT 'teste',
  `id_tipo_produto` int(11) NOT NULL DEFAULT '-2',
  `id_icms` int(10) unsigned NOT NULL,
  `produto_desativado` tinyint(1) NOT NULL DEFAULT '0',
  `qtd_produto` decimal(10,3) NOT NULL DEFAULT '0.000',
  `total_venda` decimal(10,2) NOT NULL DEFAULT '0.00',
  `total_custo` decimal(13,6) NOT NULL DEFAULT '0.000000',
  `lucro_total` decimal(13,6) NOT NULL DEFAULT '0.000000',
  `icms_venda` decimal(13,6) unsigned NOT NULL,
  PRIMARY KEY (`venda_produto_trimestre_id`),
  KEY `idx_venda_produto_trimestre_lookup` (`id_loja`,`id_produto`,`ano`,`trimestre`)
) ENGINE=InnoDB AUTO_INCREMENT=19491 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary view structure for view `vendas_categoria`
--

DROP TABLE IF EXISTS `vendas_categoria`;
/*!50001 DROP VIEW IF EXISTS `vendas_categoria`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vendas_categoria` AS SELECT 
 1 AS `secao_desc`,
 1 AS `categoria_desc`,
 1 AS `qtd_produto`,
 1 AS `total_custo`,
 1 AS `total_venda`,
 1 AS `lucro`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vendas_secao`
--

DROP TABLE IF EXISTS `vendas_secao`;
/*!50001 DROP VIEW IF EXISTS `vendas_secao`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vendas_secao` AS SELECT 
 1 AS `secao_desc`,
 1 AS `qtd_produto`,
 1 AS `total_custo`,
 1 AS `total_venda`,
 1 AS `lucro`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vendas_subcategoria`
--

DROP TABLE IF EXISTS `vendas_subcategoria`;
/*!50001 DROP VIEW IF EXISTS `vendas_subcategoria`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vendas_subcategoria` AS SELECT 
 1 AS `secao_desc`,
 1 AS `categoria_desc`,
 1 AS `sub_categoria_desc`,
 1 AS `qtd_produto`,
 1 AS `total_custo`,
 1 AS `total_venda`,
 1 AS `lucro`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping routines for database 'datawarehouse'
--
/*!50003 DROP FUNCTION IF EXISTS `SKUtoid_produto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `SKUtoid_produto`(s VARCHAR(14)) RETURNS int(10)
BEGIN
DECLARE id INT UNSIGNED;
SET id = (SELECT id_produto FROM datawarehouse.d_produto WHERE SKU= s);
RETURN id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `abc`
--

/*!50001 DROP VIEW IF EXISTS `abc`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `abc` AS select `venda_produto_dia`.`id_produto` AS `id_produto`,`venda_produto_dia`.`produto_desc` AS `produto_desc`,sum(`venda_produto_dia`.`total_venda`) AS `total_venda`,(sum(`venda_produto_dia`.`total_venda`) / (select sum(`venda_produto_dia`.`total_venda`) from `venda_produto_dia` where ((`venda_produto_dia`.`ano` = 2015) and (`venda_produto_dia`.`mes` = 1)) group by `venda_produto_dia`.`ano`)) AS `percentual` from `venda_produto_dia` where ((`venda_produto_dia`.`ano` = 2015) and (`venda_produto_dia`.`mes` = 1)) group by `venda_produto_dia`.`ano`,`venda_produto_dia`.`mes`,`venda_produto_dia`.`id_produto` order by `percentual` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `hora`
--

/*!50001 DROP VIEW IF EXISTS `hora`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `hora` AS select date_format(utc_timestamp(),'%d/%m/%Y %H:%i:%s') AS `datahora')`,utc_date() AS `data`,utc_time() AS `hora` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `minuto`
--

/*!50001 DROP VIEW IF EXISTS `minuto`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `minuto` AS select minute(utc_time()) AS `minute(utc_time())` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vendas_categoria`
--

/*!50001 DROP VIEW IF EXISTS `vendas_categoria`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vendas_categoria` AS select `d_tipo_produto`.`secao_desc` AS `secao_desc`,`d_tipo_produto`.`categoria_desc` AS `categoria_desc`,sum(`f_vendas`.`qtd_produto`) AS `qtd_produto`,sum(`f_vendas`.`total_custo`) AS `total_custo`,sum(`f_vendas`.`total_venda`) AS `total_venda`,(sum(`f_vendas`.`total_venda`) - sum(`f_vendas`.`total_custo`)) AS `lucro` from ((`f_vendas` join `d_produto` on((`f_vendas`.`id_produto` = `d_produto`.`id_produto`))) join `d_tipo_produto` on((`d_produto`.`id_tipo_produto` = `d_tipo_produto`.`id_tipo_produto`))) group by `d_tipo_produto`.`secao_id`,`d_tipo_produto`.`categoria_id` order by `lucro` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vendas_secao`
--

/*!50001 DROP VIEW IF EXISTS `vendas_secao`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vendas_secao` AS select `d_tipo_produto`.`secao_desc` AS `secao_desc`,sum(`f_vendas`.`qtd_produto`) AS `qtd_produto`,sum(`f_vendas`.`total_custo`) AS `total_custo`,sum(`f_vendas`.`total_venda`) AS `total_venda`,(sum(`f_vendas`.`total_venda`) - sum(`f_vendas`.`total_custo`)) AS `lucro` from ((`f_vendas` join `d_produto` on((`f_vendas`.`id_produto` = `d_produto`.`id_produto`))) join `d_tipo_produto` on((`d_produto`.`id_tipo_produto` = `d_tipo_produto`.`id_tipo_produto`))) group by `d_tipo_produto`.`secao_id` order by `lucro` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vendas_subcategoria`
--

/*!50001 DROP VIEW IF EXISTS `vendas_subcategoria`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vendas_subcategoria` AS select `d_tipo_produto`.`secao_desc` AS `secao_desc`,`d_tipo_produto`.`categoria_desc` AS `categoria_desc`,`d_tipo_produto`.`sub_categoria_desc` AS `sub_categoria_desc`,sum(`f_vendas`.`qtd_produto`) AS `qtd_produto`,sum(`f_vendas`.`total_custo`) AS `total_custo`,sum(`f_vendas`.`total_venda`) AS `total_venda`,(sum(`f_vendas`.`total_venda`) - sum(`f_vendas`.`total_custo`)) AS `lucro` from ((`f_vendas` join `d_produto` on((`f_vendas`.`id_produto` = `d_produto`.`id_produto`))) join `d_tipo_produto` on((`d_produto`.`id_tipo_produto` = `d_tipo_produto`.`id_tipo_produto`))) group by `d_tipo_produto`.`secao_id`,`d_tipo_produto`.`categoria_id`,`d_tipo_produto`.`sub_categoria_id` order by `lucro` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-09-24 10:29:49
-- MySQL dump 10.13  Distrib 5.6.24, for osx10.8 (x86_64)
--
-- Host: 127.0.0.1    Database: staging
-- ------------------------------------------------------
-- Server version	5.6.25

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `agrup_itens_inicial`
--

DROP TABLE IF EXISTS `agrup_itens_inicial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `agrup_itens_inicial` (
  `id_loja` int(11) DEFAULT NULL,
  `id_data` int(11) DEFAULT NULL,
  `id_produto` int(11) DEFAULT NULL,
  `qtd_produto` decimal(10,3) NOT NULL,
  `total_venda` decimal(10,3) NOT NULL,
  `total_custo` decimal(12,6) NOT NULL,
  `valor_produto_minimo` decimal(10,3) NOT NULL,
  `valor_produto_medio` decimal(10,3) NOT NULL,
  `valor_produto_maximo` decimal(10,3) NOT NULL,
  `custo_produto_minimo` decimal(12,6) NOT NULL,
  `custo_produto_medio` decimal(12,6) NOT NULL,
  `custo_produto_maximo` decimal(12,6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `f_vendas_erro`
--

DROP TABLE IF EXISTS `f_vendas_erro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `f_vendas_erro` (
  `COO` int(10) unsigned NOT NULL,
  `CCF` int(10) unsigned NOT NULL,
  `id_loja` int(10) unsigned NOT NULL,
  `id_itens` int(10) unsigned NOT NULL,
  `id_data` int(10) unsigned NOT NULL,
  `qtd_item` decimal(7,3) unsigned NOT NULL,
  `custo_item` decimal(5,2) unsigned NOT NULL,
  `valor_item` decimal(5,2) unsigned NOT NULL,
  `total_item` decimal(7,2) unsigned NOT NULL,
  `id_icms` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`COO`,`CCF`,`id_loja`,`id_itens`,`id_data`),
  KEY `fk_f_vendas_d_loja_idx` (`id_loja`),
  KEY `fk_f_vendas_d_itens1_idx` (`id_itens`),
  KEY `fk_f_vendas_d_data1_idx` (`id_data`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `log_extracao`
--

DROP TABLE IF EXISTS `log_extracao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `log_extracao` (
  `id_log_extracao` int(10) NOT NULL AUTO_INCREMENT,
  `tabela_extracao` varchar(45) NOT NULL,
  `nReg_log` double DEFAULT NULL,
  `data` datetime NOT NULL,
  PRIMARY KEY (`id_log_extracao`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `relatorio_transacoes`
--

DROP TABLE IF EXISTS `relatorio_transacoes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `relatorio_transacoes` (
  `venda_id` int(10) NOT NULL AUTO_INCREMENT,
  `id_loja` int(2) NOT NULL,
  `ano` smallint(4) NOT NULL,
  `mes` smallint(2) NOT NULL,
  `dia` smallint(2) NOT NULL,
  `hora` smallint(2) NOT NULL,
  `Qtd` int(5) NOT NULL,
  `vendas_totais` decimal(8,2) NOT NULL,
  `venda_maxima` decimal(9,2) NOT NULL,
  `venda_minima` decimal(9,2) NOT NULL,
  `ticket_medio` decimal(9,2) NOT NULL,
  `vale` decimal(9,2) NOT NULL,
  `dinheiro` decimal(9,2) NOT NULL,
  `credito_total` decimal(9,2) NOT NULL,
  `debito_total` decimal(9,2) NOT NULL,
  `alimentacao_total` decimal(9,2) NOT NULL,
  `visa_credito` decimal(9,2) NOT NULL,
  `mastercard_credito` decimal(9,2) NOT NULL,
  `hipercard_credito` decimal(9,2) NOT NULL,
  `alimentacao` decimal(9,2) NOT NULL,
  `visaelectron_debito` decimal(9,2) NOT NULL,
  `ticket_alimentacao` decimal(9,2) NOT NULL,
  `maestrocp_debito` decimal(9,2) NOT NULL,
  `elo_debito` decimal(9,2) NOT NULL,
  `elo_credito` decimal(9,2) NOT NULL,
  `americanexpress_credito` decimal(9,2) NOT NULL,
  `mastercard_debito` decimal(9,2) NOT NULL,
  `diners_credito` decimal(9,2) NOT NULL,
  `ticket2_alimentacao` decimal(9,2) NOT NULL,
  `cabal_debito` decimal(9,2) NOT NULL,
  `planvale_alimentacao` decimal(9,2) NOT NULL,
  `predatado_cheque` decimal(9,2) DEFAULT NULL,
  `avista_cheque` decimal(9,2) DEFAULT NULL,
  `goodcard_alimentacao` decimal(9,2) DEFAULT NULL,
  `recarga_dinheiro` decimal(9,2) DEFAULT NULL,
  `pos_cartao` decimal(9,2) DEFAULT NULL,
  `troca` decimal(9,2) DEFAULT NULL,
  `expansiva_credito` decimal(9,2) DEFAULT NULL,
  `softway_credito` decimal(9,2) DEFAULT NULL,
  `dinheiro_total` decimal(9,2) DEFAULT NULL,
  `cheque_total` decimal(9,2) DEFAULT NULL,
  `hiper_debito` decimal(9,2) DEFAULT NULL,
  PRIMARY KEY (`venda_id`)
) ENGINE=InnoDB AUTO_INCREMENT=899268 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `stg1_categorias_grupo`
--

DROP TABLE IF EXISTS `stg1_categorias_grupo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stg1_categorias_grupo` (
  `grupo_id` int(10) unsigned NOT NULL,
  `grupo_desc` varchar(45) NOT NULL,
  `grupo_coddesativado` int(10) unsigned NOT NULL DEFAULT '0',
  `grupo_L1` int(10) unsigned DEFAULT '0',
  `grupo_L2` int(10) unsigned DEFAULT '0',
  `grupo_L3` int(10) unsigned DEFAULT '0',
  `grupo_L4` int(10) unsigned DEFAULT '0',
  `grupo_L5` int(10) unsigned DEFAULT '0',
  `grupo_L6` int(10) unsigned DEFAULT '0',
  `grupo_L7` int(10) unsigned DEFAULT '0',
  `grupo_L8` int(10) unsigned DEFAULT '0',
  `grupo_L9` int(10) unsigned DEFAULT '0',
  `grupo_L10` int(10) unsigned DEFAULT '0',
  PRIMARY KEY (`grupo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `stg1_categorias_grupomarca`
--

DROP TABLE IF EXISTS `stg1_categorias_grupomarca`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stg1_categorias_grupomarca` (
  `grupomarca_id` int(10) unsigned NOT NULL,
  `gruposub_id` int(10) unsigned NOT NULL,
  `grupomarca_desc` varchar(45) NOT NULL,
  `grupomarca_coddesativado` int(10) unsigned NOT NULL DEFAULT '0',
  `grupomarca_L1` int(10) unsigned DEFAULT '0',
  `grupomarca_L2` int(10) unsigned DEFAULT '0',
  `grupomarca_L3` int(10) unsigned DEFAULT '0',
  `grupomarca_L4` int(10) unsigned DEFAULT '0',
  `grupomarca_L5` int(10) unsigned DEFAULT '0',
  `grupomarca_L6` int(10) unsigned DEFAULT '0',
  `grupomarca_L7` int(10) unsigned DEFAULT '0',
  `grupomarca_L8` int(10) unsigned DEFAULT '0',
  `grupomarca_L9` int(10) unsigned DEFAULT '0',
  `grupomarca_L10` int(10) unsigned DEFAULT '0',
  PRIMARY KEY (`grupomarca_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `stg1_categorias_gruposub`
--

DROP TABLE IF EXISTS `stg1_categorias_gruposub`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stg1_categorias_gruposub` (
  `gruposub_id` int(10) unsigned NOT NULL,
  `grupo_id` int(10) unsigned NOT NULL,
  `gruposub_desc` varchar(45) NOT NULL,
  `gruposub_coddesativado` int(10) unsigned NOT NULL DEFAULT '0',
  `gruposub_L1` int(10) unsigned DEFAULT '0',
  `gruposub_L2` int(10) unsigned DEFAULT '0',
  `gruposub_L3` int(10) unsigned DEFAULT '0',
  `gruposub_L4` int(10) unsigned DEFAULT '0',
  `gruposub_L5` int(10) unsigned DEFAULT '0',
  `gruposub_L6` int(10) unsigned DEFAULT '0',
  `gruposub_L7` int(10) unsigned DEFAULT '0',
  `gruposub_L8` int(10) unsigned DEFAULT '0',
  `gruposub_L9` int(10) unsigned DEFAULT '0',
  `gruposub_L10` int(10) unsigned DEFAULT '0',
  PRIMARY KEY (`gruposub_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `stg1_itens`
--

DROP TABLE IF EXISTS `stg1_itens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stg1_itens` (
  `nInterno` int(10) unsigned NOT NULL,
  `CodigoBarra` varchar(45) NOT NULL DEFAULT '0',
  `item_descricao` varchar(50) NOT NULL DEFAULT '0',
  `Abreviacao` varchar(25) NOT NULL DEFAULT '0',
  `ST` varchar(45) NOT NULL DEFAULT '0',
  `codsetor` int(10) unsigned NOT NULL DEFAULT '0',
  `qtdemb` double DEFAULT '0',
  `IPI` decimal(12,2) DEFAULT '0.00',
  `DIF` decimal(12,2) DEFAULT '0.00',
  `custo` decimal(12,2) NOT NULL DEFAULT '0.00',
  `margem` varchar(45) DEFAULT '10',
  `CodMarca` int(10) unsigned NOT NULL DEFAULT '0',
  `CodSubSetor` int(10) unsigned NOT NULL DEFAULT '0',
  `Peso` varchar(45) NOT NULL DEFAULT '0',
  `Validade` int(10) unsigned NOT NULL DEFAULT '0',
  `TipoBalanca` varchar(1) DEFAULT 'P',
  `Pai` int(10) unsigned NOT NULL DEFAULT '0',
  `CodFornecLista` double NOT NULL DEFAULT '0',
  `NaoRepetirLista` int(10) unsigned NOT NULL DEFAULT '0',
  `P1` varchar(12) NOT NULL DEFAULT '0',
  `P2` varchar(12) NOT NULL DEFAULT '0',
  `P3` varchar(12) NOT NULL DEFAULT '0',
  `P4` varchar(12) NOT NULL DEFAULT '0',
  `P5` varchar(12) NOT NULL DEFAULT '0',
  `P6` varchar(12) NOT NULL DEFAULT '0',
  `P7` varchar(12) NOT NULL DEFAULT '0',
  `P8` varchar(12) NOT NULL DEFAULT '0',
  `P9` varchar(12) NOT NULL DEFAULT '0',
  `P10` varchar(12) NOT NULL DEFAULT '0',
  `L1` int(10) unsigned NOT NULL DEFAULT '0',
  `L2` int(10) unsigned NOT NULL DEFAULT '0',
  `L3` int(10) unsigned NOT NULL DEFAULT '0',
  `L4` int(10) unsigned NOT NULL DEFAULT '0',
  `L5` int(10) unsigned NOT NULL DEFAULT '0',
  `L6` int(10) unsigned NOT NULL DEFAULT '0',
  `L7` int(10) unsigned NOT NULL DEFAULT '0',
  `L8` int(10) unsigned NOT NULL DEFAULT '0',
  `L9` int(10) unsigned NOT NULL DEFAULT '0',
  `L10` int(10) unsigned NOT NULL DEFAULT '0',
  `Preco` decimal(12,2) NOT NULL DEFAULT '0.00',
  `UltimoCusto` varchar(13) NOT NULL DEFAULT '0.00',
  `PER_IPI` varchar(13) NOT NULL DEFAULT '0.00',
  `PER_ICMS1` varchar(13) NOT NULL DEFAULT '0.00',
  `PER_ICMS2` varchar(13) NOT NULL DEFAULT '0.00',
  `PER_FreteCompra` varchar(13) NOT NULL DEFAULT '0.00',
  `PER_ICMSvenda` varchar(13) NOT NULL DEFAULT '0.00',
  `PER_COMISSAO` varchar(13) NOT NULL DEFAULT '0.00',
  `PER_FreteVenda` varchar(13) NOT NULL DEFAULT '0.00',
  `PER_DF` varchar(13) NOT NULL DEFAULT '0.00',
  `PER_LL` varchar(13) NOT NULL DEFAULT '0.00',
  `NomeAlteracao` varchar(45) NOT NULL DEFAULT '0',
  `DataHoraAlteracao` varchar(45) NOT NULL DEFAULT '0',
  `CST` varchar(3) DEFAULT '0',
  `PISCONFINS` varchar(1) NOT NULL DEFAULT '0',
  `CODIGONCM` varchar(20) NOT NULL DEFAULT '0',
  `CFOPentrada` varchar(4) DEFAULT '0',
  `ICMSentrada` varchar(6) DEFAULT '0',
  `CFOPsaida` varchar(4) DEFAULT '0',
  `ICMSsaida` varchar(6) DEFAULT '0',
  `IPIentrada` varchar(6) DEFAULT '0',
  `Estoque` double NOT NULL DEFAULT '0',
  `Novo` int(10) unsigned NOT NULL DEFAULT '0',
  `Unid` varchar(5) NOT NULL DEFAULT 'UN',
  `UnidadeCompra` varchar(45) NOT NULL DEFAULT 'CX',
  `UnVenda` varchar(45) NOT NULL DEFAULT 'UN',
  `CodDesativado` int(10) unsigned NOT NULL DEFAULT '0',
  `CreditoPisCofins` varchar(45) DEFAULT '0',
  `ValorAgregadoST` varchar(45) NOT NULL DEFAULT '0',
  `AliquotaSt` varchar(45) NOT NULL DEFAULT '0',
  `codpiscofinssaida` varchar(45) NOT NULL DEFAULT '0',
  `tipoitem` varchar(45) NOT NULL DEFAULT '0',
  `A1` varchar(45) NOT NULL DEFAULT '0',
  `A2` varchar(45) NOT NULL DEFAULT '0',
  `A3` varchar(45) NOT NULL DEFAULT '0',
  `A4` varchar(45) NOT NULL DEFAULT '0',
  `A5` varchar(45) DEFAULT '0',
  `A6` varchar(45) DEFAULT '0',
  `A7` varchar(45) DEFAULT '0',
  `A8` varchar(45) DEFAULT '0',
  `A9` varchar(45) DEFAULT '0',
  `A10` varchar(45) DEFAULT '0',
  `Q1` varchar(45) DEFAULT '0',
  `Q2` varchar(45) DEFAULT '0',
  `Q3` varchar(45) DEFAULT '0',
  `Q4` varchar(45) DEFAULT '0',
  `Q5` varchar(45) DEFAULT '0',
  `Q6` varchar(45) DEFAULT '0',
  `Q7` varchar(45) DEFAULT '0',
  `Q8` varchar(45) DEFAULT '0',
  `Q9` varchar(45) DEFAULT '0',
  `Q10` varchar(45) DEFAULT '0',
  `TabelaCstPisCofins` varchar(45) DEFAULT '0',
  `NaoRevisadosPis` int(10) unsigned DEFAULT '0',
  `BaseCreditoPis` varchar(45) DEFAULT '0',
  `CodTabela` varchar(45) DEFAULT '1',
  `CodGenero` varchar(45) DEFAULT '0',
  `Codprod` varchar(45) DEFAULT '0',
  `Codigo` varchar(45) DEFAULT '0',
  `AlqTributos` varchar(45) DEFAULT '0',
  `M1` decimal(6,2) DEFAULT '10.00',
  `M2` decimal(6,2) DEFAULT '10.00',
  `M3` decimal(6,2) DEFAULT '10.00',
  `M4` decimal(6,2) DEFAULT '10.00',
  `M5` decimal(6,2) DEFAULT '10.00',
  `M6` decimal(6,2) DEFAULT '10.00',
  `M7` decimal(6,2) DEFAULT '10.00',
  `M8` decimal(6,2) DEFAULT '10.00',
  `M9` decimal(6,2) DEFAULT '10.00',
  `M10` decimal(6,2) DEFAULT '10.00',
  `CodFornecedor` int(10) unsigned DEFAULT '0',
  `EstMax1` decimal(6,2) DEFAULT '0.00',
  `EstMax2` decimal(6,2) DEFAULT '0.00',
  `EstMax3` decimal(6,2) DEFAULT '0.00',
  `EstMax4` decimal(6,2) DEFAULT '0.00',
  `EstMax5` decimal(6,2) DEFAULT '0.00',
  `EstMax6` decimal(6,2) DEFAULT '0.00',
  `EstMax7` decimal(6,2) DEFAULT '0.00',
  `EstMax8` decimal(6,2) DEFAULT '0.00',
  `EstMax9` decimal(6,2) DEFAULT '0.00',
  `EstMax10` decimal(6,2) DEFAULT '0.00',
  `EstMin1` decimal(6,2) DEFAULT '0.00',
  `EstMin2` decimal(6,2) DEFAULT '0.00',
  `EstMin3` decimal(6,2) DEFAULT '0.00',
  `EstMin4` decimal(6,2) DEFAULT '0.00',
  `EstMin5` decimal(6,2) DEFAULT '0.00',
  `EstMin6` decimal(6,2) DEFAULT '0.00',
  `EstMin7` decimal(6,2) DEFAULT '0.00',
  `EstMin8` decimal(6,2) DEFAULT '0.00',
  `EstMin9` decimal(6,2) DEFAULT '0.00',
  `EstMin10` decimal(6,2) DEFAULT '0.00',
  `CodGrupo` int(10) unsigned DEFAULT '0',
  `CodGrupoSub` int(10) unsigned DEFAULT '0',
  `CodGrupoMarca` int(10) unsigned DEFAULT '0',
  `Atualizacao` varchar(45) DEFAULT '01-01-2010',
  `TXT` int(10) unsigned DEFAULT '0',
  `ConvenioICMS` varchar(45) DEFAULT '0',
  `Revisado` int(10) unsigned DEFAULT '0',
  `ABC` varchar(1) DEFAULT '0',
  `DataABC` varchar(15) DEFAULT '0',
  PRIMARY KEY (`nInterno`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='InnoDB free: 495616 kB; InnoDB free: 14336 kB; InnoDB free: ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `stg1_situacaotributaria`
--

DROP TABLE IF EXISTS `stg1_situacaotributaria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stg1_situacaotributaria` (
  `St` varchar(5) DEFAULT NULL,
  `Descricao` varchar(45) DEFAULT NULL,
  `Valor` decimal(5,2) DEFAULT NULL,
  `nReg` int(11) DEFAULT NULL,
  `Seq` int(11) DEFAULT NULL,
  `Rel` varchar(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `stg2_categorias`
--

DROP TABLE IF EXISTS `stg2_categorias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stg2_categorias` (
  `id_stgcategoria` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `secao_id` tinyint(2) unsigned NOT NULL,
  `secao_desc` varchar(45) NOT NULL,
  `categoria_id` smallint(3) unsigned NOT NULL,
  `categoria_desc` varchar(45) NOT NULL,
  `sub_categoria_id` smallint(3) unsigned NOT NULL,
  `sub_categoria_desc` varchar(45) NOT NULL,
  PRIMARY KEY (`id_stgcategoria`)
) ENGINE=InnoDB AUTO_INCREMENT=370 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `stg2_d_itens`
--

DROP TABLE IF EXISTS `stg2_d_itens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stg2_d_itens` (
  `id_itens` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `item_desc` varchar(100) NOT NULL,
  `item_descvenda` varchar(45) NOT NULL,
  `SKU` varchar(14) NOT NULL,
  `item_desativado` tinyint(1) DEFAULT NULL,
  `grupo_id` smallint(2) NOT NULL,
  `grupo_desc` varchar(45) NOT NULL,
  `gruposub_id` smallint(3) NOT NULL,
  `gruposub_desc` varchar(45) NOT NULL,
  `grupomarca_id` smallint(3) NOT NULL,
  `grupomarca_desc` varchar(45) NOT NULL,
  `custo_item` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id_itens`)
) ENGINE=InnoDB AUTO_INCREMENT=15465 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `stg2_itens`
--

DROP TABLE IF EXISTS `stg2_itens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stg2_itens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `CCF` int(10) unsigned NOT NULL,
  `COO` int(10) unsigned NOT NULL,
  `SKU` varchar(14) NOT NULL,
  `Qtd` decimal(9,3) NOT NULL,
  `ValorUnitario` decimal(7,2) NOT NULL,
  `ValorTotal` decimal(7,2) NOT NULL,
  `Data` datetime NOT NULL,
  `id_loja` smallint(2) DEFAULT NULL,
  `alq` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1715285 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `stg2_itens_aux`
--

DROP TABLE IF EXISTS `stg2_itens_aux`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stg2_itens_aux` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `CCF` int(10) unsigned NOT NULL,
  `COO` int(10) unsigned NOT NULL,
  `SKU` varchar(14) NOT NULL,
  `Qtd` decimal(9,3) NOT NULL,
  `ValorUnitario` decimal(7,2) NOT NULL,
  `ValorTotal` decimal(7,2) NOT NULL,
  `Data` datetime NOT NULL,
  `id_loja` smallint(2) DEFAULT NULL,
  `alq` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=856746 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `stg2_itens_cancelamento`
--

DROP TABLE IF EXISTS `stg2_itens_cancelamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stg2_itens_cancelamento` (
  `id_cancelamento` int(11) NOT NULL AUTO_INCREMENT,
  `CCF` int(10) unsigned NOT NULL,
  `COO` int(10) unsigned NOT NULL,
  `SKU` varchar(14) NOT NULL,
  `Qtd` decimal(9,3) NOT NULL,
  `ValorUnitario` decimal(5,2) NOT NULL,
  `ValorTotal` decimal(7,2) NOT NULL,
  `Data` datetime NOT NULL,
  `id_loja` smallint(2) DEFAULT NULL,
  PRIMARY KEY (`id_cancelamento`)
) ENGINE=InnoDB AUTO_INCREMENT=18275 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `stg2_itens_cancelamento_aux`
--

DROP TABLE IF EXISTS `stg2_itens_cancelamento_aux`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stg2_itens_cancelamento_aux` (
  `id_cancelamento` int(11) NOT NULL AUTO_INCREMENT,
  `CCF` int(10) unsigned NOT NULL,
  `COO` int(10) unsigned NOT NULL,
  `SKU` varchar(14) NOT NULL,
  `Qtd` decimal(9,3) NOT NULL,
  `ValorUnitario` decimal(5,2) NOT NULL,
  `ValorTotal` decimal(7,2) NOT NULL,
  `Data` datetime NOT NULL,
  `id_loja` smallint(2) DEFAULT NULL,
  PRIMARY KEY (`id_cancelamento`)
) ENGINE=InnoDB AUTO_INCREMENT=6638 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `stg2_itens_erro`
--

DROP TABLE IF EXISTS `stg2_itens_erro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stg2_itens_erro` (
  `id_erro` int(11) NOT NULL AUTO_INCREMENT,
  `CCF` varchar(40) DEFAULT NULL,
  `COO` varchar(40) DEFAULT NULL,
  `SKU` varchar(40) DEFAULT NULL,
  `Qtd` varchar(40) DEFAULT NULL,
  `ValorUnitario` varchar(40) DEFAULT NULL,
  `ValorTotal` varchar(40) DEFAULT NULL,
  `Data` varchar(40) DEFAULT NULL,
  `id_loja` varchar(40) DEFAULT NULL,
  `alq` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_erro`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `stg2_transacoes`
--

DROP TABLE IF EXISTS `stg2_transacoes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stg2_transacoes` (
  `venda_id` int(10) NOT NULL AUTO_INCREMENT,
  `venda_data` datetime NOT NULL,
  `valor` decimal(9,2) NOT NULL,
  `IndCancel` tinyint(1) NOT NULL DEFAULT '0',
  `Tipo1` smallint(2) NOT NULL DEFAULT '0',
  `Tipo2` smallint(2) NOT NULL DEFAULT '0',
  `Cartao` varchar(50) NOT NULL DEFAULT '0',
  `Recarga` tinyint(1) NOT NULL DEFAULT '0',
  `id_loja` smallint(2) unsigned NOT NULL,
  PRIMARY KEY (`venda_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2642317 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `stg_relatoriofec`
--

DROP TABLE IF EXISTS `stg_relatoriofec`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stg_relatoriofec` (
  `nReg` double NOT NULL AUTO_INCREMENT,
  `Data` date NOT NULL,
  `Hora` varchar(45) NOT NULL,
  `Valor` varchar(45) NOT NULL,
  `COO` varchar(45) NOT NULL,
  `IndCancel` varchar(45) NOT NULL DEFAULT '0',
  `Tipo1` varchar(45) NOT NULL DEFAULT '0',
  `Tipo2` varchar(45) NOT NULL DEFAULT '0',
  `NSU` varchar(45) NOT NULL DEFAULT '0',
  `Cartao` varchar(500) NOT NULL DEFAULT '0',
  `Recarga` int(10) unsigned NOT NULL DEFAULT '0',
  `nMov` double NOT NULL DEFAULT '0',
  `StatusSangria` int(10) unsigned NOT NULL DEFAULT '0',
  `SeqSangria` double NOT NULL DEFAULT '0',
  `TicketDesconto` varchar(45) NOT NULL DEFAULT '0',
  `TicketBruto` varchar(45) NOT NULL DEFAULT '0',
  `TicketQtd` varchar(45) NOT NULL DEFAULT '0',
  `nECF` int(10) unsigned NOT NULL DEFAULT '0',
  `nRegPDV` double NOT NULL DEFAULT '0',
  `StatusEnviado` int(10) unsigned NOT NULL DEFAULT '0',
  `Operador` varchar(45) NOT NULL DEFAULT '0',
  `Troco` varchar(45) NOT NULL DEFAULT '0',
  `nEnvelope` varchar(45) NOT NULL DEFAULT '0',
  `ccf` varchar(45) NOT NULL DEFAULT '0',
  PRIMARY KEY (`nReg`)
) ENGINE=InnoDB AUTO_INCREMENT=208 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `stg_zcupomitensloja1`
--

DROP TABLE IF EXISTS `stg_zcupomitensloja1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stg_zcupomitensloja1` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `nReg` double NOT NULL,
  `nECF` int(10) unsigned NOT NULL,
  `CCF` int(10) unsigned NOT NULL,
  `COO` int(10) unsigned NOT NULL,
  `nItem` int(10) unsigned NOT NULL,
  `Codigo` varchar(14) NOT NULL,
  `Descricao` varchar(45) NOT NULL,
  `Qtd` varchar(12) NOT NULL,
  `Unidade` varchar(5) NOT NULL,
  `ValorUnitario` varchar(12) NOT NULL,
  `ValorTotal` varchar(12) NOT NULL,
  `Alq` varchar(15) DEFAULT NULL,
  `IndCancel` varchar(1) NOT NULL,
  `Data` date NOT NULL,
  `Hora` varchar(15) NOT NULL,
  `CodSetor` int(10) unsigned NOT NULL,
  `CodSubSetor` int(10) unsigned NOT NULL,
  `CodMarca` int(10) unsigned NOT NULL,
  `QtdNovo` decimal(12,3) DEFAULT NULL,
  `ValorTotalNovo` decimal(12,3) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `2nd` (`CCF`)
) ENGINE=InnoDB AUTO_INCREMENT=1200001 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping routines for database 'staging'
--
/*!50003 DROP FUNCTION IF EXISTS `reglog_tabela` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `reglog_tabela`(tabela VARCHAR(14)) RETURNS int(10)
BEGIN
DECLARE reg_log INT UNSIGNED;
SET reg_log = (select ifnull((SELECT nReg_log FROM staging.log_extracao where (tabela_extracao = tabela) order by nReg_log DESC limit 1),0));
RETURN reg_log;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-09-24 10:29:49
