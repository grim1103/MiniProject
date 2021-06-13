using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;


namespace Hanyokessai.Models
{
    public class Zb400Dto
    {
        public string mailList_mail { get; set; }

        public string mailList_detail { get; set; }

        public string mail1 { get; set; }

        public string mail2 { get; set; }

        public string mail3 { get; set; }

        public string mail4 { get; set; }

        public string mail5 { get; set; }

        public string mail6 { get; set; }

        public string mail7 { get; set; }

        public string mail8 { get; set; }

        public string mail9 { get; set; }

        public string mail10 { get; set; }

        public string reg_id { get; set; }

        public string reg_date { get; set; }

        public string upd_id { get; set; }

        public string upd_date { get; set; }

        public string del_cd { get; set; }

        public IEnumerable<Zb400listDto> zb400SelectLists { get; set; }

        public class Zb400listDto
        {
            public string mail { get; set; }

            public string detail { get; set; }

            public string reg { get; set; }

            public string upd { get; set; }

        }

        public string Inputbtn { get; set; }

        public string Updatebtn { get; set; }
    }
}
