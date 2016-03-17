


    function open1() {

        document.getElementById("SecondryData").style.visibility = "visible";

        document.getElementById("status").innerHTML = "2-Normal User Data";
        document.getElementById("lbl1").innerHTML = "First Name";
        document.getElementById("lbl2").innerHTML = "Last Name";
        document.getElementById("lbl3").innerHTML = "Date Of Birth";



    }

    function open2() {
        document.getElementById("SecondryData").style.visibility = "visible";

        document.getElementById("status").innerHTML = "2-Verified User Data";
        document.getElementById("lbl1").innerHTML = "First Name";
        document.getElementById("lbl2").innerHTML = "Last Name";
        document.getElementById("lbl3").innerHTML = "Working Since";

        var x = document.getElementById("img3");
        x.src = "../icons/calendar68.png";

    }

    function open3() {
        document.getElementById("SecondryData").style.visibility = "visible";

        document.getElementById("status").innerHTML = "2-Development Team Data";
        document.getElementById("lbl1").innerHTML = "Team Name";
        document.getElementById("lbl2").innerHTML = "Company Name";
        document.getElementById("lbl3").innerHTML = "Formation Date";
        var x = document.getElementById("img1");
        x.src = "../icons/business53.png";

        var x = document.getElementById("img2");
        x.src = "../icons/businessman7.png";



        var x = document.getElementById("img3");
        x.src = "../icons/calendar68.png";


    }
    
    $(document).ready(function () {
        
        $("#LoginButton").click(function ()
        {
            $("#logindiv").animate({ top: '10px' }, 1000);
        });
    });