SELECT 
	  
	  ca.InsuranceType		

	 ,[HCPCS]
	  ,case
		when modifier1 not in ('A1','A2','A3','A4','A5','A6','A7','A8','A9','AX'
		,'AY','BP','BR','BU','CC','CR','CS','EA','EB','EC'
		,'EJ','EM','EY','FB','GA','GB','GK','GL','GS','GU'
		,'GW','GY','GZ','J4','JA','JB','K0','K1','K2','K3'
		,'K4','KA','KB','KD','KG','KH','KI','KJ','KK','KO'
		,'KP','KQ','KR','KS','KT','KV','KW','KX','KY','LR'
		,'LS','LT','M2','NB','PL','QE','QH','QJ','Q1','RA'
		,'RB','RT','VP','TD','GX','CG','QR','QA','SD','NU')

		then Modifier1 else 'NULL' end as 'Pricing Modifier1'

		,case
		when modifier2 not in ('A1','A2','A3','A4','A5','A6','A7','A8','A9','AX'
		,'AY','BP','BR','BU','CC','CR','CS','EA','EB','EC'
		,'EJ','EM','EY','FB','GA','GB','GK','GL','GS','GU'
		,'GW','GY','GZ','J4','JA','JB','K0','K1','K2','K3'
		,'K4','KA','KB','KD','KG','KH','KI','KJ','KK','KO'
		,'KP','KQ','KR','KS','KT','KV','KW','KX','KY','LR'
		,'LS','LT','M2','NB','PL','QE','QH','QJ','Q1','RA'
		,'RB','RT','VP','TD','GX','CG','QR','QA','SD','NU')

		then Modifier2 else 'NULL' end as 'Pricing Modifier2'
		
		,CASE 
		WHEN ci.Modifier1 = 'RR' or ci.Modifier1 = 'KH' or ci.Modifier1 = 'KI' or ci.Modifier1 = 'KJ' 
		or ci.Modifier2 = 'RR' or ci.Modifier2 = 'KH' or ci.Modifier2 = 'KI' or ci.Modifier2 = 'KJ' THEN 'RENTAL' ELSE 'PURCHASE'  END as 'Rental Ind'
      
      ,[PIHealthPlanFamily] as 'Family Plan'
      ,[PIPlanName] as 'Plan Name'
	  ,[OfficeName] as 'Provider'
     
	  ,sum([BilledUnits]) as 'Total Units'
      ,sum([Charge]) as 'Total Spend'
	  ,cast((round (Charge/BilledUnits,2)) as varchar) as 'ChargePerUnit'
	  ,sum([Paid]) as 'Total Paid'
	  ,sum([PAID+PR]) as 'Total Paid+PR'
	     
  FROM 
  [dbo].[vw_ClaimItemARAnalysis] as ci
  left join dbo.Claim as cl on ci.claim=cl.Claim 
  left join dbo.Office as o on ci.OfficeId=o.Office
  left join dbo.Carrier as ca on ci.Carrier=ca.Carrier

  where 
  IsMostRecentVersion=1
  and
  DOSFrom between '2021-01-01' and '2021-12-31'
  and
  ca.[InsuranceType] in ('Dual Enrollment','HMO','FIDA','Exchange','FS','Commercial','Medicare','Medicare Advantage')
  and
  ci.[HCPCS] in ('E2510','E2512','E2599','K0739')
  
  group by 
      ca.InsuranceType
	 ,cast((round (ci.charge/ci.BilledUnits,2)) as varchar)
	 ,ca.InsuranceType
	 ,[PIHealthPlanFamily] 
     ,[PIPlanName] 
	 ,[OfficeName]
     ,[HCPCS]
	  ,case
		when modifier1 not in ('A1','A2','A3','A4','A5','A6','A7','A8','A9','AX'
		,'AY','BP','BR','BU','CC','CR','CS','EA','EB','EC'
		,'EJ','EM','EY','FB','GA','GB','GK','GL','GS','GU'
		,'GW','GY','GZ','J4','JA','JB','K0','K1','K2','K3'
		,'K4','KA','KB','KD','KG','KH','KI','KJ','KK','KO'
		,'KP','KQ','KR','KS','KT','KV','KW','KX','KY','LR'
		,'LS','LT','M2','NB','PL','QE','QH','QJ','Q1','RA'
		,'RB','RT','VP','TD','GX','CG','QR','QA','SD','NU')

		then Modifier1 else 'NULL' end 
		,case
		when modifier2 not in ('A1','A2','A3','A4','A5','A6','A7','A8','A9','AX'
		,'AY','BP','BR','BU','CC','CR','CS','EA','EB','EC'
		,'EJ','EM','EY','FB','GA','GB','GK','GL','GS','GU'
		,'GW','GY','GZ','J4','JA','JB','K0','K1','K2','K3'
		,'K4','KA','KB','KD','KG','KH','KI','KJ','KK','KO'
		,'KP','KQ','KR','KS','KT','KV','KW','KX','KY','LR'
		,'LS','LT','M2','NB','PL','QE','QH','QJ','Q1','RA'
		,'RB','RT','VP','TD','GX','CG','QR','QA','SD','NU')

		then Modifier2 else 'NULL' end 
		
		,CASE 
		WHEN ci.Modifier1 = 'RR' or ci.Modifier1 = 'KH' or ci.Modifier1 = 'KI' or ci.Modifier1 = 'KJ' 
		or ci.Modifier2 = 'RR' or ci.Modifier2 = 'KH' or ci.Modifier2 = 'KI' or ci.Modifier2 = 'KJ' THEN 'RENTAL' ELSE 'PURCHASE'  END
	