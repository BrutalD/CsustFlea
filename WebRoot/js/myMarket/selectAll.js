function selectAllThings(){
	var AllThings = document.getElementsByName("things");
	var selectAll=document.getElementById("selectAll");
	if (selectAll.checked==true) {
		for ( var i = 0; i < AllThings.length; i++) {
			AllThings[i].checked = true;
		}
	} else {
		for ( var i = 0; i < AllThings.length; i++) {
			AllThings[i].checked = false;
		}
	}
}