Imports System.Web.UI
Imports System.io
Imports DotNetNuke
Imports System.Collections.Generic
Imports DotNetNuke.Entities.Modules

Namespace Modules.TweetDNN
    Partial Class View
        Inherits DotNetNuke.Entities.Modules.PortalModuleBase

        Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
            Dim Body As New StringBuilder()
            Dim Statuses As List(Of Status)
            Dim TwitterResponse As String = ""
            Dim MC As New ModuleController()
            Dim CacheFile As String = Server.MapPath(ModulePath + ModuleId.ToString() + ".cache")
            Dim CSSFilePath As String = ModulePath + ModuleId.ToString() + ".css"
            Dim CachedData As String = ""
            Dim LastUpdated As DateTime = DateTime.MinValue
            Dim ScreenName As String = ""
            Dim Count As Integer = 0
            Dim TempCount As Integer

            CType(Me.Page, CDefault).AddStyleSheet(CSSFilePath, CSSFilePath, False)

            ' Check if cache file exists
            If File.Exists(CacheFile) Then
                LastUpdated = File.GetLastWriteTime(CacheFile)
                CachedData = File.ReadAllText(CacheFile)
            End If

            ' Set screen name if valid
            If Settings("ScreenName") IsNot Nothing Then
                ScreenName = Settings("ScreenName")
            End If

            ' Set count if valid
            If Integer.TryParse(Settings("Count"), TempCount) Then
                If TempCount > 0 And TempCount <= 200 Then
                    Count = TempCount
                End If
            End If

            ' Check if settings are properly set
            If Count > 0 And ScreenName.Length > 0 Then
                ' If the info was downloaded more than a minute ago
                If LastUpdated.AddMinutes(1.0) < DateTime.Now Then
                    ' Gets a new user timeline from Twitter
                    TwitterResponse = Twitter.GetUserTimeLine(ScreenName, Count)
                    ' Couldn't connect to twitter
                    If TwitterResponse.Length > 0 Then
                        ' Cache data
                        File.WriteAllText(CacheFile, TwitterResponse)
                    Else
                        ' Load the cached data
                        TwitterResponse = CachedData
                    End If
                Else
                    TwitterResponse = CachedData
                End If

                If TwitterResponse.Length > 0 Then
                    Try
                        Statuses = Twitter.GetStatusesFromXml(TwitterResponse)

                        For Each status As Status In Statuses
                            Body.AppendLine("<div class=""status"">")

                            Body.AppendLine("<span class=""text"">")
                            Body.AppendLine(status.Text)
                            Body.AppendLine("</span>")

                            Body.AppendLine("<span class=""created_at"">")
                            Body.AppendLine("Posted " + status.TimeString)
                            Body.AppendLine("</span>")

                            'Body.AppendLine("<span class=""source"">")
                            'Body.AppendLine(status.Source)
                            'Body.AppendLine("</span>")
                            Body.AppendLine("</div>")
                        Next
                    Catch ex As Exception
                        If UserInfo.IsSuperUser Then
                            Body.AppendLine("Information Not Available")
                        End If
                    End Try
                Else
                    If UserInfo.IsSuperUser Then
                        Body.AppendLine("Information Unavailable")
                    End If
                End If
            Else
                If UserInfo.IsSuperUser Then
                    Body.AppendLine("Configure Module in the Settings")
                End If
            End If
            PlaceHolder.InnerHtml = Body.ToString
        End Sub
    End Class
End Namespace