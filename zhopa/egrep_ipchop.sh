#!/bin/bash
ipextract () 
{ 
egrep --only-matching -E  '(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)' 
}

ipextractnet ()
{ 
egrep --only-matching -E  '(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)/[[:digit:]]+' 
}

ipextracttcp ()
{ 
egrep --only-matching -E  '[[:digit:]]+/tcp' 
}

ipextractudp ()
{ 
egrep --only-matching -E  '[[:digit:]]+/udp' 
}

ipextractsctp ()
{ 
egrep --only-matching -E  '[[:digit:]]+/sctp' 
}

ipextractfqdn ()
{ 
egrep --only-matching -E  '[a-zA-Z0-9]+[a-zA-Z0-9\-\.]*\.[a-zA-Z]{2,}' 
}
