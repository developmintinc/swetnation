<?php
	if($_POST){
		$to = 'example@example.com';/*Put Yuur Email Adress Here*/
		$subject = $_POST['subject'];
		$from_name = $_POST['name'];
		$from_email = $_POST['email'];
		$budget = $_POST['budget'];
		$message = $_POST['message'];
		$header = "From: $from_name <$from_email>";
		$body="New Message From: $from_name\n Email Adress: $from_email\n Subject: $subject\n Budget: $budget\n  Message: $message";
		mail($to, $subject, $body,$header);		
	}
?>