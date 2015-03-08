Public Class AFForumTopic
#Region "Private Members"
    Private _TopicID As Integer
    Private _ForumID As Integer
    Private _ViewCount As Integer
    Private _LastReplyDate As Integer
    Private _ReplyCount As Integer

    Private _Subject As String
    Private _TopicURL As String
    Private _URL As String
    Private _FullURL As String
    Private _PrefixURL As String

#End Region

#Region "Constructors"

    Public Sub New()
    End Sub

#End Region

#Region "Properties"


    Public Property TopicID() As Integer
        Get
            Return _TopicID
        End Get
        Set(ByVal Value As Integer)
            _TopicID = Value
        End Set
    End Property

    Public Property ReplyCount() As Integer
        Get
            Return _ReplyCount
        End Get
        Set(ByVal Value As Integer)
            _ReplyCount = Value
        End Set
    End Property
    Public Property LastReplyDate() As Integer
        Get
            Return _LastReplyDate
        End Get
        Set(ByVal Value As Integer)
            _LastReplyDate = Value
        End Set
    End Property

    Public Property ViewCount() As Integer
        Get
            Return _ViewCount
        End Get
        Set(ByVal Value As Integer)
            _ViewCount = Value
        End Set
    End Property


    Public Property Subject() As String
        Get
            Return _Subject
        End Get
        Set(ByVal Value As String)
            _Subject = Value
        End Set
    End Property



    Public Property URL() As String
        Get
            Return _URL
        End Get
        Set(ByVal Value As String)
            _URL = Value
        End Set
    End Property



    Public Property TopicURL() As String
        Get
            Return _TopicURL
        End Get
        Set(ByVal Value As String)
            _TopicURL = Value
        End Set
    End Property


    Public Property PrefixURL() As String
        Get
            Return _PrefixURL
        End Get
        Set(ByVal Value As String)
            _PrefixURL = Value
        End Set
    End Property


    Public Property FullURL() As String
        Get
            Return _FullURL
        End Get
        Set(ByVal Value As String)
            _FullURL = Value
        End Set
    End Property






#End Region

End Class
