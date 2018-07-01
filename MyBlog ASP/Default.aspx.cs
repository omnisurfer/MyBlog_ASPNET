using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{

    int _year = -1, _month = -1;

    protected void Page_Load(object sender, EventArgs e)
    {

        if (!string.IsNullOrEmpty(Request.QueryString.Get("YEAR")))
        {
            _year = Convert.ToInt32(Request.QueryString.Get("YEAR"));
        }

        if (!string.IsNullOrEmpty(Request.QueryString.Get("MONTH")))
        {
            _month = Convert.ToInt32(Request.QueryString.Get("MONTH"));
        }

        //Display the year and month passed by query string
        if (_year > 0 && _month > 0)
        {
            #region Entity Framework Code

            using (dbMyBlogEntities myEntities = new dbMyBlogEntities())
            {
                //DMR-201309222 - check this out: http://stackoverflow.com/questions/12339737/linq-select-from-multiple-tables

                var blogEntries = from blogEntry in myEntities.BlogEntries                                  
                                  join byContributors in myEntities.BlogContributors on blogEntry.OwnerID equals byContributors.ID
                                  where blogEntry.Publish == true && blogEntry.CreatedDateTime.Year == _year && blogEntry.CreatedDateTime.Month == _month
                                  orderby blogEntry.CreatedDateTime descending
                                  select new
                                  {
                                      ID = blogEntry.ID,
                                      Title = blogEntry.Title,
                                      Summary = blogEntry.Summary,
                                      BodyText = blogEntry.BodyText,
                                      CreatedDateTime = blogEntry.CreatedDateTime,

                                      //from Blog Contributors
                                      OwnerImageURL = byContributors.OwnerImageURL,
                                      OwnerName = byContributors.OwnerName,
                                      OwnerUrl = byContributors.OwnerURL
                                  };

                BlogPosts.DataSource = blogEntries.ToList();
                BlogPosts.DataBind();
            }

            #endregion
        }

        //Default posts to display if query string is invalid or initial landing on page
        else
        {
            /* Select only the most recent year and month
             * http://stackoverflow.com/questions/470440/how-to-select-only-the-records-with-the-highest-date-in-linq
             */
            using (dbMyBlogEntities myEntities = new dbMyBlogEntities())
            {
                var query = from blogEntry in myEntities.BlogEntries
                            orderby blogEntry.CreatedDateTime descending
                            select new { Year = blogEntry.CreatedDateTime.Year, Month = blogEntry.CreatedDateTime.Month };

                _year = query.FirstOrDefault().Year;
                _month = query.FirstOrDefault().Month;                            
           }

            using (dbMyBlogEntities myEntities = new dbMyBlogEntities())
            {                
                var blogEntries = from blogEntry in myEntities.BlogEntries                                                             
                                  join byContributors in myEntities.BlogContributors on blogEntry.OwnerID equals byContributors.ID
                                  where blogEntry.Publish == true && blogEntry.CreatedDateTime.Year == _year && blogEntry.CreatedDateTime.Month == _month
                                  orderby blogEntry.CreatedDateTime descending
                                  select new
                                  {
                                      ID = blogEntry.ID,
                                      Title = blogEntry.Title,
                                      Summary = blogEntry.Summary,
                                      BodyText = blogEntry.BodyText,
                                      CreatedDateTime = blogEntry.CreatedDateTime,

                                      //from Blog Contributors
                                      OwnerImageURL = byContributors.OwnerImageURL,
                                      OwnerName = byContributors.OwnerName,
                                      OwnerUrl = byContributors.OwnerURL
                                  };

                BlogPosts.DataSource = blogEntries.ToList();
                BlogPosts.DataBind();
            }
        }
    }

    #region Button Click Events

    #endregion

}