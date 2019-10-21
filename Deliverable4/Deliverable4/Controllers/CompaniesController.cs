using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using Deliverable4.Models;

namespace Deliverable4.Views
{
    public class CompaniesController : Controller
    {
        private JobItDBEntities db = new JobItDBEntities();

        // GET: Companies
        public ActionResult Index()
        {

            var companies = db.Companies.Include(c => c.City);
            return View(companies.ToList());
        }

        // GET: Companies/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Company company = db.Companies.Find(id);
            if (company == null)
            {
                return HttpNotFound();
            }
            return View(company);
        }

        // GET: Companies/Create
        public ActionResult Create()
        {
            ViewBag.CityID = new SelectList(db.Cities, "CityID", "CityName");
            return View();
        }

        // POST: Companies/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "CompanyName,PhoneNo,Email,Website")] Company co)
        {
            if (ModelState.IsValid)
            {
                db.Companies.Add(co);
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            //List<City> c = db.Cities.ToList();
            //ViewBag.CityName = new SelectList(c, "CityID", "CityName");
            // ViewBag.Usee = new SelectList(db.UserTypes.Select(zz => new { ID = zz.ID, Description = zz.ID + " - " + zz.Description }), "ID", "Description", user.UserType);

            //ViewBag.ProvinceName = new SelectList(db.Provinces.Select(zz => zz.ProvinceName), "ProvinceName");
            //ViewBag.CityName = new SelectList(db.Cities.Select(zz => zz.CityName), "CityName");
            //List<Province> prov = db.Provinces.ToList();
            //ViewBag.ProvinceName = new SelectList(prov, "ProvinceID", "ProvinceName");
            ViewBag.CityID = new SelectList(db.Cities.Select(zz => new { CityName = zz.CityName }), "CityID", "CityName", co.CityID);
            return View(co);
        }

        // GET: Companies/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Company company = db.Companies.Find(id);
            if (company == null)
            {
                return HttpNotFound();
            }
            ViewBag.CityID = new SelectList(db.Cities, "CityID", "CityName", company.CityID);

            return View(company);
        }

        // POST: Companies/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "CompanyID,CompanyName,PhoneNo,Email,Website,CityID")] Company company)
        {
            if (ModelState.IsValid)
            {
                db.Entry(company).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            // ViewBag.CityID = new SelectList(db.Cities, "CityID", "CityName", company.CityID);
            ViewBag.CityID = new SelectList(db.Cities.Select(zz => new { CityName = zz.CityName }), "CityID", "CityName", company.CityID);
            return View(company);
        }

        // GET: Companies/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Company company = db.Companies.Find(id);
            if (company == null)
            {
                return HttpNotFound();
            }
            return View(company);
        }

        // POST: Companies/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Company company = db.Companies.Find(id);
            db.Companies.Remove(company);
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
