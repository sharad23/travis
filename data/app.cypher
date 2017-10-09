USING PERIODIC COMMIT
LOAD CSV WITH HEADERS FROM "file:////home/sharad/Documents/xtravis/data/csv/applist.csv" as row

with row,
coalesce(row.FGID,"") as _FGID,
coalesce(row.ApplicationName,"") as _ApplicationName,
coalesce(row.MALAppCode,"") as _MALAppCode,
coalesce(row.Description,"") as _Description,
coalesce(row.Classification,"") as _Classification,
coalesce(row.LineofBusiness,"") as _LineofBusiness,
coalesce(row.Vendor,"") as _Vendor,
coalesce(row.AMTeam,"") as _AMTeam,
coalesce(row.UsersCount,"") as _UsersCount,
coalesce(row.QuarterlyLOE,"") as _QuarterlyLOE,
coalesce(row.AnnualExpense,"") as _AnnualExpense,
coalesce(row.BCPTier,"") as _BCPTier,
coalesce(row.ApplicationType,"") as _ApplicationType,
coalesce(row.ApplicationLifecycle,"") as _ApplicationLifecycle,
coalesce(row.BRAM1,"") as _BRAM1,
coalesce(row.BRAM2,"") as _BRAM2,
coalesce(row.TRAM1,"") as _TRAM1,
coalesce(row.TRAM2,"") as _TRAM2,
coalesce(row.BusinessAlignment,"") as _BusinessAlignment,
coalesce(row.BusinessImpact,"") as _BusinessImpact,
coalesce(row.BusinessTolerance,"") as _BusinessTolerance,
coalesce(row.ExternalClients,"") as _ExternalClients,
coalesce(row.InternalClients,"") as _InternalClients,
coalesce(row.PBRating,"") as _PBRating,
coalesce(row.SBRating,"") as _SBRating,
coalesce(row.BCScore,"") as _BCScore,
coalesce(row.BCScoreRank,"") as _BCScoreRank,
coalesce(row.ApplicationManager,"") as _ApplicationManager,
coalesce(row.BusinessLineManager,"") as _BusinessLineManager,
coalesce(row.BusinessLineOwner,"") as _BusinessLineOwner,
coalesce(row.BusinessLineExecutiveOwner,"") as _BusinessLineExecutiveOwner,
coalesce(row.SystemSecurityAdministrator,"") as _SystemSecurityAdministrator,
coalesce(row.DatabaseAdministrator,"") as _DatabaseAdministrator,
coalesce(row.Director,"") as _Director,
coalesce(row.Portfolio,"") as _Portfolio,
coalesce(row.ITProjectDeliveryManager,"") as _ITProjectDeliveryManager,
coalesce(row.TechnologySolutionsBusinessAnalyst,"") as _TechnologySolutionsBusinessAnalyst,
coalesce(row.SeniorManager,"") as _SeniorManager,
coalesce(row.DeveloperManager,"") as _DeveloperManager,
coalesce(row.Developer,"") as _Developer,
coalesce(row.Engineer,"") as _Engineer,
coalesce(row.Architect,"") as _Architect,
coalesce(row.Level2_DatabaseAdministrator,"") as _Level2_DatabaseAdministrator,
coalesce(row.Level2_SystemAdministrator,"") as _Level2_SystemAdministrator,
coalesce(row.Level2_ResponseTeamManager,"") as _Level2_ResponseTeamManager,
coalesce(row.Level3_AFSSupportOn_Call,"") as _Level3_AFSSupportOn_Call,
coalesce(row.Level3_DatabaseAdministrator,"") as _Level3_DatabaseAdministrator,
coalesce(row.Level3_SystemsAdministrator,"") as _Level3_SystemsAdministrator,
coalesce(row.SupportVendor,"") as _SupportVendor


MERGE (app:Application {FGID:_FGID,
name:_ApplicationName,
MALAppCode:_MALAppCode,
Description:_Description,
UsersCount:_UsersCount,
QuarterlyLOE:_QuarterlyLOE,
AnnualExpense:_AnnualExpense,
ExternalClients:_ExternalClients,
InternalClients:_InternalClients,
PBRating:_PBRating,
SBRating:_SBRating,
BCScore:_BCScore,
BCScoreRank:_BCScoreRank,
BusinessAlignment:_BusinessAlignment,
BusinessImpact:_BusinessImpact,
BusinessTolerance:_BusinessTolerance
})

merge (ApplicationManager:ApplicationManager  {name:_ApplicationManager})
merge (BusinessLineManager:BusinessLineManager  {name:_BusinessLineManager})
merge (BusinessLineOwner:BusinessLineOwner  {name:_BusinessLineOwner})
merge (BusinessLineExecutiveOwner:BusinessLineExecutiveOwner  {name:_BusinessLineExecutiveOwner})
merge (SystemSecurityAdministrator:SystemSecurityAdministrator  {name:_SystemSecurityAdministrator})
merge (DatabaseAdministrator:DatabaseAdministrator  {name:_DatabaseAdministrator})
merge (Director:Director  {name:_Director})
merge (Portfolio:Portfolio  {name:_Portfolio})
merge (ITProjectDeliveryManager:ITProjectDeliveryManager  {name:_ITProjectDeliveryManager})
merge (TechnologySolutionsBusinessAnalyst:TechnologySolutionsBusinessAnalyst  {name:_TechnologySolutionsBusinessAnalyst})
merge (SeniorManager:SeniorManager  {name:_SeniorManager})
merge (DeveloperManager:DeveloperManager  {name:_DeveloperManager})
merge (Developer:Developer  {name:_Developer})
merge (Engineer:Engineer  {name:_Engineer})
merge (Architect:Architect  {name:_Architect})
merge (Level2_DatabaseAdministrator:Level2_DatabaseAdministrator  {name:_Level2_DatabaseAdministrator})
merge (Level2_SystemAdministrator:Level2_SystemAdministrator  {name:_Level2_SystemAdministrator})
merge (Level2_ResponseTeamManager:Level2_ResponseTeamManager  {name:_Level2_ResponseTeamManager})
merge (Level3_AFSSupportOn_Call:Level3_AFSSupportOn_Call  {name:_Level3_AFSSupportOn_Call})
merge (Level3_DatabaseAdministrator:Level3_DatabaseAdministrator  {name:_Level3_DatabaseAdministrator})
merge (Level3_SystemsAdministrator:Level3_SystemsAdministrator  {name:_Level3_SystemsAdministrator})
merge (SupportVendor:SupportVendor  {name:_SupportVendor})
merge (Classification:Classification  {name:_Classification})
merge (LineofBusiness:LineofBusiness  {name:_LineofBusiness})
merge (Vendor:Vendor  {name:_Vendor})
merge (AMTeam:AMTeam  {name:_AMTeam})
merge (BCPTier:BCPTier  {name:_BCPTier})
merge (ApplicationType:ApplicationType  {name:_ApplicationType})
merge (ApplicationLifecycle:ApplicationLifecycle  {name:_ApplicationLifecycle})
merge (BRAM1:BRAM1  {name:_BRAM1})
merge (BRAM2:BRAM2  {name:_BRAM2})
merge (TRAM1:TRAM1  {name:_TRAM1})
merge (TRAM2:TRAM2  {name:_TRAM2})


merge (BRAM1) - [:function] -> (BRAM2)
merge (BRAM2) - [:has] -> (app)

merge (TRAM1) - [:has] -> (TRAM2)
merge (TRAM2) - [:has] -> (app)

merge (app)-[:AM]->(ApplicationManager)
merge (app)-[:BLM]->(BusinessLineManager)
merge (app)-[:BLO]->(BusinessLineOwner)
merge (app)-[:BEO]->(BusinessLineExecutiveOwner)
merge (app)-[:SSA]->(SystemSecurityAdministrator)
merge (app)-[:DBA]->(DatabaseAdministrator)
merge (app)-[:DIR]->(Director)
merge (app)-[:PF]->(Portfolio)
merge (app)-[:ITPM]->(ITProjectDeliveryManager)
merge (app)-[:BA]->(TechnologySolutionsBusinessAnalyst)
merge (app)-[:SM]->(SeniorManager)
merge (app)-[:DM]->(DeveloperManager)
merge (app)-[:DEV]->(Developer)
merge (app)-[:ENG]->(Engineer)
merge (app)-[:ARC]->(Architect)
merge (app)-[:L2DBA]->(Level2_DatabaseAdministrator)
merge (app)-[:L2SSA]->(Level2_SystemAdministrator)
merge (app)-[:L2RTM]->(Level2_ResponseTeamManager)
merge (app)-[:L3SUPONCALL]->(Level3_AFSSupportOn_Call)
merge (app)-[:L3DBA]->(Level3_DatabaseAdministrator)
merge (app)-[:L3SSA]->(Level3_SystemsAdministrator)
merge (app)-[:SV]->(SupportVendor)
merge (app)-[:CLASS]->(Classification)
merge (app)-[:LOB]->(LineofBusiness)
merge (app)-[:VEND]->(Vendor)
merge (app)-[:AMT]->(AMTeam)
merge (app)-[:BCPT]->(BCPTier)
merge (app)-[:APPTYPE]->(ApplicationType)
merge (app)-[:APPLC]->(ApplicationLifecycle)





;
