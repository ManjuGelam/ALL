function submitData() {
    var file = $("#file_upload").val();
    var Upload = $("#btnUpload").val();
    $('#display_excel_data tr:gt(0)').each(function (e) {


        isValid = true;
        var stockList = []; // You need to define and populate this variable with the data to be sent
        var ID = ''; // You need to define and set this variable with the appropriate value
        var MobileNum = ''; // You need to define and set this variable with the appropriate value
        var Country = ''; // You need to define and set this variable with the appropriate value
        $.ajax({
            type: "post",
            url: "Try.aspx/SubmitData",
            data: "{'columns':'" + stockList + "','ID':'" + ID + "','Name':'" + Name + "',''}",
            //data: JSON.stringify({ columns: stockList, ID: ID, Name: MobileNum, Salary: Country }),
            contentType: "application/json",
            success: function (res) {
                var obj = JSON.parse(res.d);
                if (obj[0].FLAG === 1) {
                    alert("Data submitted successfully");
                }
                else {
                    alert("Data not submitted");
                    return false;
                }
            },
            error: function (err) {
                alert("Something went wrong. Please try again later!");
            },
            complete: function (data) {

            }
        });
    });
}
