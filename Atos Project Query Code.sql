SELECT 
	   [HCPCS]
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

	  ,OrgName
	  ,OfficeName
      ,SUM([BilledUnits]) as "Total Billed Units"
      ,SUM([Charge]) as "Total Charge"
	  ,cast((round (ci.charge/ci.BilledUnits,2)) as varchar) as 'chargePerUnit'	
  FROM [dbo].[vw_ClaimItemARAnalysis] as ci 

  WHERE IsMostRecentVersion = 1 
  AND DOSFrom Between '2021-01-01' AND '2021-12-31' 
  AND HCPCS IN ('A4245','A4364','A4402','A4456','A4481','A4626','A5120','A5126','A7501','A7503','A7507','A7508','A7520','A7523','A7524','A7526','L8500','L8501','L8507','L8509','L8511','L8512','L8513','L8514')


  GROUP BY  
	   [HCPCS]
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
 ,cast((round (ci.charge/ci.BilledUnits,2)) as varchar)
 ,OrgName
 ,OfficeName

