using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using Microsoft.AspNetCore.Http;

namespace Hanyokessai.Models
{
    public class Za400Dto
    {
        public UInt32 fileSize { get; set; }
        
        public string member_id { get; set; }

        public string txtUpdateid { get; set; }

        public string txtMail { get; set; }

        [Required(ErrorMessage = "パスワードを入力してください。")]
        [StringLength(15, ErrorMessage = "15桁以内で入力してください。")]
        [RegularExpression(@"^[a-zA-Z0-9!-/:-@¥[-`{-~]*$", ErrorMessage = "半角文字及び数字を入力してください。")]
        public string txtPwd { get; set; }

        [Required(ErrorMessage = "パースワード確認を入力してください。")]
        [StringLength(15, ErrorMessage = "15桁以内で入力してください。")]
        [Compare("txtPwd", ErrorMessage = "パスワードとパスワード確認が違います。")]
        public string txtPwdConfirm { get; set; }

        [StringLength(30, ErrorMessage = "姓(カナ)に30桁以内で入力してください。")]
        [RegularExpression("^[ｦ-ﾟ]*$", ErrorMessage = "姓(カナ)に半角カナを入力してください。")]
        public string txtKanaFirstName { get; set; }

        [StringLength(30, ErrorMessage = "名(カナ)に30桁以内で入力してください。")]
        [RegularExpression("^[ｦ-ﾟ]*$", ErrorMessage = "名(カナ)に半角カナを入力してください。")]
        public string txtKanaLastName { get; set; }

        [Required(ErrorMessage = "姓(漢字)を入力してください。")]
        [StringLength(15, ErrorMessage = "姓(漢字)を15桁以内で入力してください。")]
        [RegularExpression("^[^-~｡-ﾟ]*$", ErrorMessage = "姓(漢字)に全角文字を入力してください。")]
        public string txtKanjiFirstName { get; set; }

        [Required(ErrorMessage = "名(漢字)を入力してください。")]
        [StringLength(15, ErrorMessage = "名(漢字)に15桁以内で入力してください。")]
        [RegularExpression("^[^-~｡-ﾟ]*$", ErrorMessage = "名(漢字)に全角文字を入力してください。")]
        public string txtKanjiLastName { get; set; }

        [StringLength(30, ErrorMessage = "姓(英語)に30桁以内で入力してください。")]
        [RegularExpression("^[a-zA-Z]*$", ErrorMessage = "姓(英語)に半角英語を入力してください。")]
        public string txtEngFirstName { get; set; }

        [StringLength(30, ErrorMessage = "名(英語)に30桁以内で入力してください。")]
        [RegularExpression("^[a-zA-Z]*$", ErrorMessage = "名(英語)に半角英語を入力してください。")]
        public string txtEngLastName { get; set; }

        [RegularExpression("[\\x00-\\x7F]", ErrorMessage = "性別に誤りがあります。")]
        public string txtGender { get; set; }

        [RegularExpression("^[0-9]{3}[-][0-9]{4}[-][0-9]{4}$", ErrorMessage = "携帯番号の形式ではありません。")]
        public string txtPhone { get; set; }

        [RegularExpression("^[0-9]{3}[-][0-9]{4}$", ErrorMessage = "郵便番号の形式ではありません。")]
        public string txtZipcode { get; set; }

        [StringLength(75, ErrorMessage = "住所に75桁以内で入力してください。")]
        [RegularExpression("^[^-~｡-ﾟ]*$", ErrorMessage = "住所に全角文字を入力してください。")]
        public string txtAddress { get; set; }

        public string txtCompanyCode { get; set; }

        [RegularExpression("[\\x00-\\x7F]", ErrorMessage = "所属１に誤りがあります。")]
        public string txtDepartment1 { get; set; }

        [RegularExpression("[\\x00-\\x7F]", ErrorMessage = "所属２に誤りがあります。")]
        public string txtDepartment2 { get; set; }

        [RegularExpression("^[A-Z]+$", ErrorMessage = "職位に誤りがあります。")]
        public string txtPosition { get; set; }

        [Required(ErrorMessage = "入社日を入力してください。")]
        public string txtEnterDate { get; set; }

        public string txtUpdateDate { get; set; }

        public string txtStamp { get; set; }

        [Required(ErrorMessage = "押印情報有無を選択してください。")]
        public IFormFile imgStamp { get; set; }

        public string txtimgStamp { get; set; }

        public string txtStampCode { get; set; }
        
        public string imgStamp1 { get; set; }

        public List<string> errorMessege { get; set; }

        public List<string> txtComCdList { get; set; }

        public List<string> txtDep1CdList { get; set; }

        public List<string> txtDep1NameList { get; set; }

        public List<string> txtDep2CdList { get; set; }

        public List<string> txtDep2CdNameList { get; set; }

        public List<string> txtComPosCdList { get; set; }

        public List<string> txtComPosCdNameList { get; set; }


    }
}
