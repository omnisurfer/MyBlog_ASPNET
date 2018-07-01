using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;


/// <summary>
/// Summary description for MonthYearSelectService
/// </summary>
[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
// To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
[System.Web.Script.Services.ScriptService]
public class MonthYearSelectService : System.Web.Services.WebService
{

    public MonthYearSelectService()
    {

        //Uncomment the following line if using designed components 
        //InitializeComponent(); 
    }

    [WebMethod]
    public string[] GetYears()
    {
        #region Entity Framework Code

        var yearsList = new List<string>();

        //Show years that are selectable
        using (dbMyBlogEntities myEntities = new dbMyBlogEntities())
        {
            var entryYear = from y in myEntities.BlogEntries

                            group y.CreatedDateTime by y.CreatedDateTime.Year into g
                            orderby g.Key descending
                            select new
                            {
                                Year = g.Key,
                                EntryCount = g.Count()
                            };

            //Testing if I can get data to test against       
            //var firstElement = entryYear.FirstOrDefault();

            //if (firstElement.Year == 2013)
            //System.Diagnostics.Debug.WriteLine("TRUE!");

            foreach (var item in entryYear)
            {
                yearsList.Add(item.Year.ToString());
                string count = item.EntryCount.ToString();
            }
        }
        #endregion

        return yearsList.ToArray();
    }

    [WebMethod]
    public string[] GetMonths(int result)
    {

        var monthsList = new List<string>();

        if (result > 0)
        {
            #region Entity Framework Code            

            //add the year as the first item in the string
            monthsList.Add(result.ToString());

            //Show years that are selectable
            using (dbMyBlogEntities myEntities = new dbMyBlogEntities())
            {
                var entryMonth = from y in myEntities.BlogEntries

                                 where y.CreatedDateTime.Year == result
                                 group y.CreatedDateTime by y.CreatedDateTime.Month into g
                                 orderby g.Key descending
                                 select new
                                 {
                                     Month = g.Key,
                                     EntryCount = g.Count()
                                 };

                foreach (var item in entryMonth)
                {
                    monthsList.Add(item.Month.ToString());
                    string count = item.EntryCount.ToString();
                }
            }
            #endregion
        }

        return monthsList.ToArray();
    }
}