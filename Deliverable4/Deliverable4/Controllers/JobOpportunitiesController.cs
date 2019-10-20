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
        static List<SelectListItem> items = new List<SelectListItem>();
        public ActionResult JobOpportunities(/*string JobTitle, string Salary, string ContractType*/)
        {
            return View();
        }
        //    JobItDBEntities db= new JobItDBEntities();
        //     List<SelectListItem> items = new List<SelectListItem>();
        //    db.Jobs.Where(zz => zz.JobQualifications.Any(xx => xx.Qualification.QualificationDescription == "Masters in HR")).ToList();
          
        }
      
    }
