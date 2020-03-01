// Created by Paul MacLennan from PowerBIWiki.com
//Copy and paste the query below into Power Query editor
//Full instructions on https://PowerBiwiki.com/How to export Tableau data into Power BI

let
tok=TableauSignIn("")[token],
Source = Csv.Document(Web.Contents
(Host&"/api/3.2/sites/"
&SiteID &
"/views/"
&ViewIDforXData&
"/data"
, [Headers=[Accept="application/json", ContentType="application/json", #"X-Tableau-Auth"="" & tok & ""]]))
in
Source
