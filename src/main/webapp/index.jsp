<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false"%>

<html>
<head>
    <link href="${pageContext.request.contextPath}/CSS/indexStyles.css">
</head>
<body>
<!-- Option 1: jQuery and Bootstrap Bundle (includes Popper) -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>
<div class="container">
    <h2>Age Calculator</h2>

    <form onsubmit="calculateAge(); return false;">
        Please enter your name: <input type="text" name="name" id="name"><br>
        Please enter your birth date: <input type="date" name="date" id="date"><br>
        <input type="submit">
    </form>

    <div id="target" class="target">
    </div>




</div>
<script>
    function calculateAge() {
        const out = document.getElementById("target");
        const name = document.getElementById("name").value;
        const dateOfBirth = document.getElementById("date").value;
        const xhttp = new XMLHttpRequest();
        xhttp.onreadystatechange = function () {
            if(this.readyState == 4 && this.status == 200){
                const response = JSON.parse(this.responseText);
                out.innerText = "Hello " + response.name + ", since your birth have passed " + response.ageNow + " days, approximately " + Math.floor((response.ageNow)/365) + " years and " + (response.ageNow % 365) + " days.";
            }
        }
        xhttp.open("POST", "calculateAge", true);
        const reqBody = {name,
            dateOfBirth,
        };
        xhttp.send(JSON.stringify(reqBody));
    }
</script>
<!-- Option 1: jQuery and Bootstrap Bundle (includes Popper) -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>
</body>
</html>
