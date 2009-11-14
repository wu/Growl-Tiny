#!/perl
use strict;

use Test::More tests => 8;

use Growl::Tiny qw(notify);

ok( ! notify( {} ),
    "notify() called with empty hashref"
);

ok( ! notify(),
    "notify() called with no args"
);

ok( ! notify( { subject => 'test', quiet => 1 }),
    "notify() called with quiet flag set"
);

sleep 1;

ok( notify( { subject => 'notification with subject only' } ),
    "GROWL: notification with subject only"
);

sleep 1;

ok( notify( { subject => 'subject', title => 'title' } ),
    "GROWL: notification with subject and title"
);

sleep 1;

ok( notify( { subject => 'high priority notification', priority => 2 } ),
    "GROWL: high priority notification"
);

sleep 1;

ok( notify( { subject => 'low priority notification', priority => -2 } ),
    "GROWL: low priority notification"
);

sleep 1;

ok( notify( { subject => 'sticky notification', sticky => 1 } ),
    "GROWL: sticky notification"
);
