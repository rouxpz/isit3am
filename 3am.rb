require 'sinatra'

set :port, 9494

get '/' do 
	output = ''
	output += <<-HTML
	<!DOCTYPE html>
	<html>
	<head>
		<title>is it 3am?</title>
		<style type="text/css">
			body {
			font-family: Helvetica;
			background-repeat: repeat;
			}

			h1 {
			font-size: 500%;
			margin-left: 25%;
			margin-top: 400px;
			padding-left: 20px;
			padding-bottom: 5px;
			padding-top: 5px;
			background-color: white;
			}

			p {
			font-size: 150%;
			background-color: white;
			color: black;
			text-decoration: none;
			margin-left: 90%;
			margin-top: 200px;
			padding-left: 10px;
			}

			a {
			color: #666666;
			text-decoration: none;
			}
		</style>
	</head>

	<body>

	<script>
		var d = new Date();
		d = d.toString().split(" ");
		var t = d[4].split(":");
		console.log(t);

		if (t[0] === "03") {
			console.log("lonely");
			document.body.style.backgroundImage = "url(images/lonely.gif)";
			document.body.innerHTML = "<h1>YES.  You must be lonely.</h1><p><a href='/about'>about</a></p>";
		} else {
			console.log("nope");
			var h;
			var ampm;
			document.body.style.backgroundImage = "url(images/confused.jpg)";
			if (t[0] > 12) {
				h = t[0] - 12;
				ampm = "pm";
			} else {
				h = t[0];
				ampm = "am";
			}
			document.body.innerHTML = "<h1>No, it's " + h + ":" + t[1] + " " + ampm + ".</h1><p><a href='/about'>about</a></p>";
		}

	</script>
	</body>
	HTML
end

get '/about' do
	output = ''
	output += <<-HTML
	<!DOCTYPE html>
	<html>
	<head>
		<title>what?</title>
		<style type="text/css">
			body{
			font-family: Helvetica;
			margin-top: 100px;
			text-align: center;
			background-image: url("images/matchbox.jpg");
			background-repeat: repeat;
			}

			h3 {
			text-align: center;
			background-color: white;
			}

			a {
			color: #666666;
			text-decoration: none;
			}
		</style>
	</head>


	<body>
		<iframe width="560" height="420" src="http://www.youtube.com/embed/C-Naa1HXeDQ" frameborder="0" allowfullscreen></iframe>
		<h3>with love and apologies to matchbox 20</h3>
	</body>
	HTML
end

