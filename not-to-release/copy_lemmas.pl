#!/usr/bin/env perl
# Copies lemmas from one CoNLL-U file to another. Keeps all other contents from the other file.
# Copyright © 2018 Dan Zeman <zeman@ufal.mff.cuni.cz>
# License: GNU GPL

use utf8;
use open ':utf8';
binmode(STDIN, ':utf8');
binmode(STDOUT, ':utf8');
binmode(STDERR, ':utf8');

if(scalar(@ARGV) != 2)
{
    die("Expected two arguments.");
}
open(TGT, $ARGV[0]) or die("Cannot read $ARGV[0]: $!");
open(LEM, $ARGV[1]) or die("Cannot read $ARGV[1]: $!");
while(my $tline = <TGT>)
{
    my $lline = <LEM>;
    my @tf = split(/\t/, $tline);
    my @lf = split(/\t/, $lline);
    if(defined($lf[2]))
    {
        $tf[2] = $lf[2];
    }
    print(join("\t", @tf));
}
