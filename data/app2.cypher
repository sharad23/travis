USING PERIODIC COMMIT
LOAD CSV WITH HEADERS FROM "file:///C:/Users/saravij/OneDrive/_Neo/Banking/csv/applist.csv" as row

with row,
coalesce(row.FGID,"None") as _FGID,
coalesce(row.ApplicationName,"None") as _ApplicationName,
coalesce(row.MALAppCode,"None") as _MALAppCode,
coalesce(row.Description,"None") as _Description,
coalesce(row.Classification,"None") as _Classification,
coalesce(row.LineofBusiness,"None") as _LineofBusiness,
coalesce(row.Vendor,"None") as _Vendor,
coalesce(row.AMTeam,"None") as _AMTeam,
coalesce(row.UsersCount,"None") as _UsersCount,
coalesce(row.QuarterlyLOE,"None") as _QuarterlyLOE,
coalesce(row.AnnualExpense,"None") as _AnnualExpense,
coalesce(row.BCPTier,"None") as _BCPTier,
coalesce(row.ApplicationType,"None") as _ApplicationType,
coalesce(row.ApplicationLifecycle,"None") as _ApplicationLifecycle,
coalesce(row.BRAM1,"None") as _BRAM1,
coalesce(row.BRAM2,"None") as _BRAM2,
coalesce(row.TRAM1,"None") as _TRAM1,
coalesce(row.TRAM2,"None") as _TRAM2,
coalesce(row.BusinessAlignment,"None") as _BusinessAlignment,
coalesce(row.BusinessImpact,"None") as _BusinessImpact,
coalesce(row.BusinessTolerance,"None") as _BusinessTolerance,
coalesce(row.ExternalClients,"None") as _ExternalClients,
coalesce(row.InternalClients,"None") as _InternalClients,
coalesce(row.PBRating,"None") as _PBRating,
coalesce(row.SBRating,"None") as _SBRating,
coalesce(row.BCScore,"None") as _BCScore,
coalesce(row.BCScoreRank,"None") as _BCScoreRank,
coalesce(row.ApplicationManager,"None") as _ApplicationManager,
coalesce(row.BusinessLineManager,"None") as _BusinessLineManager,
coalesce(row.BusinessLineOwner,"None") as _BusinessLineOwner,
coalesce(row.BusinessLineExecutiveOwner,"None") as _BusinessLineExecutiveOwner,
coalesce(row.SystemSecurityAdministrator,"None") as _SystemSecurityAdministrator,
coalesce(row.DatabaseAdministrator,"None") as _DatabaseAdministrator,
coalesce(row.Director,"None") as _Director,
coalesce(row.Portfolio,"None") as _Portfolio,
coalesce(row.ITProjectDeliveryManager,"None") as _ITProjectDeliveryManager,
coalesce(row.TechnologySolutionsBusinessAnalyst,"None") as _TechnologySolutionsBusinessAnalyst,
coalesce(row.SeniorManager,"None") as _SeniorManager,
coalesce(row.DeveloperManager,"None") as _DeveloperManager,
coalesce(row.Developer,"None") as _Developer,
coalesce(row.Engineer,"None") as _Engineer,
coalesce(row.Architect,"None") as _Architect,
coalesce(row.Level2_DatabaseAdministrator,"None") as _Level2_DatabaseAdministrator,
coalesce(row.Level2_SystemAdministrator,"None") as _Level2_SystemAdministrator,
coalesce(row.Level2_ResponseTeamManager,"None") as _Level2_ResponseTeamManager,
coalesce(row.Level3_AFSSupportOn_Call,"None") as _Level3_AFSSupportOn_Call,
coalesce(row.Level3_DatabaseAdministrator,"None") as _Level3_DatabaseAdministrator,
coalesce(row.Level3_SystemsAdministrator,"None") as _Level3_SystemsAdministrator,
coalesce(row.SupportVendor,"None") as _SupportVendor


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

merge (ApplicationManager:Person {role:"ApplicationManager",name:_ApplicationManager})
merge (BusinessLineManager:Person {role:"BusinessLineManager",name:_BusinessLineManager})
merge (BusinessLineOwner:Person {role:"BusinessLineOwner",name:_BusinessLineOwner})
merge (BusinessLineExecutiveOwner:Person {role:"BusinessLineExecutiveOwner",name:_BusinessLineExecutiveOwner})
merge (SystemSecurityAdministrator:Person {role:"SystemSecurityAdministrator",name:_SystemSecurityAdministrator})
merge (DatabaseAdministrator:Person {role:"DatabaseAdministrator",name:_DatabaseAdministrator})
merge (Director:Person {role:"Director",name:_Director})

merge (TProjectDeliveryManager:Person {role:"TProjectDeliveryManager",name:_ITProjectDeliveryManager})
merge (TechnologySolutionsBusinessAnalyst:Person {role:"TechnologySolutionsBusinessAnalyst",name:_TechnologySolutionsBusinessAnalyst})
merge (SeniorManager:Person {role:"SeniorManager",name:_SeniorManager})
merge (DeveloperManager:Person {role:"DeveloperManager",name:_DeveloperManager})
merge (Developer:Person {role:"Developer",name:_Developer})
merge (Engineer:Person {role:"Engineer",name:_Engineer})
merge (Architect:Person {role:"Architect",name:_Architect})
merge (Level2_DatabaseAdministrator:Person {role:"Level2_DatabaseAdministrator",name:_Level2_DatabaseAdministrator})
merge (Level2_SystemAdministrator:Person {role:"Level2_SystemAdministrator",name:_Level2_SystemAdministrator})
merge (Level2_ResponseTeamManager:Person {role:"Level2_ResponseTeamManager",name:_Level2_ResponseTeamManager})
merge (Level3_AFSSupportOn_Call:Person {role:"Level3_AFSSupportOn_Call",name:_Level3_AFSSupportOn_Call})
merge (Level3_DatabaseAdministrator:Person {role:"Level3_DatabaseAdministrator",name:_Level3_DatabaseAdministrator})
merge (Level3_SystemsAdministrator:Person {role:"Level3_SystemsAdministrator",name:_Level3_SystemsAdministrator})

merge (Portfolio:Portfolio {name:_Portfolio})
merge (SupportVendor:SupportVendor {name:_SupportVendor})
merge (Classification:Classification {name:_Classification})
merge (LineofBusiness:LineofBusiness  {name:_LineofBusiness})
merge (Vendor:Vendor {name:_Vendor})
merge (AMTeam:AMTeam  {name:_AMTeam})
merge (BCPTier:BCPTier  {name:_BCPTier})
merge (ApplicationType:ApplicationType  {name:_ApplicationType})
merge (ApplicationLifecycle:ApplicationLifecycle  {name:_ApplicationLifecycle})
merge (BRAM1:BRAM1  {name:_BRAM1})
merge (BRAM2:BRAM2  {name:_BRAM2})
merge (TRAM1:TRAM1  {name:_TRAM1})
merge (TRAM2:TRAM2  {name:_TRAM2})



merge (app) - [:belongsto] -> (BRAM2)
merge (BRAM2) - [:belongsto] -> (BRAM1)

merge (app) - [:belongsto] -> (TRAM2)
merge (TRAM2) - [:belongsto] -> (TRAM1)

merge (app)-[:belongsto]->(LineofBusiness)
merge (app)-[:belongsto]->(Portfolio)

merge (ApplicationManager)-[:AM]->(app)
merge (BusinessLineManager)-[:BLM]->(app)
merge (BusinessLineOwner)-[:BLO]->(app)
merge (BusinessLineExecutiveOwner)-[:BEO]->(app)
merge (SystemSecurityAdministrator)-[:SSA]->(app)
merge (DatabaseAdministrator)-[:DBA]->(app)
merge (Director)-[:DIR]->(app)
merge (ITProjectDeliveryManager)-[:ITPM]->(app)
merge (TechnologySolutionsBusinessAnalyst)-[:BA]->(app)
merge (SeniorManager)-[:SM]->(app)
merge (DeveloperManager)-[:DM]->(app)
merge (Developer)-[:DEV]->(app)
merge (Engineer)-[:ENG]->(app)
merge (Architect)-[:ARC]->(app)
merge (Level2_DatabaseAdministrator)-[:L2DBA]->(app)
merge (Level2_SystemAdministrator)-[:L2SSA]->(app)
merge (Level2_ResponseTeamManager)-[:L2RTM]->(app)
merge (Level3_AFSSupportOn_Call)-[:L3SUPONCALL]->(app)
merge (Level3_DatabaseAdministrator)-[:L3DBA]->(app)
merge (Level3_SystemsAdministrator)-[:L3SSA]->(app)
merge (SupportVendor)-[:SV]->(app)
merge (Classification)-[:CLASS]->(app)
merge (Vendor)-[:VEND]->(app)
merge (AMTeam)-[:AMT]->(app)
merge (BCPTier)-[:BCPT]->(app)
merge (ApplicationType)-[:APPTYPE]->(app)
merge (ApplicationLifecycle)-[:APPLC]->(app)






;
