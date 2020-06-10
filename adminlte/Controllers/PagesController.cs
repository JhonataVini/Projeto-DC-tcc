using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using adminlte.Models;
using adminlte.DAL;

namespace adminlte.Controllers
{
    public class PagesController : Controller
    {
        public ActionResult Cadastro()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Cadastro(Aluno aluno)
        {
            if (ModelState.IsValid)
            {
                using (DirecionaCursos db = new DirecionaCursos())
                {
                    ViewBag.Escolaridade = new SelectList(db.Escolaridades, "ID", "Descricao");

                    db.Alunos.Add(aluno);
                    db.SaveChanges();
                }
                ModelState.Clear();
                ViewBag.Message = aluno.Nome + " cadastrado com sucesso.";

            }
            return View();
        }


        public ActionResult Login()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Login(Aluno aluno)
        {
            using (DirecionaCursos db = new DirecionaCursos())
            {
                var alu = db.Alunos.Single(a => a.Email == aluno.Email && a.Senha == aluno.Senha);
                if (alu != null)
                {
                    Session["ID"] = alu.ID.ToString();
                    Session["Nome"] = alu.Nome.ToString();
                    return RedirectToAction("Logado");
                }
                else
                {
                    ModelState.AddModelError("", "Email ou senha estão incorretos!");
                }
            }
            return View();
        }

        public ActionResult Logado()
        {
            if (Session["ID"] != null)
                return View();
            else
                return RedirectToAction("Login");
        }

        // GET: Page
        public ActionResult Inicio()
        {
            return View();
        }

        public ActionResult Certificados()
        {
            return View(GoogleDriveFilesRepository.GetDriveFiles());
        }
        [HttpGet]
        public ActionResult GetGoogleDriveFiles()
        {
            return View(GoogleDriveFilesRepository.GetDriveFiles());
        }

        [HttpGet]
        public ActionResult GetGoogleDriveFiles1()
        {
            return View(GoogleDriveFilesRepository.GetDriveFiles());
        }


        [HttpGet]
        public ActionResult GetGoogleDriveFiles2()
        {
            return View(GoogleDriveFilesRepository.GetDriveFiles());
        }

        [HttpPost]
        public ActionResult DeleteFile(GoogleDriveFile file)
        {
            GoogleDriveFilesRepository.DeleteFile(file);
            return RedirectToAction("Certificados");
        }

        [HttpPost]
        public ActionResult UploadFile(HttpPostedFileBase file)
        {
            GoogleDriveFilesRepository.FileUpload(file);
            return RedirectToAction("Certificados");
        }

        public void DownloadFile(string id)
        {
            string FilePath = GoogleDriveFilesRepository.DownloadGoogleFile(id);

            Response.ContentType = "application/zip";
            Response.AddHeader("Content-Disposition", "attachment; filename=" + Path.GetFileName(FilePath));
            Response.WriteFile(System.Web.HttpContext.Current.Server.MapPath("~/GoogleDriveFiles/" + Path.GetFileName(FilePath)));
            Response.End();
            Response.Flush();
        }


        [HttpGet]
        public ActionResult GetContainsInFolder(string folderId)
        {
            return View(GoogleDriveFilesRepository.GetContainsInFolder(folderId));
        }

        [HttpPost]
        public ActionResult CreateFolder(String FolderName)
        {
            GoogleDriveFilesRepository.CreateFolder(FolderName);
            return RedirectToAction("GetGoogleDriveFiles1");
        }


        [HttpPost]
        public ActionResult FileUploadInFolder(GoogleDriveFile FolderId, HttpPostedFileBase file)
        {
            GoogleDriveFilesRepository.FileUploadInFolder(FolderId.Id, file);
            return RedirectToAction("GetGoogleDriveFiles1");
        }


        [HttpGet]
        public JsonResult FolderLists()
        {
            List<GoogleDriveFile> AllFolders = GoogleDriveFilesRepository.GetDriveFolders();
            List<DDLOptions> obj = new List<DDLOptions>();

            foreach (GoogleDriveFile EachFolder in AllFolders)
            {
                obj.Add(new DDLOptions { Id = EachFolder.Id, Name = EachFolder.Name });
            }
            return Json(obj, JsonRequestBehavior.AllowGet);
        }

        public string MoveFiles(String fileId, String folderId)
        {
            string Result = GoogleDriveFilesRepository.MoveFiles(fileId, folderId);
            return Result;
        }

        public string CopyFiles(String fileId, String folderId)
        {
            string Result = GoogleDriveFilesRepository.CopyFiles(fileId, folderId);
            return Result;
        }

        public JsonResult Render_GetGoogleDriveFilesView()
        {
            Dictionary<string, object> jsonResult = new Dictionary<string, object>();
            var result = GoogleDriveFilesRepository.GetDriveFiles();
            jsonResult.Add("Html", RenderRazorViewToString("~/Views/Home/GetGoogleDriveFiles1.cshtml", result));
            return Json(jsonResult, JsonRequestBehavior.AllowGet);
        }

        public string RenderRazorViewToString(string viewName, object model)
        {
            if (model != null)
            {
                ViewData.Model = model;

            }
            using (var sw = new StringWriter())
            {
                var viewResult = ViewEngines.Engines.FindPartialView(ControllerContext, viewName);
                var viewContext = new ViewContext(ControllerContext, viewResult.View, ViewData, TempData, sw);
                viewResult.View.Render(viewContext, sw);
                viewResult.ViewEngine.ReleaseView(ControllerContext, viewResult.View);
                return sw.GetStringBuilder().ToString();
            }
        }
    }
}