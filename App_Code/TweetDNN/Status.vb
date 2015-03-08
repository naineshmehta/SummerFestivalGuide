Imports Microsoft.VisualBasic


Namespace Modules.TweetDNN
    Public Class Status
        Public Created_At As TimeSpan
        Public ID As Int64
        Public Text As String
        Public Source As String
        Public Truncated As Boolean
        Public In_Reply_To_Status_ID As String
        Public In_Reply_To_User_ID As String
        Public Favorited As Boolean
        Public In_Reply_To_Screen_Name As String

        Public ReadOnly Property TimeString() As String
            Get
                If Created_At.Days > 0 Then
                    If Created_At.Days = 1 Then
                        TimeString = " yesterday"
                    Else
                        TimeString = Created_At.Days.ToString + " days ago"
                    End If
                Else
                    If Created_At.Hours > 0 Then
                        If Created_At.Hours = 1 Then
                            TimeString = Created_At.Hours.ToString + " hour ago"
                        Else
                            TimeString = Created_At.Hours.ToString + " hours ago"
                        End If
                    Else
                        If Created_At.Minutes > 0 Then
                            If Created_At.Minutes = 1 Then
                                TimeString = Created_At.Minutes.ToString + " minute ago"
                            Else
                                TimeString = Created_At.Minutes.ToString + " minutes ago"
                            End If
                        Else
                            If Created_At.Seconds = 1 Then
                                TimeString = Created_At.Seconds.ToString + " second ago"
                            Else
                                TimeString = Created_At.Seconds.ToString + " seconds ago"
                            End If
                        End If
                    End If
                End If
            End Get
        End Property
    End Class
End Namespace
