Imports Microsoft.VisualBasic
Imports System.Collections.Generic
Imports System.Xml

Namespace Modules.TweetDNN
    Public Class Twitter
        Public Shared Function GetUserTimeLine(ByVal ScreenName As String, ByVal Count As Integer) As String
            Dim Url As New StringBuilder()
            Dim TwitterResponse As String = ""
            Dim Statuses As New List(Of Status)
            Url.Append("http://twitter.com/statuses/user_timeline.xml?screen_name=")
            Url.Append(ScreenName)
            Url.Append("&count=")
            Url.Append(Count)

            Dim wc As New System.Net.WebClient()

            Try
                TwitterResponse = wc.DownloadString(Url.ToString())
            Catch ex As Exception
                'Do Nothing
            End Try

            Return TwitterResponse
        End Function

        Public Shared Function GetStatusesFromXml(ByVal xml As String) As List(Of Status)
            Dim Doc As New XmlDocument()
            Dim Statuses As XmlNodeList
            Dim TempStatus As Status
            Dim StatusList As New List(Of Status)

            Doc.LoadXml(xml)
            Statuses = Doc.SelectNodes("statuses/status")
            For Each Status As XmlNode In Statuses
                TempStatus = New Status()
                TempStatus.Created_At = ParseTwitterDate(Status.SelectSingleNode("created_at").InnerText)
                TempStatus.Favorited = CType(Status.SelectSingleNode("favorited").InnerText, Boolean)
                TempStatus.ID = CType(Status.SelectSingleNode("id").InnerText, Int64)
                TempStatus.In_Reply_To_Screen_Name = Status.SelectSingleNode("in_reply_to_screen_name").InnerText
                TempStatus.In_Reply_To_Status_ID = Status.SelectSingleNode("in_reply_to_status_id").InnerText
                TempStatus.In_Reply_To_User_ID = Status.SelectSingleNode("in_reply_to_user_id").InnerText
                TempStatus.Source = Status.SelectSingleNode("source").InnerText
                TempStatus.Text = EnableLinks(Status.SelectSingleNode("text").InnerText)
                TempStatus.Truncated = CType(Status.SelectSingleNode("truncated").InnerText, Boolean)
                StatusList.Add(TempStatus)
            Next
            Return StatusList
        End Function

        Public Shared Function ParseTwitterDate(ByVal TwitterDate As String) As TimeSpan
            'Tue Apr 07 22:52:51 +0000 2009
            Dim DateParts As String() = TwitterDate.Split(" ")
            Dim TimeParts As String() = DateParts(3).Split(":")
            Dim TimeZone As TimeZone = TimeZone.CurrentTimeZone
            Dim Day, Month, Year, Second, Minute, Hour As Integer

            Second = CType(TimeParts(2), Integer)
            Minute = CType(TimeParts(1), Integer)
            Hour = CType(TimeParts(0), Integer)

            Day = CType(DateParts(2), Integer)
            Year = CType(DateParts(5), Integer)

            Select Case DateParts(1)
                Case "Jan"
                    Month = 1
                Case "Feb"
                    Month = 2
                Case "Mar"
                    Month = 3
                Case "Apr"
                    Month = 4
                Case "May"
                    Month = 5
                Case "Jun"
                    Month = 6
                Case "Jul"
                    Month = 7
                Case "Aug"
                    Month = 8
                Case "Sep"
                    Month = 9
                Case "Oct"
                    Month = 10
                Case "Nov"
                    Month = 11
                Case "Dec"
                    Month = 12
            End Select

            Return DateTime.UtcNow.Subtract(New DateTime(Year, Month, Day, Hour, Minute, Second, DateTimeKind.Utc))
        End Function

        Public Shared Function EnableLinks(ByVal text As String) As String
            Dim UserRegex As New Regex("@(?<user>\w+)")
            Dim TopicRegex As New Regex("#(?<topic>\w+)")
            Dim LinkRegex As New Regex("(?<link>http://\S+)")
            For Each M As Match In LinkRegex.Matches(text)
                text = text.Replace(M.Value, CreateURL(M.Value, M.Value))
            Next
            'text = LinkRegex.Replace(text, CreateURL("${link}", CreateURL("${link}", "${link}")))
            text = UserRegex.Replace(text, CreateURL("@${user}", "http://www.twitter.com/${user}"))
            text = TopicRegex.Replace(text, CreateURL("#${topic}", "http://www.twitter.com/#search?q=${topic}"))
            Return text
        End Function

        Public Shared Function CreateURL(ByVal text As String, ByVal link As String) As String
            Return "<a href=""" + link + """>" + text + "</a>"
        End Function
    End Class
End Namespace
