using System;
using System.Data;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using EventManagementSystem.Services;

namespace EventManagementSystem
{
    public partial class EventList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadCategories();
                LoadEvents();
            }
        }

        private void LoadCategories()
        {
            string sql = "SELECT CategoryID, CategoryName FROM Categories";
            DataTable dt = DatabaseHelper.ExecuteSelectQuery(sql);

            ddlCategory.Items.Clear();
            ddlCategory.Items.Add(new ListItem("All", "0")); // default

            foreach (DataRow r in dt.Rows)
            {
                ddlCategory.Items.Add(new ListItem(
                    r["CategoryName"].ToString(),
                    r["CategoryID"].ToString()
                ));
            }
        }

        private void LoadEvents()
        {
            string sql = @"
                SELECT E.EventID, E.EventName, E.EventDate, E.Location, 
                       C.CategoryName, E.MaxCapacity, E.CurrentRegistrations
                FROM Events E
                INNER JOIN Categories C ON E.CategoryID = C.CategoryID
                WHERE 1=1";

            var parameters = new System.Collections.Generic.List<SqlParameter>();

            if (ddlCategory.SelectedValue != "0")
            {
                sql += " AND E.CategoryID = @CategoryID";
                parameters.Add(new SqlParameter("@CategoryID", ddlCategory.SelectedValue));
            }

            if (!string.IsNullOrWhiteSpace(txtSearch.Text))
            {
                sql += " AND E.EventName LIKE @Search";
                parameters.Add(new SqlParameter("@Search", "%" + txtSearch.Text.Trim() + "%"));
            }

            DataTable dt = DatabaseHelper.ExecuteSelectQuery(sql, parameters.ToArray());
            gvEvents.DataSource = dt;
            gvEvents.DataBind();
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            if (!Page.IsValid) return;
            LoadEvents();
        }
    }
}
