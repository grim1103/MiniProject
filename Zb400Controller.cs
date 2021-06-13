using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Hanyokessai.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace Hanyokessai.Controllers
{
    public class Zb400Controller : Controller
    {
        public IActionResult event_Initial()
        {
            //画面表示に必要なデータを取得する。
            DbService context = HttpContext.RequestServices.GetService(typeof(DbService)) as DbService;
                  //ログインしているアカウントの会社コード
            string comCd = HttpContext.Session.GetString("companyCd");            
            Zb400Dto zb400 = new Zb400Dto();
            List <Zb400Dto.Zb400listDto> zb400SelectLists = context.GetInfoBydataZb400(comCd);
            zb400.zb400SelectLists = zb400SelectLists;
            zb400.Inputbtn = "none";
            zb400.Updatebtn = "none";

            return View("Zb400", zb400);
        }

        public IActionResult MaillistInsert(Zb400Dto zb400)
        {
            DbService context = HttpContext.RequestServices.GetService(typeof(DbService)) as DbService;
                  //データを入れる時の日付
            string sysDate = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");
            //ログインしているアカウントのID情報
            string Userid = HttpContext.Session.GetString("memberId");
            context.InsertMaillistZb400(zb400, sysDate, Userid);
            return RedirectToAction("event_Initial", "Zb400");
        }

        public IActionResult MaillistUpdate(Zb400Dto zb400)
        {
            DbService context = HttpContext.RequestServices.GetService(typeof(DbService)) as DbService;
                  //データを入れる時の日付
            string sysDate = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");
            //ログインしているアカウントのID情報
            string Userid = HttpContext.Session.GetString("memberId");
            context.UpdateMaillistZb400(zb400, sysDate, Userid);
            return RedirectToAction("event_Initial", "Zb400");
        }

        public IActionResult MaillistDelete(string mail)
        {
            DbService context = HttpContext.RequestServices.GetService(typeof(DbService)) as DbService;
            context.DeleteMaillistZb400(mail);
            return RedirectToAction("event_Initial", "Zb400");
        }

        public IActionResult MaillistSelect(string chkmail)
        {
            DbService context = HttpContext.RequestServices.GetService(typeof(DbService)) as DbService;
                   //ログインしているアカウントの会社コード
            string comCd = HttpContext.Session.GetString("companyCd");
            Zb400Dto zb400 = new Zb400Dto();
            zb400 = context.SelectMaillistzb400(chkmail);
            List<Zb400Dto.Zb400listDto> zb400SelectLists = context.GetInfoBydataZb400(comCd);
            zb400.zb400SelectLists = zb400SelectLists;
            zb400.Inputbtn = "none";
            zb400.Updatebtn = "";

            return View("Zb400", zb400);
        }

        public IActionResult maillistForm()
        {
            DbService context = HttpContext.RequestServices.GetService(typeof(DbService)) as DbService;
                  //ログインしているアカウントの会社コード
            string comCd = HttpContext.Session.GetString("companyCd");
            Zb400Dto zb400 = new Zb400Dto();
            List<Zb400Dto.Zb400listDto> zb400SelectLists = context.GetInfoBydataZb400(comCd);
            zb400.zb400SelectLists = zb400SelectLists;
            zb400.Inputbtn = "";
            zb400.Updatebtn = "none";
            return View("Zb400", zb400);
        }
    }
}
