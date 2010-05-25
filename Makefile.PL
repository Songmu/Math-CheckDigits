use inc::Module::Install;
name 'Math-CheckDigits';
all_from 'lib/Math/CheckDigits.pm';

# requires '';

tests 't/*.t';
author_tests 'xt';

test_requires 'Test::More';
auto_set_repository;
auto_include;
WriteAll;
