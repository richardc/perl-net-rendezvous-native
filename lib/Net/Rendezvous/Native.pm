package Net::Rendezvous::Native;
use strict;
use warnings;
our $VERSION = '0.01';

=head1 NAME

Net::Rendezvous::Native - Use native rendezvous library, if available

=head1 SYNOPSIS

 use Net::Rendezvous::Native;
 my $res = Net::Rendezvous::Native->new( $service, );
 $res->discover;

=head1 DESCRIPTION

Net::Rendezvous::Native presents the same interface as Net::Rendezvous
but selects a native Rendezvous library, if available.  The native
versions are typically quicker to query, and sometimes more robust.

=cut

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
