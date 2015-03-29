<%@ Control Language="VB" AutoEventWireup="true" CodeFile="Tweets.ascx.vb" Inherits="Modules.Simple.Tweet" %>

<style type="text/css">
    .twtr-tweet-text{ font-size:  <%=FontSize %>!important; }
</style>

<div id="<%=ModuleDiv %>" style="padding: <%=Padding %>;">
    <script type="text/javascript" charset="utf-8" src="http://widgets.twimg.com/j/2/widget.js"></script>
    
    <script type="text/javascript">
        new TWTR.Widget(
        {
            version: 2,
            type: 'profile',
            rpp: <%=NumberOfTweets %>,
            interval:  <%=TweetInterval %>,
            width: <%=TweetWidth %>,
            height: <%=TweetHeight %>,
            theme:
                {
                    shell:
                        {
                            background: <%=ShellBackground %>,
                            color: <%=ShellText %>
                        },
                    tweets:
                        {
                            background: <%=TweetBackground %>,
                            color: <%=TweetText %>,
                            links: <%=TweetLinks %>
                        }
                },
       <%=TwitterParameter %>
        }
        )<%=TwitterRender %>
    </script>
    <asp:Label ID="lblDebugging" runat="server" Text="Label" />
</div>