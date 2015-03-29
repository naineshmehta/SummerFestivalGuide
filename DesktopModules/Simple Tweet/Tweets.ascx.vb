
Imports DotNetNuke
Imports System.Web.UI
Imports DotNetNuke.Entities.Modules
Imports System.IO
Imports System.Globalization
Imports System.Linq

Namespace Modules.Simple
    Partial Class Tweet
        Inherits DotNetNuke.Entities.Modules.PortalModuleBase

#Region "Events"
        Public ModuleDiv As String

        Public TwitterName As String

        Public Behavior As Boolean = False
        Public PollForNew As Boolean = False
        Public IncludeScrollbar As Boolean = False
        Public ShowAvatars As Boolean = False
        Public ShowHashtags As Boolean = False
        Public ShowTimestamps As Boolean = False

        Public LoopResults As Boolean = False

        Public TweetInterval As String
        Public NumberOfTweets As String
        Public FontSize As String
        Public ShellBackground As String
        Public ShellText As String
        Public TweetBackground As String
        Public TweetText As String
        Public TweetLinks As String
        Public TweetWidth As String
        Public TweetHeight As String

        Public Padding As String

        Public TwitterParameter As String
        Public TwitterRender As String

        Private FeatureCheck As Integer = 0
        Private StyleCheck As Integer = 0

        Private Sub Page_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
            Try
                lblDebugging.Visible = "False"

                'DotNetNuke.Framework.jQuery.RequestRegistration()

                ' This is done to make it possible to have more than one module on a page
                'ModuleDiv = "ST" + ModuleId.ToString

                TwitterParameter = "features: { scrollbar: false, loop: false, hashtags: false, timestamp: false, avatars: false, live: false, behavior: 'default' }"

                ' Check to see if the Debug checkbox is checked
                If Settings("chkDebug") = "True" Then
                    lblDebugging.Visible = "True"
                ElseIf Settings("chkDebug") = "False" Then
                    lblDebugging.Visible = "False"
                End If

                ' Set the default Twitter Username to @DNNCorp (DotNetNuke Corporation) if nothing is entered
                If Settings("txtTwitterName") Is Nothing Then
                    Settings("txtTwitterName") = "DNNCorp" ' default value of @DNNCorp
                End If
                TwitterName = CType(Settings("txtTwitterName"), String)
                TwitterRender = ".render().setUser('" & TwitterName & "').start();"
                lblDebugging.Text = "<table align=""left"" width=""98%"" cellpadding=""1"" cellspacing=""1"">"
                lblDebugging.Text += "<tr><td style=""text-align: right; width: 17%""><strong>Twitter Name:</strong></td><td>" & TwitterName & "</td></tr>"

                ' Poll for new Tweets
                If CType(Settings("chkPollForNew"), String) = "False" Then
                    FeatureCheck = InStr(TwitterParameter.ToString, "live: false")
                    If FeatureCheck = 0 Then
                        TwitterParameter = TwitterParameter.Replace("live: true", "live: false")
                        PollForNew = False
                    End If
                ElseIf CType(Settings("chkPollForNew"), String) = "True" Then
                    FeatureCheck = InStr(TwitterParameter.ToString, "live: true")
                    If FeatureCheck = 0 Then
                        TwitterParameter = TwitterParameter.Replace("live: false", "live: true")
                        PollForNew = True
                    End If
                End If
                lblDebugging.Text += "<tr><td style=""text-align: right;""><strong>Poll For New:</strong></td><td>" & PollForNew.ToString & "</td></tr>"

                ' Include Scrollbar
                If CType(Settings("chkIncludeScrollBar"), String) = "False" Then
                    FeatureCheck = InStr(TwitterParameter.ToString, "scrollbar: false")
                    If FeatureCheck = 0 Then
                        TwitterParameter = TwitterParameter.Replace("scrollbar: true", "scrollbar: false")
                        IncludeScrollbar = False
                    End If
                ElseIf CType(Settings("chkIncludeScrollBar"), String) = "True" Then
                    FeatureCheck = InStr(TwitterParameter.ToString, "scrollbar: true")
                    If FeatureCheck = 0 Then
                        TwitterParameter = TwitterParameter.Replace("scrollbar: false", "scrollbar: true")
                        IncludeScrollbar = True
                    End If
                End If
                lblDebugging.Text += "<tr><td style=""text-align: right;""><strong>Include Scrollbar:</strong></td><td>" & IncludeScrollbar.ToString & "</td></tr>"

                'Tweet Behaviour - Timed Interval or Load All
                If CType(Settings("rblBehaviour"), String) = "Default" Then
                    FeatureCheck = InStr(TwitterParameter.ToString, "behavior: 'default'")
                    If FeatureCheck = 0 Then
                        TwitterParameter = TwitterParameter.Replace("behavior: 'all'", "behavior: 'default'")
                        Behavior = False
                    End If
                ElseIf CType(Settings("rblBehaviour"), String) = "All" Then
                    FeatureCheck = InStr(TwitterParameter.ToString, "behavior: 'all'")
                    If FeatureCheck = 0 Then
                        TwitterParameter = TwitterParameter.Replace("behavior: 'default'", "behavior: 'all'")
                        Behavior = True
                    End If
                End If

                If Behavior = True Then
                    lblDebugging.Text += "<tr><td style=""text-align: right; vertical-align: bottom; height: 25px;""><strong>Behavior:</strong></td><td style=""vertical-align: bottom;"">Display All</td></tr>"
                ElseIf Behavior = False Then
                    lblDebugging.Text += "<tr><td style=""text-align: right; vertical-align: bottom; height: 25px;""><strong>Behavior:</strong></td><td style=""vertical-align: bottom;"">Timed Intervals</td></tr>"
                End If


                ' Loop Results
                If CType(Settings("chkLoopResults"), String) = "False" Then
                    FeatureCheck = InStr(TwitterParameter.ToString, "loop: false")
                    If FeatureCheck = 0 Then
                        TwitterParameter = TwitterParameter.Replace("loop: true", "loop: false")
                        LoopResults = False
                    End If
                ElseIf CType(Settings("chkLoopResults"), String) = "True" Then
                    FeatureCheck = InStr(TwitterParameter.ToString, "loop: true")
                    If FeatureCheck = 0 Then
                        TwitterParameter = TwitterParameter.Replace("loop: false", "loop: true")
                        LoopResults = True
                    End If
                End If
                FeatureCheck = InStr(TwitterParameter.ToString, "behavior: 'default'")
                If FeatureCheck > 0 Then
                    lblDebugging.Text += "<tr><td style=""text-align: right;""><strong>Loop Results:</strong></td><td>" & LoopResults.ToString & "</td></tr>"
                End If

                ' Tweet Interval
                If Settings("txtTweetInterval") = "" Then
                    Settings("txtTweetInterval") = "30" ' default value of 30 seconds
                End If
                TweetInterval = CType(Settings("txtTweetInterval"), String) & "000"

                FeatureCheck = InStr(TwitterParameter.ToString, "behavior: 'default'")
                If FeatureCheck > 0 Then
                    lblDebugging.Text += "<tr><td style=""text-align: right;""><strong>Tweet Interval:</strong></td><td>" & CType(Settings("txtTweetInterval"), String) & " seconds</td></tr>"
                End If

                ' Number of Tweets to display
                If Settings("txtNumberOfTweets") = "" Then
                    Settings("txtNumberOfTweets") = "5" ' default value of 5
                End If
                NumberOfTweets = CType(Settings("txtNumberOfTweets"), String)
                lblDebugging.Text += "<tr><td style=""text-align: right; vertical-align: bottom; height: 25px;""><strong>Number of Tweets:</strong></td><td style=""vertical-align: bottom;"">" & NumberOfTweets & "</td></tr>"

                ' Width of Tweet Window
                If Settings("txtTweetWidth") = "" Or Settings("txtTweetWidth") = "0" Then
                    Settings("txtTweetWidth") = "'auto'" ' default value of auto if blank
                End If
                TweetWidth = CType(Settings("txtTweetWidth"), String)
                lblDebugging.Text += "<tr><td style=""text-align: right; vertical-align: bottom; height: 25px;""><strong>Tweet Width:</strong></td><td style=""vertical-align: bottom;"">" & TweetWidth & "</td></tr>"

                ' Height of Tweet Window
                If Settings("txtTweetHeight") = "" Then
                    Settings("txtTweetHeight") = "300" ' default value of 300 if blank
                End If
                TweetHeight = CType(Settings("txtTweetHeight"), String)
                lblDebugging.Text += "<tr><td style=""text-align: right; vertical-align: top; height: 25px;""><strong>Tweet Height:</strong></td><td style=""vertical-align: top;"">" & TweetHeight & "</td></tr>"

                ' Tweet Font-Size
                If Settings("txtFontSize") = "" Then
                    Settings("txtFontSize") = "12" ' default value of #333333
                End If
                FontSize = CType(Settings("txtFontSize"), String) & "px "
                lblDebugging.Text += "<tr><td style=""text-align: right; vertical-align: bottom;""><strong>Font-Size:</strong></td><td style=""vertical-align: bottom;""><span style=""font-size: " & FontSize & """>" & FontSize & "</span></td></tr>"


                ' Show Avatars
                If CType(Settings("chkAvatars"), String) = "False" Then
                    FeatureCheck = InStr(TwitterParameter.ToString, "avatars: false")
                    If FeatureCheck = 0 Then
                        TwitterParameter = TwitterParameter.Replace("avatars: true", "avatars: false")
                        ShowAvatars = False
                    End If
                ElseIf CType(Settings("chkAvatars"), String) = "True" Then
                    FeatureCheck = InStr(TwitterParameter.ToString, "avatars: true")
                    If FeatureCheck = 0 Then
                        TwitterParameter = TwitterParameter.Replace("avatars: false", "avatars: true")
                        ShowAvatars = True
                    End If
                End If
                lblDebugging.Text += "<tr><td style=""text-align: right; vertical-align: bottom; height: 25px;""><strong>Show Avatars:</strong></td><td style=""vertical-align: bottom;"">" & ShowAvatars.ToString & "</td></tr>"

                ' Show Hashtags
                If CType(Settings("chkHashTags"), String) = "False" Then
                    FeatureCheck = InStr(TwitterParameter.ToString, "hashtags: false")
                    If FeatureCheck = 0 Then
                        TwitterParameter = TwitterParameter.Replace("hashtags: true", "hashtags: false")
                        ShowHashtags = False
                    End If
                ElseIf CType(Settings("chkHashTags"), String) = "True" Then
                    FeatureCheck = InStr(TwitterParameter.ToString, "hashtags: true")
                    If FeatureCheck = 0 Then
                        TwitterParameter = TwitterParameter.Replace("hashtags: false", "hashtags: true")
                        ShowHashtags = True
                    End If
                End If
                lblDebugging.Text += "<tr><td style=""text-align: right;""><strong>Show Hashtags:</strong></td><td style=""vertical-align: bottom;"">" & ShowHashtags.ToString & "</td></tr>"

                ' Show TimeStamp
                If CType(Settings("chkTimeStamp"), String) = "False" Then
                    FeatureCheck = InStr(TwitterParameter.ToString, "timestamp: false")
                    If FeatureCheck = 0 Then
                        TwitterParameter = TwitterParameter.Replace("timestamp: true", "timestamp: false")
                        ShowTimestamps = False
                    End If
                ElseIf CType(Settings("chkTimeStamp"), String) = "True" Then
                    FeatureCheck = InStr(TwitterParameter.ToString, "timestamp: true")
                    If FeatureCheck = 0 Then
                        TwitterParameter = TwitterParameter.Replace("timestamp: false", "timestamp: true")
                        ShowTimestamps = True
                    End If
                End If
                lblDebugging.Text += "<tr><td style=""text-align: right;""><strong>Show Timestamps:</strong></td><td style=""vertical-align: bottom;"">" & ShowTimestamps.ToString & "</td></tr>"


                ' Color of Shell Background
                If Settings("txtShellBackground") = "" Then
                    Settings("txtShellBackground") = "#7b0000" ' default value of #7b0000 (Red)
                End If
                ShellBackground = "'" & CType(Settings("txtShellBackground"), String) & "'"
                lblDebugging.Text += "<tr><td style=""text-align: right; vertical-align: bottom; height: 25px;""><strong>Shell Background:</strong></td><td style=""vertical-align: bottom;""><span style=""text-transform: uppercase; border: 1px solid #000; color: " & Settings("txtShellText") & "; background-color: " & Settings("txtShellBackground") & ";"">&nbsp;&nbsp;&nbsp;" & CType(Settings("txtShellBackground"), String) & "&nbsp;&nbsp;&nbsp;</span></td></tr>"

                ' Color of Shell Text
                If Settings("txtShellText") = "" Then
                    Settings("txtShellText") = "#f6f9fa" ' default value of #f6f9fa (Off-white Text)
                End If
                ShellText = "'" & CType(Settings("txtShellText"), String) & "'"
                lblDebugging.Text += "<tr><td style=""text-align: right; vertical-align: bottom;""><strong>Shell Text:</strong></td><td style=""vertical-align: bottom;""><span style=""text-transform: uppercase; border: 1px solid #000; color: " & Settings("txtShellText") & "; background-color: " & Settings("txtShellBackground") & ";"">&nbsp;&nbsp;&nbsp;" & CType(Settings("txtShellText"), String) & "&nbsp;&nbsp;&nbsp;</span></td></tr>"

                ' Color of Tweet Background
                If Settings("txtTweetBackground") = "" Then
                    Settings("txtTweetBackground") = "#f6f9fa" ' default value of #f6f9fa (Off-white tweet area background)
                End If
                TweetBackground = "'" & CType(Settings("txtTweetBackground"), String) & "'"
                lblDebugging.Text += "<tr><td style=""text-align: right; vertical-align: bottom; height: 25px;""><strong>Tweet Background:</strong></td><td style=""vertical-align: bottom;""><span style=""text-transform: uppercase; border: 1px solid #000; color: " & Settings("txtTweetText") & "; background-color: " & Settings("txtTweetBackground") & ";"">&nbsp;&nbsp;&nbsp;" & CType(Settings("txtTweetBackground"), String) & "&nbsp;&nbsp;&nbsp;</span></td></tr>"

                ' Color of Tweet Text
                If Settings("txtTweetText") = "" Then
                    Settings("txtTweetText") = "#666666" ' default value of #666666 (Gray Text)
                End If
                TweetText = "'" & CType(Settings("txtTweetText"), String) & "'"
                lblDebugging.Text += "<tr><td style=""text-align: right; vertical-align: bottom;""><strong>Tweet Text:</strong></td><td style=""vertical-align: bottom;""><span style=""border: 1px solid #000; color: " & Settings("txtTweetText") & "; background-color: " & Settings("txtTweetBackground") & ";"">&nbsp;&nbsp;&nbsp;" & CType(Settings("txtTweetText"), String) & "&nbsp;&nbsp;&nbsp;</span></td></tr>"

                ' Color of Tweet Links
                If Settings("txtLinkColor") = "" Then
                    Settings("txtLinkColor") = "#007cbc" ' default value of #007cbc (Blue Links)
                End If
                TweetLinks = "'" & CType(Settings("txtLinkColor"), String) & "'"
                lblDebugging.Text += "<tr><td style=""text-align: right; vertical-align: bottom;""><strong>Tweet Links:</strong></td><td style=""vertical-align: bottom;""><span style=""border: 1px solid #000; color: " & Settings("txtLinkColor") & "; background-color: " & Settings("txtTweetBackground") & ";"">&nbsp;&nbsp;&nbsp;" & CType(Settings("txtLinkColor"), String) & "&nbsp;&nbsp;&nbsp;</span></td></tr>"

                ' Adds padding to DIV around Twitter Information
                If CType(Settings("txtDivPaddingTop"), String) = "" Then
                    Padding = "0 "
                Else
                    Padding = CType(Settings("txtDivPaddingTop"), String) & "px "
                End If

                If CType(Settings("txtDivPaddingRight"), String) = "" Then
                    Padding += "0 "
                Else
                    Padding += CType(Settings("txtDivPaddingRight"), String) & "px "
                End If

                If CType(Settings("txtDivPaddingBottom"), String) = "" Then
                    Padding += "0 "
                Else
                    Padding += CType(Settings("txtDivPaddingBottom"), String) & "px "
                End If

                If CType(Settings("txtDivPaddingLeft"), String) = "" Then
                    Padding += "0"
                Else
                    Padding += CType(Settings("txtDivPaddingLeft"), String) & "px"
                End If

                If Padding.ToString = "0 0 0 0" Then
                    Padding = "0"
                End If

                lblDebugging.Text += "<tr><td style=""text-align: right; vertical-align: bottom; height: 25px;""><strong>Padding:</strong></td><td style=""vertical-align: bottom;"">" & Padding & "</td></tr>"
                lblDebugging.Text += "<tr><td style=""text-align: right; vertical-align: bottom; height: 25px;""><strong>Features:</strong></td><td style=""vertical-align: bottom;"">" & TwitterParameter & "</td></tr></table>"

            Catch exc As Exception
                ProcessModuleLoadException("Error Loading the Page" & exc.ToString, Me, exc, True)
            End Try

        End Sub

#End Region

    End Class
End Namespace