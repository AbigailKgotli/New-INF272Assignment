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
    public class PersonLanguagesController : Controller
    {
        private JobItDBEntities db = new JobItDBEntities();

        // GET: PersonLanguages
        public ActionResult Index()
        {
            var personLanguages = db.PersonLanguages.Include(p => p.Language).Include(p => p.Person);
            return View(personLanguages.ToList());
        }

        // GET: PersonLanguages/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            PersonLanguage personLanguage = db.PersonLanguages.Find(id);
            if (personLanguage == null)
            {
                return HttpNotFound();
            }
            return View(personLanguage);
        }

        // GET: PersonLanguages/Create
        public ActionResult Create()
        {
            ViewBag.LanguageID = new SelectList(db.Languages, "LanguageID", "Description");
            ViewBag.PersonID = new SelectList(db.People, "PersonID", "PersonName");
            return View();
        }

        // POST: PersonLanguages/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "PersonLanguageID,PersonID,LanguageID")] PersonLanguage personLanguage)
        {
            if (ModelState.IsValid)
            {
                db.PersonLanguages.Add(personLanguage);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.LanguageID = new SelectList(db.Languages, "LanguageID", "Description", personLanguage.LanguageID);
            ViewBag.PersonID = new SelectList(db.People, "PersonID", "PersonName", personLanguage.PersonID);
            return View(personLanguage);
        }

        // GET: PersonLanguages/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            PersonLanguage personLanguage = db.PersonLanguages.Find(id);
            if (personLanguage == null)
            {
                return HttpNotFound();
            }
            ViewBag.LanguageID = new SelectList(db.Languages, "LanguageID", "Description", personLanguage.LanguageID);
            ViewBag.PersonID = new SelectList(db.People, "PersonID", "PersonName", personLanguage.PersonID);
            return View(personLanguage);
        }

        // POST: PersonLanguages/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "PersonLanguageID,PersonID,LanguageID")] PersonLanguage personLanguage)
        {
            if (ModelState.IsValid)
            {
                db.Entry(personLanguage).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.LanguageID = new SelectList(db.Languages, "LanguageID", "Description", personLanguage.LanguageID);
            ViewBag.PersonID = new SelectList(db.People, "PersonID", "PersonName", personLanguage.PersonID);
            return View(personLanguage);
        }

        // GET: PersonLanguages/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            PersonLanguage personLanguage = db.PersonLanguages.Find(id);
            if (personLanguage == null)
            {
                return HttpNotFound();
            }
            return View(personLanguage);
        }

        // POST: PersonLanguages/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            PersonLanguage personLanguage = db.PersonLanguages.Find(id);
            db.PersonLanguages.Remove(personLanguage);
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
