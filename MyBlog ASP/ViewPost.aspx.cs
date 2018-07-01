using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ViewPost : System.Web.UI.Page
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
                                 join c in myEntities.BlogContributors on r.OwnerID equals c.ID
                                 where r.ID == _id
                                 select new
                                 {
                                     ID = r.ID,
                                     Title = r.Title,
                                     BodyText = r.BodyText,
                                     CreatedDateTime = r.CreatedDateTime,

                                     //from Blog Contributors
                                     OwnerImageURL = c.OwnerImageURL,
                                     OwnerName = c.OwnerName,
                                     OwnerUrl = c.OwnerURL
                                 }
                                 ).SingleOrDefault();

                if (blogEntry != null)
                {
                    PostTitle.Text = blogEntry.Title;
                    CreatedDateTime.Text = blogEntry.CreatedDateTime.ToString();
                    BodyText.Text = blogEntry.BodyText;
                    EditLink.Text = "Edit";
                    EditLink.NavigateUrl = "~/Management/AddEditBlogEntry.aspx?ID=" + blogEntry.ID;

                    OwnerURLImage.NavigateUrl = blogEntry.OwnerUrl;
                    OwnerURL.Text = blogEntry.OwnerName;
                    OwnerURL.NavigateUrl = blogEntry.OwnerUrl;
                    OwnerName.Text = blogEntry.OwnerName;
                    OwnerImage.ImageUrl = blogEntry.OwnerImageURL;

                    
                }

            }
        }
    }
}