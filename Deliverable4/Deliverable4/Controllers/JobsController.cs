using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using Deliverable4.Models;

namespace Deliverable4.Controllers
{
    public class JobsController : Controller
    {
        private JobItDBEntities1 db = new JobItDBEntities1();

        // GET: Jobs
        public ActionResult Index()
        {
            var jobs = db.Jobs.Include(j => j.City).Include(j => j.Company).Include(j => j.ContractType);
            return View(jobs.ToList());
        }

        // GET: Jobs/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Job job = db.Jobs.Find(id);
            if (job == null)
            {
                return HttpNotFound();
            }
            return View(job);
        }
        public ActionResult ViewJobs()
        {
            JobItDBEntities1 entities = new JobItDBEntities1();
            return View(from Job in entities.Jobs.Take(10)
                        select Job);
        }

        // GET: Jobs/Create
        public ActionResult Create()
        {
            ViewBag.CityID = new SelectList(db.Cities, "CityID", "CityName");
            ViewBag.CompanyID = new SelectList(db.Companies, "CompanyID", "CompanyName");
            ViewBag.ContractTypeID = new SelectList(db.ContractTypes, "ContractTypeID", "ContractType1");
            return View();
        }

        // POST: Jobs/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "JobID,JobTitle,Salary,DateAdded,ExpiryDate,CriminalRecord,ContractTypeID,CompanyID,CityID")] Job job)
        {
            if (ModelState.IsValid)
            {
                db.Jobs.Add(job);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.CityID = new SelectList(db.Cities, "CityID", "CityName", job.CityID);
            ViewBag.CompanyID = new SelectList(db.Companies, "CompanyID", "CompanyName", job.CompanyID);
            ViewBag.ContractTypeID = new SelectList(db.ContractTypes, "ContractTypeID", "ContractType1", job.ContractTypeID);
            return View(job);
        }

        // GET: Jobs/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Job job = db.Jobs.Find(id);
            if (job == null)
            {
                return HttpNotFound();
            }
            ViewBag.CityID = new SelectList(db.Cities, "CityID", "CityName", job.CityID);
            ViewBag.CompanyID = new SelectList(db.Companies, "CompanyID", "CompanyName", job.CompanyID);
            ViewBag.ContractTypeID = new SelectList(db.ContractTypes, "ContractTypeID", "ContractType1", job.ContractTypeID);
            return View(job);
        }

        // POST: Jobs/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "JobID,JobTitle,Salary,DateAdded,ExpiryDate,CriminalRecord,ContractTypeID,CompanyID,CityID")] Job job)
        {
            if (ModelState.IsValid)
            {
                db.Entry(job).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.CityID = new SelectList(db.Cities, "CityID", "CityName", job.CityID);
            ViewBag.CompanyID = new SelectList(db.Companies, "CompanyID", "CompanyName", job.CompanyID);
            ViewBag.ContractTypeID = new SelectList(db.ContractTypes, "ContractTypeID", "ContractType1", job.ContractTypeID);
            return View(job);
        }

        // GET: Jobs/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Job job = db.Jobs.Find(id);
            if (job == null)
            {
                return HttpNotFound();
            }
            return View(job);
        }

        // POST: Jobs/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Job job = db.Jobs.Find(id);
            db.Jobs.Remove(job);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
