use strict;
use warnings;

use RT::Extension::InlineAudioVideoAttachments::Test tests => 18;

my $audio_name   = 'des_armes.mp3';
my $audio_file   = RT::Test::get_relocatable_file($audio_name, 'data');

my ($baseurl, $m) = RT::Test->started_ok;
ok $m->login, 'logged in';

my $queue = RT::Queue->new(RT->Nobody);
my $qid = $queue->Load('General');
ok( $qid, "Loaded General queue" );

# Create ticket
$m->form_name('CreateTicketInQueue');
$m->field('Queue', $qid);
$m->submit;
is($m->status, 200, "request successful");
$m->content_contains("Create a new ticket", 'Ticket create page');

$m->form_name('TicketCreate');
$m->field('Subject', 'Audio attachment test');
$m->field('Content', 'Content with audio');
$m->submit;
is($m->status, 200, "Request successful");

$m->content_contains('Audio attachment test', 'We have subject on the page');
$m->content_contains('Content with audio', 'And content');

# Reply with uploaded attachments
$m->follow_link_ok({text => 'Reply'}, "Reply to the ticket");
$m->content_lacks('AttachExisting');
$m->form_name('TicketUpdate');
$m->field('Attach', $audio_file);
$m->field('UpdateContent', 'Message');
$m->click('SubmitTicket');
is($m->status, 200, "Request successful");

$m->content_contains("Download $audio_name", 'Page has file name');
$m->content_like(qr{<audio controls><source src="Attachment/\d+/\d+/$audio_name" type="audio/mpeg">Your browser does not support the audio tag.</audio>}, 'Audio can be watched in HTML5 player');
