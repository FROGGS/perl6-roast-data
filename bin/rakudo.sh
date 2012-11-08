#!/bin/sh

rm -rf rakudo
git clone git://github.com/rakudo/rakudo.git
cd rakudo
ln -s ../../roast t/spec
/home/coke/perl5/perlbrew/perls/perl-5.14.2/bin/perl Configure.pl --gen-parrot
make all

# uninstalled rakudo doesn't know how to find Test.pm
# ... or any other modules
export PERL6LIB=`pwd`/lib:.

/home/coke/perl5/perlbrew/perls/perl-5.14.2/bin/perl t/spec/test_summary rakudo 2>&1 | tee ../rakudo_summary.out