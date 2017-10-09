LOAD CSV WITH HEADERS FROM "file:///home/sharad/Documents/xtravis/data/csv/BRM.csv" as row

with row,
coalesce(row.ID,"Null") as _ID,
coalesce(row.Name,"None") as _Name,
coalesce(row.Description,"None") as _Description,
coalesce(row.Parent,"None") as _Parent,
coalesce(row.Level,"None") as _Level


MERGE (capability:Capability {ID:_ID,
Capability:_Name,
Description:_Description,
Parent:_Parent,
Level:_Level})
;

LOAD CSV WITH HEADERS FROM "file:///home/sharad/Documents/xtravis/data/csv/rosebay.csv" as row

with row,
coalesce(row.Transaction_ID,"Null") as _Transaction_ID,
coalesce(row.Keyword,"Null") as _Keyword,
coalesce(row.Source_Wallet_ID,"Null") as _Source_Wallet_ID,
coalesce(row.Dest_Wallet_ID,"Null") as _Dest_Wallet_ID,
coalesce(row.Amount,"Null") as _Amount,
coalesce(row.Source_Balance_Before,"Null") as _Source_Balance_Before,
coalesce(row.Source_Balance_After,"Null") as _Source_Balance_After,
coalesce(row.Dest_Balance_Before,"Null") as _Dest_Balance_Before,
coalesce(row.Dest_Balance_After,"Null") as _Dest_Balance_After,
coalesce(row.Created_Date,"Null") as _Created_Date,
coalesce(row.Transaction_Fee,"Null") as _Transaction_Fee,
coalesce(row.Transaction_Comm,"Null") as _Transaction_Comm,
coalesce(row.Status,"Null") as _Status,
coalesce(row.Reference_ID,"Null") as _Reference_ID,
coalesce(row.Fee_Payer,"Null") as _Fee_Payer,
coalesce(row.Commission_Receiver,"Null") as _Commission_Receiver,
coalesce(row.Reward_Receiver,"Null") as _Reward_Receiver,
coalesce(row.Reward_Point,"Null") as _Reward_Point

MERGE (wallet_id:Wallet_ID {


MERGE (capability:Capability {ID:_ID,
Capability:_Name,
Description:_Description,
Parent:_Parent,
Level:_Level})
;

match (c:Capability),(p:Capability) where c.Parent = p.ID
with p as _parent, c as _children merge (_parent)-[:has]->(_children)
;
