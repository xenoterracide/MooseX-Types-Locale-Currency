#!/usr/bin/perl
use strict;
use warnings;
use Test::More;

{
    package Currency;
    use Moose;
    use MooseX::Types::Locale::Currency qw( CurrencyCode );

    has code  => (
        is => 'ro',
        isa => CurrencyCode,
		coerce => 1,
    );

    __PACKAGE__->meta->make_immutable;
}

my $c = Currency->new({ code => 840 });

is( $c->code, 'USD', 'check currency code returns' );

done_testing;
