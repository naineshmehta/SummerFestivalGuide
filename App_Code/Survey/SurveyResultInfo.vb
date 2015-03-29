'
' DotNetNukeŽ - http://www.dotnetnuke.com
' Copyright (c) 2002-2007
' by DotNetNuke Corporation
'
' Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated 
' documentation files (the "Software"), to deal in the Software without restriction, including without limitation 
' the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and 
' to permit persons to whom the Software is furnished to do so, subject to the following conditions:
'
' The above copyright notice and this permission notice shall be included in all copies or substantial portions 
' of the Software.
'
' THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED 
' TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL 
' THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF 
' CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER 
' DEALINGS IN THE SOFTWARE.
'

Imports System
Imports System.Data
Imports DotNetNuke

Namespace DotNetNuke.Modules.Survey

    Public Class SurveyResultInfo

        ' local property declarations
        Private _OptionName As String
        Private _IsCorrect As Boolean
        Private _UserId As Integer
        Private _Question As String
        Private _OptionType As String

        ' initialization
        Public Sub New()
        End Sub

        ' public properties

        Public Property OptionName() As String
            Get
                Return _OptionName
            End Get
            Set(ByVal Value As String)
                _OptionName = Value
            End Set
        End Property

        Public Property IsCorrect() As Boolean
            Get
                Return _IsCorrect
            End Get
            Set(ByVal Value As Boolean)
                _IsCorrect = Value
            End Set
        End Property

        Public Property UserId() As Integer
            Get
                Return _UserId
            End Get
            Set(ByVal Value As Integer)
                _UserId = Value
            End Set
        End Property

        Public Property Question() As String
            Get
                Return _Question
            End Get
            Set(ByVal Value As String)
                _Question = Value
            End Set
        End Property

        Public Property OptionType() As String
            Get
                Return _OptionType
            End Get
            Set(ByVal Value As String)
                _OptionType = Value
            End Set
        End Property

    End Class
End Namespace


