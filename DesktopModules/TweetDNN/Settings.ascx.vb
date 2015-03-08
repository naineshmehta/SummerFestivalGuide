Imports System.Web.UI
Imports System.IO
Imports DotNetNuke

Namespace Modules.TweetDNN
    Partial Class Settings
        Inherits DotNetNuke.Entities.Modules.ModuleSettingsBase

        Public Overrides Sub LoadSettings()
            Try
                Dim CSSFilePath As String = Server.MapPath(ModulePath + ModuleId.ToString() + ".css")
                Dim DefaulCSSFilePath As String = Server.MapPath(ModulePath + "TweetDNN.css")

                If Not Page.IsPostBack Then
                    If CType(ModuleSettings("ScreenName"), String) <> "" Then
                        txtScreenName.Text = ModuleSettings("ScreenName")
                    End If
                    If CType(ModuleSettings("Count"), String) <> "" Then
                        txtCount.Text = ModuleSettings("Count")
                    End If

                    If Not File.Exists(CSSFilePath) Then
                        File.Copy(DefaulCSSFilePath, CSSFilePath)
                    End If
                    txtCSS.Text = File.ReadAllText(CSSFilePath)
                End If
            Catch exc As Exception    'Module failed to load
                ProcessModuleLoadException(Me, exc)
            End Try
        End Sub

        Public Overrides Sub UpdateSettings()
            Try
                Dim CSSFilePath As String = Server.MapPath(ModulePath + ModuleId.ToString() + ".css")
                Dim CacheFile As String = Server.MapPath(ModulePath + ModuleId.ToString() + ".cache")

                Dim TwitterResponse As String = ""
                ' update modulesettings
                Dim objModules As New DotNetNuke.Entities.Modules.ModuleController
                objModules.UpdateModuleSetting(ModuleId, "ScreenName", txtScreenName.Text)
                objModules.UpdateModuleSetting(ModuleId, "Count", txtCount.Text)

                ' update cache
                TwitterResponse = Twitter.GetUserTimeLine(txtScreenName.Text, txtCount.Text)
                File.WriteAllText(CacheFile, TwitterResponse)

                ' update css file
                File.WriteAllText(CSSFilePath, txtCSS.Text)
            Catch exc As Exception    'Module failed to load
                ProcessModuleLoadException(Me, exc)
            End Try
        End Sub
    End Class
End Namespace

