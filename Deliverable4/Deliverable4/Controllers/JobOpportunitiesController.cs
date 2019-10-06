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
            JobItDBEntities Opportunities = new JobItDBEntities();
           
            return View();
        }
    }
}