/****** Script for SelectTopNRows command from SSMS  ******/
SELECT [Batch]
      ,[ClaimNumber]
      ,[ClaimItemNumber]
      ,[MemberID]
      ,[MemberGender]
      ,[MemberDOB]
      ,[MemberState]
      ,[ProviderID]
      ,[HCPCS]
      ,[Modifier1]
      ,[Modifier2]
      ,[Modifier3]
      ,[Modifier4]
      ,[DateOfService]
      ,[ServiceQuarter]
      ,[ReceivedDate]
      ,[PaidDate]
      ,[Units]
      ,[AllowedUnits]
      ,[PlaceOfService]
      ,[Charge]
      ,[Allowed]
      ,[Copay]
      ,[Coinsurance]
      ,[Deductible]
      ,[Paid]
      ,[NonCoveredAmount]
      ,[DenialReason1]
      ,[DenialReason2]
      ,[DenialReason3]
      ,[DenialReason4]
      ,[Diag1]
      ,[Diag2]
      ,[Diag3]
      ,[Diag4]
      ,[Diag5]
      ,[Diag6]
      ,[Diag7]
      ,[Diag8]
      ,[Diag9]
      ,[Diag10]
      ,[PlanName]
      ,[LineOfBusiness]
      ,[PayorState]
      ,[Exclusion]
      ,[ExclusionReason]
      ,[ReferringProviderName]
      ,[ReferringProviderNPI]
      ,[ReferringProviderPhone]
      ,[ServicingProviderName]
      ,[ServicingProviderNPI]
      ,[ServicingProviderPhone]
  FROM [dbo].[ClaimDetail]
  where batch = 133
  and DateOfService >= '2020-04-01'
  and DateOfService <= '2020-12-31'

  UNION
  
  SELECT [Batch]
      ,[ClaimNumber]
      ,[ClaimItemNumber]
      ,[MemberID]
      ,[MemberGender]
      ,[MemberDOB]
      ,[MemberState]
      ,[ProviderID]
      ,[HCPCS]
      ,[Modifier1]
      ,[Modifier2]
      ,[Modifier3]
      ,[Modifier4]
      ,[DateOfService]
      ,[ServiceQuarter]
      ,[ReceivedDate]
      ,[PaidDate]
      ,[Units]
      ,[AllowedUnits]
      ,[PlaceOfService]
      ,[Charge]
      ,[Allowed]
      ,[Copay]
      ,[Coinsurance]
      ,[Deductible]
      ,[Paid]
      ,[NonCoveredAmount]
      ,[DenialReason1]
      ,[DenialReason2]
      ,[DenialReason3]
      ,[DenialReason4]
      ,[Diag1]
      ,[Diag2]
      ,[Diag3]
      ,[Diag4]
      ,[Diag5]
      ,[Diag6]
      ,[Diag7]
      ,[Diag8]
      ,[Diag9]
      ,[Diag10]
      ,[PlanName]
      ,[LineOfBusiness]
      ,[PayorState]
      ,[Exclusion]
      ,[ExclusionReason]
      ,[ReferringProviderName]
      ,[ReferringProviderNPI]
      ,[ReferringProviderPhone]
      ,[ServicingProviderName]
      ,[ServicingProviderNPI]
      ,[ServicingProviderPhone]
  FROM [dbo].[ClaimDetail]
  where batch = 144
  and DateOfService >= '2021-01-01'
  and DateOfService <= '2021-03-31'


/***

-- base period 
-- batch 133 DOS 04/01/2020 - 12/31/2020
-- batch 144 DOS 01/01/2021 - 03/31/2021

 Select MIN(DateOfService) as 'MINDOS'
	   ,MAX(DateOfService) as 'MAXDOS'
  from [dbo].[ClaimDetail]
  where batch = 133

 Select MIN(DateOfService) as 'MINDOS'
	   ,MAX(DateOfService) as 'MAXDOS'
  from [dbo].[ClaimDetail]
  where batch = 144

-- measurement period
-- batch 149 DOS 04/01/2021 - 04/30/2021
-- batch 155 DOS 05/01/2021 - 11/24/2021

 Select MIN(DateOfService) as 'MINDOS'
	   ,MAX(DateOfService) as 'MAXDOS'
  from [dbo].[ClaimDetail]
  where batch = 149

 Select MIN(DateOfService) as 'MINDOS'
	   ,MAX(DateOfService) as 'MAXDOS'
  from [dbo].[ClaimDetail]
  where batch = 155

  ***/