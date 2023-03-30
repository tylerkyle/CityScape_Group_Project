const togglePassword = document.getElementById("toggle-pass");
const toggleConfirmPassword = document.getElementById("toggle-confirm-pass");
const password = document.getElementById("password");
const passwordConfirmation = document.getElementById("passwordConfirmation");

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

toggleConfirmPassword.addEventListener("click", function() {
	const type = passwordConfirmation.getAttribute("type") === "password" ? "text" : "password";
	passwordConfirmation.setAttribute("type", type);
	
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