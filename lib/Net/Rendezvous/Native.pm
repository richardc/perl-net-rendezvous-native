package Net::Rendezvous::Native;
use strict;
use warnings;
our $VERSION = '0.01';

=head1 NAME

Net::Rendezvous::Native - Use native rendezvous library, if available

=head1 SYNOPSIS

 use Net::Rendezvous::Native;
 my $res = Net::Rendezvous->new( $service, );
 $res->discover;

=head1 DESCRIPTION

Net::Rendezvous::Native will augment Net::Rendezvous to use a native
Rendezvous library, if available.  The native versions are typically
quicker to query, and more robust than doing it by hand as
Net::Rendezvous does.

=cut

# first, move the original Net::Rendezvous to one side
require Net::Rendezvous;
%Net::Rendezvous::Native::Perl:: = %Net::Rendezvous::;
delete $Net::Rendezvous::{$_} for keys %Net::Rendezvous::;
{
    package Net::Rendezvous;
    our @ISA = qw( Net::Rendezvous::Native );
}

sub new {
    my $self = shift;
    my $into = "Net::Rendezvous::Native::Perl";
    warn "remaking '$self' as a '$into'";
    $into->new( @_ );
}

=head1 AUTHOR

Richard Clamp <richardc@unixbeard.net>

=head1 COPYRIGHT

Copyright 2004 Richard Clamp.  All Rights Reserved.

This program is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=head1 SEE ALSO

Net::Rendezvous

=cut

1;
