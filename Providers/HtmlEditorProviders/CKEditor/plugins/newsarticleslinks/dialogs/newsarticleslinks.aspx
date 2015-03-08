<%@ Page Language="C#" AutoEventWireup="true" CodeFile="newsarticleslinks.aspx.cs" Inherits="WatchersNET.CKEditor.NewsArticlesLinks" %>

<!DOCTYPE html>
<html lang="en">
  <head>
   <title>News Articles Module Article Link Selector</title>
   <style type="text/css">
     body { font: normal 12px Arial,Helvetica,Tahoma,Verdana,Sans-Serif; }
   </style>
  </head>
 <body>
    <form id="DialogForm" runat="server">
      <div>
        <p>Select the News Articles Module Instance:</p>
	    <p style="margin-left:10px;"><asp:DropDownList runat="server" id="ModuleListDropDown" AutoPostBack="True"></asp:DropDownList></p>
      </div>
      <div>
        <p>Select an Article:</p>
        <p style="margin-left:10px;"><asp:DropDownList runat="server" id="ArticlesList"></asp:DropDownList></p>
      </div>
	</form>
  </body>
</html>
