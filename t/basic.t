#!perl -w
use strict;
use Test::More tests => 2;
use Net::Rendezvous::Native;

my $res = Net::Rendezvous->new( 'dmap' );
