// Created by Paul MacLennan from PowerBIWiki.com
//Copy and paste the query below into Power Query editor
//Full instructions on https://PowerBiwiki.com/How to export Tableau data into Power BI


let
Source = (ContentUrl) =>
let
Source = Json.Document(Web.Contents(Host & "/api/3.0/auth/signin",[
Headers=[#"Content-Type"="application/json",
#"Accept"="application/json"],
Content = Text.ToBinary("{""credentials"": {""name"": """ & username & """,""password"": """ & password & """,""site"": {""contentUrl"": """ & ContentUrl& """}}}")
]
)),
credentials = Source[credentials]
in
credentials
in
Source
