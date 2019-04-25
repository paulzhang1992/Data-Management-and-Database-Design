-- MySQL dump 10.13  Distrib 8.0.15, for macos10.14 (x86_64)
--
-- Host: 155.138.214.24    Database: hyperparameter
-- ------------------------------------------------------
-- Server version	8.0.15

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `DP_hyperparameter`
--

DROP TABLE IF EXISTS `DP_hyperparameter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `DP_hyperparameter` (
  `model_id` varchar(64) NOT NULL,
  `nfolds` int(11) DEFAULT NULL,
  `fold_assignment` text,
  `fold_column` text,
  `score_each_iteration` text,
  `weights_column` text,
  `max_after_balance_size` double DEFAULT NULL,
  `max_confusion_matrix_size` int(11) DEFAULT NULL,
  `max_hit_ratio_k` int(11) DEFAULT NULL,
  `pretrained_autoencoder` text,
  `standardize` text,
  `activation` text,
  `epochs` double DEFAULT NULL,
  `train_samples_per_iteration` int(11) DEFAULT NULL,
  `seed` double DEFAULT NULL,
  `rho` double DEFAULT NULL,
  `epsilon` double DEFAULT NULL,
  `rate` double DEFAULT NULL,
  `rate_annealing` double DEFAULT NULL,
  `rate_decay` double DEFAULT NULL,
  `momentum_start` double DEFAULT NULL,
  `momentum_ramp` double DEFAULT NULL,
  `l1` double DEFAULT NULL,
  `l2` double DEFAULT NULL,
  `max_w2` double DEFAULT NULL,
  `initial_weight_distribution` text,
  `initial_weight_scale` double DEFAULT NULL,
  `initial_biases` text,
  `loss` text,
  `quantile_alpha` double DEFAULT NULL,
  `tweedie_power` double DEFAULT NULL,
  `score_interval` double DEFAULT NULL,
  `huber_alpha` double DEFAULT NULL,
  `score_training_samples` int(11) DEFAULT NULL,
  `score_validation_samples` int(11) DEFAULT NULL,
  `score_duty_cycle` double DEFAULT NULL,
  `stopping_rounds` int(11) DEFAULT NULL,
  `stopping_metric` text,
  `stopping_tolerance` double DEFAULT NULL,
  `max_runtime_secs` double DEFAULT NULL,
  `score_validation_sampling` text,
  `diagnostics` text,
  `fast_mode` text,
  `force_load_balance` text,
  `variable_importances` text,
  `single_node_mode` text,
  `quiet_mode` text,
  `autoencoder` text,
  `sparse` text,
  `col_major` text,
  `average_activation` double DEFAULT NULL,
  `sparsity_beta` double DEFAULT NULL,
  `reproducible` text,
  `export_weights_and_biases` text,
  `mini_batch_size` int(11) DEFAULT NULL,
  `categorical_encoding` text,
  `elastic_averaging` text,
  `elastic_averaging_moving_rate` double DEFAULT NULL,
  `elastic_averaging_regularization` double DEFAULT NULL,
  PRIMARY KEY (`model_id`),
  UNIQUE KEY `DP_hyperparameter_model_id_uindex` (`model_id`),
  CONSTRAINT `DP_hyperparameter_model_data_model_id_fk` FOREIGN KEY (`model_id`) REFERENCES `model_data` (`model_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DP_hyperparameter`
--

LOCK TABLES `DP_hyperparameter` WRITE;
/*!40000 ALTER TABLE `DP_hyperparameter` DISABLE KEYS */;
INSERT INTO `DP_hyperparameter` VALUES ('DeepLearning_1_AutoML_20190415_212612',5,'Modulo','null','false','null',5,20,0,'null','true','Rectifier',10.405704558705725,-2,1.0486661601112082e18,0.99,0.00000001,0.005,0.000001,1,0,1000000,0,0,3.4028235e38,'\"UniformAdaptive\"',1,'null','Automatic',0.5,1.5,5,0.9,10000,0,0.1,0,'deviance',0.006802091556591675,0,'Uniform','true','true','true','true','false','false','false','false','false',0,0,'false','false',1,'AUTO','false',0.9,0.001),('DeepLearning_1_AutoML_20190416_102359',5,'Modulo','null','false','null',5,20,0,'null','true','Rectifier',10.397793001965905,-2,-7.615084943679764e18,0.99,0.00000001,0.005,0.000001,1,0,1000000,0,0,3.4028235e38,'\"UniformAdaptive\"',1,'null','Automatic',0.5,1.5,5,0.9,10000,0,0.1,0,'deviance',0.006802091556591675,0,'Uniform','true','true','true','true','false','false','false','false','false',0,0,'false','false',1,'AUTO','false',0.9,0.001),('DeepLearning_1_AutoML_20190416_112303',5,'Modulo','null','false','null',5,20,0,'null','true','Rectifier',10.401621632144538,-2,-2.923272195081756e18,0.99,0.00000001,0.005,0.000001,1,0,1000000,0,0,3.4028235e38,'\"UniformAdaptive\"',1,'null','Automatic',0.5,1.5,5,0.9,10000,0,0.1,0,'deviance',0.006802091556591675,0,'Uniform','true','true','true','true','false','false','false','false','false',0,0,'false','false',1,'AUTO','false',0.9,0.001),('DeepLearning_grid_1_AutoML_20190416_102359_model_1',5,'Modulo','null','false','null',5,20,0,'null','true','RectifierWithDropout',0.5177583961594505,-2,-1.4972953924935864e18,0.95,0.000001,0.005,0.000001,1,0,1000000,0,0,3.4028235e38,'\"UniformAdaptive\"',1,'null','Automatic',0.5,1.5,5,0.9,10000,0,0.1,0,'deviance',0.006802091556591675,0,'Uniform','true','true','true','true','false','false','false','false','false',0,0,'false','false',1,'AUTO','false',0.9,0.001),('DeepLearning_grid_1_AutoML_20190416_102359_model_2',5,'Modulo','null','false','null',5,20,0,'null','true','RectifierWithDropout',0.548790104969742,-2,-4.2852395399769146e17,0.95,0.0000001,0.005,0.000001,1,0,1000000,0,0,3.4028235e38,'\"UniformAdaptive\"',1,'null','Automatic',0.5,1.5,5,0.9,10000,0,0.1,0,'deviance',0.006802091556591675,0,'Uniform','true','true','true','true','false','false','false','false','false',0,0,'false','false',1,'AUTO','false',0.9,0.001),('DeepLearning_grid_1_AutoML_20190416_102359_model_3',5,'Modulo','null','false','null',5,20,0,'null','true','RectifierWithDropout',9.388331199557241,-2,7.369419992095606e18,0.95,0.0000001,0.005,0.000001,1,0,1000000,0,0,3.4028235e38,'\"UniformAdaptive\"',1,'null','Automatic',0.5,1.5,5,0.9,10000,0,0.1,0,'deviance',0.006802091556591675,0,'Uniform','true','true','true','true','false','false','false','false','false',0,0,'false','false',1,'AUTO','false',0.9,0.001),('DeepLearning_grid_1_AutoML_20190416_112303_model_1',5,'Modulo','null','false','null',5,20,0,'null','true','RectifierWithDropout',41.559104553935875,-2,9.211647225475309e18,0.95,0.00000001,0.005,0.000001,1,0,1000000,0,0,3.4028235e38,'\"UniformAdaptive\"',1,'null','Automatic',0.5,1.5,5,0.9,10000,0,0.1,0,'deviance',0.006802091556591675,0,'Uniform','true','true','true','true','false','false','false','false','false',0,0,'false','false',1,'AUTO','false',0.9,0.001),('DeepLearning_grid_1_AutoML_20190416_112303_model_2',5,'Modulo','null','false','null',5,20,0,'null','true','RectifierWithDropout',1.5937861434213962,-2,-3.920436634791016e18,0.99,0.00000001,0.005,0.000001,1,0,1000000,0,0,3.4028235e38,'\"UniformAdaptive\"',1,'null','Automatic',0.5,1.5,5,0.9,10000,0,0.1,0,'deviance',0.006802091556591675,0,'Uniform','true','true','true','true','false','false','false','false','false',0,0,'false','false',1,'AUTO','false',0.9,0.001),('DeepLearning_grid_1_AutoML_20190416_112303_model_3',5,'Modulo','null','false','null',5,20,0,'null','true','RectifierWithDropout',2.395306083504629,-2,6.981278339326843e18,0.95,0.000000001,0.005,0.000001,1,0,1000000,0,0,3.4028235e38,'\"UniformAdaptive\"',1,'null','Automatic',0.5,1.5,5,0.9,10000,0,0.1,0,'deviance',0.006802091556591675,0,'Uniform','true','true','true','true','false','false','false','false','false',0,0,'false','false',1,'AUTO','false',0.9,0.001),('DeepLearning_grid_1_AutoML_20190416_112303_model_4',5,'Modulo','null','false','null',5,20,0,'null','true','RectifierWithDropout',28.108171814427273,-2,4.076022894468757e18,0.99,0.000001,0.005,0.000001,1,0,1000000,0,0,3.4028235e38,'\"UniformAdaptive\"',1,'null','Automatic',0.5,1.5,5,0.9,10000,0,0.1,0,'deviance',0.006802091556591675,0,'Uniform','true','true','true','true','false','false','false','false','false',0,0,'false','false',1,'AUTO','false',0.9,0.001);
/*!40000 ALTER TABLE `DP_hyperparameter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DRF_hyperparameter`
--

DROP TABLE IF EXISTS `DRF_hyperparameter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `DRF_hyperparameter` (
  `model_id` varchar(64) NOT NULL,
  `nfolds` int(11) DEFAULT NULL,
  `score_tree_interval` int(11) DEFAULT NULL,
  `fold_assignment` text,
  `fold_column` text,
  `weights_column` text,
  `balance_classes` text,
  `class_sampling_factors` text,
  `max_after_balance_size` double DEFAULT NULL,
  `max_confusion_matrix_size` int(11) DEFAULT NULL,
  `max_hit_ratio_k` int(11) DEFAULT NULL,
  `ntrees` int(11) DEFAULT NULL,
  `max_depth` int(11) DEFAULT NULL,
  `min_rows` double DEFAULT NULL,
  `nbins` int(11) DEFAULT NULL,
  `nbins_top_level` int(11) DEFAULT NULL,
  `nbins_cats` int(11) DEFAULT NULL,
  `stopping_rounds` int(11) DEFAULT NULL,
  `stopping_metric` text,
  `stopping_tolerance` double DEFAULT NULL,
  `seed` double DEFAULT NULL,
  `mtries` int(11) DEFAULT NULL,
  `sample_rate` double DEFAULT NULL,
  `sample_rate_per_class` text,
  `min_split_improvement` double DEFAULT NULL,
  `histogram_type` text,
  `categorical_encoding` text,
  `distribution` text,
  PRIMARY KEY (`model_id`),
  UNIQUE KEY `DRF_hyperparameter_model_id_uindex` (`model_id`),
  CONSTRAINT `DRF_hyperparameter_model_data_model_id_fk` FOREIGN KEY (`model_id`) REFERENCES `model_data` (`model_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DRF_hyperparameter`
--

LOCK TABLES `DRF_hyperparameter` WRITE;
/*!40000 ALTER TABLE `DRF_hyperparameter` DISABLE KEYS */;
INSERT INTO `DRF_hyperparameter` VALUES ('DRF_1_AutoML_20190415_205714',5,0,'Modulo','null','null','false','null',5,20,0,50,20,1,20,1024,1024,0,'AUTO',0.006802091556591675,8.581272521533921e18,-1,0.6320000290870667,'null',0.00001,'AUTO','AUTO','gaussian'),('DRF_1_AutoML_20190415_211555',5,0,'Modulo','null','null','false','null',5,20,0,50,20,1,20,1024,1024,0,'AUTO',0.006802091556591675,3.5824720359989975e18,-1,0.6320000290870667,'null',0.00001,'AUTO','AUTO','gaussian'),('DRF_1_AutoML_20190415_212612',5,0,'Modulo','null','null','false','null',5,20,0,50,20,1,20,1024,1024,0,'AUTO',0.006802091556591675,8.103707241923509e18,-1,0.6320000290870667,'null',0.00001,'AUTO','AUTO','gaussian'),('DRF_1_AutoML_20190416_102359',5,0,'Modulo','null','null','false','null',5,20,0,45,20,1,20,1024,1024,0,'AUTO',0.006802091556591675,9.117191528931432e18,-1,0.6320000290870667,'null',0.00001,'AUTO','AUTO','gaussian'),('DRF_1_AutoML_20190416_112303',5,0,'Modulo','null','null','false','null',5,20,0,50,20,1,20,1024,1024,0,'AUTO',0.006802091556591675,-9.660782085406495e17,-1,0.6320000290870667,'null',0.00001,'AUTO','AUTO','gaussian');
/*!40000 ALTER TABLE `DRF_hyperparameter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `GBM_hyperparameter`
--

DROP TABLE IF EXISTS `GBM_hyperparameter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `GBM_hyperparameter` (
  `model_id` varchar(64) NOT NULL,
  `nfolds` int(11) DEFAULT NULL,
  `weights_column` text,
  `balance_classes` text,
  `max_after_balance_size` double DEFAULT NULL,
  `max_confusion_matrix_size` int(11) DEFAULT NULL,
  `max_hit_ratio_k` int(11) DEFAULT NULL,
  `ntrees` int(11) DEFAULT NULL,
  `max_depth` int(11) DEFAULT NULL,
  `min_rows` double DEFAULT NULL,
  `nbins` int(11) DEFAULT NULL,
  `nbins_top_level` int(11) DEFAULT NULL,
  `nbins_cats` int(11) DEFAULT NULL,
  `stopping_rounds` int(11) DEFAULT NULL,
  `stopping_metric` text,
  `stopping_tolerance` double DEFAULT NULL,
  `seed` double DEFAULT NULL,
  `learn_rate` double DEFAULT NULL,
  `learn_rate_annealing` double DEFAULT NULL,
  `distribution` text,
  `quantile_alpha` double DEFAULT NULL,
  `tweedie_power` double DEFAULT NULL,
  `huber_alpha` double DEFAULT NULL,
  `sample_rate` double DEFAULT NULL,
  `sample_rate_per_class` text,
  `min_split_improvement` double DEFAULT NULL,
  `histogram_type` text,
  `pred_noise_bandwidth` double DEFAULT NULL,
  `categorical_encoding` text,
  PRIMARY KEY (`model_id`),
  UNIQUE KEY `GBM_hyperparameter_model_id_uindex` (`model_id`),
  CONSTRAINT `GBM_hyperparameter_model_data_model_id_fk` FOREIGN KEY (`model_id`) REFERENCES `model_data` (`model_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `GBM_hyperparameter`
--

LOCK TABLES `GBM_hyperparameter` WRITE;
/*!40000 ALTER TABLE `GBM_hyperparameter` DISABLE KEYS */;
INSERT INTO `GBM_hyperparameter` VALUES ('GBM_1_AutoML_20190418_163635',5,'null','false',5,20,0,86,15,100,20,1024,1024,0,'deviance',0.006802091556591675,-4.295154864655339e18,0.1,1,'gaussian',0.5,1.5,0.9,0.8,'null',0.00001,'AUTO',0,'AUTO'),('GBM_1_AutoML_20190418_165439',5,'null','false',5,20,0,79,15,100,20,1024,1024,0,'deviance',0.006802091556591675,-8.956200382444347e17,0.1,1,'gaussian',0.5,1.5,0.9,0.8,'null',0.00001,'AUTO',0,'AUTO'),('GBM_1_AutoML_20190418_181012',5,'null','false',5,20,0,84,15,100,20,1024,1024,0,'deviance',0.006802091556591675,-4.5209994384550866e18,0.1,1,'gaussian',0.5,1.5,0.9,0.8,'null',0.00001,'AUTO',0,'AUTO'),('GBM_3_AutoML_20190418_163635',5,'null','false',5,20,0,86,15,100,20,1024,1024,0,'deviance',0.006802091556591675,-4.295154864655339e18,0.1,1,'gaussian',0.5,1.5,0.9,0.8,'null',0.00001,'AUTO',0,'AUTO'),('GBM_3_AutoML_20190418_165439',5,'null','false',5,20,0,79,15,100,20,1024,1024,0,'deviance',0.006802091556591675,-8.956200382444347e17,0.1,1,'gaussian',0.5,1.5,0.9,0.8,'null',0.00001,'AUTO',0,'AUTO'),('GBM_grid_1_AutoML_20190418_163635_model_1',5,'null','false',5,20,0,4,10,5,20,1024,1024,0,'deviance',0.006802091556591675,-2.5227322211094845e18,0.008,1,'gaussian',0.5,1.5,0.9,1,'null',0.00001,'AUTO',0,'AUTO'),('GBM_grid_1_AutoML_20190418_165439_model_1',5,'null','false',5,20,0,114,9,15,20,1024,1024,0,'deviance',0.006802091556591675,8.798085263549016e18,0.1,1,'gaussian',0.5,1.5,0.9,0.6,'null',0.0001,'AUTO',0,'AUTO'),('GBM_grid_1_AutoML_20190418_165439_model_2',5,'null','false',5,20,0,447,11,10,20,1024,1024,0,'deviance',0.006802091556591675,-7.381211768048002e18,0.001,1,'gaussian',0.5,1.5,0.9,0.9,'null',0.0001,'AUTO',0,'AUTO'),('GBM_grid_1_AutoML_20190418_172432_model_2',5,'null','false',5,20,0,115,10,10,20,1024,1024,0,'deviance',0.006802091556591675,5.533495044660121e18,0.08,1,'gaussian',0.5,1.5,0.9,0.8,'null',0.0001,'AUTO',0,'AUTO'),('GBM_grid_1_AutoML_20190418_172432_model_4',5,'null','false',5,20,0,159,4,15,20,1024,1024,0,'deviance',0.006802091556591675,5.082247484933305e18,0.1,1,'gaussian',0.5,1.5,0.9,0.5,'null',0.0001,'AUTO',0,'AUTO');
/*!40000 ALTER TABLE `GBM_hyperparameter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `GLM_hyperparameter`
--

DROP TABLE IF EXISTS `GLM_hyperparameter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `GLM_hyperparameter` (
  `model_id` varchar(64) NOT NULL,
  `nfolds` int(11) DEFAULT NULL,
  `seed` double DEFAULT NULL,
  `fold_assignment` text,
  `fold_column` text,
  `offset_column` text,
  `weights_column` text,
  `tweedie_variance_power` double DEFAULT NULL,
  `tweedie_link_power` double DEFAULT NULL,
  `solver` text,
  `alpha_1` double DEFAULT NULL,
  `alpha_2` double DEFAULT NULL,
  `alpha_3` double DEFAULT NULL,
  `alpha_4` double DEFAULT NULL,
  `alpha_5` double DEFAULT NULL,
  `alpha_6` double DEFAULT NULL,
  `lambda_1` double DEFAULT NULL,
  `lambda_2` double DEFAULT NULL,
  `lambda_3` double DEFAULT NULL,
  `lambda_4` double DEFAULT NULL,
  `lambda_5` double DEFAULT NULL,
  `lambda_search` text,
  `early_stopping` text,
  `nlambdas` int(11) DEFAULT NULL,
  `standardize` text,
  `missing_values_handling` text,
  `max_iterations` int(11) DEFAULT NULL,
  `objective_epsilon` double DEFAULT NULL,
  `beta_epsilon` double DEFAULT NULL,
  `gradient_epsilon` double DEFAULT NULL,
  `link` text,
  `prior` double DEFAULT NULL,
  `lambda_min_ratio` double DEFAULT NULL,
  `interactions` text,
  `max_after_balance_size` double DEFAULT NULL,
  `max_confusion_matrix_size` int(11) DEFAULT NULL,
  `max_hit_ratio_k` int(11) DEFAULT NULL,
  `max_runtime_secs` double DEFAULT NULL,
  PRIMARY KEY (`model_id`),
  UNIQUE KEY `GLM_hyperparameter_model_id_uindex` (`model_id`),
  CONSTRAINT `GLM_hyperparameter_model_data_model_id_fk` FOREIGN KEY (`model_id`) REFERENCES `model_data` (`model_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `GLM_hyperparameter`
--

LOCK TABLES `GLM_hyperparameter` WRITE;
/*!40000 ALTER TABLE `GLM_hyperparameter` DISABLE KEYS */;
INSERT INTO `GLM_hyperparameter` VALUES ('GLM_grid_1_AutoML_20190416_112303_model_1',5,8.545980703075643e18,'Modulo','null','null','null',0,1,'COORDINATE_DESCENT',0,0.2,0.4,0.6,0.8,1,25789241.536127478,16015555.912468724,9945931.555454643,6176591.998831225,3835768.2744260547,'true','true',30,'true','MeanImputation',300,0.0001,0.0001,0.0000010000000000000002,'identity',-1,0.0000010000000000000002,'null',5,20,0,11.333333333333334);
/*!40000 ALTER TABLE `GLM_hyperparameter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `XRT_hyperparameter`
--

DROP TABLE IF EXISTS `XRT_hyperparameter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `XRT_hyperparameter` (
  `model_id` varchar(64) NOT NULL,
  `nfolds` int(11) DEFAULT NULL,
  `score_each_iteration` text,
  `score_tree_interval` int(11) DEFAULT NULL,
  `fold_assignment` text,
  `fold_column` text,
  `offset_column` text,
  `weights_column` text,
  `balance_classes` text,
  `max_after_balance_size` double DEFAULT NULL,
  `max_confusion_matrix_size` int(11) DEFAULT NULL,
  `max_hit_ratio_k` int(11) DEFAULT NULL,
  `ntrees` int(11) DEFAULT NULL,
  `max_depth` int(11) DEFAULT NULL,
  `min_rows` double DEFAULT NULL,
  `nbins` int(11) DEFAULT NULL,
  `nbins_top_level` int(11) DEFAULT NULL,
  `nbins_cats` int(11) DEFAULT NULL,
  `stopping_rounds` int(11) DEFAULT NULL,
  `stopping_metric` text,
  `stopping_tolerance` double DEFAULT NULL,
  `seed` double DEFAULT NULL,
  `sample_rate` double DEFAULT NULL,
  `sample_rate_per_class` text,
  `histogram_type` text,
  `categorical_encoding` text,
  `distribution` text,
  PRIMARY KEY (`model_id`),
  UNIQUE KEY `XRT_hyperparameter_model_id_uindex` (`model_id`),
  CONSTRAINT `XRT_hyperparameter_model_data_model_id_fk` FOREIGN KEY (`model_id`) REFERENCES `model_data` (`model_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `XRT_hyperparameter`
--

LOCK TABLES `XRT_hyperparameter` WRITE;
/*!40000 ALTER TABLE `XRT_hyperparameter` DISABLE KEYS */;
INSERT INTO `XRT_hyperparameter` VALUES ('XRT_1_AutoML_20190415_212612',5,'false',0,'Modulo','null','null','null','false',5,20,0,50,20,1,20,1024,1024,0,'deviance',0.006802091556591675,-9.114167429941751e18,0.6320000290870667,'null','Random','AUTO','gaussian'),('XRT_1_AutoML_20190416_102359',5,'false',0,'Modulo','null','null','null','false',5,20,0,50,20,1,20,1024,1024,0,'deviance',0.006802091556591675,-8.937748868663764e17,0.6320000290870667,'null','Random','AUTO','gaussian'),('XRT_1_AutoML_20190416_112303',5,'false',0,'Modulo','null','null','null','false',5,20,0,50,20,1,20,1024,1024,0,'deviance',0.006802091556591675,3.9565223682620923e18,0.6320000290870667,'null','Random','AUTO','gaussian');
/*!40000 ALTER TABLE `XRT_hyperparameter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `data_info`
--

DROP TABLE IF EXISTS `data_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `data_info` (
  `data_id` int(11) NOT NULL,
  `data_name` text,
  `url` text,
  `row_count` int(11) DEFAULT NULL,
  `column_count` int(11) DEFAULT NULL,
  `type` text,
  PRIMARY KEY (`data_id`),
  UNIQUE KEY `data_info_data_id_uindex` (`data_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_info`
--

LOCK TABLES `data_info` WRITE;
/*!40000 ALTER TABLE `data_info` DISABLE KEYS */;
INSERT INTO `data_info` VALUES (1,'housing price','https://www.kaggle.com/harlfoxem/housesalesprediction',21613,21,'regression');
/*!40000 ALTER TABLE `data_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `leaderboard`
--

DROP TABLE IF EXISTS `leaderboard`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `leaderboard` (
  `model_id` varchar(64) NOT NULL,
  `mean_residual_deviance` double DEFAULT NULL,
  `rmse` int(11) DEFAULT NULL,
  `mse` double DEFAULT NULL,
  `mae` double DEFAULT NULL,
  `rmsle` text,
  PRIMARY KEY (`model_id`),
  UNIQUE KEY `leaderboard_model_id_uindex` (`model_id`),
  CONSTRAINT `leaderboard_model_data_model_id_fk` FOREIGN KEY (`model_id`) REFERENCES `model_data` (`model_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leaderboard`
--

LOCK TABLES `leaderboard` WRITE;
/*!40000 ALTER TABLE `leaderboard` DISABLE KEYS */;
INSERT INTO `leaderboard` VALUES ('DeepLearning_1_AutoML_20190415_212612',20011900000,141464,20011900000,84587.3,'0.206921'),('DeepLearning_1_AutoML_20190416_102359',20675200000,143789,20675200000,85999.9,'0.212836'),('DeepLearning_1_AutoML_20190416_112303',18763300000,136979,18763300000,82113.8,'0.202561'),('DeepLearning_grid_1_AutoML_20190416_102359_model_1',24231800000,155666,24231800000,93651.4,'nan'),('DeepLearning_grid_1_AutoML_20190416_102359_model_2',24373500000,156120,24373500000,89142.7,'0.210536'),('DeepLearning_grid_1_AutoML_20190416_102359_model_3',35496600000,188405,35496600000,149634,'0.382594'),('DeepLearning_grid_1_AutoML_20190416_112303_model_1',22604400000,150348,22604400000,87370.5,'nan'),('DeepLearning_grid_1_AutoML_20190416_112303_model_2',34862700000,186716,34862700000,115077,'0.260986'),('DeepLearning_grid_1_AutoML_20190416_112303_model_3',35139000000,187454,35139000000,117240,'nan'),('DeepLearning_grid_1_AutoML_20190416_112303_model_4',54144200000,232689,54144200000,180727,'0.460172'),('DRF_1_AutoML_20190415_205714',26169800000,161771,26169800000,83389,'0.200014'),('DRF_1_AutoML_20190415_211555',27940300000,167153,27940300000,84201,'0.20076'),('DRF_1_AutoML_20190415_212612',26827000000,163790,26827000000,83899.9,'0.200731'),('DRF_1_AutoML_20190416_102359',26824200000,163781,26824200000,84240.3,'0.201843'),('DRF_1_AutoML_20190416_112303',26968700000,164222,26968700000,83523.4,'0.200045'),('GBM_1_AutoML_20190418_163635',24080900000,155180,24080900000,80867.7,'0.193501'),('GBM_1_AutoML_20190418_165439',23652300000,153793,23652300000,79508.1,'0.19084'),('GBM_1_AutoML_20190418_181012',21499300000,146626,21499300000,78066.7,'0.189221'),('GBM_3_AutoML_20190418_163635',25264600000,158948,25264600000,81713.8,'0.195259'),('GBM_3_AutoML_20190418_165439',23826700000,154359,23826700000,80473.1,'0.193682'),('GBM_grid_1_AutoML_20190418_163635_model_1',128663000000,358697,128663000000,227769,'0.533564'),('GBM_grid_1_AutoML_20190418_165439_model_1',20425600000,142918,20425600000,76652.1,'0.186732'),('GBM_grid_1_AutoML_20190418_165439_model_2',82503200000,287234,82503200000,176352,'0.421342'),('GBM_grid_1_AutoML_20190418_172432_model_2',20059400000,141631,20059400000,75119.6,'0.183657'),('GBM_grid_1_AutoML_20190418_172432_model_4',22196000000,148983,22196000000,81623.4,'0.197885'),('GLM_grid_1_AutoML_20190416_112303_model_1',134955000000,367363,134955000000,234075,'0.548253'),('StackedEnsemble_AllModels_AutoML_20190416_102359',128433000000,358375,128433000000,227757,'0.533376'),('StackedEnsemble_AllModels_AutoML_20190416_112303',126739000000,356004,126739000000,226016,'0.529407'),('StackedEnsemble_BestOfFamily_AutoML_20190416_102359',132847000000,364482,132847000000,232074,'0.543471'),('StackedEnsemble_BestOfFamily_AutoML_20190416_112303',132832000000,364461,132832000000,232061,'0.543442'),('XRT_1_AutoML_20190415_212612',17626500000,132765,17626500000,73268.3,'0.183189'),('XRT_1_AutoML_20190416_102359',18302900000,135288,18302900000,73472.3,'0.184148'),('XRT_1_AutoML_20190416_112303',17680900000,132969,17680900000,73008.3,'0.183129');
/*!40000 ALTER TABLE `leaderboard` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `metadata`
--

DROP TABLE IF EXISTS `metadata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `metadata` (
  `column_name` varchar(64) NOT NULL,
  `data_type` text,
  `variable_type` text,
  `data_set_id` int(11) NOT NULL,
  PRIMARY KEY (`column_name`),
  UNIQUE KEY `metadata_column_name_uindex` (`column_name`),
  KEY `metadata_data_info_data_id_fk` (`data_set_id`),
  CONSTRAINT `metadata_data_info_data_id_fk` FOREIGN KEY (`data_set_id`) REFERENCES `data_info` (`data_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `metadata`
--

LOCK TABLES `metadata` WRITE;
/*!40000 ALTER TABLE `metadata` DISABLE KEYS */;
INSERT INTO `metadata` VALUES ('bathrooms','float64','Independent',1),('bedrooms','int64','Independent',1),('condition','int64','Independent',1),('date','object','Independent',1),('floors','float64','Independent',1),('grade','int64','Independent',1),('id','int64','Independent',1),('lat','float64','Independent',1),('long','float64','Independent',1),('price','int64','Dependent',1),('sqft_above','int64','Independent',1),('sqft_basement','int64','Independent',1),('sqft_living','int64','Independent',1),('sqft_living15','int64','Independent',1),('sqft_lot','int64','Independent',1),('sqft_lot15','int64','Independent',1),('view','int64','Independent',1),('waterfront','int64','Independent',1),('yr_built','int64','Independent',1),('yr_renovated','int64','Independent',1),('zipcode','int64','Independent',1);
/*!40000 ALTER TABLE `metadata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `model_data`
--

DROP TABLE IF EXISTS `model_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `model_data` (
  `model_id` varchar(64) NOT NULL,
  `data_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`model_id`),
  UNIQUE KEY `model_data_model_id_uindex` (`model_id`),
  KEY `model_data_data_info_data_id_fk` (`data_id`),
  CONSTRAINT `model_data_data_info_data_id_fk` FOREIGN KEY (`data_id`) REFERENCES `data_info` (`data_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `model_data`
--

LOCK TABLES `model_data` WRITE;
/*!40000 ALTER TABLE `model_data` DISABLE KEYS */;
INSERT INTO `model_data` VALUES ('DeepLearning_1_AutoML_20190415_212612',1),('DeepLearning_1_AutoML_20190416_102359',1),('DeepLearning_1_AutoML_20190416_112303',1),('DeepLearning_grid_1_AutoML_20190416_102359_model_1',1),('DeepLearning_grid_1_AutoML_20190416_102359_model_2',1),('DeepLearning_grid_1_AutoML_20190416_102359_model_3',1),('DeepLearning_grid_1_AutoML_20190416_112303_model_1',1),('DeepLearning_grid_1_AutoML_20190416_112303_model_2',1),('DeepLearning_grid_1_AutoML_20190416_112303_model_3',1),('DeepLearning_grid_1_AutoML_20190416_112303_model_4',1),('DRF_1_AutoML_20190415_205714',1),('DRF_1_AutoML_20190415_211555',1),('DRF_1_AutoML_20190415_212612',1),('DRF_1_AutoML_20190416_102359',1),('DRF_1_AutoML_20190416_112303',1),('GBM_1_AutoML_20190418_163635',1),('GBM_1_AutoML_20190418_165439',1),('GBM_1_AutoML_20190418_181012',1),('GBM_3_AutoML_20190418_163635',1),('GBM_3_AutoML_20190418_165439',1),('GBM_grid_1_AutoML_20190418_163635_model_1',1),('GBM_grid_1_AutoML_20190418_165439_model_1',1),('GBM_grid_1_AutoML_20190418_165439_model_2',1),('GBM_grid_1_AutoML_20190418_172432_model_2',1),('GBM_grid_1_AutoML_20190418_172432_model_4',1),('GLM_grid_1_AutoML_20190416_112303_model_1',1),('StackedEnsemble_AllModels_AutoML_20190416_102359',1),('StackedEnsemble_AllModels_AutoML_20190416_112303',1),('StackedEnsemble_BestOfFamily_AutoML_20190416_102359',1),('StackedEnsemble_BestOfFamily_AutoML_20190416_112303',1),('XRT_1_AutoML_20190415_212612',1),('XRT_1_AutoML_20190416_102359',1),('XRT_1_AutoML_20190416_112303',1);
/*!40000 ALTER TABLE `model_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stacked_ensemble_hyperparameter`
--

DROP TABLE IF EXISTS `stacked_ensemble_hyperparameter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `stacked_ensemble_hyperparameter` (
  `model_id` varchar(64) NOT NULL,
  `metalearner_algorithm` text,
  `metalearner_nfolds` int(11) DEFAULT NULL,
  `metalearner_fold_assignment` text,
  `metalearner_fold_column` text,
  `keep_levelone_frame` text,
  `metalearner_params` text,
  `seed` double DEFAULT NULL,
  PRIMARY KEY (`model_id`),
  UNIQUE KEY `stacked_ensemble_hyperparameter_model_id_uindex` (`model_id`),
  CONSTRAINT `stacked_ensemble_hyperparameter_model_data_model_id_fk` FOREIGN KEY (`model_id`) REFERENCES `model_data` (`model_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stacked_ensemble_hyperparameter`
--

LOCK TABLES `stacked_ensemble_hyperparameter` WRITE;
/*!40000 ALTER TABLE `stacked_ensemble_hyperparameter` DISABLE KEYS */;
INSERT INTO `stacked_ensemble_hyperparameter` VALUES ('StackedEnsemble_AllModels_AutoML_20190416_102359','AUTO',5,'null','null','true',NULL,3.990829087418305e18),('StackedEnsemble_AllModels_AutoML_20190416_112303','AUTO',5,'null','null','true',NULL,4.024451812177012e18),('StackedEnsemble_BestOfFamily_AutoML_20190416_102359','AUTO',5,'null','null','true',NULL,6.590702504966973e18);
/*!40000 ALTER TABLE `stacked_ensemble_hyperparameter` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-04-21 12:57:50
