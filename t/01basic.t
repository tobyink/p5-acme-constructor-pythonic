use Test::More tests => 1;

diag "Running on Perl $] $^O";

{
	package Local::Foo;
	sub create { bless [] => shift };
}

use Acme::Constructor::Pythonic
	main => {
		class       => 'Local::Foo',
		constructor => 'create',
		alias       => 'LocalFu',
		no_require  => 1,
	};
	
isa_ok( LocalFu(), 'Local::Foo' );
