﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FinalTemplate
{
    public partial class studentpanel : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btn_logout_Click(object sender, EventArgs e)
        {

            //Session.Clear();
            //Session.RemoveAll();
            //Session.Abandon();
            //System.Web.Security.FormsAuthentication.SignOut();
            //Response.Redirect("~/Default.aspx");

            //Session.Clear();
            //Session.Remove("userid");
            //Session.Abandon();
            //System.Web.Security.FormsAuthentication.SignOut();
            //Response.Redirect("Default.aspx");

            //Session.Remove("userid");
            //bool sessiongone = (Session["userid"] == null);
            //if (sessiongone)
            //{
            //    Response.Redirect("~/Default.aspx");
            //}

            Session.Remove("userid");
            Session.RemoveAll();
            Response.Redirect("~/Default.aspx");
        }
    }
}