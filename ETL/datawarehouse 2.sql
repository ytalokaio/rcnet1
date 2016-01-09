-- MySQL dump 10.13  Distrib 5.6.24, for osx10.8 (x86_64)
--
-- Host: localhost    Database: datawarehouse
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
-- Table structure for table `d_data`
--

DROP TABLE IF EXISTS `d_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `d_data` (
  `id_data` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `data` datetime NOT NULL DEFAULT '1900-01-01 00:00:00',
  `version` int(11) NOT NULL DEFAULT '0',
  `date_start` datetime NOT NULL DEFAULT '1900-01-01 00:00:00',
  `date_range` datetime NOT NULL DEFAULT '1900-01-01 00:00:00',
  `mes` smallint(2) NOT NULL DEFAULT '-2',
  `ano` smallint(4) NOT NULL DEFAULT '-2',
  `diasemana` smallint(1) NOT NULL DEFAULT '-2',
  `hora` smallint(2) NOT NULL DEFAULT '-2',
  `trimestre` smallint(1) NOT NULL DEFAULT '-2',
  `minuto` smallint(2) NOT NULL DEFAULT '-2',
  `dia` smallint(2) NOT NULL DEFAULT '-2',
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
  `alq_icms` varchar(15) NOT NULL DEFAULT 'teste',
  `icms_desc` varchar(45) NOT NULL DEFAULT 'teste',
  `alq_percentual` decimal(4,2) NOT NULL DEFAULT '-2.00',
  `version` int(11) NOT NULL DEFAULT '-2',
  `date_start` datetime NOT NULL DEFAULT '1900-01-01 00:00:00',
  `date_range` datetime NOT NULL DEFAULT '1900-01-01 00:00:00',
  PRIMARY KEY (`id_icms`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;
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
  `id_produto` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `produto_desc` varchar(50) NOT NULL DEFAULT 'nao obtido',
  `produto_descvenda` varchar(45) NOT NULL DEFAULT 'nao obtido',
  `SKU` varchar(14) NOT NULL DEFAULT '0',
  `id_tipo_produto` int(10) unsigned NOT NULL DEFAULT '0',
  `produto_desativado` tinyint(1) NOT NULL DEFAULT '0',
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
  `id_tipo_transacao` int(11) NOT NULL AUTO_INCREMENT,
  `tipo_transacao` varchar(45) NOT NULL DEFAULT '-2',
  `cod1` smallint(2) NOT NULL DEFAULT '-2',
  `cod2` smallint(2) NOT NULL DEFAULT '-2',
  `tipo_cartao_desc` varchar(45) NOT NULL DEFAULT '-2',
  `version` int(11) NOT NULL DEFAULT '0',
  `date_start` datetime NOT NULL DEFAULT '1900-01-01 00:00:00',
  `date_range` datetime NOT NULL DEFAULT '1900-01-01 00:00:00',
  PRIMARY KEY (`id_tipo_transacao`),
  KEY `idx_d_tipo_transacao_lookup` (`cod1`,`cod2`,`tipo_cartao_desc`)
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
  `transacao_valor` decimal(9,2) NOT NULL,
  PRIMARY KEY (`CCF`,`COO`,`id_data`,`id_tipo_transacao`,`id_loja`),
  KEY `fk_f_pagamentos_d_tipo_pagamento1_idx` (`id_tipo_transacao`),
  KEY `fk_f_pagamentos_d_data1` (`id_data`),
  KEY `fk_f_pagamentos_d_loja` (`id_loja`),
  CONSTRAINT `fk_f_pagamentos_d_data` FOREIGN KEY (`id_data`) REFERENCES `d_data` (`id_data`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_f_pagamentos_d_loja` FOREIGN KEY (`id_loja`) REFERENCES `d_loja` (`id_loja`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_f_pagamentos_d_tipo_transacao` FOREIGN KEY (`id_tipo_transacao`) REFERENCES `d_tipo_transacao` (`id_tipo_transacao`) ON DELETE NO ACTION ON UPDATE NO ACTION
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
  `total_custo` decimal(11,6) unsigned NOT NULL,
  PRIMARY KEY (`COO`,`CCF`,`id_loja`,`id_produto`,`id_data`),
  KEY `fk_f_vendas_d_loja_idx` (`id_loja`),
  KEY `fk_f_vendas_d_produto1_idx` (`id_produto`),
  KEY `fk_f_vendas_d_data1_idx` (`id_data`),
  KEY `fk_f_vendas_d_icms` (`id_icms`),
  CONSTRAINT `fk_f_vendas_d_data` FOREIGN KEY (`id_data`) REFERENCES `d_data` (`id_data`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_f_vendas_d_icms` FOREIGN KEY (`id_icms`) REFERENCES `d_icms` (`id_icms`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_f_vendas_d_loja` FOREIGN KEY (`id_loja`) REFERENCES `d_loja` (`id_loja`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_f_vendas_d_produto` FOREIGN KEY (`id_produto`) REFERENCES `d_produto` (`id_produto`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
  `data` date NOT NULL,
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
  `id_icms` int(11) NOT NULL,
  `produto_desativado` tinyint(1) NOT NULL DEFAULT '0',
  `qtd_produto` decimal(10,3) unsigned NOT NULL DEFAULT '0.000',
  `total_venda` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  `total_custo` decimal(13,6) unsigned NOT NULL DEFAULT '0.000000',
  `lucro_total` decimal(13,6) unsigned NOT NULL DEFAULT '0.000000',
  `diasemana` tinyint(2) NOT NULL,
  `icms_venda` decimal(13,6) unsigned NOT NULL,
  PRIMARY KEY (`venda_produto_hora_id`),
  KEY `idx_venda_produto_hora_lookup` (`id_loja`,`id_produto`,`ano`,`trimestre`,`mes`,`dia`,`hora`,`diasemana`),
  KEY `idx_data` (`data`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping routines for database 'datawarehouse'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-10-15 10:18:37
