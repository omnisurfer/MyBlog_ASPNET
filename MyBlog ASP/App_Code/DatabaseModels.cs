using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Data.Entity.ModelConfiguration;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for DatabaseObjects
/// </summary>
/* How to use my objects to bind to the datasource
 * http://weblogs.asp.net/scottgu/archive/2010/08/03/using-ef-code-first-with-an-existing-database.aspx
*/
public class DatabaseModels
{
    public DatabaseModels()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    public class BlogEntry
    {
        public int ID { get; set; }
        public string CreatedDateTime { get; set; }
        public string ModifiedDateTime { get; set; }
        public string Title { get; set; }
        public string Summary { get; set; }
        public string URL { get; set; }
        public string Keywords { get; set; }
        public string BodyText { get; set; }

        public bool CommentsEnabled { get; set; }
        public bool Publish { get; set; }

        public int OwnerID { get; set; }

        public string TextFilePointer { get; set; }
    }

    public class FeedEntry
    {
        public int ID { get; set; }        
        public string CreatedDateTime { get; set; }
        public string ModifiedDateTime { get; set; }
        public string FeedText { get; set; }
        public int OwnerID { get; set; }        
    }

    public class BlogContributor
    {
        public int ID { get; set; }
        public string OwnerName { get; set; }
        public string OwnerURL { get; set; }
        public string UserGroup { get; set; }
        public string OwnerImageURL { get; set; }
    }

    public class Blog : DbContext
    {
        public DbSet<BlogEntry> BlogEntry { get; set; }
        public DbSet<FeedEntry> FeedEntry { get; set; }
        public DbSet<BlogContributor> BlogContributor { get; set; }

        public Blog()
            : base("name=dbMyBlogEntities")
        {

        }
    }
}