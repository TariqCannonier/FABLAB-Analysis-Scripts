function validate(){
	username = document.getElementById("username").value;
	if (username !== "" && username.length == 7){
		localStorage.setItem("user",username);
		window.location = "RecMem.html"; // Redirecting to other page.
	return false;
	}
	else{
		alert("Please enter a valid ID.");
	}
}