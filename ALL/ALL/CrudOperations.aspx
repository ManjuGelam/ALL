<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CrudOperations.aspx.cs" Inherits="ALL.ALL.CrudOperations" %>

<!DOCTYPE HTML>
<html>
<head>
    <meta charset="utf-8" />
    <title>Convert Excel to HTML Table using JavaScript</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

    <script type="text/javascript" src="https://unpkg.com/xlsx@0.15.1/dist/xlsx.full.min.js"></script>
    <script type="text/javascript" src="../Scripts/jquery-3.6.4.js"></script>
    <script type="text/javascript" src="../Scripts/jquery-3.6.4.min.js"></script>
</head>
<body>
    <div class="container">

        <div class="card">
            <div class="card-header"><b>Select Excel File</b></div>
            <div class="card-body">
                <input type="file" id="excel_file" />
            </div>
        </div>
        <div id="excel_data" class="mt-5"></div>
        <div id="divbtn">
            <input type="button" value="Submit" onclick="return OnSubmit();" style="margin-top: 30px;" />

        </div>
    </div>
</body>
</html>

<script>

    function OnSubmit() {
        /* $("#tblExcel tr").length;
         for (var i = 0; i < tblLength; i++) {
 
         }*/

        $("#tblExcel tr").each(function (e) {
            if (e > 0) {
                var FCol = $(this).find('td:eq(0)').html();
                var SCol = $(this).find('td:eq(1)').html();

                $.ajax({
                    type: "post",
                    url: "CrudOperations.aspx/InsertData",
                    data: "{'FCol':'" + FCol + "','SCol':'" + SCol + "'}",
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
        })

    }


    const excel_file = document.getElementById('excel_file');

    excel_file.addEventListener('change', (event) => {

        if (!['application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'application/vnd.ms-excel'].includes(event.target.files[0].type)) {
            document.getElementById('excel_data').innerHTML = '<div class="alert alert-danger">Only .xlsx or .xls file format are allowed</div>';

            excel_file.value = '';

            return false;
        }
        var reader = new FileReader();

        reader.readAsArrayBuffer(event.target.files[0]);

        reader.onload = function (event) {

            var data = new Uint8Array(reader.result);

            var work_book = XLSX.read(data, { type: 'array' });

            var sheet_name = work_book.SheetNames;

            var sheet_data = XLSX.utils.sheet_to_json(work_book.Sheets[sheet_name[0]], { header: 1 });

            if (sheet_data.length > 0) {
                var table_output = '<table border="2px;" id="tblExcel" cellpadding="5px;" cellspacing="5px;" style="width:200px;">';

                for (var row = 0; row < sheet_data.length; row++) {

                    table_output += '<tr>';

                    for (var cell = 0; cell < sheet_data[row].length; cell++) {

                        if (row == 0) {

                            table_output += '<th>' + sheet_data[row][cell] + '</th>';

                        }
                        else {

                            table_output += '<td>' + sheet_data[row][cell] + '</td>';

                        }

                    }

                    table_output += '</tr>';

                }

                table_output += '</table>';

                document.getElementById('excel_data').innerHTML = table_output;
            }

            excel_file.value = '';

        }

    });

</script>


