package DBIx::Database::Pg;

use strict;
use vars qw($VERSION @ISA);
use DBIx::Database::Driver;
@ISA = qw( DBIx::Database::Driver );

$VERSION = '0.01';

=head1 NAME

DBIx::Database::Pg - PostgreSQL driver for DBIx::Database

=head1 SYNOPSIS

  use DBIx::Database;

  use DBIx::Database qw( create_database drop_database );

  create_database( "dbi:Pg:dbname=$dbname", $username, $password )
    or warn $DBIx::Database::errstr;

  create_database( "dbi:Pg:dbname=$dbname;host=$host;port=$port",
                   $username, $password )
    or warn $DBIx::Database::errstr;

  drop_database( "dbi:Pg:dbname=$dbname", $username, $password )
    or warn $DBIx::Database::errstr;

  drop_database( "dbi:Pg:dbname=$dbname;host=$host;port=$port",
                  $username, $password )
    or warn $DBIx::Database::errstr;

=head1 DESCRIPTION

This is the PostgresSQL driver for DBIx::Database.

=cut

sub parse_dsn {
  my( $class, $action, $dsn ) = @_;
  $dsn =~ s/^(dbi:(\w*?)(?:\((.*?)\))?:)//i #nicked from DBI->connect
                        or '' =~ /()/; # ensure $1 etc are empty if match fails
  my $prefix = $1 or die "can't parse data source: $dsn";

  my $database;
  if ( $dsn =~ s/(^|[;:])dbname=([^=:;]+)([;:]|$)/$1dbname=template1$3/ ) {
    $database = $2;
  } else {
    die "can't parse data source: $prefix$dsn";
  }

  ( "$prefix$dsn", "\U$action\E DATABASE $database" );
}

=head1 AUTHOR

Ivan Kohler <ivan-dbix-database@420.am>

=head1 COPYRIGHT

Copyright (c) 2000 Ivan Kohler
Copyright (c) 2000 Mail Abuse Prevention System LLC
All rights reserved.
This program is free software; you can redistribute it and/or modify it under
the same terms as Perl itself.

=head1 BUGS

=head1 SEE ALSO

L<DBIx::Database::Driver>, L<DBIx::Database>, L<DBD::Pg>, L<DBI>

=cut 

1;

