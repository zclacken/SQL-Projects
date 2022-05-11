/****** Script for SelectTopNRows command from SSMS  ******/
SELECT
      [HCPCS]	  
      ,[Modifier1]
      ,[Modifier2] 
      ,sum([Units]) as 'Total Units'
      ,sum([AllowedUnits]) as 'Total Allowed Units'
      ,sum([Charge]) as 'Total Charge'
      ,sum([Allowed]) as 'Total Allowed'
      ,sum([Paid]) as 'Total Paid'
	  ,DateOfService
      ,[ServicingProviderName]
      ,[ServicingProviderNPI]

  FROM [dbo].[ClaimDetail]
  /*HPP batch numbers*/
  Where Batch in ('160')

  and DateOfService between '2021-02-01' and '2022-01-31'

  group by
   [HCPCS]	  
      ,[Modifier1]
      ,[Modifier2]
      ,[ServicingProviderName]
      ,[ServicingProviderNPI]
	  ,DateOfService

