using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class _Default : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(@"Data Source=pdfserver.database.windows.net;Initial Catalog=RPGgame;User ID=.pdf;Password=info12C98");

    protected void Page_Load(object sender, EventArgs e)
    {
    
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        Label1.Text = "";
        Label2.Text = "";
        Label3.Text = "";
        Label4.Text = "";
        Label5.Text = "";
        Label6.Text = "";
        Label7.Text = "";
        bool register = true, pass = true;
        if (String.IsNullOrWhiteSpace(TextBox1.Text))
        {
            register = false;
            Label1.Text = "Please enter username!";
        }
        if (String.IsNullOrWhiteSpace(Password1.Value))
        {
            register = false;
            Label2.Text = "Please enter password!";
            pass = false;
        }
        if (String.IsNullOrWhiteSpace(Password2.Value))
        {
            register = false;
            Label3.Text = "Please confirm password!";
        }
        else
        {
            if (pass)
            {
                if (!String.Equals(Password1.Value, Password2.Value))
                {
                    Label3.Text = "Passwords do not match!";
                    register = false;
                }
            }

        }
        if (register)
        {
            con.Open();
            SqlCommand cmd = con.CreateCommand();
            cmd.CommandType = System.Data.CommandType.Text;
            cmd.CommandText = "select count(*) from Jatekos where Username='" + TextBox1.Text + "'";
            int number = (int)cmd.ExecuteScalar();
            if (number > 0)
            {
                Label1.Text = "This username is already taken!";
            }
            else
            {
                

                string parancs = "insert into Jatekos(Username,Password,Aktiv,Regisztracio,Utolsobejelentkezes) values(@nev, @pwd, @akt, @reg, @bej)";
                SqlCommand cmd1 = new SqlCommand(parancs, con);
                cmd1.CommandType = System.Data.CommandType.Text;
                cmd1.Parameters.AddWithValue("@nev", TextBox1.Text);
                cmd1.Parameters.AddWithValue("@pwd", Password1.Value);
                cmd1.Parameters.AddWithValue("@akt", true);
                cmd1.Parameters.AddWithValue("@reg", DateTime.Now);
                cmd1.Parameters.AddWithValue("@bej", DateTime.Now);

                cmd1.ExecuteNonQuery();
                Label4.Text = "Succesfull registration!";
                TextBox1.Text = "";
                Password1.Value = "";
                Password2.Value = "";
                GridView1.DataBind();
                con.Close();
            }
        }
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        Label1.Text = "";
        Label2.Text = "";
        Label3.Text = "";
        Label4.Text = "";
        Label5.Text = "";
        Label6.Text = "";
        Label7.Text = "";
        bool login = true;
        if (String.IsNullOrWhiteSpace(TextBox2.Text))
        {
            Label5.Text = "Please enter a username!";
            login = false;
        }
        if (String.IsNullOrWhiteSpace(Password3.Value))
        {
            Label6.Text = "Please enter password!";
            login = false;
        }
        if (login)
        {
            con.Open();
            SqlCommand cmd = con.CreateCommand();
            cmd.CommandType = System.Data.CommandType.Text;
            cmd.CommandText = "select count(*) from Jatekos where Username='" + TextBox2.Text + "'";
            int number = (int)cmd.ExecuteScalar();
            if (number == 0)
            {
                Label5.Text = "This username does not exist!";
            }
            else
            {
                cmd.CommandText = "select Password from Jatekos where Username='" + TextBox2.Text + "'";
                string password = cmd.ExecuteScalar().ToString();
                password = password.Replace(" ", String.Empty);
                if (String.Equals(password, Password3.Value))
                {
                    Label7.Text = "Succesful login!";
                    cmd.CommandText = "select ID from Jatekos where Username='" + TextBox2.Text + "'";
                    int x = (int)cmd.ExecuteScalar();
                    Session["ID"] = x;
                    cmd.CommandText = "update Jatekos set Utolsobejelentkezes=@utolso where ID='" + x + "'";
                    cmd.Parameters.AddWithValue("@utolso", DateTime.Now);
                    cmd.ExecuteNonQuery();
                    Server.Transfer("home.aspx", true);
                    // int User=Convert.ToInt32(GridView1.DataKeys[x].Value.ToString())



                }
                else
                {
                    Label7.Text = "Incorrect password!";
                }
            }
            con.Close();
        }
    }



    

    protected void ButtonJatekos_Click(object sender, EventArgs e)
    {
        GridView1.Visible = true;
        GridView2.Visible = false;
        GridView3.Visible = false;
        GridView4.Visible = false;
       
    }

    protected void ButtonKarakter_Click(object sender, EventArgs e)
    {
        GridView1.Visible = false;
        GridView2.Visible = true;
        GridView3.Visible = false;
        GridView4.Visible = false;
    }


    protected void ButtonItem_Click(object sender, EventArgs e)
    {
        GridView1.Visible = false;
        GridView2.Visible = false;
        GridView3.Visible = true;
        GridView4.Visible = false;
    }

    protected void ButtonHos_Click(object sender, EventArgs e)
    {
        GridView1.Visible = false;
        GridView2.Visible = false;
        GridView3.Visible = false;
        GridView4.Visible = true;
    }

    protected void GridView2_RowDeleted(object sender, GridViewDeletedEventArgs e)
    {
        
    }

    protected void GridView2_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
                           
       
    }

    protected void GridView2_RowEditing(object sender, GridViewEditEventArgs e)
    {
      
    }
}