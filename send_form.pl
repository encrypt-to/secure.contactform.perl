#!/usr/bin/perl -w

use CGI;
$query = new CGI;

# your email address
$mailto = 'your@mail.com';

# sendmail path
$sendmail = "/usr/sbin/sendmail -t";

# form params
$subject = $query->param('subject');
$message = $query->param('message');
$mailfrom = $query->param('email');

# sendmail
open(SENDMAIL, "|$sendmail") or die "Cannot open $sendmail: $!";
print SENDMAIL "To: $mailto\n";
print SENDMAIL "Reply-To: $mailfrom\n";
print SENDMAIL "Subject: $subject\n\n";
print SENDMAIL "Content-type: text/plain\n\n";
print SENDMAIL "$message\n";
close(SENDMAIL);

print "Thank you for contacting us.";