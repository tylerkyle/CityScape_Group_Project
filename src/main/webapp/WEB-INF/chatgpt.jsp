<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ChatGPT</title>
    <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
</head>
<body>
	<div class="bg-video">
    	<video autoplay loop muted style="width: 100%; height: 100vh; object-fit: cover; position: absolute; z-index: -1;">
        	<source src="/videos/AdobeStock_387753011.mp4"  type="video/mp4">
    	</video>


    <h2 class="text-center text-light p-4">City Guide</h2>
    <a href="/dashboard" class="btn btn-primary position-absolute top-0 end-0 m-4">Dashboard</a>
    <div class="container-lg">
    	<form class="px-4 py-3" action="chat" method="post">
    		<div>
    			<p class="text-light text-center"><strong>Guide: </strong> ${response}</p>
    		</div>
    		<div class="mv-3 fixed-bottom form-group-lg flex-nowrap p-5">
        		<div class="gap-9 input-group mb-3">
        			<input class="form-control input-lg col-md-11 bg-dark shadow-lg text-light bg-gradient bg-transparent" type="text" id="prompt" name="prompt" required>
        			<div class="input-group-append">
        				<button class="btn btn-outline-success" type="submit">
        					<i class="bi bi-send "></i>
        				</button>
        			</div>
        		</div>
        	</div>
    	</form>
    </div>
    </div>
</body>
</html>