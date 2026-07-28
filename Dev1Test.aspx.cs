using System;
using EventManagementSystem.Services; 

namespace EventManagementSystem
{
    public partial class Dev1Test : System.Web.UI.Page
    {
        protected void btnRegister_Click(object sender, EventArgs e)
        {
            if (!Page.IsValid)
            {
                lblOutput.Text = "Please fix validation errors.";
                return;
            }

            try
            {
                int eventId = Convert.ToInt32(txtEventID.Text.Trim());
                string name = txtName.Text.Trim();
                string email = txtEmail.Text.Trim();
                string phone = txtPhone.Text.Trim();

                EventService svc = new EventService();

                if (!svc.CheckCapacity(eventId))
                {
                    lblOutput.Text = "Event is full.";
                    return;
                }

                if (svc.IsAlreadyRegistered(eventId, email))
                {
                    lblOutput.Text = "You already registered for this event.";
                    return;
                }

                int regId = svc.RegisterStudent(eventId, name, email, phone);
                lblOutput.Text = "SUCCESS! Registration ID = " + regId;
            }
            catch (Exception ex)
            {
                lblOutput.Text = "Error: " + ex.Message;
            }
        }
    }
}
