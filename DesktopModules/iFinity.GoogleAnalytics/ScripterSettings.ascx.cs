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
using DotNetNuke.Entities.Users;
using DotNetNuke.Services.Localization;
using DotNetNuke.Services.Exceptions;
using DotNetNuke.Security.Roles;
namespace iFinity.DNN.Modules.GoogleAnalytics
{
    public partial class ScripterSettings : ModuleSettingsBase 
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void ShowSettings()
        {
            //get the tracking ID
            if (ModuleSettings.ContainsKey("GoogleTrackingId"))
                txtAnalyticsTrackingId.Text = (string)ModuleSettings["GoogleTrackingId"];

            if (ModuleSettings.ContainsKey("LocalHostAddress"))
            {
                txtLocalHostName.Text = (string)ModuleSettings["LocalHostAddress"];
            }
            
            //populate the drop down box
            RoleController rc = new DotNetNuke.Security.Roles.RoleController();
            ArrayList roles = rc.GetPortalRoles(this.PortalId);
            //put in a dummy role to allow no restriction on role
            RoleInfo dummyRole = new RoleInfo();
            dummyRole.RoleID = -1;
            dummyRole.RoleName = "[Do Not Hide Tracking]";
            roles.Insert(0, dummyRole);
            ddlSecurityGroups.DataSource = roles;
            ddlSecurityGroups.DataValueField = "RoleID";
            ddlSecurityGroups.DataTextField = "RoleName";
            ddlSecurityGroups.DataBind();

            //get the security group
            if (ModuleSettings.ContainsKey("HideTrackingFromRole"))
            {
                foreach(ListItem item in ddlSecurityGroups.Items)
                {
                    string value = (string)ModuleSettings["HideTrackingFromRole"];
                    if (item.Text == value)
                        ddlSecurityGroups.SelectedValue = item.Value;
                }
            }

            string raw = (string)ModuleSettings["TrackExternals"];
            if (raw != null)
                if (raw.ToLower() == "true")
                    chkTrackExternals.Checked = true;
                else
                    chkTrackExternals.Checked = false;
            else
                chkTrackExternals.Checked = false;

            raw = (string)ModuleSettings["TrackRegisteredUsers"];
            if (raw != null)
                if (raw.ToLower() == "true")
                    chkTrackRegisteredUsers.Checked = true;
                else
                    chkTrackRegisteredUsers.Checked = false;
            else
                chkTrackRegisteredUsers.Checked = false;

            string timeout = (string)ModuleSettings["SessionTimeout"];
            if (timeout == null)
                txtTimeout.Text = "30";
            else
                txtTimeout.Text = timeout;
        }
        protected void SaveSettings()
        {
            ModuleController mc = new ModuleController();
            if (txtAnalyticsTrackingId.Text.Length > 0)
            {
                if (ModuleSettings.ContainsKey("GoogleTrackingId"))
                    ModuleSettings["GoogleTrackingId"] = txtAnalyticsTrackingId.Text;
                else
                    ModuleSettings.Add("GoogleTrackingId", txtAnalyticsTrackingId.Text);
                mc.UpdateModuleSetting(this.ModuleId, "GoogleTrackingId", txtAnalyticsTrackingId.Text);
            }

            if (ModuleSettings.ContainsKey("LocalHostAddress"))
                ModuleSettings["LocalHostAddress"] = txtLocalHostName.Text;
            else
                ModuleSettings.Add("LocalHostAddress", txtLocalHostName.Text );
            mc.UpdateModuleSetting(this.ModuleId, "LocalHostAddress", txtLocalHostName.Text );

            if (ddlSecurityGroups.SelectedValue != "-1")
            {
                if (ModuleSettings.ContainsKey("HideTrackingFromRole"))
                    ModuleSettings["HideTrackingFromRole"] = ddlSecurityGroups.SelectedItem.Text;
                else
                    ModuleSettings.Add("HideTrackingFromRole", ddlSecurityGroups.SelectedItem.Text);
                mc.UpdateModuleSetting(this.ModuleId, "HideTrackingFromRole", ddlSecurityGroups.SelectedItem.Text);
            }
            else
            {
                if (ModuleSettings.ContainsKey("HideTrackingFromRole"))
                    mc.DeleteModuleSetting(this.ModuleId, "HideTrackingFromRole");
            }

            if (ModuleSettings.ContainsKey("TrackExternals"))
                ModuleSettings["TrackExternals"] = chkTrackExternals.Checked.ToString();
            else
                ModuleSettings.Add("TrackExternals", chkTrackExternals.Checked.ToString());
            mc.UpdateModuleSetting(this.ModuleId, "TrackExternals", chkTrackExternals.Checked.ToString());

            if (ModuleSettings.ContainsKey("TrackRegisteredUsers"))
                ModuleSettings["TrackRegisteredUsers"] = chkTrackRegisteredUsers.Checked.ToString();
            else
                ModuleSettings.Add("TrackRegisteredUsers", chkTrackRegisteredUsers.Checked.ToString());
            mc.UpdateModuleSetting(this.ModuleId, "TrackRegisteredUsers", chkTrackRegisteredUsers.Checked.ToString());

            if (ModuleSettings.ContainsKey("SessionTimeout"))
                ModuleSettings["SessionTimeout"] = txtTimeout.Text ;
            else
                ModuleSettings.Add("SessionTimeout", txtTimeout.Text);
            mc.UpdateModuleSetting(this.ModuleId, "SessionTimeout", txtTimeout.Text);

        }
        public override void LoadSettings()
        {
            base.LoadSettings();
            ShowSettings();
        }
        public override void UpdateSettings()
        {
            SaveSettings();
            base.UpdateSettings();
        }

    }
}
