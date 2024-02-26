DROP TABLE IF EXISTS ESG1; 

CREATE TABLE ESG1 (
	Ticker VARCHAR(4), 
	ISIN VARCHAR(12), 
	Industry VARCHAR(50), 
	TR_AnalyticCO2 DECIMAL(5,2), 
	TR_AnalyticTotalWaste DECIMAL(5,2), 
	TR_EnvProducts DECIMAL(5,2), 
	TR_AnalyticEnvRND DECIMAL(5,2), 
	TR_AnalyticWaterUse DECIMAL(5,2), 
	TR_AnalyticEnergyUse DECIMAL(5,2), 
	TR_PolicyHumanRights DECIMAL(5,2), 
	TR_PolicyResponsibleMarketing DECIMAL(5,2), 
	TR_ProductQualityMonitoring DECIMAL(5,2), 
	TR_PolicyDataPrivacy DECIMAL(5,2), 
	TR_WomenEmployees DECIMAL(5,2), 
	TR_AvgTrainingHours DECIMAL(5,2), 
	TR_TradeUnionRep DECIMAL(5,2), 
	TR_AnalyticLostDays DECIMAL(5,2));
