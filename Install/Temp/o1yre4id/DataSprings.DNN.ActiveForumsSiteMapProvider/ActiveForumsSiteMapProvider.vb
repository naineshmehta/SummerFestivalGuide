
Imports System.Collections
Imports System.Collections.Generic
Imports System.Text

' DNN Specific modules 

Imports DotNetNuke.Entities.Portals
Imports DotNetNuke.Common
Imports DotNetNuke.Common.Utilities
Imports DotNetNuke.Entities.Tabs
Imports DotNetNuke.Entities.Modules
Imports DotNetNuke.Entities.Modules.Definitions
Imports DotNetNuke.Services.Localization
Imports DotNetNuke.Modules.Admin
Imports System


Imports Active.Modules.Forums
Imports Active.Modules.Forums.Data


Imports DotNetNuke.Providers.SearchEngineSiteMapProvider

Namespace DataSprings.DNN.Modules
    Public Class ActiveForumsSiteMapProvider
        Inherits SiteMapProvider

        '
        ' * 
        ' * Data Springs, Inc  - http://www.datasprings.com
        ' * Copyright (c) 2010
        ' 

#Region "private memners"
        Private _maxForumEntries As Integer
        Private _hideForumIds As String()
        Private _forumEntries As Integer = 0
#End Region
#Region "Overriden Base Members"

        Public Sub New(ByVal name As String, ByVal config As System.Collections.Specialized.NameValueCollection)
            MyBase.New(name, config)

            _maxForumEntries = Me.GetSafeSetting(config, "maxForumEntries", -1)
            Dim rawHideForumIds As String = Me.GetSafeSetting(config, "hideForumIds", "")
            _hideForumIds = rawHideForumIds.Split(","c)

        End Sub
        Public Overrides Function SitePagesForTab(portalAlias As DotNetNuke.Entities.Portals.PortalAliasInfo, tab As DotNetNuke.Entities.Tabs.TabInfo, locale As Locale, sitemapNum As Integer, urlCount As Integer, startingCount As Integer, endingCount As Integer) As System.Collections.Generic.List(Of DotNetNuke.Providers.SearchEngineSiteMapProvider.SitePage)

            Dim sitePages As New List(Of SitePage)()
            'initalise new value
            MyBase.SetBaseURL(portalAlias.HTTPAlias)
            'set defualt priority based on underyling dnn tab
            _defaultPagePriority = Me.GetTabPriority(_defaultPagePriority, tab)

            Try
                sitePages = GetSitePagesForAFList(portalAlias, tab, locale)

            Catch ex As Exception
                DotNetNuke.Services.Exceptions.ProcessPageLoadException(ex)
            End Try

            Return sitePages
        End Function


#End Region

#Region "private methods"
        Public Function GetSitePagesForAFList(ByVal portalAlias As PortalAliasInfo, ByVal tab As TabInfo, ByVal langLocale As Locale) As List(Of SitePage)
            Dim siteUrls As New List(Of SitePage)()
            Dim lang As String = ""
            If (Not langLocale Is Nothing) Then
                lang = langLocale.Code
            End If
            _forumEntries = 0
            'We need to know the TabID, the ModuleID, and then from there we will get the Active Forum groups, topics, and posts. 
            Dim modCtl As New ModuleController()
            Dim modDefs As New ModuleDefinitionController()
            tab.Modules = modCtl.GetPortalTabModules(portalAlias.PortalID, tab.TabID)
            If tab.Modules IsNot Nothing Then
                For Each moduleOnTab As ModuleInfo In tab.Modules
                    'check each modeul on the page, looking for the wiki-specific ones
                    Dim modulePages As New List(Of SitePage)()
                    Dim modDef As ModuleDefinitionInfo = modDefs.GetModuleDefinition(moduleOnTab.ModuleDefID)
                    Dim modDefFriendlyName As String = modDef.FriendlyName
                    Select Case modDefFriendlyName.ToLower()
                        Case "active forums"
                            'get entries for wiki
                            Dim objGroupInfo As Active.Modules.Forums.ForumGroupInfo
                            Dim objGroupsC As New Active.Modules.Forums.ForumGroupController

                            Try
                                For Each objGroupInfo In objGroupsC.Groups_List(moduleOnTab.ModuleID, False, False)
                                    'Group Url
                                    siteUrls.AddRange(SitePagesFromGroup(tab, lang, tab.PortalID, moduleOnTab.ModuleID, objGroupInfo))
                                    If _forumEntries > _maxForumEntries AndAlso _maxForumEntries > 0 Then Exit For
                                    'Forum Urls
                                    siteUrls.AddRange(SitePagesFromForum(tab, lang, tab.PortalID, moduleOnTab.ModuleID, objGroupInfo, -1))
                                Next
                            Catch
                            End Try

                            Exit Select
                    End Select
                Next
            End If

            Return siteUrls

        End Function
        Private Function SitePagesFromGroup(tab As TabInfo, lang As String, portalId As Integer, moduleId As Integer, objGroupInfo As ForumGroupInfo) As List(Of SitePage)
            Dim objGroupPage As New SitePage
            Dim intDouble As Double
            Dim strIndividualGroupURL As String = ""
            Dim groupSitePages As List(Of SitePage) = New List(Of SitePage)

            strIndividualGroupURL = ""
            'TODO: handle vanity urls for forums?
            Dim strPrefixUrl As String = objGroupInfo.PrefixURL
            If (String.IsNullOrEmpty(strPrefixUrl)) Then
                strIndividualGroupURL = Me.GetTabUrl(tab, lang, "afg=" & objGroupInfo.ForumGroupId.ToString())
            Else
                strIndividualGroupURL = Me.GetTabUrl(tab, lang, strPrefixUrl)
            End If

            objGroupPage.Loc = strIndividualGroupURL
            objGroupPage.ChangeFreq = DefaultPageUpdateFrequency
            objGroupPage.LastMod = DateTime.Now
            objGroupPage.Priority = DefaultPagePriority
            groupSitePages.Add(objGroupPage)
            _forumEntries = _forumEntries + 1
            Return groupSitePages

        End Function
        Private Function SitePagesFromForum(tab As TabInfo, lang As String, portalId As Integer, moduleId As Integer, objGroupInfo As ForumGroupInfo, parentForumId As Integer) As List(Of SitePage)
            Dim sitePages As New List(Of SitePage)
            Dim strTopicURL As String
            Dim intEndingForumID As Integer
            Dim blnContinue As Boolean = True

            Dim forumsDb As Active.Modules.Forums.Data.ForumsDB = New ForumsDB
            Dim rdr As IDataReader = forumsDb.Forums_List(portalId, moduleId, objGroupInfo.ForumGroupId, parentForumId, False)
            Dim forums As List(Of Forum) = DotNetNuke.Common.Utilities.CBO.FillCollection(Of Forum)(rdr)
            Dim objForum As Forum 'iterator
            For Each objForum In forums
                If _forumEntries > _maxForumEntries AndAlso _maxForumEntries > 0 Then Exit For

                If objForum.Hidden = False AndAlso _hideForumIds.Contains(objForum.ForumID.ToString()) = False Then
                    Dim strIndividualForumURL As String = ""
                    Dim strPrefixUrl As String = objForum.PrefixURL
                    If (String.IsNullOrEmpty(strPrefixUrl)) Then
                        strIndividualForumURL = Me.GetTabUrl(tab, lang, "aff=" + objForum.ForumID.ToString())
                    Else
                        strIndividualForumURL = Me.GetTabUrl(tab, lang, strPrefixUrl)
                    End If

                    Dim objSitePage As New SitePage

                    objSitePage.Priority = Me.DefaultPagePriority
                    objSitePage.Loc = strIndividualForumURL
                    objSitePage.ChangeFreq = Me.DefaultPageUpdateFrequency
                    If (objForum.LastPostDateTime > DateTime.MinValue) Then
                        objSitePage.LastMod = objForum.LastPostDateTime
                    Else
                        objSitePage.LastMod = DateTime.Now
                    End If
                    'forum site page
                    sitePages.Add(objSitePage)
                    _forumEntries = _forumEntries + 1

                    'now get topic site pages
                    Dim topics As List(Of AFForumTopic) = GetMyAFTopics(objForum.ForumID, moduleId)
                    For Each objForumTopic As AFForumTopic In topics
                        Dim strIndividualTopicURL As String = ""
                        objSitePage = New SitePage
                        Dim intPriority As Double

                        If (objForumTopic.ViewCount > 20000) Or (objForumTopic.ReplyCount > 20) Then
                            intPriority = 0.9
                        ElseIf (objForumTopic.ViewCount > 15000) Or (objForumTopic.ReplyCount > 15) Then
                            intPriority = 0.8
                        ElseIf (objForumTopic.ViewCount > 10000) Or (objForumTopic.ReplyCount > 10) Then
                            intPriority = 0.7
                        ElseIf (objForumTopic.ViewCount > 5000) Or (objForumTopic.ReplyCount > 5) Then
                            intPriority = 0.6
                        Else
                            intPriority = Me.DefaultPagePriority
                        End If

                        Dim topicUrl As String = objForumTopic.TopicURL
                        If (String.IsNullOrEmpty(topicUrl)) Then
                            strIndividualTopicURL = Me.GetTabUrl(tab, lang, "aft=" + objForumTopic.TopicID.ToString())
                        Else
                            strIndividualTopicURL = Me.GetTabUrl(tab, lang, topicUrl)
                        End If

                        objSitePage.Priority = intPriority
                        objSitePage.Loc = strIndividualTopicURL
                        objSitePage.ChangeFreq = Me.DefaultPageUpdateFrequency
                        objSitePage.LastMod = DateTime.Now
                        sitePages.Add(objSitePage)
                        _forumEntries = _forumEntries + 1
                    Next
                End If
            Next



            Return sitePages
        End Function
        Public Function GetMyAFTopics(ByVal intForumID As Integer, ByVal MyModuleID As Integer) As List(Of AFForumTopic)
            Dim objMySource As New Active.Modules.Forums.SqlDataProvider
            Return DotNetNuke.Common.Utilities.CBO.FillCollection(Of AFForumTopic)(objMySource.Instance().Topics_List(intForumID, 0, MyModuleID))
        End Function

#End Region

    End Class
End Namespace
