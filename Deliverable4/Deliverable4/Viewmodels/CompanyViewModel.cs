using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Deliverable4.Viewmodels
{
    public class CompanyViewModel
    {
        private string companyName;
        private string province;
        private string PhoneNo;
        private string CompanyEmail;
        private string website;
        private string city;

        public List<Models.Job> Jobs { get; set; }
        public string CompanyName { get => companyName; set => companyName = value; }
        public string PhoneNo1 { get => PhoneNo; set => PhoneNo = value; }
        public string CompanyEmail1 { get => CompanyEmail; set => CompanyEmail = value; }
        public string Website { get => website; set => website = value; }
        public string City { get => city; set => city = value; }
        public string Province { get => province; set => province = value; }

        //public CompanyViewModel()
        //{

        //}

        //public CompanyViewModel(string name, string phone, string email, string web, string c)
        //{
        //    companyName = name;
        //    PhoneNo = phone;
        //    CompanyEmail = email;
        //    website = web;
        //    city = c;
        //}
    }
}