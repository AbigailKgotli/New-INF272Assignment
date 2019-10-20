using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Deliverable4.Models;

namespace Deliverable4.Controllers
{
    public class JobOpportunitiesController : Controller
    {
        // GET: JobOpportunities
        public ActionResult JobOpportunities()
        {
            JobItDBEntities db= new JobItDBEntities();
            List<SelectListItem> items = new List<SelectListItem>();
            db.Jobs.Where(zz => zz.JobQualifications.Any(xx => xx.Qualification.QualificationDescription == "Masters in HR")).ToList();
            //items.Add(new SelectListItem() { Text = "1", Value = "1" });
            //items.Add(new SelectListItem() { Text = "2", Value = "2" });
            //items.Add(new SelectListItem() { Text = "3", Value = "3" });
            //items.Add(new SelectListItem() { Text = "4", Value = "4" });
            //items.Add(new SelectListItem() { Text = "5", Value = "5" });
            //items.Add(new SelectListItem() { Text = "6", Value = "6" });
            //items.Add(new SelectListItem() { Text = "7", Value = "7" });
            //items.Add(new SelectListItem() { Text = "8", Value = "8" });
            //items.Add(new SelectListItem() { Text = "9", Value = "9" });
            //items.Add(new SelectListItem() { Text = "10", Value = "10" });
            //var ddl = from n in items
            //          select n.Text;
            //ViewBag.No = ddl;
            //JobItDBEntities entities = new JobItDBEntities();
            //var products = (from e in entities.
            //                select e).Take(no);
            return View(db);
        }
       
    }
}