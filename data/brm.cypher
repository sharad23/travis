LOAD CSV WITH HEADERS FROM "file:///C:/users/saravij/onedrive/_neo/banking/csv/brm.csv" as row

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

match (c:Capability),(p:Capability) where c.Parent = p.ID 
with p as _parent, c as _children merge (_parent)-[:has]->(_children)
;


