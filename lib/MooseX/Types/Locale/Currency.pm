package MooseX::Types::Locale::Currency;
use 5.008;
use strict;
use warnings;

# VERSION

use MooseX::Types -declare => [ qw( CurrencyCode ) ];
use MooseX::Types::Moose qw( Str Int );
use namespace::autoclean;

use Locale::Currency;

enum CurrencyCode,
	[ all_currency_codes ]
	;

coerce CurrencyCode,
	from Int,
	via {
		currency_code2code( $_, 'num', 'alpha' );
	}
	;

1;

# ABSTRACT: Moose Types related to Locale Currency

=head1 SYNOPSIS

	{
		package My::Object;
		use Moose;
		use MooseX::Types::Locale::Currency qw( CurrencyCode );

		has currency_code => (
			is => 'ro',
			isa => CurrencyCode,
		);
		__PACKAGE__->meta->make_immutable;
	}

	my $obj = My::Object->new({
		currency_code => 'usd'
	});

=head1 DESCRIPTION

This module provides the C<CurrencyCode> type. The API is not stable, currency
code may become an object or gain "handles" in order to  support accessing the
different ways to "view" a currency code.

=head1 TYPES

=over

=item * C<CurrencyCode>

Base Type: C<enum>

will validate the the 3 character string passed to it is in the list of
C<all_currency_codes>

=back

=head1 SEE ALSO

=over

=item * L<Locale::Currency>

=back

=cut
