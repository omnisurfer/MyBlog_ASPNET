using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Management_Login : System.Web.UI.Page
{
    //if nothing is passed in querystring, id will be -1
    int _id = -1;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!string.IsNullOrEmpty(Request.QueryString.Get("ID")))
        {
            _id = Convert.ToInt32(Request.QueryString.Get("ID"));
        }

        if (!Page.IsPostBack && _id > -1)
        {
            using (dbMyBlogEntities myEntities = new dbMyBlogEntities())
            {
                var blogEntry = (from r in myEntities.BlogEntries
                                 where r.ID == _id
                                 select r).SingleOrDefault();
                
                if (blogEntry != null)
                {
                    titleTextBox.Text = blogEntry.Title;
                    summaryTextBox.Text = blogEntry.Summary;
                    bodyTextBox.Text = blogEntry.BodyText;

                    contributorDropDownList.DataBind();
                    ListItem myItem = contributorDropDownList.Items.FindByValue(blogEntry.BlogContributor.OwnerName);
                    if (myItem != null)
                    {
                        myItem.Selected = true;
                    }

                    publishEnableCheckBox.Checked = blogEntry.Publish;
                    commentsEnableCheckBox.Checked = blogEntry.CommentsEnabled;
                }

            }
        }
    }

    private void EndEditing()
    {
        Response.Redirect("Default.aspx");
    }
    protected void saveButton_Click(object sender, EventArgs e)
    {
        using (dbMyBlogEntities myEntities = new dbMyBlogEntities())
        {
            BlogEntry myBlogEntry;
            if (_id == -1) //Insert New blog entry
            {
                myBlogEntry = new BlogEntry();
                myBlogEntry.CreatedDateTime = DateTime.Now;
                myBlogEntry.ModifiedDateTime = myBlogEntry.CreatedDateTime;
                myEntities.BlogEntries.Add(myBlogEntry);
            }

            else //update existing entry
            {
                myBlogEntry = (from r in myEntities.BlogEntries
                               where r.ID == _id
                               select r).Single();
                
                myBlogEntry.ModifiedDateTime = DateTime.Now;
            }
            myBlogEntry.Title = titleTextBox.Text;
            myBlogEntry.Summary = summaryTextBox.Text;
            myBlogEntry.BodyText = bodyTextBox.Text;
            myBlogEntry.OwnerID = Convert.ToInt32(contributorDropDownList.SelectedValue);
            myBlogEntry.Publish = publishEnableCheckBox.Checked;
            myBlogEntry.CommentsEnabled = commentsEnableCheckBox.Checked;
            myEntities.SaveChanges();
            Response.Redirect("~/Default.aspx");
        }
    }
}