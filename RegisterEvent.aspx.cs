using System;
using System.Data;
using EventManagementSystem.Services; 

namespace EventManagementSystem
{
    public partial class RegisterEvent : System.Web.UI.Page
    {
        protected int EventID => Convert.ToInt32(Request.QueryString["EventID"] ?? "0");

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (EventID <= 0)
                {
                    lblMsg.Text = "Invalid event.";
                    btnSubmit.Enabled = false;
                    return;
                }
                LoadEventDetails(EventID);
            }
        }

        private void LoadEventDetails(int eventId)
        {
            string sql = "SELECT EventName, EventDate, Location, MaxCapacity, CurrentRegistrations FROM Events WHERE EventID = @ID";
            DataTable dt = DatabaseHelper.ExecuteSelectQuery(sql, DatabaseHelper.Param("@ID", System.Data.SqlDbType.Int, eventId));

            if (dt.Rows.Count == 0)
            {
                lblMsg.Text = "Event not found.";
                btnSubmit.Enabled = false;
                return;
            }

            lblEventName.Text = $"Event: {dt.Rows[0]["EventName"]} - {Convert.ToDateTime(dt.Rows[0]["EventDate"]).ToString("dd-MMM-yyyy")}";
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            // Server-side check for validation controls
            if (!Page.IsValid)
                return;

            try
            {
                EventService svc = new EventService();

                if (!svc.CheckCapacity(EventID))
                {
                    lblMsg.Text = "Event is full.";
                    return;
                }

                if (svc.IsAlreadyRegistered(EventID, txtEmail.Text.Trim()))
                {
                    lblMsg.Text = "You are already registered for this event.";
                    return;
                }

                int regId = svc.RegisterStudent(EventID, txtName.Text.Trim(), txtEmail.Text.Trim(), txtPhone.Text.Trim());
                lblMsg.Text = $"Registration successful! ID = {regId}";
            }
            catch (Exception ex)
            {
                lblMsg.Text = "Error: " + ex.Message;
            }
        }
    }
}
