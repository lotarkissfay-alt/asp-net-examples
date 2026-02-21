function queryLegends() {
    var xhr = null;
    if (window.XMLHttpRequest) {
        xhr = new XMLHttpRequest();
    } else {
        xhr = new ActiveXObject("Microsoft.XMLHTTP");
    }

    xhr.open("GET", "api/list.aspx", false);
    xhr.send();

    return xhr.responseXML.getElementsByTagName("legend");
}

function updateTable() {

    var legends =queryLegends();
    var table = document.getElementById("legendTable");

    while (table.rows.length > 1) {
        table.deleteRow(1);
    }

    for (var i = 0; i < legends.length; i++) {

        var name = legends[i].getElementsByTagName("name")[0].firstChild.nodeValue;
        var age = legends[i].getElementsByTagName("age")[0].firstChild.nodeValue;

        var row = table.insertRow(-1);

        var cell1 = row.insertCell(0);
        var cell2 = row.insertCell(1);

        cell1.align = "center";
        cell2.align = "center";

        cell1.innerHTML = name;
        cell2.innerHTML = age;
    }
}
