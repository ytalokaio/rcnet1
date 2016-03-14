CREATE TABLE if not exists supermercado.`auditoria_compras` (
  `nCompra` double NOT NULL ,
  `nNota` varchar(45) DEFAULT NULL,
  `CodFornec` double DEFAULT NULL,
  `DataLan` date DEFAULT NULL,
  `DataStatus` date DEFAULT NULL,
  `DataEmissao` date DEFAULT NULL,
  `DataRecto` date NOT NULL,
  `TotalBaseICMS` decimal(12,2) NOT NULL DEFAULT '0.00',
  `TotalValorICMS` decimal(12,2) NOT NULL DEFAULT '0.00',
  `TotalFrete` decimal(12,2) NOT NULL DEFAULT '0.00',
  `TotalSeguro` decimal(12,2) NOT NULL DEFAULT '0.00',
  `TotalDespAcess` decimal(12,2) NOT NULL DEFAULT '0.00',
  `TotalICMSSub` decimal(12,2) NOT NULL DEFAULT '0.00',
  `TotalIPI` decimal(12,2) NOT NULL DEFAULT '0.00',
  `TotalProdutos` decimal(12,2) NOT NULL DEFAULT '0.00',
  `TotalNota` decimal(12,2) NOT NULL DEFAULT '0.00',
  `TotalComparacao` decimal(12,2) NOT NULL DEFAULT '0.00',
  `Status` varchar(2) DEFAULT NULL,
  `CodOperador` double DEFAULT NULL,
  `ContasApagar` double NOT NULL DEFAULT '0',
  `DataVencimento` date DEFAULT NULL,
  `cfop` varchar(45) NOT NULL DEFAULT '0',
  `NomeFornec` varchar(100) NOT NULL DEFAULT '0',
  `NomeOperador` varchar(45) NOT NULL DEFAULT '0',
  `StatusSupermercado` int(10) unsigned NOT NULL DEFAULT '0',
  `UF` varchar(2) NOT NULL DEFAULT '0',
  `TotalDesconto` decimal(12,2) NOT NULL DEFAULT '0.00',
  `CNPJ` varchar(14) NOT NULL DEFAULT '0',
  `IE` varchar(14) NOT NULL DEFAULT '0',
  `Modelo` varchar(5) NOT NULL DEFAULT '0',
  `Serie` varchar(5) NOT NULL DEFAULT '0',
  `Movimentacao` varchar(45) NOT NULL DEFAULT '0',
  `Tipo` varchar(45) NOT NULL DEFAULT '0',
  `StatusCega` int(10) unsigned NOT NULL DEFAULT '0',
  `NomeConferente` varchar(45) NOT NULL DEFAULT '0',
  `TotalISENTO` decimal(12,2) NOT NULL DEFAULT '0.00',
  `TotalOUTROS` decimal(12,2) NOT NULL DEFAULT '0.00',
  `StatusCentral` int(10) unsigned NOT NULL DEFAULT '0',
  `EspelhoICMS` decimal(12,2) NOT NULL DEFAULT '0.00',
  `FormaPagto` varchar(75) NOT NULL DEFAULT '0' COMMENT '0-Avista 1-A praza 9-sem',
  `ArredondamentoICMS` int(10) unsigned NOT NULL DEFAULT '0',
  `Simples` int(10) unsigned NOT NULL DEFAULT '0',
  `nProtocolo` double NOT NULL DEFAULT '0',
  `SituacaoDoc` varchar(2) NOT NULL DEFAULT '0',
  `TipoFrete` int(10) unsigned NOT NULL DEFAULT '0',
  `despesaparticipaicms` tinyint(1) NOT NULL DEFAULT '0',
  `flagabriufechou` int(10) unsigned NOT NULL DEFAULT '0',
  `TotalBCICMSST` decimal(12,2) DEFAULT '0.00',
  `nCupomTroca` double unsigned DEFAULT '0' COMMENT 'se troca-devolucao no balcao, sera preenchido com numero do cupom fiscal',
  `nECF` double unsigned DEFAULT '0' COMMENT 'se troca-devolucao no balcao, sera preenchido com numero da ecf',
  `DataConferencia` date DEFAULT '2010-01-01',
  `StatusProtocolo` int(10) unsigned DEFAULT '0',
  `DataConferenciaLan` date DEFAULT '2010-01-01',
  `HoraConferencia` varchar(45) DEFAULT '0',
  `DataEntradaSaida` date DEFAULT '2011-01-01',
  `chave` varchar(45) DEFAULT '0',
  `ChaveNFeReferenciadaDevolucao` varchar(44) DEFAULT NULL,
  `NumeroPedido` double DEFAULT '0',
  `TotImpostoPagoConsumidor` double unsigned DEFAULT '0',
  `NFeEmDigitacao` tinyint(1) DEFAULT '0',
  `modificacao` varchar(45) DEFAULT NULL,
  `data_modificacao` datetime DEFAULT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1;

drop trigger if exists auditoria_compras;
DELIMITER $$

create trigger auditoria_compras before update on supermercado.compras for each row
BEGIN

if OLD.ncompra != NEW.ncompra or OLD.nnota != New.nnota then insert into auditoria_compras select * , concat('update'), now() from supermercado.compras where ncompra = OLD.ncompra;
END IF;

END;
$$
DELIMITER ;

CREATE TABLE if not exists `auditoria_loja` (
  `CodLoja` int(10) unsigned NOT NULL DEFAULT '1',
  `Nome` varchar(45) NOT NULL DEFAULT 'Loja1',
  `nReg` int(10) unsigned NOT NULL,
  `ContadorEstoque` int(10) unsigned DEFAULT '0',
  `CNPJ` varchar(14) NOT NULL DEFAULT '0',
  `IE` varchar(25) DEFAULT NULL COMMENT 'Inscricao Estadual',
  `InscMunic` varchar(50) DEFAULT '' COMMENT 'Inscricao Municipal',
  `RazaoSocial` varchar(45) NOT NULL,
  `Fantasia` varchar(45) NOT NULL,
  `CodRegTribut` int(10) unsigned NOT NULL DEFAULT '3' COMMENT 'Codigo do Regime Tributario{1=simples nac;2=SimplesNac. Sublimite;3=Regime Normal}',
  `CNAE` varchar(20) DEFAULT '' COMMENT 'CNAE Fiscal',
  `Logradouro` varchar(50) NOT NULL,
  `Numero` varchar(45) NOT NULL,
  `Complemento` varchar(45) DEFAULT '',
  `Bairro` varchar(45) NOT NULL,
  `Cidade` varchar(45) NOT NULL,
  `CodMunicipio` varchar(20) NOT NULL,
  `UFSigla` varchar(2) NOT NULL,
  `UFDescricao` varchar(45) NOT NULL,
  `UFCodigo` varchar(10) NOT NULL DEFAULT '26' COMMENT '26=Pernambuco',
  `CEP` varchar(8) NOT NULL,
  `Fone` varchar(10) DEFAULT '',
  `Email` varchar(50) DEFAULT '-',
  `NFeVerProc` varchar(6) NOT NULL DEFAULT '2.00' COMMENT 'Versao',
  `NFeModelo` varchar(3) NOT NULL DEFAULT '55',
  `NFeSerie` varchar(3) NOT NULL DEFAULT '1',
  `NFeNoSerieCertificado` varchar(80) DEFAULT '',
  `NFeDanfeTipo` varchar(1) NOT NULL DEFAULT '1' COMMENT '1-Normal;2-Conting FS; 3-Conting SCAN; 4-Conting DPEC; 5-Conting FS-DA',
  `NFeDanfeCanhoto` tinyint(1) DEFAULT '1' COMMENT '1=imprime;0=nao imprime',
  `NFeDanfeRodape` varchar(80) DEFAULT 'RCNet Solucoes - www.rcnet.com.br' COMMENT 'Texto de rodape do danfe',
  `NFePathDataPacket` varchar(120) NOT NULL DEFAULT '%programfiles%\\RCNET\\NFe\\XML\\NfeDtPkt-v6.4.1-FS.xtr',
  `NFePathDataPacketSeg` varchar(120) NOT NULL DEFAULT '%programfiles%\\RCNET\\NFe\\XML\\NFeDtPkt-v6.4.1-FS.xtr',
  `NFePathPrincipal` varchar(120) NOT NULL DEFAULT '%programfiles%\\RCNET\\NFe\\XML',
  `NFePathSchemas` varchar(120) NOT NULL DEFAULT 'schemas\\',
  `NFeCancelamento` varchar(100) NOT NULL DEFAULT 'https://nfehomolog.sefaz.pe.gov.br/nfe-service/services/NfeCancelamento2',
  `NFeConsultaProtocolo` varchar(100) NOT NULL DEFAULT 'https://nfehomolog.sefaz.pe.gov.br/nfe-service/services/NfeConsulta2',
  `NFeInutilizacao` varchar(100) NOT NULL DEFAULT 'https://nfehomolog.sefaz.pe.gov.br/nfe-service/services/NfeInutilizacao2',
  `NFeRecepcao` varchar(100) NOT NULL DEFAULT 'https://nfehomolog.sefaz.pe.gov.br/nfe-service/services/NfeRecepcao2',
  `NFeRetRecepcao` varchar(100) NOT NULL DEFAULT 'https://nfehomolog.sefaz.pe.gov.br/nfe-service/services/NfeRetRecepcao2',
  `NFeStatusServico` varchar(100) NOT NULL DEFAULT 'https://nfehomolog.sefaz.pe.gov.br/nfe-service/services/NfeStatusServico2',
  `NFeRecepcaoEvento` varchar(100) NOT NULL DEFAULT 'https://nfehomolog.sefaz.pe.gov.br/nfe-service/services/RecepcaoEvento',
  `NFeSMTPServidor` varchar(40) DEFAULT NULL,
  `NFeSMTPSenha` varchar(40) DEFAULT NULL,
  `NFeSMTPNomeExibicao` varchar(40) DEFAULT NULL,
  `NFeSMTPSSL` varchar(1) DEFAULT '1',
  `NFeSMTPeMail` varchar(50) DEFAULT '',
  `NFeAmbiente` tinyint(1) unsigned DEFAULT '2' COMMENT '1=producao;2=homologacao-testes',
  `NFeSMTPeGel` varchar(45) DEFAULT '0',
  `NFeSMTPeBai` varchar(45) DEFAULT '0',
  `NFeSMTPPorta` varchar(45) DEFAULT NULL,
  `NFeTimeout` int(10) unsigned DEFAULT '5' COMMENT 'tempo de espera por retorno da sefaz, em segundos.',
  `NFeConsultaCompletaNacional` varchar(150) DEFAULT 'http://hom.nfe.fazenda.gov.br/portal/consulta.aspx?tipoConsulta=',
  `NFeConsultaCompletaEstadual` varchar(150) DEFAULT 'http://nfehomolog.sefaz.pe.gov.br/nfe-web/consNfe?tp=C',
  `seqcarga` int(10) unsigned DEFAULT '0',
  `CaminhoContas` int(10) unsigned DEFAULT '0',
  `modificacao` varchar(45) DEFAULT NULL,
  `data_modificacao` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='InnoDB free: 393216 kB';


drop trigger if exists auditoria_loja;
DELIMITER $$

create trigger auditoria_loja before update on supermercado.loja for each row
BEGIN

insert into auditoria_loja select * , concat('update'), now() from supermercado.loja where CodLoja = OLD.CodLoja;

END;
$$
DELIMITER ;


drop trigger if exists auditoria_loja_delete;
DELIMITER $$

create trigger auditoria_loja_delete after delete on supermercado.loja for each row
BEGIN

insert into auditoria_loja select * , concat('delete'), now() from supermercado.loja where CodLoja = OLD.CodLoja;

END;
$$
DELIMITER ;

CREATE TABLE if not exists supermercado.auditoria_nfe (
  `nReg` double unsigned NOT NULL ,
  `nCompra` double unsigned DEFAULT NULL,
  `NFeChave` varchar(44) DEFAULT NULL,
  `NFeNumero` double unsigned DEFAULT NULL,
  `NFeSerie` int(10) unsigned DEFAULT '1',
  `NFEStatus` tinyint(1) DEFAULT NULL COMMENT '''1=Autorizada.2=Cancelada.3=Inutilizada.4=Reinicializada''',
  `NFeAmbiente` tinyint(1) unsigned DEFAULT '2',
  `NFeNRecibo` varchar(45) DEFAULT NULL,
  `NFeProtocolo` varchar(45) DEFAULT NULL,
  `NFeDtHrProt` varchar(45) DEFAULT NULL,
  `NFeMotivo_CANC_INUT` varchar(250) DEFAULT NULL,
  `NFeObsLoja` varchar(500) DEFAULT NULL,
  `NfeObsFisco` varchar(500) DEFAULT NULL,
  `NFeLote` double unsigned DEFAULT NULL,
  `NFeIdLoteEvento` double unsigned DEFAULT '0' COMMENT 'Somente para lotes de eventos.',
  `NFeCNPJEmitente` varchar(14) NOT NULL DEFAULT '0' COMMENT 'As vezes usa-se cnpj de outras empresas',
  `LogDeAtividades` varchar(150),
  `modificacao` varchar(45) DEFAULT NULL,
  `data_modificacao` datetime DEFAULT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1;


drop trigger if exists auditoria_nfe_delete;
DELIMITER $$

create trigger auditoria_nfe_delete after delete on supermercado.nfe for each row
BEGIN

insert into auditoria_nfe select * , concat('delete'), now() from supermercado.nfe where Nfenumero = OLD.NfeNumero;

END;
$$
DELIMITER ;




CREATE TABLE supermercado.auditoria_nfe_cuponsreferenciados (
  `nCompra` double NOT NULL,
  `ModeloDocFiscal` varchar(3) NOT NULL DEFAULT '2D' COMMENT 'Conforme Manual do Contribuinte',
  `nECF` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Numero ECF',
  `nCOO` double unsigned DEFAULT NULL COMMENT 'COO do cupom fiscal',
  `nCCF` double unsigned NOT NULL DEFAULT '0' COMMENT 'CCF do cupom fiscal',
  `modificacao` varchar(45) DEFAULT NULL,
  `data_modificacao` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



drop trigger if exists auditoria_nfe_cuponsreferenciados_delete;
DELIMITER $$

create trigger auditoria_nfe_cuponsreferenciados_delete after delete on supermercado.nfe for each row
BEGIN

insert into auditoria_nfe_cuponsreferenciados select * , concat('delete'), now() from supermercado.nfe_cuponsreferenciados  where Ncompra = OLD.Ncompra;

END;
$$
DELIMITER ;

CREATE TABLE if not exists auditoria_nfe_notasreferenciadas (
  `nCompra` varchar(20) NOT NULL,
  `Data` datetime DEFAULT NULL,
  `NFeChave` varchar(44) NOT NULL DEFAULT '',
  `UFCod` varchar(2) DEFAULT NULL,
  `AnoMes` varchar(4) DEFAULT NULL COMMENT 'AAMM',
  `CNPJ` varchar(14) DEFAULT NULL,
  `Modelo` varchar(2) DEFAULT NULL,
  `Serie` varchar(6) DEFAULT NULL,
  `NumeroNota` varchar(12) DEFAULT NULL,
  `modificacao` varchar(45) DEFAULT NULL,
  `data_modificacao` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


drop trigger if exists auditoria_nfe_notasreferenciadas_delete;
DELIMITER $$

create trigger auditoria_nfe_notasreferenciadas_delete after delete on supermercado.nfe_notasreferenciadas for each row
BEGIN

insert into auditoria_nfe_notasreferenciadas select * , concat('delete'), now() from supermercado.nfe_notasreferenciadas  where Ncompra = OLD.Ncompra;

END;
$$
DELIMITER ;









