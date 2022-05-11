SELECT [PayorName]
      ,[HCPCS]
	  ,[Mod1]
	  ,[Mod2]
      ,[CalculatedCharge]
  FROM [dbo].[vw_FeeScheduleChargeHeader]
  WHERE PayorName LIKE '%Northwell%'

 