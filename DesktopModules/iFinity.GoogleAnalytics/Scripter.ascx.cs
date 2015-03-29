/*
 * 
 * iFinity Smart Business Solutions - http://www.ifinity.com.au
 * Copyright (c) 2007
 
 * Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated 
 * documentation files (the "Software"), the rights to use, copy, modify, merge, publish, distribute, sublicense
 * copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the 
 * following conditions:

 * 1. The above copyright notice and this permission notice shall be included in all copies or substantial portions 
 *    of the Software.  
 * 2. The software may not be claimed as the original work and may not be sold as a stand alone product

 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED 
 * TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL 
 * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF 
 * CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER 
 * DEALINGS IN THE SOFTWARE.
 * 
 * Portions of this code may have been adapted from publicly available code samples.  Any perceived copyright 
 * issues should be directed to the above website.
 * 
 */
using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

using DotNetNuke;
using DotNetNuke.Common;
using DotNetNuke.Common.Utilities;
using DotNetNuke.Entities.Modules;
using DotNetNuke.Services.Localization;
using DotNetNuke.Services.Exceptions;
using System.Text;
using DotNetNuke.Security;
namespace iFinity.DNN.Modules.GoogleAnalytics
{
    public partial class Scripter : PortalModuleBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //first check is to determine if the script should be hidden when running in a particular role
            //this means that administrators or whoever can turn off tracking, so that their activities 
            //won't be counted in the google analytics stats
            bool showScript = true;
            string hideFromRole = (string)Settings["HideTrackingFromRole"];
            if (hideFromRole != null && hideFromRole.Length > 0)
                showScript = !PortalSecurity.IsInRole(hideFromRole);
            if (showScript)
            {
                string sessionTimeout = (string)Settings["SessionTimeout"];
                int timeout = -1;
                if (sessionTimeout != null)
                    if (int.TryParse(sessionTimeout, out timeout))
                        timeout = timeout * 60; //convert to seconds
                    else
                        timeout = -1;  //don't explicitly set

                //check to see if external links should be tracked as well
                string trackExternals = (string)Settings["TrackExternals"];

                //this is the base script, but with string.format placeholders
                //check whether running in http or https
                string schemeAndSubdomain = "http://www.";
                if (Request.Url.Scheme == System.Uri.UriSchemeHttps)
                    schemeAndSubdomain = "https://ssl.";
                string scriptFunction = "pageTracker._trackPageview();";
                StringBuilder script = new StringBuilder();
                if (trackExternals != null && trackExternals.ToLower() == "true")
                {
                    //track the external links using the taglinks.js file
                    script.AppendLine("<script type='text/javascript' src='" + this.ModulePath + "js/taglinks.js'></script>");
                }
                script.AppendLine("<script type='text/javascript' src='" + schemeAndSubdomain + "google-analytics.com/ga.js'></script>");
                script.AppendLine("<script type='text/javascript'>");
                script.AppendLine(@"var pageTracker = _gat._getTracker(""{1}"");");
                if (timeout > 0)
                    script.AppendLine("pageTracker._setSessionTimeout('" + timeout.ToString() + "');"); //set the sesion timeout
                script.AppendLine(@"pageTracker._initData();");
                script.AppendLine(@"{2}");
                //this is a registered user, so insert a variable to track them
                string trackUserSegment = (string)Settings["TrackRegisteredUsers"];
                if (trackUserSegment != null && trackUserSegment.ToLower() == "true")
                    if (this.UserId > 0)
                    {
                        script.AppendLine ("pageTracker._setVar('User');");
                    }

                script.AppendLine(@"</script>");

                //this next piece of logic decides on whether or not the script should
                //actually call the pageTracker() function from the Google script
                //if running on localhost, and localhost calls turned off, then the call is commented out
                //in the generated javascript
                string localHostName = "";
                if (Settings.ContainsKey("LocalHostAddress"))
                    localHostName = (string)Settings["LocalHostAddress"];
                //string scriptFunction = "urchinTracker();";
                if (localHostName == Request.UserHostAddress || localHostName.ToLower() == Request.UserHostName.ToLower() || localHostName.ToLower() == Request.Url.Host.ToLower())
                    scriptFunction = "/*pageTracker._trackVisit(); commented out due to match on " + localHostName + "*/";

                //get the user account id for the anayltics account
                string userAccountId = (string)Settings["GoogleTrackingId"];
                if (userAccountId == null || userAccountId.Length == 0)
                {
                    //if no user account, then comment out the urchinTracker call as well
                    userAccountId = "UA-nnnnnn-n";
                    scriptFunction = "/*pageTracker._trackVisit(); commented out due to no valid user id*/";
                }

                //format up the script string
                string scriptOUTPUT = string.Format(script.ToString(), schemeAndSubdomain, userAccountId, scriptFunction);
                //now register the script
                this.BasePage.ClientScript.RegisterStartupScript(GetType(), "analytics", scriptOUTPUT);
            }
        }
        #region overriden properties
        public DotNetNuke.Framework.CDefault BasePage
        {
            get
            {
                return (DotNetNuke.Framework.CDefault)this.Page;
            }
        }
        #endregion
    }
}
    