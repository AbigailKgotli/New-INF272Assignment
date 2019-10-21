﻿using System;
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
            var companies = db.Companies.Include(c => c.City).Include(c => c.CompanyType).Include(c => c.User);
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
            ViewBag.CompanyTypeID = new SelectList(db.CompanyTypes, "CompanyTypeID", "Description");
            ViewBag.UserID = new SelectList(db.Users, "UserID", "Username");
            return View();
        }

        // POST: Companies/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "CompanyID,CompanyName,PhoneNo,Email,Website,CompanyTypeID,UserID,CityID")] Company company)
        {
            if (ModelState.IsValid)
            {
                db.Companies.Add(company);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.CityID = new SelectList(db.Cities, "CityID", "CityName", company.CityID);
            ViewBag.CompanyTypeID = new SelectList(db.CompanyTypes, "CompanyTypeID", "Description", company.CompanyTypeID);
            ViewBag.UserID = new SelectList(db.Users, "UserID", "Username", company.UserID);
            return View(company);
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
            ViewBag.CompanyTypeID = new SelectList(db.CompanyTypes, "CompanyTypeID", "Description", company.CompanyTypeID);
            ViewBag.UserID = new SelectList(db.Users, "UserID", "Username", company.UserID);
            return View(company);
        }

        // POST: Companies/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "CompanyID,CompanyName,PhoneNo,Email,Website,CompanyTypeID,UserID,CityID")] Company company)
        {
            if (ModelState.IsValid)
            {
                db.Entry(company).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.CityID = new SelectList(db.Cities, "CityID", "CityName", company.CityID);
            ViewBag.CompanyTypeID = new SelectList(db.CompanyTypes, "CompanyTypeID", "Description", company.CompanyTypeID);
            ViewBag.UserID = new SelectList(db.Users, "UserID", "Username", company.UserID);
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
