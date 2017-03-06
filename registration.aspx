protected void btnsubmit_Click(object sender, EventArgs e)
{
if (txtpwd.Text == txtcnmpwd.Text)
{
string UserName = txtuser.Text;
string Password = txtpwd.Text;
string ConfirmPassword = txtcnmpwd.Text;
string FirstName = txtfname.Text;
string LastName = txtlname.Text;
string Email = txtEmail.Text;
string Phoneno = txtphone.Text;
string Location = txtlocation.Text;
string Created_By = txtuser.Text;
SqlConnection con = new SqlConnection("Data Source=MYCBJ017550027;Initial Catalog=MySamplesDB;Integrated Security=True");
con.Open();
SqlCommand cmd = new SqlCommand("sp_userinformation", con);
cmd.CommandType = CommandType.StoredProcedure;
cmd.Parameters.AddWithValue("@UserName", UserName);
cmd.Parameters.AddWithValue("@Password", Password);
cmd.Parameters.AddWithValue("@FirstName", FirstName);
cmd.Parameters.AddWithValue("@LastName", LastName);
cmd.Parameters.AddWithValue("@Email", Email);
cmd.Parameters.AddWithValue("@PhoneNo", Phoneno);
cmd.Parameters.AddWithValue("@Location", Location);
cmd.Parameters.AddWithValue("@Created_By", Created_By);
cmd.Parameters.Add("@ERROR", SqlDbType.Char, 500);
cmd.Parameters["@ERROR"].Direction = ParameterDirection.Output;
cmd.ExecuteNonQuery();
message = (string) cmd.Parameters["@ERROR"].Value;
con.Close();
}
else
{
Page.RegisterStartupScript("UserMsg", "<Script language='javascript'>alert('" + "Password mismatch" + "');</script>");
}
lblErrorMsg.Text = message;
}
