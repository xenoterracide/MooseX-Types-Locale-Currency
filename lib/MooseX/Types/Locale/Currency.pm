package MooseX::Types::Locale::Currency;
use 5.008;
use strict;
use warnings;

# VERSION

use MooseX::Types -declare => [ qw( AlphaCurrencyCode ) ];
use MooseX::Types::Moose qw( Str );
use namespace::autoclean;

use Locale::Currency;

enum AlphaCurrencyCode,
	[ all_currency_codes ]
	;

1;

# ABSTRACT: MooseX::Types::Locale::Currency
