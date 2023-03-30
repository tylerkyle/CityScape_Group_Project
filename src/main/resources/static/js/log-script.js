const togglePassword = document.getElementById("toggle-pass");
const password = document.getElementById("password");

togglePassword.addEventListener("click", function() {
	const type = password.getAttribute("type") === "password" ? "text" : "password";
	password.setAttribute("type", type);
	
	this.classList.toggle("bi-eye");
	
	if (this.classList.contains("bi-eye"))
	{
		this.title = "Hide";
	}
	else
	{
		this.title = "Show";
	}
})