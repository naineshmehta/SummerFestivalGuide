'+--------------------------------------------------------------------+
' THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED 
' TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL 
' THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF 
' CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER 
' DEALINGS IN THE SOFTWARE.
'+--------------------------------------------------------------------+

Imports System.IO
Imports System.Runtime.Serialization.Formatters
Imports DotNetNuke

Namespace Modules.Simple.Tweets
    ''' -----------------------------------------------------------------------------
    ''' <summary>
    ''' The Settings ModuleSettingsBase is used to manage the 
    ''' settings for the Module
    ''' </summary>
    ''' <remarks>
    ''' </remarks>
    ''' <history>
    ''' 	[Spook_Man]	2012-03-19	created
    ''' </history>
    ''' -----------------------------------------------------------------------------
    Partial Public Class Settings
        Inherits DotNetNuke.Entities.Modules.ModuleSettingsBase

#Region "Base Method Implementations"
        ''' -----------------------------------------------------------------------------
        ''' <summary>
        ''' </summary>
        ''' <remarks>
        ''' </remarks>
        ''' <history>
        ''' 	[Spook_Man]	2012-03-19	created
        ''' </history>
        ''' -----------------------------------------------------------------------------
        Public Overrides Sub LoadSettings()
            Try
                If Not Page.IsPostBack Then
                    'DotNetNuke.Framework.jQuery.RequestRegistration()

                    ' The Twitter Username
                    If Settings("txtTwitterName") = "" Then
                        txtTwitterName.Text = ""
                    Else
                        txtTwitterName.Text = ModuleSettings("txtTwitterName")
                    End If

                    ' Poll for New Tweets
                    chkPollForNew.Checked = ModuleSettings("chkPollForNew")

                    ' Add Scrollbar
                    chkIncludeScrollBar.Checked = ModuleSettings("chkIncludeScrollBar")

                    ' Tweet Behavior
                    If ModuleSettings("rblBehaviour") = "All" Then
                        rblBehaviour.Items.FindByValue("All").Selected = True
                        divTimedSettings.Visible = False
                    Else
                        rblBehaviour.Items.FindByValue("Default").Selected = True
                        divTimedSettings.Visible = True
                    End If

                    ' Loop Results
                    chkLoopResults.Checked = ModuleSettings("chkLoopResults")

                    ' Tweet Interval
                    If Settings("txtTweetInterval") = "" Then
                        txtTweetInterval.Text = ""
                    Else
                        txtTweetInterval.Text = ModuleSettings("txtTweetInterval")
                    End If

                    ' Number of Tweets
                    If Settings("txtNumberOfTweets") = "" Then
                        txtNumberOfTweets.Text = ""
                    Else
                        txtNumberOfTweets.Text = ModuleSettings("txtNumberOfTweets")
                    End If

                    ' Tweet Font-Size
                    If Settings("txtFontSize") = "" Then
                        txtFontSize.Text = "12"
                    Else
                        txtFontSize.Text = ModuleSettings("txtFontSize")
                    End If

                    ' Show Avatars
                    chkAvatars.Checked = ModuleSettings("chkAvatars")

                    ' Show Hashtags
                    chkHashTags.Checked = ModuleSettings("chkHashTags")

                    ' Show TimeStamp
                    chkTimeStamp.Checked = ModuleSettings("chkTimeStamp")

                    ' Shell Background Color
                    If Settings("txtShellBackground") = "" Then
                        txtShellBackground.Text = "#7b0000"
                    Else
                        txtShellBackground.Text = ModuleSettings("txtShellBackground")
                    End If

                    ' Shell Text Color
                    If Settings("txtShellText") = "" Then
                        txtShellText.Text = "#f6f9fa"
                    Else
                        txtShellText.Text = ModuleSettings("txtShellText")
                    End If

                    ' Tweet Background Color
                    If Settings("txtTweetBackground") = "" Then
                        txtTweetBackground.Text = "#f6f9fa"
                    Else
                        txtTweetBackground.Text = ModuleSettings("txtTweetBackground")
                    End If

                    ' Tweet Text Color
                    If Settings("txtTweetText") = "" Then
                        txtTweetText.Text = "#666666"
                    Else
                        txtTweetText.Text = ModuleSettings("txtTweetText")
                    End If

                    ' Link Text Color
                    If Settings("txtLinkColor") = "" Then
                        txtLinkColor.Text = "#007cbc"
                    Else
                        txtLinkColor.Text = ModuleSettings("txtLinkColor")
                    End If

                    ' Tweet Box Width
                    If Settings("txtTweetWidth") = "" Then
                        txtTweetWidth.Text = ""
                    Else
                        txtTweetWidth.Text = ModuleSettings("txtTweetWidth")
                    End If

                    ' Tweet Box Height
                    If Settings("txtTweetHeight") = "" Then
                        txtTweetHeight.Text = ""
                    Else
                        txtTweetHeight.Text = ModuleSettings("txtTweetHeight")
                    End If

                    ' DIV Padding Top
                    If Settings("txtDivPaddingTop") = "" Then
                        txtDivPaddingTop.Text = ""
                    Else
                        txtDivPaddingTop.Text = ModuleSettings("txtDivPaddingTop")
                    End If

                    ' DIV Padding Right
                    If Settings("txtDivPaddingRight") = "" Then
                        txtDivPaddingRight.Text = ""
                    Else
                        txtDivPaddingRight.Text = ModuleSettings("txtDivPaddingRight")
                    End If

                    ' DIV Padding Bottom
                    If Settings("txtDivPaddingBottom") = "" Then
                        txtDivPaddingBottom.Text = ""
                    Else
                        txtDivPaddingBottom.Text = ModuleSettings("txtDivPaddingBottom")
                    End If

                    ' DIV Padding Left
                    If Settings("txtDivPaddingLeft") = "" Then
                        txtDivPaddingLeft.Text = ""
                    Else
                        txtDivPaddingLeft.Text = ModuleSettings("txtDivPaddingLeft")
                    End If

                    ' If Debugging message will be shown
                    chkDebug.Checked = ModuleSettings("chkDebug")
	    	End If

            Catch exc As Exception    'Module failed to load
                ProcessModuleLoadException(Me, exc)
            End Try

        End Sub

        Public Sub rblBehaviour_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles rblBehaviour.SelectedIndexChanged
            If rblBehaviour.SelectedValue = "All" Then
                divTimedSettings.Visible = False
            ElseIf rblBehaviour.SelectedValue = "Default" Then
                divTimedSettings.Visible = True
            End If
        End Sub

        Public Overrides Sub UpdateSettings()
            Try
                ' update modulesettings
                Dim objModules As New DotNetNuke.Entities.Modules.ModuleController

                ' Twitter User Name
                If Not txtTwitterName.Text Is Nothing Then
                    objModules.UpdateModuleSetting(ModuleId, "txtTwitterName", txtTwitterName.Text)
                End If

                ' Poll for New Tweets
                objModules.UpdateModuleSetting(ModuleId, "chkPollForNew", chkPollForNew.Checked)

                ' Allow Scroll Bar
                objModules.UpdateModuleSetting(ModuleId, "chkIncludeScrollBar", chkIncludeScrollBar.Checked)

                ' Tweet Behaviour
                objModules.UpdateModuleSetting(ModuleId, "rblBehaviour", rblBehaviour.SelectedItem.Value)

                ' Loop Results
                objModules.UpdateModuleSetting(ModuleId, "chkLoopResults", chkLoopResults.Checked)

                ' Tweet Interval
                If Not txtTweetInterval.Text Is Nothing Then
                    objModules.UpdateModuleSetting(ModuleId, "txtTweetInterval", txtTweetInterval.Text)
                End If

                ' Number of Tweets
                If Not txtNumberOfTweets.Text Is Nothing Then
                    objModules.UpdateModuleSetting(ModuleId, "txtNumberOfTweets", txtNumberOfTweets.Text)
                End If

                ' Tweet Font-Size
                If Not txtFontSize.Text Is Nothing Then
                    objModules.UpdateModuleSetting(ModuleId, "txtFontSize", txtFontSize.Text)
                End If

                ' Show Avatars
                objModules.UpdateModuleSetting(ModuleId, "chkAvatars", chkAvatars.Checked)

                ' Show Hashtags
                objModules.UpdateModuleSetting(ModuleId, "chkHashTags", chkHashTags.Checked)

                ' Show TimeStamp
                objModules.UpdateModuleSetting(ModuleId, "chkTimeStamp", chkTimeStamp.Checked)

                ' Shell Background Color
                If Not txtShellBackground.Text Is Nothing Then
                    objModules.UpdateModuleSetting(ModuleId, "txtShellBackground", txtShellBackground.Text)
                End If

                ' Shell Text Color
                If Not txtShellText.Text Is Nothing Then
                    objModules.UpdateModuleSetting(ModuleId, "txtShellText", txtShellText.Text)
                End If

                ' Tweet Background Color
                If Not txtTweetBackground.Text Is Nothing Then
                    objModules.UpdateModuleSetting(ModuleId, "txtTweetBackground", txtTweetBackground.Text)
                End If

                ' Tweet Text Color
                If Not txtTweetText.Text Is Nothing Then
                    objModules.UpdateModuleSetting(ModuleId, "txtTweetText", txtTweetText.Text)
                End If

                ' Link Text Color
                If Not txtLinkColor.Text Is Nothing Then
                    objModules.UpdateModuleSetting(ModuleId, "txtLinkColor", txtLinkColor.Text)
                End If

                ' Tweet Box Width
                If Not txtTweetWidth.Text Is Nothing Then
                    objModules.UpdateModuleSetting(ModuleId, "txtTweetWidth", txtTweetWidth.Text)
                End If

                ' Tweet Box Height
                If Not txtTweetHeight.Text Is Nothing Then
                    objModules.UpdateModuleSetting(ModuleId, "txtTweetHeight", txtTweetHeight.Text)
                End If

                ' DIV Padding Top
                If Not txtDivPaddingTop.Text Is Nothing Then
                    objModules.UpdateModuleSetting(ModuleId, "txtDivPaddingTop", txtDivPaddingTop.Text)
                End If

                ' DIV Padding Right
                If Not txtDivPaddingRight.Text Is Nothing Then
                    objModules.UpdateModuleSetting(ModuleId, "txtDivPaddingRight", txtDivPaddingRight.Text)
                End If

                ' DIV Padding Bottom
                If Not txtDivPaddingBottom.Text Is Nothing Then
                    objModules.UpdateModuleSetting(ModuleId, "txtDivPaddingBottom", txtDivPaddingBottom.Text)
                End If

                ' DIV Padding Left
                If Not txtDivPaddingLeft.Text Is Nothing Then
                    objModules.UpdateModuleSetting(ModuleId, "txtDivPaddingLeft", txtDivPaddingLeft.Text)
                End If

                ' Turn off/on Debugging Lines
                objModules.UpdateModuleSetting(ModuleId, "chkDebug", chkDebug.Checked)

            Catch exc As Exception    'Module failed to load
                ProcessModuleLoadException(Me, exc)
            End Try

        End Sub

#End Region

    End Class

End Namespace


