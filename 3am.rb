require 'sinatra'

set :port, 9494

get '/' do 
	utctime = Time.now.utc
	time = utctime.getlocal("-04:00")
	hour = time.hour
	minute = time.min
	#{}"The time is " + hour.inspect + ":" + minute.inspect

	if hour == 3 && minute == 0
		output = ''
		output += <<-HTML
		<!DOCTYPE html>
		<html>
		<head>
			<title>is it 3am?</title>
			<style type="text/css">
				body {
				font-family: Helvetica;
				background-image: url("images/lonely.gif");
				background-repeat: repeat;
				}

				h1 {
				font-size: 500%;
				margin-left: 400px;
				margin-top: 400px;
				background-color: white;
				}

				p {
				font-size: 150%;
				background-color: white;
				color: black;
				text-decoration: none;
				margin-left: 1350px;
				margin-top: 200px;
				}

				a {
				color: black;
				text-decoration: none;
				}
			</style>
		</head>

		<body>

			<h1>YES.  You must be lonely.</h1>
			<p><a href="/about">about</a></p>

		</body>
		HTML

	else
		if (hour > 12)
			hour = hour - 12
			half = 'pm'
		else
			if hour == 0
				hour = 12
				half = 'am'
			else
				hour = hour
				half = 'am'
			end
		end
		output = ''
		output += <<-HTML
		<!DOCTYPE html>
		<html>
		<head>
			<title>is it 3am?</title>
			<style type="text/css">
				body {
				font-family: Helvetica;
				background-image: url("images/confused.jpg");
				background-repeat: repeat;
				}

				h1 {
				font-size: 500%;
				margin-left: 700px;
				margin-top: 400px;
				background-color: white;
				}

				p {
				font-size: 150%;
				background-color: white;
				color: black;
				text-decoration: none;
				margin-left: 1350px;
				margin-top: 200px;
				}

				a {
				color: #666666;
				text-decoration: none;
				}
			</style>
		</head>

		<body>
			<h1>No, it's #{hour.inspect}:#{minute.inspect} #{half}.</h1>
			<p><a href="/about">about</a></p>
		</body>
		HTML
		end
end

get '/about' do
	output = ''
	output += <<-HTML
	<!DOCTYPE html>
	<html>
	<head>
		<title>who the hell is responsible for this?</title>
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
		<h3>created by <a href="http://ameliahancock.com/">amelia hancock</a> && <a href="http://rouxpz.com">roopa vasudevan</a></h3>
		<h3>with love and apologies to matchbox 20</h3>
	</body>
	HTML
end

