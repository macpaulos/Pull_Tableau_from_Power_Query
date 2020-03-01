

let
tok=TableauSignIn("")[token],
Source = Json.Document(Web.Contents(Host & "/api/3.2/sites/",
[Headers=[Accept="application/json", #"X-Tableau-Auth"="" & tok & ""]])),
#"Converted to Table2" = Record.ToTable(Source),
#"Transposed Table" = Table.Transpose(#"Converted to Table2"),
#"Promoted Headers" = Table.PromoteHeaders(#"Transposed Table", [PromoteAllScalars=true]),
#"Removed Other Columns" = Table.SelectColumns(#"Promoted Headers",{"sites"}),
#"Expanded sites" = Table.ExpandRecordColumn(#"Removed Other Columns", "sites", {"site"}, {"site"}),
#"Expanded site2" = Table.ExpandListColumn(#"Expanded sites", "site"),
#"Expanded site3" = Table.ExpandRecordColumn(#"Expanded site2", "site", {"id", "name", "contentUrl", "adminMode", "state", "revisionHistoryEnabled", "revisionLimit", "subscribeOthersEnabled", "guestAccessEnabled", "cacheWarmupEnabled", "commentingEnabled"}, {"id", "name", "contentUrl", "adminMode", "state", "revisionHistoryEnabled", "revisionLimit", "subscribeOthersEnabled", "guestAccessEnabled", "cacheWarmupEnabled", "commentingEnabled"})
in
#"Expanded site3"
