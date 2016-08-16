﻿using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI.WebControls;
using System.Net;
using System.IO;
using FinalTemplate.source.Database;
using FinalTemplate.source;

namespace FinalTemplate.source.Functions
{
    public class Jfunctionparents
    {
        //Returns Date in dd/mm/yyyy format
        public static string GetSystemDate()
        {
            return Convert.ToString(DateTime.Today.ToString("d"));
        }
        public static string GetSystemTime()
        {
            return Convert.ToString(System.DateTime.Today.ToString("t"));
        }
        public static void BindDropDownList(DropDownList ddl2, string displayField1, string valueField1, string queryy)
        {
            Database.Database mDatabase = new Database.Database("cesConnectionString3");
            mDatabase.CreateConnection();
            mDatabase.InitializeSQLCommandObject(mDatabase.GetCurrentConnection, queryy);
            try
            {
                mDatabase.OpenConnection();
                ddl2.DataSource = mDatabase.obj_sqlcommand.ExecuteReader();
                ddl2.DataTextField = displayField1;
                ddl2.DataValueField = valueField1;
                ddl2.DataBind();
            }
            finally
            {
                mDatabase.CloseConnection();
                mDatabase.obj_sqlcommand.Dispose();
            }
        }
    }
}