Imports DotNetNuke


Namespace FortyFingers.Dnn.SkinObjects

    ''' ----------------------------------------------------------------------------- 
    ''' <summary></summary> 
    ''' <remarks></remarks> 
    ''' <history> 
    ''' <todo>
    ''' </todo>
    ''' 
    ''' </history> 
    ''' ----------------------------------------------------------------------------- 
    ''' 
    Partial Class StyleHelper
        Inherits UI.Skins.SkinObjectBase


#Region "Private Members"

        Private Const _sNOT As String = "!"

        'Check if the conditions are met to process the files
        Dim bConditions As Boolean

#End Region


#Region "Public Properties Add & Remove"


        Private _AddToHead As String
        ''' <summary>
        ''' Pipe Sperated strings to add to the head of the page
        ''' </summary>
        ''' <value></value>
        ''' <returns></returns>
        ''' <remarks></remarks>
        Public Property AddToHead() As String
            Get
                Return _AddToHead
            End Get
            Set(ByVal value As String)
                _AddToHead = value
            End Set
        End Property



        Private _RemoveMeta As String
        ''' <summary>
        ''' Pipe seperated ids of controle to disable
        ''' </summary>
        ''' <value></value>
        ''' <returns></returns>
        ''' <remarks></remarks>
        Public Property RemoveMeta() As String
            Get
                Return _RemoveMeta
            End Get
            Set(ByVal value As String)
                _RemoveMeta = value
            End Set
        End Property



        Private _ChangeMeta As String
        ''' <summary>
        ''' Pipe Separated ids to Parse
        ''' </summary>
        ''' <value></value>
        ''' <returns></returns>
        ''' <remarks></remarks>
        Public Property ChangeMeta() As String
            Get
                Return _ChangeMeta
            End Get
            Set(ByVal value As String)
                _ChangeMeta = value
            End Set
        End Property



        Private _sRemoveCssFile As String = String.Empty
        ''' <summary>
        ''' Comma seperated list of CSS files to remove from the head of the page
        ''' </summary>
        ''' <value>Empty</value>
        ''' <returns></returns>
        ''' <remarks></remarks>
        Public Property RemoveCssFile() As String
            Set(ByVal Value As String)
                _sRemoveCssFile = Value
            End Set
            Get
                Return _sRemoveCssFile
            End Get

        End Property


        Private _sRemoveControls As String = String.Empty
        ''' <summary>
        ''' Remove any control (comma seperated)
        ''' </summary>
        ''' <remarks></remarks>
        Public Property RemoveControls() As String
            Get
                Return _sRemoveControls
            End Get
            Set(ByVal value As String)
                _sRemoveControls = value
            End Set
        End Property





        Private _bFilterRemove As Boolean = True
        ''' <summary>
        ''' Set if the removal of CSS files should be conditional
        ''' </summary>
        ''' <value>False</value>
        ''' <returns></returns>
        ''' <remarks></remarks>
        Public Property FilterRemove() As Boolean
            'Should this be conditional?
            Set(ByVal Value As Boolean)
                _bFilterRemove = Value
            End Set
            Get
                Return _bFilterRemove
            End Get
        End Property



        Private _sAddCssFile As String = String.Empty
        ''' <summary>
        ''' Comma seperated list of CSS files to add
        ''' </summary>
        ''' <value></value>
        ''' <returns></returns>
        ''' <remarks></remarks>
        Public Property AddCssFile() As String
            Set(ByVal Value As String)
                _sAddCssFile = Value
            End Set
            Get
                Return _sAddCssFile
            End Get
        End Property



        Private _sAddJsFile As String = String.Empty
        ''' <summary>
        ''' Comma seperated list of JS files to add
        ''' </summary>
        ''' <value></value>
        ''' <returns></returns>
        ''' <remarks></remarks>
        Public Property AddJsFile() As String
            Set(ByVal Value As String)
                _sAddJsFile = Value
            End Set
            Get
                Return _sAddJsFile
            End Get

        End Property



        Private _bFilterAdd As Boolean = True
        ''' <summary>
        ''' Set if the adding should be conditional
        ''' </summary>
        ''' <value>False</value>
        ''' <returns></returns>
        ''' <remarks></remarks>
        Public Property FilterAdd() As Boolean
            'Add properties at the end of the head, if false at the top
            Set(ByVal Value As Boolean)
                _bFilterAdd = Value
            End Set
            Get
                Return _bFilterAdd
            End Get
        End Property



        Private _sAddMetaTags As String = String.Empty
        ''' <summary>
        ''' List of Meta tags to add to the head.
        ''' Format: [Name:Content]
        ''' </summary>
        ''' <value></value>
        ''' <returns></returns>
        ''' <remarks></remarks>
        Public Property AddMetaTags() As String
            Set(ByVal Value As String)
                _sAddMetaTags = Value
            End Set
            Get
                Return _sAddMetaTags
            End Get

        End Property



        Private _bFilterMeta As Boolean = True
        ''' <summary>
        ''' Set if the removal of CSS files should be conditional
        ''' </summary>
        ''' <value>False</value>
        ''' <returns></returns>
        ''' <remarks></remarks>
        Public Property FilterMeta() As Boolean
            Set(ByVal Value As Boolean)
                _bFilterMeta = Value
            End Set
            Get
                Return _bFilterMeta
            End Get
        End Property



        Private _sBasePath As String = "[S]"
        ''' <summary>
        ''' Add skinpath to paths
        ''' </summary>
        ''' <value></value>
        ''' <returns></returns>
        ''' <remarks></remarks>
        Public Property BasePath() As String
            'Add skinpath to the path of the links
            Set(ByVal Value As String)
                _sBasePath = Value
            End Set
            Get
                Return _sBasePath
            End Get
        End Property



        Private _bAddAtEnd As Boolean = True
        ''' <summary>
        ''' Add links at the end of the page head
        ''' </summary>
        ''' <value></value>
        ''' <returns></returns>
        ''' <remarks></remarks>
        Public Property AddAtEnd() As Boolean
            'Add properties at the end of the head, if flase at the top
            Set(ByVal Value As Boolean)
                _bAddAtEnd = Value
            End Set
            Get
                Return _bAddAtEnd.ToString
            End Get
        End Property



        Private _sCssMedia As String = "screen"
        ''' <summary>
        ''' Media type for CSS files
        ''' </summary>
        ''' <value></value>
        ''' <returns></returns>
        ''' <remarks></remarks>
        Public Property CssMedia() As String
            'Set CSS media property
            Set(ByVal Value As String)
                _sCssMedia = Value
            End Set
            Get
                Return _sCssMedia
            End Get
        End Property



        Private _bShowInfo As Boolean
        ''' <summary>
        ''' Render ShowInfo info in browser, like browser version
        ''' </summary>
        ''' <value></value>
        ''' <remarks></remarks>
        Public Property ShowInfo() As Boolean
            'Write ShowInfo info?
            Get
                Return _bShowInfo
            End Get
            Set(ByVal Value As Boolean)
                _bShowInfo = Value
            End Set
        End Property




        Dim _bAddBodyClass As Boolean = False
        ''' <summary>
        ''' Add Page Class to Body Element without filtering
        ''' </summary>
        ''' <value>False</value>
        ''' <returns></returns>
        ''' <remarks></remarks>
        Public Property AddBodyClass() As Boolean
            Set(ByVal Value As Boolean)
                _bAddBodyClass = Value
            End Set
            Get
                Return _bAddBodyClass
            End Get

        End Property


        Dim _bFilterBodyClass As Boolean = False
        ''' <summary>
        ''' Filter adding the body class or not?
        ''' </summary>
        ''' <value>False</value>
        ''' <returns></returns>
        ''' <remarks></remarks>
        Public Property FilterBodyClass() As Boolean
            Set(ByVal Value As Boolean)
                _bFilterBodyClass = Value
            End Set
            Get
                Return _bFilterBodyClass
            End Get

        End Property



        Dim _sBodyClass As String = "[BcName] [BcId] [BcNr] [UserPageRoles]"
        ''' <summary>
        ''' Template for the page class
        ''' </summary>
        ''' <value></value>
        ''' <returns></returns>
        ''' <remarks></remarks>
        Public Property BodyClass() As String
            Get
                Return (_sBodyClass)
            End Get
            Set(ByVal value As String)
                'If the template is set, set adding the class to true.
                AddBodyClass = True
                _sBodyClass = value
            End Set
        End Property



        Private _sAddHTMLAttribte As String
        ''' <summary>
        ''' Write an attribute to the HTML element
        ''' </summary>
        ''' <value></value>
        ''' <returns></returns>
        ''' <remarks></remarks>
        ''' 
        Public Property AddHtmlAttribute() As String
            Get
                Return _sAddHTMLAttribte
            End Get
            Set(ByVal value As String)
                _sAddHTMLAttribte = value
            End Set
        End Property




        Private _sDocType As String
        ''' <summary>
        ''' Set the skin doctype
        ''' </summary>
        ''' <value></value>
        ''' <returns></returns>
        ''' <remarks></remarks>
        ''' 
        Public Property Doctype() As String
            Get
                Return _sDocType
            End Get
            Set(ByVal value As String)
                _sDocType = value
            End Set
        End Property



        Private _sContent As String = "<!--40Fingers Stylehelper Conditions Return True-->"
        ''' <summary>
        ''' 
        ''' </summary>
        ''' <value></value>
        ''' <returns></returns>
        ''' <remarks></remarks>
        Public Property Content() As String
            Get
                Return _sContent
            End Get
            Set(ByVal value As String)
                _sContent = value
            End Set
        End Property


        Private _sContentFalse As String = "<!--40Fingers Stylehelper Conditions Return False -->"
        ''' <summary>
        ''' Content to inject when the criteria are not met
        ''' </summary>
        ''' <value></value>
        ''' <returns></returns>
        ''' <remarks></remarks>
        Public Property ContentFalse() As String
            Get
                Return _sContentFalse
            End Get
            Set(ByVal value As String)
                _sContentFalse = value
            End Set
        End Property





#End Region


#Region "Public Properties Filters"

        Private _sIfBrowser As String = String.Empty
        ''' <summary>
        ''' Comma seperated list of browsers / versions
        ''' </summary>
        ''' <value></value>
        ''' <returns></returns>
        ''' <remarks></remarks>
        Public Property IfBrowser() As String
            'List of browsers to load this for
            Set(ByVal value As String)
                _sIfBrowser = value
            End Set
            Get
                Return _sIfBrowser
            End Get
        End Property



        Private _iIfMobile As Integer = 0
        ''' <summary>
        ''' If Is Mobile
        ''' </summary>
        ''' <value></value>
        ''' <returns></returns>
        ''' <remarks></remarks>
        Public Property IfMobile() As Boolean
            'List of browsers to load this for
            Set(ByVal value As Boolean)
                If value Then
                    _iIfMobile = 1
                Else
                    _iIfMobile = -1
                End If
            End Set
            Get
                IIf(_iIfMobile = 1, IfMobile = True, IfMobile = False)
            End Get
        End Property




        Private _sIfUserAgentString As String = String.Empty
        ''' <summary>
        ''' Comma seperated list of UserAgent Strings (regex)
        ''' </summary>
        ''' <value></value>
        ''' <returns></returns>
        ''' <remarks></remarks>
        Public Property IfUserAgentString() As String
            'List of browsers to load this for
            Set(ByVal value As String)
                _sIfUserAgentString = value
            End Set
            Get
                Return _sIfUserAgentString
            End Get
        End Property


        ''' <summary>
        ''' Legacy Support: Replaced by IfUserAgentString
        ''' </summary>
        ''' <value></value>
        ''' <returns></returns>
        ''' <remarks></remarks>
        Public Property IfUserNameAgentString() As String
            'List of browsers to load this for
            Set(ByVal value As String)
                _sIfUserAgentString = value
            End Set
            Get
                Return _sIfUserAgentString
            End Get
        End Property




        Private _sIfUserName As String = String.Empty
        ''' <summary>
        ''' Comma seperated list of browsers / versions
        ''' </summary>
        ''' <value></value>
        ''' <returns></returns>
        ''' <remarks></remarks>
        Public Property IfUserName() As String
            'List of browsers to load this for
            Set(ByVal value As String)
                _sIfUserName = value
            End Set
            Get
                Return _sIfUserName
            End Get
        End Property



        Private _sIfRole As String = String.Empty
        ''' <summary>
        ''' Comma seperated list of browsers / versions
        ''' </summary>
        ''' <value></value>
        ''' <returns></returns>
        ''' <remarks></remarks>
        Public Property IfRole() As String
            'List of browsers to load this for
            Set(ByVal value As String)
                _sIfRole = value
            End Set
            Get
                Return _sIfRole
            End Get
        End Property



        Private _sIfURL As String = String.Empty
        ''' <summary>
        ''' Use the current pages URL for filtering
        ''' </summary>
        ''' <value></value>
        ''' <returns></returns>
        ''' <remarks></remarks>
        Public Property IfURL() As String
            Get
                Return _sIfURL
            End Get
            Set(ByVal value As String)
                _sIfURL = value
            End Set
        End Property



        Private _sIfCulture As String = String.Empty
        ''' <summary>
        ''' Cultures to process file for
        ''' </summary>
        ''' <value></value>
        ''' <returns></returns>
        ''' <remarks></remarks>

        Public Property IfCulture() As String
            Set(ByVal Value As String)
                _sIfCulture = Value
            End Set
            Get
                Return _sIfCulture
            End Get
        End Property



        Private _sIfTxtDir As String = String.Empty
        ''' <summary>
        ''' Render accoring to the text direction
        ''' </summary>
        ''' <value></value>
        ''' <returns></returns>
        ''' <remarks></remarks>
        Public Property IfTextDir() As String
            Get
                Return (_sIfTxtDir)
            End Get
            Set(ByVal value As String)
                _sIfTxtDir = value.ToLower
            End Set
        End Property



        Private _sIfQS As String = String.Empty
        ''' <summary>
        ''' Render accoring to query string parameter
        ''' </summary>
        ''' <value></value>
        ''' <returns></returns>
        ''' <remarks></remarks>
        Public Property IfQS() As String
            Get
                Return (_sIfQS)
            End Get
            Set(ByVal value As String)
                _sIfQS = value.ToLower
            End Set
        End Property



        Private _sIfCookie As String
        ''' <summary>
        ''' Condition on Cookie
        ''' </summary>
        ''' <value></value>
        ''' <returns></returns>
        ''' <remarks></remarks>
        Public Property IfCookie() As String
            Get
                Return _sIfCookie
            End Get
            Set(ByVal value As String)
                _sIfCookie = value
            End Set
        End Property



#End Region


#Region "Client Detect Properties"

        Private _sClientDetectMethod As String = "detectmobilebrowsers.com"
        'For later use

        Private _sDetectMobileRegex1 As String = "android.+mobile|avantgo|bada\/|blackberry|blazer|compal|elaine|fennec|hiptop|iemobile|ip(hone|od)|iris|kindle|lge |maemo|midp|mmp|netfront|opera m(ob|in)i|palm( os)?|phone|p(ixi|re)\/|plucker|pocket|psp|symbian|treo|up\.(browser|link)|vodafone|wap|windows (ce|phone)|xda|xiino"
        ''' <summary>
        ''' First regular expression to detect Mobile browsers
        ''' </summary>
        ''' <value></value>
        ''' <returns></returns>
        ''' <remarks></remarks>
        Public Property DetectMobileRegex1() As String
            'List of browsers to load this for
            Set(ByVal value As String)
                _sDetectMobileRegex1 = value
            End Set
            Get
                Return _sDetectMobileRegex1
            End Get
        End Property


        Private _bDetectMobileIncludeTablet As Boolean
        ''' <summary>
        ''' If st to true Tablets are treated as Mobile following the method on http://detectmobilebrowsers.com/about
        ''' </summary>
        ''' <value></value>
        ''' <remarks></remarks>
        Public Property DetectMobileIncludeTablet() As Boolean
            Get
                Return _bDetectMobileIncludeTablet
            End Get
            Set(ByVal value As Boolean)
                If value Then DetectMobileRegex1 = "android|avantgo|bada\/|blackberry|blazer|compal|elaine|fennec|hiptop|iemobile|ip(ad|hone|od)|iris|kindle|lge |maemo|midp|mmp|netfront|opera m(ob|in)i|palm( os)?|phone|p(ixi|re)\/|plucker|pocket|psp|symbian|treo|up\.(browser|link)|vodafone|wap|windows (ce|phone)|xda|xiino|playbook|silk"
                _bDetectMobileIncludeTablet = value

            End Set
        End Property



        Private _sDetectMobileRegex2 As String = "1207|6310|6590|3gso|4thp|50[1-6]i|770s|802s|a wa|abac|ac(er|oo|s\-)|ai(ko|rn)|al(av|ca|co)|amoi|an(ex|ny|yw)|aptu|ar(ch|go)|as(te|us)|attw|au(di|\-m|r |s )|avan|be(ck|ll|nq)|bi(lb|rd)|bl(ac|az)|br(e|v)w|bumb|bw\-(n|u)|c55\/|capi|ccwa|cdm\-|cell|chtm|cldc|cmd\-|co(mp|nd)|craw|da(it|ll|ng)|dbte|dc\-s|devi|dica|dmob|do(c|p)o|ds(12|\-d)|el(49|ai)|em(l2|ul)|er(ic|k0)|esl8|ez([4-7]0|os|wa|ze)|fetc|fly(\-|_)|g1 u|g560|gene|gf\-5|g\-mo|go(\.w|od)|gr(ad|un)|haie|hcit|hd\-(m|p|t)|hei\-|hi(pt|ta)|hp( i|ip)|hs\-c|ht(c(\-| |_|a|g|p|s|t)|tp)|hu(aw|tc)|i\-(20|go|ma)|i230|iac( |\-|\/)|ibro|idea|ig01|ikom|im1k|inno|ipaq|iris|ja(t|v)a|jbro|jemu|jigs|kddi|keji|kgt( |\/)|klon|kpt |kwc\-|kyo(c|k)|le(no|xi)|lg( g|\/(k|l|u)|50|54|e\-|e\/|\-[a-w])|libw|lynx|m1\-w|m3ga|m50\/|ma(te|ui|xo)|mc(01|21|ca)|m\-cr|me(di|rc|ri)|mi(o8|oa|ts)|mmef|mo(01|02|bi|de|do|t(\-| |o|v)|zz)|mt(50|p1|v )|mwbp|mywa|n10[0-2]|n20[2-3]|n30(0|2)|n50(0|2|5)|n7(0(0|1)|10)|ne((c|m)\-|on|tf|wf|wg|wt)|nok(6|i)|nzph|o2im|op(ti|wv)|oran|owg1|p800|pan(a|d|t)|pdxg|pg(13|\-([1-8]|c))|phil|pire|pl(ay|uc)|pn\-2|po(ck|rt|se)|prox|psio|pt\-g|qa\-a|qc(07|12|21|32|60|\-[2-7]|i\-)|qtek|r380|r600|raks|rim9|ro(ve|zo)|s55\/|sa(ge|ma|mm|ms|ny|va)|sc(01|h\-|oo|p\-)|sdk\/|se(c(\-|0|1)|47|mc|nd|ri)|sgh\-|shar|sie(\-|m)|sk\-0|sl(45|id)|sm(al|ar|b3|it|t5)|so(ft|ny)|sp(01|h\-|v\-|v )|sy(01|mb)|t2(18|50)|t6(00|10|18)|ta(gt|lk)|tcl\-|tdg\-|tel(i|m)|tim\-|t\-mo|to(pl|sh)|ts(70|m\-|m3|m5)|tx\-9|up(\.b|g1|si)|utst|v400|v750|veri|vi(rg|te)|vk(40|5[0-3]|\-v)|vm40|voda|vulc|vx(52|53|60|61|70|80|81|83|85|98)|w3c(\-| )|webc|whit|wi(g |nc|nw)|wmlb|wonu|x700|xda(\-|2|g)|yas\-|your|zeto|zte\-"
        ''' <summary>
        ''' First regular expression to detect Mobile browsers
        ''' </summary>
        ''' <value></value>
        ''' <returns></returns>
        ''' <remarks></remarks>
        Public Property DetectMobileRegex2() As String
            'List of browsers to load this for
            Set(ByVal value As String)
                _sDetectMobileRegex2 = value
            End Set
            Get
                Return _sDetectMobileRegex2
            End Get
        End Property

#End Region


#Region "Redirect Properties"

        Private _sRedirectName As String = "Default"
        ''' <summary>
        ''' always, once, session
        ''' </summary>
        ''' <value></value>
        ''' <remarks></remarks>
        Public Property RedirectName() As String
            Get
                Return _sRedirectName
            End Get
            Set(ByVal value As String)
                _sRedirectName = value
            End Set
        End Property



        Private _sRedirectMode As String = "Session"
        ''' <summary>
        ''' always, once, session, never
        ''' </summary>
        ''' <value></value>
        ''' <remarks></remarks>
        Public Property RedirectMode() As String
            Get
                Return _sRedirectMode
            End Get
            Set(ByVal value As String)
                _sRedirectMode = value
            End Set
        End Property



        Private _sRedirectTo As String
        ''' <summary>
        ''' Redirect to url, page.name
        ''' </summary>
        ''' <remarks></remarks>
        Public Property RedirectTo() As String
            Get
                Return _sRedirectTo
            End Get
            Set(ByVal value As String)
                _sRedirectTo = value
            End Set
        End Property




        Private _sRedirectStop As String = "RedirectUrl,QueryString"
        ''' <summary>
        ''' One what parameters to refuse the redirect...
        ''' Revisit = Will refuse the redirect on second visit
        ''' RedirectUrl = Referrer is the Redirect URL
        ''' BaseRedirectUrl = Referrer contains the Base Redirect URL
        ''' QueryString = QS parameter passed 
        ''' Never = Never refuse the redirect
        ''' </summary>
        ''' <value></value>
        ''' <remarks></remarks>
        Public Property RedirectStop() As String
            Get
                Return _sRedirectStop
            End Get
            Set(ByVal value As String)
                _sRedirectStop = value
            End Set
        End Property



        Private _sRedirectBaseUrl As String = String.Empty
        ''' <summary>
        ''' The base URL for redirecting, will be used to make comparations
        ''' </summary>
        ''' <value></value>
        ''' <remarks></remarks>
        Public Property RedirectBaseUrl() As String
            Get
                Return _sRedirectBaseUrl
            End Get
            Set(ByVal value As String)
                _sRedirectBaseUrl = value
            End Set
        End Property



        Private _sRedirectInfo As String
        ''' <summary>
        ''' Set how the redirect url is being passed or stored.
        ''' Can be stored as cookie or passed as QS parameter.
        ''' </summary>
        ''' <value></value>
        ''' <returns></returns>
        ''' <remarks></remarks>
        Public Property RedirectInfo() As String
            Get
                Return _sRedirectInfo
            End Get
            Set(ByVal value As String)
                _sRedirectInfo = value
            End Set
        End Property

#End Region


#Region "Legacy Properties"
        'For legacy support and renamed properties

        Public Property IfMobileRX1() As String
            'List of browsers to load this for
            Set(ByVal value As String)
                _sDetectMobileRegex1 = value
            End Set
            Get
                Return _sDetectMobileRegex1
            End Get
        End Property


        Public Property IfMobileRX2() As String
            'List of browsers to load this for
            Set(ByVal value As String)
                _sDetectMobileRegex2 = value
            End Set
            Get
                Return _sDetectMobileRegex2
            End Get
        End Property

#End Region


#Region "Public Readonly Properties"
        ''' <summary>
        ''' Return a string with the browser version
        ''' </summary>
        ''' <param name="ShowMinor"></param>
        ''' <value></value>
        ''' <returns></returns>
        ''' <remarks></remarks>
        Public ReadOnly Property ShowBrowserVersion(Optional ByVal ShowMinor As Boolean = True) As String
            Get
                Return GetBrowserVersion(ShowMinor)
            End Get
        End Property

        ''' <summary>
        ''' Return the browser name
        ''' </summary>
        ''' <value></value>
        ''' <returns></returns>
        ''' <remarks></remarks>
        Public ReadOnly Property ShowBrowser() As String
            Get
                Return GetBrowser()
            End Get
        End Property


        ''' <summary>
        ''' Return the current culture
        ''' </summary>
        ''' <value></value>
        ''' <returns></returns>
        ''' <remarks></remarks>
        Public ReadOnly Property ShowCulture() As String
            Get
                Return CurrentCulture()
            End Get
        End Property

        ''' <summary>
        ''' retrun the current text direction
        ''' </summary>
        ''' <value></value>
        ''' <returns></returns>
        ''' <remarks></remarks>
        Public ReadOnly Property ShowIfTextDir() As String
            Get
                If CultureInfo.CurrentUICulture.TextInfo.IsRightToLeft = True Then
                    Return ("rtl")
                Else
                    Return ("ltr")
                End If

            End Get
        End Property

#End Region


#Region "General"




        Protected Sub Page_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init

            bConditions = CheckConditions()



        End Sub


        Private Sub Page_PreRender(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.PreRender


            'Redirect to a page
            'This test is done here to make sure the cookie is written for page the skin object is on
            If bConditions And Not RedirectTo = String.Empty Then
                ProcessRedirect()
            End If

            If Not RemoveCssFile = String.Empty Then
                If FilterRemove = False Or bConditions Then
                    'Check version
                    If CheckDnnVersion("6.1") >= 0 Then
                        If RemoveCssFile = "/" Then
                            ' This code removes all stylesheets when you pass "/" for DNN 6.1
                            RemoveControl("ClientDependencyHeadCss")
                            RemoveControl("CSS")
                            RemoveControl("StylePlaceholder")
                        Else
                            If GetCpState() = "Edit" Then
                                Content = "<div style=""text-align:center""><h4 style=""margin:0;"">40Fingers.net Stylehelper Message:</h4>In DNN 6 you can only remove all Stylesheets by passing ""/"", or none.<br />This is due to changes made to the DNN core, read our blog for more info.</div>"
                            End If
                        End If
                    Else
                        ProcessRemoveFiles()
                    End If

                End If
            End If


            ProcessRemoveControls()

            If Not RemoveMeta = String.Empty Then
                If FilterRemove = False Or bConditions Then
                    ProcessRemoveMeta()
                End If
            End If


            If Not ChangeMeta = String.Empty Then
                If FilterMeta = False Or bConditions Then
                    ProcessChangeMeta()
                End If
            End If


            If Not AddMetaTags = String.Empty Then
                If FilterMeta = False Or bConditions Then
                    ProcessMetaTags()
                End If
            End If

            If Not (AddCssFile = String.Empty And AddJsFile = String.Empty) Then
                If FilterAdd = False Or bConditions Then
                    ProcessLoadFiles()
                End If
            End If

            If Not AddToHead = String.Empty Then
                If FilterAdd = False Or bConditions Then
                    ProcessAdd2Head()
                End If
            End If


            If AddHtmlAttribute <> String.Empty And bConditions Then
                ProcessHtmlAttributes()
            End If

            'Non conditional Options
            If FilterBodyClass = False Or bConditions Then
                If AddBodyClass Then
                    ProcessPageClassTemplate(BodyClass)
                End If
            End If

            ProcessDoctype()

            'Add the HTML attributes, only needed for DNN 6
            If CheckDnnVersion("6.0") >= 0 Then
                Dim oAttributes As Literal = Me.Page.FindControl("attributeList")
                If Not oAttributes Is Nothing Then
                    oAttributes.Text = HtmlAttributeList()
                End If
            End If

            If bConditions Then
                ltShowInfo.Text &= Content
            Else
                ltShowInfo.Text &= ContentFalse
            End If

            If ShowInfo = True Then WriteShowInfo()

        End Sub



        Private Sub ProcessRedirect()       'Process redirect

            'Check first if the redirection should be stopped.
            Dim bStopRedirect As Boolean = StopRedirect()

            Select Case RedirectMode.ToLower

                Case "never" 'Don't redirect, allows disabeling redirect for testing..
                    Exit Sub

                Case "once" 'Redirect once (cookie valid for one year)

                    'Check if the redirect was refused before
                    If Not CheckCookie(CreateCookieName(String.Format("RefuseRedirect.{0}.Once", RedirectName)), "True") Then
                        If bStopRedirect Then
                            CreateCookie(CreateCookieName(String.Format("RefuseRedirect.{0}.Once", RedirectName)), "True", 365)
                        Else
                            Redirect()
                        End If

                    End If

                Case "session", "oncepersession" 'Redirect once this session but also redirect the next session..

                    'Check if the redirect was refused before
                    If Not CheckCookie(CreateCookieName(String.Format("RefuseRedirect.{0}.Session", RedirectName)), "True") Then
                        If bStopRedirect Then
                            CreateCookie(CreateCookieName(String.Format("RefuseRedirect.{0}.Session", RedirectName)), "True", 0)
                        Else
                            Redirect()
                        End If

                    End If

                Case "always"
                    If bStopRedirect Then
                        Redirect()
                    End If
            End Select

        End Sub



        Private Sub Redirect()
            'Do the actual redirect
            Dim RedirectURL As String = RedirectTo

            If RedirectInfo <> String.Empty Then
                'Writes cookie or querystring with the value of the original page url
                Dim BaseName As String = "RedirectedFrom"

                Dim sOrignalURL = PortalSettings.ActiveTab.FullUrl

                'Write a cookie with the original landing page
                If Regex.IsMatch(RedirectInfo, "Cookie", RegexOptions.IgnoreCase) Then 'Write cookie
                    Dim CookieName As String = CreateCookieName(BaseName)
                    Response.Cookies(CookieName).Value = sOrignalURL
                End If

                If Regex.IsMatch(RedirectInfo, "QS", RegexOptions.IgnoreCase) Then 'Add to querystring
                    RedirectURL = AddQueryString(RedirectTo, String.Format("{0}={1}", BaseName, HttpUtility.UrlEncode(sOrignalURL)))
                End If

            End If

            Response.Redirect(GetRedirectUrl(RedirectURL))

        End Sub



        Private Function GetRedirectUrl(ByVal URL As String) As String
            'Input: the new URL template
            'Example: m.test.com?[QS:DetailId]

            'Get the complete URL
            URL = ProcessPath(RedirectBaseUrl, URL)

            'Get the passed tokens in the new URL
            Dim sUrlTemp As String = URL

            For Each m As Match In Regex.Matches(sUrlTemp, "\[(.*)\]")

                'Remove found token
                URL = Regex.Replace(URL, Regex.Escape(m.Value), "")

                'Get parameter and value to test for
                Dim myPV As New ParameterValue(m.Groups(1).Value, ":")

                Dim sQsPm As String = String.Empty

                If myPV.Parameter = "QS" Then
                    'Get the QS parameter from the original URL
                    sQsPm = GetQsValue(myPV.Value1)
                End If

                'Test if the value was found...
                If Not sQsPm = String.Empty Then
                    'Add qs parameter
                    URL = AddQueryString(URL, myPV.Value1 & "=" & sQsPm)
                End If

            Next

            Return (URL)

        End Function



        Private Function AddQueryString(ByVal URL As String, ByVal QS As String) As String
            'Used to add a querystring parameter for the redirect link
            If URL.Contains("?") Then
                Return String.Format("{0}&{1}", URL, QS)
            Else
                Return String.Format("{0}?{1}", URL, QS)
            End If

        End Function



        Private Function StopRedirect() As Boolean
            'Check if you should stop redirecting (set with the RedirectStop attribute)

            If RedirectStop.ToLower.Contains("never") Then Return False

            'Is this page was redirected before, redirect will find out if this is a revisit
            If RedirectStop.ToLower.Contains("revisit") Then Return True

            'If a querystring parameter was passed
            If RedirectStop.ToLower.Contains("querystring") Then
                'Check for QS parameter
                If CheckQueryString("NoRedirect:True") Then
                    Return True
                End If
            End If

            'If the referer is the redirect url 
            If RedirectStop.ToLower.Contains("redirecturl") Then

                'Get the Referrer URL
                Dim sReferrer As String = String.Empty
                If Not Request.UrlReferrer Is Nothing Then 'Check if there was a referrer
                    sReferrer = Request.UrlReferrer.GetLeftPart(UriPartial.Path)
                End If

                If RedirectStop.ToLower.Contains("baseredirecturl") Then
                    'Check the referer against the passed referer Base URL (passed in Skin)
                    If RedirectBaseUrl > String.Empty AndAlso sReferrer.StartsWith(RedirectBaseUrl) Then
                        Return True
                    End If
                Else
                    'Test if the referring page is the page to redirect to
                    If sReferrer = RedirectTo Or sReferrer.EndsWith(RedirectTo) Then
                        Return True
                    End If
                End If

            End If

            Return False


        End Function



        Private Function GetCpState() As String

            Select Case PortalSettings.UserMode
                Case Entities.Portals.PortalSettings.Mode.Edit
                    Return "Edit"
                Case Entities.Portals.PortalSettings.Mode.View
                    Return ("View")
                Case Entities.Portals.PortalSettings.Mode.Layout
                    Return "Layout"
            End Select

            Return ("")

        End Function





        Private Function CheckCookie(ByVal CookieName As String, ByVal CookieValue As String) As Boolean
            'Check if the cookie exists, if it has the right value and is not expired..

            'Check if the Cookie Exists
            If Not Request.Cookies(CookieName) Is Nothing Then
                'Check if the Cookie value is correct
                If Server.HtmlEncode(Request.Cookies(CookieName).Value) = CookieValue Then
                    Return True
                End If
            End If

            Return False

        End Function


        Private Sub CreateCookie(ByVal CookieName As String, ByVal CookieValue As String, ByVal CookieExpireDays As Integer)

            'Write the cookie
            Response.Cookies(CookieName).Value = CookieValue

            'If on cookie experation passed, don't set it (session cookie)
            If CookieExpireDays > 0 Then
                Response.Cookies(CookieName).Expires = DateTime.Now.AddDays(CookieExpireDays)
            End If

        End Sub



        Private Function CreateCookieName(ByVal Name As String) As String

            Return "40Fingers.StyleHelper." & Name

        End Function




        Private Sub ProcessRemoveFiles()    'Process the files to unload from the head

            If Not RemoveCssFile.Trim = String.Empty Then

                For Each s As String In RemoveCssFile.Split(",")
                    UnloadCss(s.Trim)
                Next

            End If

        End Sub

        Private Sub ProcessRemoveControls()

            If Not RemoveControls.Trim = String.Empty Then

                For Each s As String In RemoveControls.Split(",")
                    RemoveControl(s.Trim)
                Next

            End If

        End Sub


        Private Sub ProcessRemoveMeta()
            'Remove Meta tags, some are literals, some are HtmlMeta controls
            Dim oHead As HtmlGenericControl = Me.Page.FindControl("Head")
            For Each s As String In RemoveMeta.Split("||")

                If s.StartsWith("id=") Then 'ID passed, meaning this is a Meta Control
                    s = s.Replace("id=", "")
                    Try
                        Dim oControl As Control = oHead.FindControl(s)
                        If Not oControl Is Nothing Then
                            'Try to parse to meta
                            Dim oMeta As HtmlMeta = CType(oControl, HtmlMeta)
                            oMeta.Visible = False
                        End If
                    Catch ex As Exception
                        DotNetNuke.Services.Exceptions.LogException(ex)
                    End Try
                End If

            Next

        End Sub


        Private Sub ProcessChangeMeta()
            'Remove Meta tags, some are literals, some are HtmlMeta controls
            Dim oHead As HtmlGenericControl = Me.Page.FindControl("Head")

            For Each s As String In Regex.Split(ChangeMeta, Regex.Escape("||"))

                'Meta tags are passed like this: id=MyId|content=Test
                If s.StartsWith("id=") Then 'ID passed

                    Dim sAttribute As String = String.Empty ' Store the attribute to look for

                    'Get id and attribute to change if an attribute was passed
                    If s.Split("|").Length = 2 Then
                        sAttribute = s.Split("|")(1)
                        s = s.Split("|")(0)

                        'Get the id of the element to change
                        Dim oId As New ParameterValue(s, "=")
                        s = oId.Value1


                        Dim oValPair As New ParameterValue(sAttribute, "=")

                        Try
                            Dim oControl As Control = oHead.FindControl(s)
                            If Not oControl Is Nothing Then
                                'Try to parse to meta
                                Dim oMeta As HtmlMeta = CType(oControl, HtmlMeta)
                                'Get the parameter
                                If Not oMeta.Attributes(oValPair.Parameter) Is Nothing Then
                                    Dim sNewVal = oValPair.Value1
                                    'Replace * with the original value 
                                    sNewVal = sNewVal.Replace("*", oMeta.Attributes(oValPair.Parameter))
                                    'Change the Parameters Value
                                    oMeta.Attributes(oValPair.Parameter) = ProcessTokens(sNewVal)
                                End If

                            End If
                        Catch ex As Exception
                            DotNetNuke.Services.Exceptions.LogException(ex)
                        End Try

                    End If
                End If

            Next

        End Sub




        Private Sub UnloadCss(ByVal sFileName As String)

            Dim oCSS As Control = Me.Page.FindControl("CSS")

            For Each oControl As Control In oCSS.Controls
                Select Case oControl.GetType.ToString
                    Case "System.Web.UI.HtmlControls.HtmlLink"
                        Dim oLink As HtmlLink = CType(oControl, HtmlLink)
                        If CheckStringFound(oLink.Attributes("href"), sFileName) Then
                            oLink.Visible = False
                        End If
                End Select
            Next

            'For the control panel CSS
            Dim oHead As Control = Me.Page.FindControl("Head")
            For Each oControl As Control In oHead.Controls
                Select Case oControl.GetType.ToString
                    Case "System.Web.UI.LiteralControl"
                        Dim oLink As LiteralControl = CType(oControl, LiteralControl)
                        If CheckStringFound(oLink.Text, sFileName) Then
                            oLink.Visible = False
                        End If
                End Select
            Next


        End Sub




        Private Sub ProcessMetaTags()   'Process meta tags to add to the head

            If Not AddMetaTags.Trim = String.Empty Then
                'Get the individual meta Tags
                For Each s As String In AddMetaTags.Split("|")
                    'Split name and Value
                    Dim m As String() = s.Split(":")
                    If m.Length = 2 Then
                        WriteMeta(m(0).Trim, m(1).Trim)
                    End If

                Next
            End If

        End Sub



        Public Sub WriteMeta(ByVal sName As String, ByVal sContent As String)

            Dim oMeta As New HtmlMeta
            oMeta.Name = sName
            oMeta.Content = sContent
            Me.Page.Header.Controls.Add(oMeta)


        End Sub



        Private Sub ProcessLoadFiles()  'Process the files to add to the head

            'CSS files
            If Not AddCssFile.Trim = String.Empty Then

                For Each s As String In AddCssFile.Split(",")

                    'First process tokens to prevent issues with css file media passed (uses : too)

                    s = ProcessTokens(s)

                    'Check for "" again as this could be the case if one of the tokens returns nothing

                    If Not s = String.Empty Then

                        Dim sMedia As String = CssMedia

                        'Get the media types, if passed with the filename
                        Dim m As Match = Regex.Match(s, ":[^/].*")

                        If m.Length > 0 Then
                            'Remove the match from the original string
                            s = s.Replace(m.Value, "")
                            'Parse passed tokens

                            'Format the media types
                            sMedia = m.Value
                            sMedia = Regex.Replace(sMedia, "^:", "") 'Remove first :
                            sMedia = Regex.Replace(sMedia, ":", ", ") 'Replace : by ,
                        End If

                        WriteToHead(s, "css", "", AddAtEnd, sMedia)

                    End If

                Next
            End If

            'JS files
            If Not AddJsFile.Trim = String.Empty Then
                For Each s As String In AddJsFile.Split(",")

                    'Process tokens
                    s = ProcessTokens(s)

                    'Check for "" again as this could be the case if one of the tokens returns nothing
                    If Not s = String.Empty Then
                        WriteToHead(s, "js", "", AddAtEnd)
                    End If

                Next
            End If

        End Sub


        Private Sub ProcessAdd2Head()
            'Process the string that are to be added to the head of the page

            For Each s As String In AddToHead.Split("||")
                Add2Head(s)
            Next

        End Sub


        Private Sub Add2Head(ByVal sIn As String)
            'Write a string to the head of the page

            'Get the head element
            Dim oHead As HtmlGenericControl = Me.Page.FindControl("Head")

            'Create literal and parse the tokens
            Dim litAdd As New Literal
            litAdd.Text = ProcessTokens(sIn)

            'Test if head exists
            If Not oHead Is Nothing Then
                'Get position
                Dim iLocation As Integer = 0
                If AddAtEnd = True Then
                    iLocation = oHead.Controls.Count
                End If
                'Inject the string
                oHead.Controls.AddAt(iLocation, litAdd)

            End If


        End Sub





        Private Sub ProcessHtmlAttributes()
            'Process pipe separated list of attributes for the HTML element
            For Each m As String In AddHtmlAttribute.Split("|")
                Dim s As String() = m.Split(",")
                If s.Length = 2 Then
                    AddNewHtmlAttribute(m.Split(",")(0), m.Split(",")(1))
                End If
            Next

        End Sub



        Private Sub AddNewHtmlAttribute(ByVal Attribute As String, ByVal Value As String)
            'Write attributes to the HTML element
            If Attribute <> String.Empty And Value <> String.Empty Then
                Dim oPage As CDefault = TryCast(Me.Page, CDefault)
                If oPage.HtmlAttributes(Attribute) > "" Then
                    'If attribute already exists, overwrite it
                    oPage.HtmlAttributes(Attribute) = Value
                Else
                    oPage.HtmlAttributes.Add(Attribute, Value)
                End If

            End If

        End Sub


        Protected Function HtmlAttributeList() As String
            'Get the DNN page
            Dim oPage As CDefault = TryCast(Me.Page, CDefault)

            If (oPage.HtmlAttributes IsNot Nothing) AndAlso (oPage.HtmlAttributes.Count > 0) Then
                Dim attr = New StringBuilder("")
                For Each AttributeName As String In oPage.HtmlAttributes.Keys
                    If (Not [String].IsNullOrEmpty(AttributeName)) AndAlso (oPage.HtmlAttributes(AttributeName) IsNot Nothing) Then
                        Dim attributeValue As String = oPage.HtmlAttributes(AttributeName)
                        If (attributeValue.IndexOf(",") > 0) Then
                            Dim attributeValues = attributeValue.Split(","c)
                            For attributeCounter As Integer = 0 To attributeValues.Length - 1
                                attr.Append((" " & AttributeName & "=""") + attributeValues(attributeCounter) & """")
                            Next
                        Else
                            attr.Append(" " & AttributeName & "=""" & attributeValue & """")
                        End If
                    End If
                Next
                Return attr.ToString()
            End If
            Return ""

        End Function


        Private Sub ProcessDoctype()

            If Doctype <> String.Empty Then
                'Will overwrite the doctype with the passed doctype

                Dim strLang As String = System.Globalization.CultureInfo.CurrentCulture.ToString()
                'Sets the skins doctype
                Dim liDoctype As Literal = CType(Me.Page.FindControl("skinDocType"), Literal)

                If Not liDoctype Is Nothing Then
                    If StringContains(Doctype, "HTML 5") Then 'HTML 5
                        liDoctype.Text = "<!DOCTYPE HTML>"
                    ElseIf StringContains(Doctype, "XHTML") Then 'XHTML

                        AddNewHtmlAttribute("xml:lang", strLang)
                        AddNewHtmlAttribute("xmlns", "http://www.w3.org/1999/xhtml")

                        If StringContains(Doctype, "Strict") Then ' 1.0 Strict
                            liDoctype.Text = "<!DOCTYPE html PUBLIC '-//W3C//DTD XHTML 1.0 Strict//EN' 'http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd'>"
                        ElseIf StringContains(Doctype, "Transitional") Then ' 1.0 Transitional
                            liDoctype.Text = "<!DOCTYPE html PUBLIC '-//W3C//DTD XHTML 1.0 Transitional//EN' 'http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd'>"
                        ElseIf StringContains(Doctype, "XHTML 1.1") Then ' 1.1
                            liDoctype.Text = "<!DOCTYPE html PUBLIC '-//W3C//DTD XHTML 1.1//EN' 'http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd'>"
                        End If

                    ElseIf StringContains(Doctype, "HTML 4.01 Strict") Then ' HTML 4.01 Strict
                        liDoctype.Text = "<!DOCTYPE HTML PUBLIC '-//W3C//DTD HTML 4.01//EN' 'http://www.w3.org/TR/html4/strict.dtd'>"

                    Else
                        liDoctype.Text = "<!DOCTYPE HTML PUBLIC '-//W3C//DTD HTML 4.01 Transitional//EN' 'http://www.w3.org/TR/html4/loose.dtd'>"
                    End If
                End If
            End If


        End Sub






        Private Sub WriteToHead(ByVal sFile As String, ByVal sType As String, Optional ByVal sId As String = "", Optional ByVal bAddAtEnd As Boolean = True, Optional ByVal sMedia As String = "screen")

            Dim sFilePath As String = ProcessPath(BasePath, sFile)
            Dim oLink As New HtmlGenericControl

            Select Case sType 'Check what kind of file this is

                Case "css" ' CSS
                    oLink = New HtmlGenericControl("link")
                    oLink.Attributes("href") = sFilePath
                    oLink.Attributes("media") = sMedia
                    oLink.Attributes("type") = "text/css"
                    oLink.Attributes("rel") = "stylesheet"
                Case "js" ' JS
                    oLink = New HtmlGenericControl("script")
                    oLink.Attributes("language") = "javascript"
                    oLink.Attributes("type") = "text/javascript"
                    oLink.Attributes("src") = sFilePath
            End Select

            If Not oLink Is Nothing Then
                Dim oAddTo As Control


                Dim iLocation As Integer = 0
                If bAddAtEnd = True Then
                    oAddTo = Me.Page.FindControl("Head")
                    iLocation = oAddTo.Controls.Count
                Else
                    oAddTo = Me.Page.FindControl("CSS")
                End If

                If Not oAddTo Is Nothing Then
                    oAddTo.Controls.AddAt(iLocation, oLink)
                End If
            End If

        End Sub



        Private Sub RemoveControl(ByVal id As String)
            'Set a controls visibilty to false

            Dim oControl As Control = Me.Page.FindControl(id)
            If Not oControl Is Nothing Then
                oControl.Visible = False

            End If

        End Sub



        Private Function ProcessPath(ByVal BasePath As String, ByVal Path As String) As String

            'Check if the subpath is not a absolute URI and there is no root token in the base path.
            If Not (Path.Contains("://") Or Regex.IsMatch(Path, "\[.\]", RegexOptions.IgnoreCase)) Then
                Path = CombinePath(PathTokeReplace(BasePath), Path)
            Else
                Path = PathTokeReplace(Path)
            End If

            Return Path

        End Function


        Private Function PathTokeReplace(ByVal Path As String) As String
            'Replace tokens in Path
            Path = Regex.Replace(Path, "\[S\]", PortalSettings.ActiveTab.SkinPath, RegexOptions.IgnoreCase) 'Skin Path
            Path = Regex.Replace(Path, "\[P\]", PortalSettings.HomeDirectory, RegexOptions.IgnoreCase) 'Portal Path
            Path = Regex.Replace(Path, "\[M\]", Me.TemplateSourceDirectory, RegexOptions.IgnoreCase) 'Skin Object Path
            Path = Regex.Replace(Path, "\[R\]", "/") 'Root Path
            Path = Regex.Replace(Path, "\[D\]", "/DesktopModules/") 'DesktopModules

            Return Path

        End Function


        Private Function CombinePath(ByVal BasePath As String, ByVal SubPath As String) As String
            'Combine two path

            If BasePath.EndsWith("/") Then
                If SubPath.StartsWith("/") Then
                    SubPath.Substring(1, SubPath.Length - 1)
                End If
            Else
                If Not SubPath.StartsWith("/") Then
                    SubPath = "/" & SubPath
                End If
            End If

            Return BasePath & SubPath


        End Function



        Private Function CheckConditions() As Boolean

            Return CheckBrowsers(IfBrowser) AndAlso _
            CheckUser(IfUserName) AndAlso _
            CheckURLs(IfURL) AndAlso _
            CheckCultures(IfCulture) AndAlso _
            CheckUserAgents(IfUserAgentString) AndAlso _
            CheckRoles(IfRole) AndAlso _
            CheckQueryString(IfQS) AndAlso _
            CheckTextDir(IfTextDir) AndAlso _
            CheckMobile() AndAlso _
            CheckCookies(IfCookie)

        End Function


#End Region


#Region "Condition Functions"


        Protected Function CheckBrowsers(ByVal sBrowsers As String) As Boolean
            'Check if the current browser is part of the browser string

            If sBrowsers = String.Empty Then
                Return (True)
            Else
                Dim bOut As Boolean = False
                For Each s As String In sBrowsers.Split(",")
                    bOut = (CheckBrowser(s))
                    If bOut Then
                        Return (bOut)
                    End If
                Next
                Return (bOut)
            End If

        End Function



        Protected Function CheckBrowser(ByVal sIn As String) As Boolean

            'Get all the current browsers data
            Dim sCurBrowser As String = GetBrowser()
            Dim siCurBrowser As Single = 0

            Dim bInclude As Boolean

            sIn = sIn.ToLower

            'Check for Negation (!)
            bInclude = Not CheckInvert(sIn)

            Dim bCheck As Boolean = False
            'Split Browser name and Version
            Dim sBrowser() As String = Regex.Split(sIn, "[<>=]")

            If (sBrowser(0).Trim = sCurBrowser) Then
                Select Case sBrowser.Length
                    Case 1
                        'If there is no version number
                        bCheck = True
                    Case 2
                        'If there is a version number
                        Dim siVersion As Double
                        siVersion = Val(sBrowser(1))
                        'Check if no minor version was passed
                        If sBrowser(1).IndexOf(".") = -1 Then
                            siCurBrowser = GetBrowserVersion(False)
                        Else
                            siCurBrowser = GetBrowserVersion(True)
                        End If

                        'Get the kind of filtering
                        If sIn.IndexOf("=") > 0 Then
                            If siVersion = siCurBrowser Then bCheck = True
                        End If

                        If sIn.IndexOf("<") > 0 Then
                            If siVersion > siCurBrowser Then bCheck = True
                        End If

                        If sIn.IndexOf(">") > 0 Then
                            If siCurBrowser > siVersion Then bCheck = True
                        End If
                End Select
            End If

            Return (Not (bCheck Xor bInclude))

        End Function



        Protected Function GetBrowserVersion(Optional ByVal bGetMinor As Boolean = True) As Single
            Dim sVersion As String = Request.Browser.Version.Replace(",", ".")
            Dim sOut As String = String.Empty


            For Each sResult As String In sVersion.Split(".", 2, StringSplitOptions.RemoveEmptyEntries)
                If bGetMinor = False Then
                    'only return the major version
                    sOut = sResult
                    Exit For
                Else
                    sResult = sResult.Replace(".", "")
                    If Not sOut = String.Empty Then
                        sOut &= sResult
                    Else
                        sOut = String.Concat(sResult, ".")
                    End If
                End If
            Next

            Return Val(sOut)

        End Function




        Private Function CheckUserAgents(ByVal sUserAgents As String) As Boolean

            If sUserAgents = String.Empty Then
                Return (True)
            Else
                'Get the current UserAgentString
                Dim sUserAgent As String = Request.UserAgent
                Return (MatchString(sUserAgent, sUserAgents))
            End If

        End Function




        Private Function CheckUser(ByVal sUsers As String) As Boolean

            If sUsers = String.Empty Then
                Return (True)
            Else
                'Get the current username
                Dim sUser As String = UserController.GetCurrentUserInfo().Username
                Return (MatchString(sUser, sUsers))
            End If

        End Function




        Private Function CheckRoles(ByVal sRoles As String) As Boolean


            If sRoles = String.Empty Then
                'If no filter roles set return True
                Return (True)
            Else

                'Regular Check, user in roles
                Dim sAllroles As String = GetUserroles()

                'As there is no superuser role add it when the current user is a superuser
                If UserController.GetCurrentUserInfo.IsSuperUser Then
                    sAllroles = CharSepStrAdd(sAllroles, "SuperUsers", "|")
                    sAllroles = CharSepStrAdd(sAllroles, "SuperUser", "|") 'Legacy, was an error in pervious version
                End If


                'If the user is not a member of any roles (not logged in)
                If sAllroles = "" Then
                    If (MatchString("*", sRoles)) Then
                        Return True
                    End If
                Else

                    If (MatchString(sAllroles, sRoles)) Then
                        Return True
                    End If

                    'If SuperUsers was part of the roles list

                End If

                Return False

            End If

        End Function

        Private Function GetUserroles() As String
            'Gets the roles a user is in as one string for regex comparison
            Dim sOut As String = String.Empty

            'Create string with all roles for this user in it
            For Each sRole As String In UserController.GetCurrentUserInfo().Roles
                sOut = CharSepStrAdd(sOut, sRole, "|")
            Next

            Return sOut

        End Function


        Private Function CharSepStrAdd(ByVal Original As String, ByVal Add As String, ByVal Separator As String) As String
            'Add a character separated string to an existing string

            If Add > String.Empty Then
                If Original = String.Empty Then
                    Return Add
                Else
                    Return String.Format("{0}{1}{2}", Original, Separator, Add)
                End If
            Else
                Return Original
            End If

        End Function

        Private Function CheckRoles2(ByVal sRoles As String) As Boolean


            If sRoles = String.Empty Then
                'If no filter roles set return True
                Return (True)
            Else
                'If the user is not a member of any roles
                If UserController.GetCurrentUserInfo().Roles.Length = 0 Then
                    If (PortalSettings.Current.UserInfo.IsSuperUser) Then
                        If (MatchString(PortalSettings.AdministratorRoleName, sRoles)) Then
                            Return True
                        End If
                    Else
                        If (MatchString("*", sRoles)) Then
                            Return True
                        End If
                    End If
                Else
                    'Regular Check, user in roles
                    Dim sAllroles As String = String.Empty
                    'Create string with all roles for this user in it
                    For Each sRole As String In UserController.GetCurrentUserInfo().Roles
                        sAllroles &= sRole
                    Next
                    If (MatchString(sAllroles, sRoles)) Then
                        Return True
                    End If

                    'If SuperUsers was part of the roles list

                    If UserController.GetCurrentUserInfo.IsSuperUser Then
                        If (MatchString(sRoles, "superuser")) Then
                            Return True
                        End If
                    End If


                End If

                Return False

            End If


        End Function




        Private Function CheckQueryString(ByVal sQS As String) As Boolean
            'Check if the query string parameter exists and if the value is correct

            'If no QS passed, skin check
            If sQS = String.Empty Then
                Return (True)
            Else
                'Get parameter and value to test for
                Dim ifQS As New ParameterValue(sQS, ":")

                Dim QSValue As String = GetQsValue(ifQS.Parameter)

                If ifQS.Value1 = "" Then
                    'Thsi means only a QS parameter was passed a condition, retrun true if it exists in the current URL
                    If QSValue > "" Then
                        Return True
                    End If
                Else
                    'Check the passed QS paramter value against the current url's QS value
                    If QSValue.ToLower = ifQS.Value1.ToLower Then
                        Return (True)
                    End If

                End If

                Return (False)

            End If

        End Function




        Private Function CheckURLs(ByVal sUrls As String) As Boolean

            If sUrls = String.Empty Then
                Return True
            Else
                'Get the current username
                Dim sUrl As String = PortalSettings.ActiveTab.FullUrl

                Return (MatchString(sUrl, sUrls))

            End If

        End Function




        Protected Function CheckCultures(ByVal sCultures As String) As Boolean


            If sCultures > String.Empty Then
                'Get the current username
                Dim sCulture As String = CurrentCulture.ToLower

                Return (MatchString(sCulture, sCultures))
            Else
                Return (True)

            End If

        End Function




        Protected Function CheckTextDir(ByVal sTextDir As String) As Boolean
            'Check if there should be a file loaded for RTL or LTR

            If Not sTextDir = String.Empty Then

                Return Not ((sTextDir = "rtl") Xor CultureInfo.CurrentUICulture.TextInfo.IsRightToLeft)

            End If

            Return (True)

        End Function


        Protected Function CheckCookies(ByVal sCookies As String) As Boolean
            'Check if the passed cookies

            If sCookies = String.Empty Then
                Return (True)
            Else
                Dim bOut As Boolean = False
                For Each s As String In sCookies.Split("||")
                    Dim ParVal As New ParameterValue(s, ":")
                    If CheckCookie(ParVal.Parameter, ParVal.Value1) Then
                        Return True
                    Else
                        Return False
                    End If
                Next
                Return (bOut)
            End If

            Return (False)

        End Function

#End Region


#Region "ShowInfo"

        Private Sub WriteShowInfo()
            'This will write the detected information to the page for testing
            Dim s As String = "<div class=""ff_sh_item"">{0}: {1}</div>"
            Dim sbOut As New StringBuilder
            sbOut.AppendLine("<div class=""FFStyleHelper""><h4>40FINGERS Style Helper Skin Object</h4>")
            sbOut.AppendLine(String.Format(s, "ASP.NET detected Browser", ShowBrowser))
            sbOut.AppendLine(String.Format(s, "ASP.NET detected Browserversion", ShowBrowserVersion))
            sbOut.AppendLine(String.Format(s, "Useragent String", Request.UserAgent))
            sbOut.AppendLine(String.Format(s, "Current Username", UserController.GetCurrentUserInfo().Username))

            Dim sRoles As String = String.Empty

            For Each sRole As String In UserController.GetCurrentUserInfo().Roles
                If Not sRole = String.Empty Then
                    sRole &= ", "
                End If
                sRoles &= sRole
            Next

            sbOut.AppendLine(String.Format(s, "Current UserRoles", sRoles))
            sbOut.AppendLine(String.Format(s, "Culture", ShowCulture))
            sbOut.AppendLine(String.Format(s, "Text Direction", ShowIfTextDir))
            sbOut.AppendLine("</div>")

            ltShowInfo.Text &= sbOut.ToString


        End Sub

#End Region


#Region "Helper Functions"

        Private Function CheckDnnVersion(ByVal TestVersion As String) As Integer
            'Pass a test version, returns > 0 if it's higher equal or lower then the current DNN version

            Dim CompareVersion As New Version(TestVersion.Replace(",", "."))

            Dim DnnVersion As New Version(PortalSettings.Version.Replace(",", "."))

            Return DnnVersion.CompareTo(CompareVersion)


        End Function


        Protected Function GetBrowser() As String

            Return Request.Browser.Browser.ToLower

        End Function




        Private Function CurrentCulture() As String

            Return CultureInfo.CurrentUICulture.Name.ToString

        End Function



        Private Class ParameterValue
            'Pass a QS parameter & value combination and split in parameter and value

            Private _sParameter As String
            Public Property Parameter() As String
                Get
                    Return _sParameter
                End Get
                Set(ByVal value As String)
                    _sParameter = value
                End Set
            End Property



            Private _sValue As String
            Public Property Value1() As String
                Get
                    Return _sValue
                End Get
                Set(ByVal value As String)
                    _sValue = value
                End Set
            End Property



            Public Sub New(ByVal Pair As String, ByVal SplitChar As String)

                SplitChar = Regex.Escape(SplitChar)

                If Pair > "" Then
                    'Check if any value was passed
                    If Pair.Contains(SplitChar) Then
                        Parameter = Regex.Split(Pair, SplitChar, RegexOptions.IgnoreCase)(0)
                        Value1 = Regex.Split(Pair, SplitChar, RegexOptions.IgnoreCase)(1)
                    Else
                        'If no value passed, return "" as the value
                        Parameter = Pair
                        Value1 = ""
                    End If

                End If

            End Sub


        End Class

        Public Function GetValue(ByVal Pair As String, ByVal SplitChar As String) As String

            If Pair > "" Then
                Dim oPV As New ParameterValue(Pair, SplitChar)
                Return oPV.Value1
            End If

            Return ""

        End Function



        Private Function GetQsValue(ByVal Parameter As String) As String

            If Request.QueryString(Parameter) Is Nothing Then
                Return (String.Empty)
            Else
                Return Request.QueryString(Parameter)
            End If

        End Function


        Private Function RemoveStartEnd(ByVal sIn As String, ByVal StartString As String, ByVal EndString As String) As String
            'Remove characters a start eand end of string

            StartString = "^" & Regex.Escape(StartString)
            sIn = Regex.Replace(sIn, StartString, "", RegexOptions.IgnoreCase)

            EndString = Regex.Escape(EndString) & "$"
            sIn = Regex.Replace(sIn, EndString, "", RegexOptions.IgnoreCase)

            Return sIn

        End Function




        Private Function MatchString(ByVal sTest As String, ByVal sParameters As String) As Boolean
            'Test if one of the parameters (comma separated) matches the Test string

            If sParameters = String.Empty Or sTest = String.Empty Then
                Return False
            End If

            Dim bReturn As Boolean = False

            For Each s As String In Regex.Split(sParameters, ",", RegexOptions.IgnoreCase)

                'Check if the string contains an invert
                Dim bInvert As Boolean = CheckInvert(s)
                'Combine the invert and the found boolean for the correct value

                Dim bFound As Boolean = Regex.IsMatch(sTest, s, RegexOptions.IgnoreCase)

                If bInvert Then
                    'If an inverted value was found, this can never be a match
                    If bFound = True Then
                        Return (False)
                    Else
                        'This can be the correct value, but the rest of the test needs bo be done (for !a, !b)
                        bReturn = True
                    End If
                Else
                    'For a normal value, if the value is found this must be correct, if not it must be incorrect
                    Return bFound
                End If

            Next

            Return bReturn

        End Function




        Private Function CheckStringFound(ByVal sIn As String, ByVal sCheck As String) As Boolean

            Try
                If sCheck = "/" Then sCheck = "/.*"
                Return Regex.IsMatch(sIn, sCheck, RegexOptions.IgnoreCase)
            Catch ex As Exception
                Return ""
            End Try

        End Function




        Private Function CheckInvert(ByRef sIn As String) As Boolean
            'Check for Invert (!)
            Dim sTest As String = "^" & _sNOT

            If Regex.IsMatch(sIn, sTest) Then
                sIn = Regex.Replace(sIn, sTest, "")
                Return True
            Else
                Return False
            End If

        End Function



        Private Function StringContains(ByVal Input As String, ByVal Contains As String) As Boolean

            If Regex.IsMatch(Input, Contains, RegexOptions.IgnoreCase) Then
                Return True
            Else
                Return False
            End If

        End Function



        Private Function ProcessTokens(ByVal sOriginal As String) As String
            'Allow the use of all kinds of DNN attributes to be used in templates
            'Will parse the passed string

            'Replace PortalId
            sOriginal = Regex.Replace(sOriginal, "\[PortalId\]", PortalSettings.PortalId.ToString, RegexOptions.IgnoreCase)

            'Get the pattern [xxx]
            Dim m As Match = Regex.Match(sOriginal, "\[.*:.*\]", RegexOptions.IgnoreCase)

            If Not m.Value = String.Empty Then

                'Get rid of the []
                Dim s As String = RemoveStartEnd(m.Value, "[", "]")

                'Split the parameter and value
                Dim oParamVal As New ParameterValue(s, ":")

                Select Case oParamVal.Parameter
                    Case "QS"
                        Dim sQS As String = GetQsValue(oParamVal.Value1)

                        If sQS = String.Empty Then
                            'Return "" if querystring not found
                            sOriginal = Regex.Replace(sOriginal, Regex.Escape(m.Value), "")
                        Else
                            sOriginal = Regex.Replace(sOriginal, Regex.Escape(m.Value), sQS)
                        End If

                End Select

            End If



            Return (sOriginal)

        End Function

#End Region


#Region "PageClasses"

        Private Sub ProcessPageClassTemplate(ByVal Template As String)
            'Process the template for the body CSS class
            Dim sOut As String = String.Empty

            Dim oTab As DotNetNuke.Entities.Tabs.TabInfo

            'Get Bc Name Class
            If Regex.IsMatch(Template, "\[BcName\]", RegexOptions.IgnoreCase) Then
                For Each oTab In PortalSettings.ActiveTab.BreadCrumbs
                    sOut &= " " & CreateValidCssClass("L" & oTab.Level & "_" & oTab.TabName)
                Next
                Template = Regex.Replace(Template, "\[BcName\]", sOut, RegexOptions.IgnoreCase)
            End If

            sOut = String.Empty

            'Get Bc Id Class
            If Regex.IsMatch(Template, "\[BcId\]", RegexOptions.IgnoreCase) Then
                For Each oTab In PortalSettings.ActiveTab.BreadCrumbs
                    sOut &= " " & CreateValidCssClass("Id" & oTab.TabID)
                Next
                Template = Regex.Replace(Template, "\[BcId\]", sOut, RegexOptions.IgnoreCase)
            End If

            sOut = String.Empty

            'Get Bc Order Class
            If Regex.IsMatch(Template, "\[BcNr\]", RegexOptions.IgnoreCase) Then
                For Each oTab In PortalSettings.ActiveTab.BreadCrumbs
                    sOut &= " " & CreateValidCssClass("L" & oTab.Level & "_" & "Nr" & GetTabOrder(oTab.TabID))
                Next
                Template = Regex.Replace(Template, "\[BcNr\]", sOut, RegexOptions.IgnoreCase)
            End If


            'Get Bc Role Class
            If Regex.IsMatch(Template, "\[UserPageRoles\]", RegexOptions.IgnoreCase) Then
                Template = Regex.Replace(Template, "\[UserPageRoles\]", GetUserPageRolesClass)
            End If



            WritePageClass(Template.Trim)


        End Sub


        Private Function GetUserPageRolesClass() As String

            'For all the roles that have view right on this page, get all roles the current user is a member of.
            'Please note that host is treaded as a member of all roles (so all roles will be reurned if you are logged in as Host)

            'Get Authorized roles for this page
            Dim sRoles As String = PortalSettings.ActiveTab.AuthorizedRoles
            Dim sOut As String = String.Empty

            If sRoles > "" Then
                'Remove ; at the end
                sRoles = Regex.Replace(sRoles, ";$", "")

                'Split out all the roles
                For Each sRole As String In Regex.Split(sRoles, ";")
                    'Check if the user is a member of the Role
                    If UserController.GetCurrentUserInfo().IsInRole(sRole) Then
                        sOut &= " " & CreateValidCssClass("UPR_" & sRole)
                    End If
                Next
            End If

            Return sOut.Trim

        End Function




        Private Sub WritePageClass(ByVal sIn As String)

            Dim oBody As New HtmlGenericControl
            oBody = CType(Me.Page.FindControl("Body"), HtmlGenericControl)
            oBody.Attributes.Add("class", sIn.Trim)

        End Sub



        Private Function GetTabOrder(ByVal TabId As Integer) As Integer

            Dim iOrder As Integer = 0

            Dim oTabC As New DotNetNuke.Entities.Tabs.TabController
            Dim myTab As DotNetNuke.Entities.Tabs.TabInfo = oTabC.GetTab(TabId, PortalSettings.PortalId, True)
            Dim iParentId As Integer = 0
            If Not myTab Is Nothing Then
                iParentId = myTab.ParentId
            End If

            'DNN 5.2 minimum
            For Each oTab As DotNetNuke.Entities.Tabs.TabInfo In TabController.GetTabsByParent(iParentId, PortalSettings.PortalId)
                If Navigation.CanShowTab(oTab, False, False) And oTab.CultureCode = PortalSettings.ActiveTab.CultureCode Then
                    iOrder += 1
                    If oTab.TabID = TabId Then
                        Exit For
                    End If
                End If
            Next

            Return (iOrder)

        End Function



        Private Function CreateValidCssClass(ByVal sIn As String) As String

            Return Regex.Replace(sIn, "^[^A-z]|[^A-z0-9]", "_")

        End Function



#End Region


#Region "IsMobile"

        Function CheckMobile() As Boolean
            'Will return True if check is not needed.

            If _iIfMobile <> 0 Then
                Dim bCheckFor As Boolean = False
                'Get the correct return Value, make sure it will: 
                'Return True if IsMobile is set to True and this is a mobile browser.
                'Return True if IsMobile is set to False and this is NOT a mobile browser.
                If _iIfMobile = 1 Then bCheckFor = True


                'Detect if the browser is a mobile browser
                'The regex comes from http://detectmobilebrowser.com/
                'Used version: "Regex updated: 30 June 2010"
                Dim u As String = Request.ServerVariables("HTTP_USER_AGENT")
                Dim b As New Regex(IfMobileRX1, RegexOptions.IgnoreCase)
                Dim v As New Regex(IfMobileRX2, RegexOptions.IgnoreCase)
                If b.IsMatch(u) Or v.IsMatch(Left(u, 4)) Then
                    Return (bCheckFor)
                Else
                    Return (Not bCheckFor)
                End If
            Else
                Return True
            End If

        End Function


#End Region

    End Class

End Namespace



