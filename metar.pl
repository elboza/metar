#!/usr/bin/perl

# Simple metar - command line.
# author: Fernando Iazeolla
# licence: GPLv2

use warnings;
use strict;
use Getopt::Long;
use LWP::Simple;
use File::Basename;

$main::VERSION="0.2";
$::appname=fileparse($0);

sub show_version()
{
	print "v$main::VERSION\n";
	exit;
}
sub usage()
{
	print "$::appname, metar and taf viewer, v $::VERSION, 2012 by Fernando Iazeolla\n";
	print "this software is licensed under GPLv2\n";
	print "usage: $::appname <options>\n";
	print <<EOF;
options:
  --apt <ICAO>   -i <ICAO>   set iaco airport code
  --decode       -d          decode
  --help         -h          show this help
  --verbose      -v          verbose
  --version      -vv         show prog version
  --taf          -f          show taf forecast
  
EOF
	print "Example: $::appname -i lirf -f\n\n";
	exit;
}
sub main()
{
	my $city=0;
	my $decode=0;
	my $verbose=0;
	my $help=0;
	my $version=0;
	my $debug=0;
	my $forecast=0;
	my $metar="http://weather.noaa.gov/pub/data/observations/metar/";
	my $taf="http://weather.noaa.gov/pub/data/forecasts/taf/stations/";
	my ($xx,$line);
	my @rr;

	GetOptions(
	'apt|i=s'=>\$city,
	'decode|d'=>\$decode,
	'verbose|v'=>\$verbose,
	'help|h'=>\$help,
	'taf|f'=>\$forecast,
	'version|vv'=>\$version
	) or die "incorrect usage! try $::appname -h\n";
	
	show_version if($version);
	usage if($help);
	die "incorect usage! try $::appname -h\n" if(!$city);
	print "$city $decode $verbose $help $version\n" if($debug);
	if($decode) {$metar=$metar."decoded/";} else {$metar=$metar."stations/";}
	$city=uc($city);
	$metar=$metar.$city.".TXT";
	$taf=$taf.$city.".TXT";
	print "$metar\n$taf\n" if($verbose);
	$xx=get $metar or die"can't get metar.\n";
	if($decode)
	{
		print $xx;
	}
	else
	{
		@rr=split /\n/,$xx;
		shift(@rr);
		foreach $line (@rr) {print "$line\n";}
	}
	if($forecast)
	{
		$xx=get $taf or die "can't get taf.\n";
		@rr=split(/\n/,$xx);
		$rr[0]="";
		foreach $line (@rr) {print "$line\n";}
	}

}

main;
