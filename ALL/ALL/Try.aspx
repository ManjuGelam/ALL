<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Try.aspx.cs" Inherits="ALL.ALL.Try" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.16.9/xlsx.full.min.js"></script>
    <script src="../Scripts/jquery-3.6.4.js" type="text/javascript"></script>
    <script src="../Scripts/jquery-3.6.4.min.js" type="text/javascript"></script>
    <script src="../Scripts/Scripts/js/JavaScript1.js" type="text/javascript"></script>

</head>
<body>
    <form id="form1" runat="server">
        <script>
            $(document).ready(function () {
                alert("Hello Ittadi");
                return false;
            });

            var Form = document.getElementById("divTable");

            function Upload(event) {
                var files = document.getElementById('file_upload').files;
                if (files.length == 0) {
                    alert("Please choose a file...");
                    return false;
                }

                var filename = files[0].name;
                var extension = filename.substring(filename.lastIndexOf(".")).toUpperCase();
                if (extension == '.XLS' || extension == '.XLSX') {
                    excelFileToJSON(files[0]);
                    event.preventDefault();
                    return false;
                } else {
                    alert("Please select a valid excel file.");
                }
            }

            function excelFileToJSON(file) {
                try {
                    var reader = new FileReader();
                    reader.readAsBinaryString(file);
                    reader.onload = function (e) {
                        var data = e.target.result;
                        var workbook = XLSX.read(data, {
                            type: 'binary'
                        });
                        var result = {};
                        var firstSheetName = workbook.SheetNames[0];
                        var jsonData = XLSX.utils.sheet_to_json(workbook.Sheets[firstSheetName]);
                        displayJsonToHtmlTable(jsonData);
                    }
                } catch (e) {
                    console.error(e);
                }
            }

            function displayJsonToHtmlTable(jsonData) {
                var table = document.getElementById("display_excel_data");
                if (jsonData.length > 1) {
                    var htmlData = '<tr><th>ID</th><th>' + columnHeaders[0] + '</th><th>' + columnHeaders[1] + '</th><th>' + columnHeaders[3] + '</th><th>' + columnHeaders[4] + '</th></tr>';
                    for (var i = 1; i < jsonData.length; i++) {
                        var row = jsonData[i];
                        htmlData += '<tr><td>' + i + '</td><td>' + jsonData[i]["ROLL_No"] + '</td><td>' + jsonData[i]["NEW_INSTCODE"] + '</td><td>' + jsonData[i]["INSTCODE"] + '</td></tr>';
                    }
                    table.innerHTML = htmlData;
                    $("#display_excel_data").show();
                    event.preventDefault();
                } else {
                    table.innerHTML = 'There is no data in the excel.';
                }
            }

            function SubmitData() {
                var Obj = [];
                var FCol = $("display_excel_data tr th ")[0].innerHTML;
                var SCol = $("display_excel_data tr th ")[1].innerHTML;
                var TCol = $("display_excel_data tr th ")[2].innerHTML;
                var FrCol = $("display_excel_data tr th ")[3].innerHTML;
                var FifthCol = $("display_excel_data tr th ")[4].innerHTML;
                $.ajax({
                    type: "post",
                    url: "Try.aspx/GetGrid",
                    data: { ID: ID, Name: Name, MobileNum: MobileNum, Salary: Salary, Country: Country },
                    contentType: "application/json",
                    dataType: "json",
                    async: true,
                    beforeSend: function () {

                    },
                    success: function (res) {
                        alert("Success");
                    },
                    error: function (err) {
                        alert("fail")
                        return false;
                    },
                    complete: function () {

                    }
                });
            }
  </script>


        <div id="divTable">
            <input type="file" id="file_upload" name="file_upload" />
            <asp:Button ID="btnUpload" runat="server" Text="Upload" />

            <div id="divExcel" style="overflow: auto;">
                <table id="display_excel_data" border="1"></table>
            </div>
            <input type="button" id="btnsubmit" value="submit" onclick="return SubmitData();" />
        </div>
    </form>
</body>
</html>
