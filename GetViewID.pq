// Created by Paul MacLennan from PowerBIWiki.com
//Copy and paste the query below into Power Query editor
//Full instructions on https://PowerBiwiki.com/How to export Tableau data into Power BI

let
Query1 = let
tok=TableauSignIn("")[token],
Source = Json.Document(Web.Contents(Host &"/api/3.2/sites/" & SiteID & "/views" ,
[Headers=[Accept="application/json", ContentType="application/json", #"X-Tableau-Auth"="" & tok & ""]])),
#"Converted to Table1" = Record.ToTable(Source),
#"Transposed Table" = Table.Transpose(#"Converted to Table1"),
#"Promoted Headers" = Table.PromoteHeaders(#"Transposed Table", [PromoteAllScalars=true]),
#"Removed Other Columns" = Table.SelectColumns(#"Promoted Headers",{"datasources"}){0}
in
#"Promoted Headers",
#"Removed Other Columns" = Table.SelectColumns(Query1,{"views"}),
#"Expanded views" = Table.ExpandRecordColumn(#"Removed Other Columns", "views", {"view"}, {"view"}),
#"Expanded view" = Table.ExpandListColumn(#"Expanded views", "view"),
#"Expanded view1" = Table.ExpandRecordColumn(#"Expanded view", "view", {"workbook", "owner", "project", "tags", "id", "name", "contentUrl", "createdAt", "updatedAt"}, {"workbook", "owner", "project", "tags", "id", "name", "contentUrl", "createdAt", "updatedAt"})
in
#"Expanded view1"
