CREATE DATABASE  IF NOT EXISTS `imobiliaria` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `imobiliaria`;
-- MySQL dump 10.13  Distrib 5.6.13, for Win32 (x86)
--
-- Host: localhost    Database: imobiliaria
-- ------------------------------------------------------
-- Server version	5.6.15-log

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
-- Table structure for table `aluguel`
--

DROP TABLE IF EXISTS `aluguel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aluguel` (
  `datafim` datetime NOT NULL,
  `diavencimento` int(11) NOT NULL,
  `id` bigint(20) NOT NULL,
  `id_fiador` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_31cvlm42rj5cb98p7txnjiqi1` (`id_fiador`),
  CONSTRAINT `FK_31cvlm42rj5cb98p7txnjiqi1` FOREIGN KEY (`id_fiador`) REFERENCES `fiador` (`id`),
  CONSTRAINT `FK_830aa2xykk1cwsg1tr7s2pneu` FOREIGN KEY (`id`) REFERENCES `transacao` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aluguel`
--

LOCK TABLES `aluguel` WRITE;
/*!40000 ALTER TABLE `aluguel` DISABLE KEYS */;
/*!40000 ALTER TABLE `aluguel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fiador`
--

DROP TABLE IF EXISTS `fiador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fiador` (
  `renda` decimal(19,2) NOT NULL,
  `id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `FK_28x88gjt7kfpglejsmodtp58x` FOREIGN KEY (`id`) REFERENCES `pessoafisica` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fiador`
--

LOCK TABLES `fiador` WRITE;
/*!40000 ALTER TABLE `fiador` DISABLE KEYS */;
INSERT INTO `fiador` VALUES (2000.00,4),(1500.00,5),(3000.00,6),(2000.00,11),(5000.00,18),(5000.05,20);
/*!40000 ALTER TABLE `fiador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `funcionario`
--

DROP TABLE IF EXISTS `funcionario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `funcionario` (
  `login` varchar(255) NOT NULL,
  `senha` varchar(255) NOT NULL,
  `id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `FK_a6sbw8sa6y2an94gvff30rmbq` FOREIGN KEY (`id`) REFERENCES `pessoafisica` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `funcionario`
--

LOCK TABLES `funcionario` WRITE;
/*!40000 ALTER TABLE `funcionario` DISABLE KEYS */;
INSERT INTO `funcionario` VALUES ('admin','admin',14);
/*!40000 ALTER TABLE `funcionario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `imovel`
--

DROP TABLE IF EXISTS `imovel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `imovel` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `bairro` varchar(255) NOT NULL,
  `banheiros` int(11) NOT NULL,
  `cep` varchar(255) NOT NULL,
  `cidade` varchar(255) NOT NULL,
  `endereco` varchar(255) NOT NULL,
  `finalidade` varchar(255) NOT NULL,
  `numeroescritura` varchar(255) NOT NULL,
  `quartos` int(11) NOT NULL,
  `salas` int(11) NOT NULL,
  `situacao` varchar(255) NOT NULL,
  `tamanho` varchar(255) NOT NULL,
  `tipoimovel` varchar(255) NOT NULL,
  `uf` varchar(255) NOT NULL,
  `vagasgaragem` int(11) NOT NULL,
  `valorimovel` decimal(19,2) NOT NULL,
  `valoriptu` decimal(19,2) NOT NULL,
  `id_propietario` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_b4il97703gyj4sk68ldqtdmm4` (`id_propietario`),
  CONSTRAINT `FK_b4il97703gyj4sk68ldqtdmm4` FOREIGN KEY (`id_propietario`) REFERENCES `pessoa` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imovel`
--

LOCK TABLES `imovel` WRITE;
/*!40000 ALTER TABLE `imovel` DISABLE KEYS */;
INSERT INTO `imovel` VALUES (1,'Passos',3,'36021-630','juiz de fora','Av. BarÃ£o do Rio Branco','Residencial','156168448',3,1,'locacao','300','Apartamento','MG',2,350000.00,2000.00,4),(2,'Centro',2,'36258-965','juiz de fora','Av. Independecia','Residencial','16516561',2,2,'venda','500','Apartamento','MG',1,150000.00,3000.00,5),(3,'Centro',2,'36254-852','Juz de Fora','Galeria Pintias GuimarÃ£es','residencial','51564848910',2,2,'venda','500','Apartamento','MG',2,500000.00,5000.00,8);
/*!40000 ALTER TABLE `imovel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pagamento`
--

DROP TABLE IF EXISTS `pagamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pagamento` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `codcontacorrente` int(11) NOT NULL,
  `datapagamento` datetime NOT NULL,
  `datavencimento` datetime NOT NULL,
  `juros` decimal(19,2) NOT NULL,
  `multa` decimal(19,2) NOT NULL,
  `valor` decimal(19,2) NOT NULL,
  `id_transacao` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_k9w4t5ir6ygcoelhmfb347ltl` (`id_transacao`),
  CONSTRAINT `FK_k9w4t5ir6ygcoelhmfb347ltl` FOREIGN KEY (`id_transacao`) REFERENCES `transacao` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pagamento`
--

LOCK TABLES `pagamento` WRITE;
/*!40000 ALTER TABLE `pagamento` DISABLE KEYS */;
/*!40000 ALTER TABLE `pagamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pessoa`
--

DROP TABLE IF EXISTS `pessoa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pessoa` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `telefone` varchar(255) NOT NULL,
  `tipopessoa` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pessoa`
--

LOCK TABLES `pessoa` WRITE;
/*!40000 ALTER TABLE `pessoa` DISABLE KEYS */;
INSERT INTO `pessoa` VALUES (1,'zigbertelli@hotmail.com','Diego','9144-7717','fisica'),(2,'rafaelunianalise@hotmail.com','Rafael','9144-8574','fisica'),(4,'teste@mail.com','Teste','(32) 8855-55632','fisica'),(5,'rafael@mail.com','Rafael','(32) 8855-5214','fisica'),(6,'zigbertelli@hotmail.co','Bertelli','(32) 8855-5527','fisica'),(8,'rdjhavjhdfvj','gstgsgs','(32) 8855-5214','juridica'),(11,'xuxu@gmail.com','Massaranduba','9574-8577','fisica'),(14,'admin@hotmail.com','Administrador','9144-7717','fisica'),(18,'vivi@mail','Vivian Campos Damasceno','Av. BarÃÂÃÂÃÂÃÂ£o do Rio Branco','fisica'),(19,'xande@mail.com','Alexandre','3241511615','fisica'),(20,'raul@mail.com','Raul ','(13) 151-3153','fisica');
/*!40000 ALTER TABLE `pessoa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pessoafisica`
--

DROP TABLE IF EXISTS `pessoafisica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pessoafisica` (
  `cpf` varchar(255) NOT NULL,
  `datanascimento` datetime NOT NULL,
  `rg` varchar(255) NOT NULL,
  `sexo` varchar(255) NOT NULL,
  `id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `FK_3s3u6jjld170yu1mm3rp1p0hn` FOREIGN KEY (`id`) REFERENCES `pessoa` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pessoafisica`
--

LOCK TABLES `pessoafisica` WRITE;
/*!40000 ALTER TABLE `pessoafisica` DISABLE KEYS */;
INSERT INTO `pessoafisica` VALUES ('44324461538','2010-01-01 22:04:00','56156115','masculino',4),('13765353434','2000-01-01 22:04:00','51518951','masculino',5),('76384862778','1985-01-01 21:02:00','51818159','masculino',6),('85508389857','1853-01-13 21:03:00','5165816851','masculino',11),('25147895625','1986-01-13 22:05:00','25154889','masculino',14),('35144671454','1985-01-11 21:02:00','16516666','feminino',18),('21335','1988-01-14 22:04:00','15516165','masculino',19),('642-815-305.09','2013-01-10 22:03:00','25156165165','masculino',20);
/*!40000 ALTER TABLE `pessoafisica` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pessoajuridica`
--

DROP TABLE IF EXISTS `pessoajuridica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pessoajuridica` (
  `cnpj` varchar(255) NOT NULL,
  `ie` varchar(255) NOT NULL,
  `razaosocial` varchar(255) NOT NULL,
  `id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `FK_dv63ipgblx38roirema6io3jn` FOREIGN KEY (`id`) REFERENCES `pessoa` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pessoajuridica`
--

LOCK TABLES `pessoajuridica` WRITE;
/*!40000 ALTER TABLE `pessoajuridica` DISABLE KEYS */;
INSERT INTO `pessoajuridica` VALUES ('48304157000137','5616564','DiskNet',8);
/*!40000 ALTER TABLE `pessoajuridica` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transacao`
--

DROP TABLE IF EXISTS `transacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transacao` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `data` datetime NOT NULL,
  `valor` decimal(19,2) NOT NULL,
  `id_cliente` bigint(20) NOT NULL,
  `id_funcionario` bigint(20) NOT NULL,
  `id_imovel` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_c748xk6oppta0exw33gk3pd8c` (`id_cliente`),
  KEY `FK_kqiibffc5xc3rkbf7i09cm3xj` (`id_funcionario`),
  KEY `FK_otnoamsel73x7vyunmr5ym6cg` (`id_imovel`),
  CONSTRAINT `FK_c748xk6oppta0exw33gk3pd8c` FOREIGN KEY (`id_cliente`) REFERENCES `pessoa` (`id`),
  CONSTRAINT `FK_kqiibffc5xc3rkbf7i09cm3xj` FOREIGN KEY (`id_funcionario`) REFERENCES `funcionario` (`id`),
  CONSTRAINT `FK_otnoamsel73x7vyunmr5ym6cg` FOREIGN KEY (`id_imovel`) REFERENCES `imovel` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transacao`
--

LOCK TABLES `transacao` WRITE;
/*!40000 ALTER TABLE `transacao` DISABLE KEYS */;
/*!40000 ALTER TABLE `transacao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `venda`
--

DROP TABLE IF EXISTS `venda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `venda` (
  `financeira` varchar(255) NOT NULL,
  `parcelas` int(11) NOT NULL,
  `id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `FK_mtgb4hfc1cgf63qx76qdxdmad` FOREIGN KEY (`id`) REFERENCES `transacao` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `venda`
--

LOCK TABLES `venda` WRITE;
/*!40000 ALTER TABLE `venda` DISABLE KEYS */;
/*!40000 ALTER TABLE `venda` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-08-15 21:14:47
