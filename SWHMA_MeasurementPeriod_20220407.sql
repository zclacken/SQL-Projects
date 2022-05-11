/****** Script for SelectTopNRows command from SSMS  ******/
SELECT [HCPCS]
      ,[Modifier1]
      ,[Modifier2]
      ,[DateOfService]
      ,SUM([AllowedUnits]) "Total Allowed Units" 
	  ,SUM([Allowed]) as "Allowed Amount" 
      ,SUM([Paid]) as "Paid Amount" 
	  ,SUM([Charge]) as "Total Charge"
	  ,SUM([Units]) as "Total Units"
	  ,SUM([Copay]) as "Copay"
      ,SUM([Coinsurance]) as "Coinsurance"
      ,SUM([Deductible]) as "Deductible"
  FROM [dbo].[ClaimDetail]
  where batch=149
  and DateOfService >= '2021-04-01'
  and DateOfService <= '2022-03-31'

   GROUP BY [HCPCS]
      ,[Modifier1]
      ,[Modifier2]
      ,[DateOfService]

UNION

  SELECT [HCPCS]
      ,[Modifier1]
      ,[Modifier2]
      ,[DateOfService]
      ,SUM([AllowedUnits]) "Total Allowed Units" 
	  ,SUM([Allowed]) as "Allowed Amount" 
      ,SUM([Paid]) as "Paid Amount" 
	  ,SUM([Charge]) as "Total Charge"
	  ,SUM([Units]) as "Total Units"
	  ,SUM([Copay]) as "Copay"
      ,SUM([Coinsurance]) as "Coinsurance"
      ,SUM([Deductible]) as "Deductible"
  FROM [dbo].[ClaimDetail]
  where batch=155
  and DateOfService >= '2021-04-01'
  and DateOfService <= '2022-03-31'

  GROUP BY [HCPCS]
      ,[Modifier1]
      ,[Modifier2]
      ,[DateOfService]