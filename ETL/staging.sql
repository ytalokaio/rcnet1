CREATE DATABASE  IF NOT EXISTS `staging` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `staging`;
-- MySQL dump 10.13  Distrib 5.6.24, for osx10.8 (x86_64)
--
-- Host: localhost    Database: staging
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
-- Table structure for table `f_transacao_erro`
--

DROP TABLE IF EXISTS `f_transacao_erro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `f_transacao_erro` (
  `id_erro_f_transacao` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `CCF` int(11) DEFAULT NULL,
  `COO` int(11) DEFAULT NULL,
  `id_data` int(10) DEFAULT NULL,
  `id_tipo_transacao` int(11) DEFAULT NULL,
  `id_loja` int(10) DEFAULT NULL,
  `transacao_valor` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_erro_f_transacao`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `f_vendas_canceladas_erro`
--

DROP TABLE IF EXISTS `f_vendas_canceladas_erro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `f_vendas_canceladas_erro` (
  `n_erro` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ECF` smallint(2) unsigned NOT NULL,
  `COO` int(10) unsigned NOT NULL,
  `CCF` int(10) unsigned NOT NULL,
  `id_loja` int(10) unsigned NOT NULL,
  `id_produto` int(10) unsigned NOT NULL,
  `id_data` int(10) unsigned NOT NULL,
  `id_hora` int(10) unsigned NOT NULL,
  `qtd_produto` decimal(7,3) unsigned NOT NULL,
  `total_venda` decimal(7,2) unsigned NOT NULL,
  PRIMARY KEY (`n_erro`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `f_vendas_deletadas`
--

DROP TABLE IF EXISTS `f_vendas_deletadas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `f_vendas_deletadas` (
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
  PRIMARY KEY (`COO`,`CCF`,`id_loja`,`id_produto`,`id_data`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `f_vendas_erro`
--

DROP TABLE IF EXISTS `f_vendas_erro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `f_vendas_erro` (
  `id_f_vendas_erro` int(11) NOT NULL AUTO_INCREMENT,
  `ECF` smallint(2) DEFAULT '0',
  `COO` int(10) DEFAULT '0',
  `CCF` int(10) DEFAULT '0',
  `id_loja` int(10) DEFAULT '0',
  `id_itens` int(10) DEFAULT '0',
  `id_data` int(10) DEFAULT '0',
  `qtd_item` decimal(7,3) DEFAULT NULL,
  `custo_item` decimal(5,2) DEFAULT NULL,
  `valor_item` decimal(5,2) DEFAULT NULL,
  `total_item` decimal(7,2) DEFAULT NULL,
  `id_icms` int(10) DEFAULT NULL,
  `SKU` varchar(15) DEFAULT NULL,
  `data` datetime DEFAULT NULL,
  `id_piscofins` int(11) DEFAULT NULL,
  `cod_piscofins` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_f_vendas_erro`),
  KEY `fk_f_vendas_d_loja_idx` (`id_loja`),
  KEY `fk_f_vendas_d_itens1_idx` (`id_itens`),
  KEY `fk_f_vendas_d_data1_idx` (`id_data`)
) ENGINE=InnoDB AUTO_INCREMENT=226 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `f_vendas_erro_tratamento`
--

DROP TABLE IF EXISTS `f_vendas_erro_tratamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `f_vendas_erro_tratamento` (
  `id_f_vendas_erro` int(11) NOT NULL AUTO_INCREMENT,
  `ECF` smallint(2) DEFAULT '0',
  `COO` int(10) DEFAULT '0',
  `CCF` int(10) DEFAULT '0',
  `id_loja` int(10) DEFAULT '0',
  `id_itens` int(10) DEFAULT '0',
  `id_data` int(10) DEFAULT '0',
  `qtd_item` decimal(7,3) DEFAULT NULL,
  `custo_item` decimal(5,2) DEFAULT NULL,
  `valor_item` decimal(5,2) DEFAULT NULL,
  `total_item` decimal(7,2) DEFAULT NULL,
  `id_icms` int(10) DEFAULT NULL,
  `SKU` varchar(15) DEFAULT NULL,
  `data` datetime DEFAULT NULL,
  PRIMARY KEY (`id_f_vendas_erro`)
) ENGINE=InnoDB AUTO_INCREMENT=6495 DEFAULT CHARSET=utf8;
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
  PRIMARY KEY (`nInterno`),
  KEY `sku` (`CodigoBarra`)
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
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=latin1;
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
) ENGINE=InnoDB AUTO_INCREMENT=10001 DEFAULT CHARSET=utf8;
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
  `Qtd` decimal(9,3) unsigned NOT NULL,
  `ValorUnitario` decimal(7,2) unsigned NOT NULL,
  `ValorTotal` decimal(7,2) unsigned NOT NULL,
  `Data` datetime NOT NULL,
  `id_loja` smallint(2) unsigned NOT NULL,
  `alq` varchar(15) NOT NULL,
  `nECF` int(2) unsigned NOT NULL DEFAULT '0',
  `custo_unitario` decimal(12,6) unsigned NOT NULL,
  `custo_total` decimal(12,6) unsigned NOT NULL,
  `cod_piscofins` smallint(2) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12989 DEFAULT CHARSET=latin1;
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
  `Qtd` decimal(9,3) unsigned NOT NULL,
  `ValorUnitario` decimal(7,2) unsigned NOT NULL,
  `ValorTotal` decimal(7,2) unsigned NOT NULL,
  `Data` datetime NOT NULL,
  `id_loja` smallint(2) NOT NULL,
  `alq` varchar(15) NOT NULL,
  `custo_unitario` decimal(12,6) NOT NULL,
  `custo_total` decimal(12,6) NOT NULL,
  `nECF` int(2) unsigned NOT NULL DEFAULT '0',
  `cod_piscofins` smallint(2) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6495 DEFAULT CHARSET=latin1;
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
  `nECF` int(2) unsigned NOT NULL,
  PRIMARY KEY (`id_cancelamento`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=latin1;
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
  `nECF` int(2) unsigned NOT NULL,
  PRIMARY KEY (`id_cancelamento`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=latin1;
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `stg2_movimentos_internos`
--

DROP TABLE IF EXISTS `stg2_movimentos_internos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stg2_movimentos_internos` (
  `movimento_id` int(10) NOT NULL AUTO_INCREMENT,
  `COO` int(11) unsigned NOT NULL,
  `CCF` int(11) unsigned NOT NULL,
  `venda_data` datetime NOT NULL,
  `valor` decimal(9,2) NOT NULL,
  `Tipo1` smallint(2) NOT NULL DEFAULT '0',
  `Tipo2` smallint(2) NOT NULL DEFAULT '0',
  `Cartao` varchar(50) NOT NULL DEFAULT '0',
  `id_loja` smallint(2) unsigned NOT NULL,
  `nECF` smallint(2) unsigned NOT NULL,
  PRIMARY KEY (`movimento_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15001 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `stg2_movimentos_internos_aux`
--

DROP TABLE IF EXISTS `stg2_movimentos_internos_aux`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stg2_movimentos_internos_aux` (
  `movimento_id` int(10) NOT NULL AUTO_INCREMENT,
  `COO` int(11) unsigned NOT NULL,
  `CCF` int(11) unsigned NOT NULL,
  `venda_data` datetime NOT NULL,
  `valor` decimal(9,2) NOT NULL,
  `Tipo1` smallint(2) NOT NULL DEFAULT '0',
  `Tipo2` smallint(2) NOT NULL DEFAULT '0',
  `Cartao` varchar(50) NOT NULL DEFAULT '0',
  `id_loja` smallint(2) unsigned NOT NULL,
  `nECF` smallint(2) unsigned NOT NULL,
  PRIMARY KEY (`movimento_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20001 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `stg2_transacoes`
--

DROP TABLE IF EXISTS `stg2_transacoes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stg2_transacoes` (
  `venda_id` int(10) NOT NULL AUTO_INCREMENT,
  `COO` int(11) unsigned NOT NULL,
  `CCF` int(11) unsigned NOT NULL,
  `venda_data` datetime NOT NULL,
  `valor` decimal(9,2) NOT NULL,
  `Tipo1` smallint(2) NOT NULL DEFAULT '0',
  `Tipo2` smallint(2) NOT NULL DEFAULT '0',
  `Cartao` varchar(50) NOT NULL DEFAULT '0',
  `id_loja` smallint(2) unsigned NOT NULL,
  `nECF` smallint(2) unsigned NOT NULL,
  PRIMARY KEY (`venda_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `stg2_transacoes_aux`
--

DROP TABLE IF EXISTS `stg2_transacoes_aux`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stg2_transacoes_aux` (
  `venda_id` int(10) NOT NULL AUTO_INCREMENT,
  `COO` int(11) unsigned NOT NULL,
  `CCF` int(11) unsigned NOT NULL,
  `venda_data` datetime NOT NULL,
  `valor` decimal(9,2) NOT NULL,
  `Tipo1` smallint(2) NOT NULL DEFAULT '0',
  `Tipo2` smallint(2) NOT NULL DEFAULT '0',
  `Cartao` varchar(50) NOT NULL DEFAULT '0',
  `id_loja` smallint(2) unsigned NOT NULL,
  `nECF` smallint(2) unsigned NOT NULL,
  PRIMARY KEY (`venda_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `stg2_transacoes_canceladas`
--

DROP TABLE IF EXISTS `stg2_transacoes_canceladas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stg2_transacoes_canceladas` (
  `venda_id` int(10) NOT NULL AUTO_INCREMENT,
  `COO` int(11) unsigned NOT NULL,
  `CCF` int(11) unsigned NOT NULL,
  `venda_data` datetime NOT NULL,
  `valor` decimal(9,2) NOT NULL,
  `Tipo1` smallint(2) NOT NULL DEFAULT '0',
  `Tipo2` smallint(2) NOT NULL DEFAULT '0',
  `Cartao` varchar(50) NOT NULL DEFAULT '0',
  `id_loja` smallint(2) unsigned NOT NULL,
  `nECF` smallint(2) unsigned NOT NULL,
  PRIMARY KEY (`venda_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `stg2_transacoes_canceladas_aux`
--

DROP TABLE IF EXISTS `stg2_transacoes_canceladas_aux`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stg2_transacoes_canceladas_aux` (
  `venda_id` int(10) NOT NULL AUTO_INCREMENT,
  `COO` int(11) unsigned NOT NULL,
  `CCF` int(11) unsigned NOT NULL,
  `venda_data` datetime NOT NULL,
  `valor` decimal(9,2) NOT NULL,
  `Tipo1` smallint(2) NOT NULL DEFAULT '0',
  `Tipo2` smallint(2) NOT NULL DEFAULT '0',
  `Cartao` varchar(50) NOT NULL DEFAULT '0',
  `id_loja` smallint(2) unsigned NOT NULL,
  `nECF` smallint(2) unsigned NOT NULL,
  PRIMARY KEY (`venda_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `stg_relatoriofecloja1`
--

DROP TABLE IF EXISTS `stg_relatoriofecloja1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stg_relatoriofecloja1` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nReg` double NOT NULL,
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=408001 DEFAULT CHARSET=latin1;
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
  `CodSetor` int(10) unsigned DEFAULT NULL,
  `CodSubSetor` int(10) unsigned DEFAULT NULL,
  `CodMarca` int(10) unsigned DEFAULT NULL,
  `QtdNovo` decimal(12,3) DEFAULT NULL,
  `ValorTotalNovo` decimal(12,3) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `2nd` (`CCF`),
  KEY `codigo_sku` (`Codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=6930892 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `temp_f_vendas`
--

DROP TABLE IF EXISTS `temp_f_vendas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `temp_f_vendas` (
  `ECF` smallint(2) unsigned NOT NULL,
  `COO` int(10) unsigned NOT NULL,
  `CCF` int(10) unsigned NOT NULL,
  `id_loja` int(10) unsigned NOT NULL,
  `id_produto` int(10) unsigned NOT NULL,
  `id_data` int(10) unsigned NOT NULL,
  `id_hora` int(10) unsigned NOT NULL,
  `id_icms` int(10) unsigned NOT NULL,
  `qtd_produto` decimal(7,3) unsigned NOT NULL,
  `custo_produto` decimal(5,2) unsigned NOT NULL,
  `valor_produto` decimal(5,2) unsigned NOT NULL,
  `total_venda` decimal(7,2) unsigned NOT NULL,
  `total_custo` decimal(11,6) unsigned NOT NULL,
  `id_piscofins` int(10) unsigned NOT NULL,
  PRIMARY KEY (`ECF`,`COO`,`CCF`,`id_loja`,`id_produto`,`id_data`,`id_hora`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `temp_venda_produto_hora`
--

DROP TABLE IF EXISTS `temp_venda_produto_hora`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `temp_venda_produto_hora` (
  `id_loja` int(11) NOT NULL,
  `id_produto` int(11) NOT NULL,
  `ano` smallint(4) NOT NULL,
  `trimestre` tinyint(2) NOT NULL,
  `mes` tinyint(2) NOT NULL,
  `data` date NOT NULL,
  `dia` tinyint(2) NOT NULL,
  `hora` tinyint(2) NOT NULL,
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
  `qtd_produto` decimal(10,3) NOT NULL DEFAULT '0.000',
  `total_venda` decimal(10,2) NOT NULL DEFAULT '0.00',
  `total_custo` decimal(13,6) NOT NULL DEFAULT '0.000000',
  `lucro_total` decimal(13,6) NOT NULL DEFAULT '0.000000',
  `diasemana` tinyint(2) NOT NULL,
  `icms_venda` decimal(13,6) NOT NULL,
  `id_piscofins` int(10) unsigned NOT NULL,
  `pis_venda` decimal(13,6) NOT NULL,
  `cofins_venda` decimal(13,6) NOT NULL,
  PRIMARY KEY (`id_loja`,`id_produto`,`ano`,`mes`,`dia`,`hora`,`id_icms`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping routines for database 'staging'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-12-03 10:41:19
