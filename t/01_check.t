use strict;
use Test::More tests => 16;
use Math::CheckDigits;

can_ok( 'Math::CheckDigits', qw/new checkdigit complete is_valid/ );

my $cd = Math::CheckDigits->new( 11, [2..7] );
ok $cd;

is $cd->checkdigit('12345678'), 5;
is $cd->complete('12345678'), '123456785';
ok $cd->is_valid('123456785');


$cd = Math::CheckDigits->new(
    modulus => 10,
    weight  => [3,1],
);
ok $cd;

is $cd->checkdigit('4972253'), 6;
is $cd->complete('4972253'), '49722536';
ok $cd->is_valid('49722536');

$cd = Math::CheckDigits->new({
    modulus => 10,
    weight  => [3,1],
});
ok $cd;

is $cd->checkdigit('12345'), 7;
is $cd->complete('12345'), '123457';
ok $cd->is_valid('123457');

#old ISBN
$cd = Math::CheckDigits->new(
        modulus => 11,
        weight  => [10, 9, 8, 7, 6, 5, 4, 3, 2],
    )->options(
        start_at_right => 0,
    )->trans_table(
        10  => 'X',
    );
ok $cd->is_valid('4101092052');


#runes
$cd = Math::CheckDigits->new(
    modulus => 10,
    weight  => [1, 2],
)->options(
    runes => 1,
);

ok $cd->is_valid('3487649');

# modulus 16
$cd = Math::CheckDigits->new(
    modulus => 16,
    weight  => [1],
)->trans_table(
    10  => '-',
    11  => '$',
    12  => ':',
    13  => '.',
    14  => '/',
    15  => '+',
    16  => 'a',
    17  => 'b',
    18  => 'c',
    19  => 'd',
);

is $cd->checkdigit('a16329aa'), '$';



