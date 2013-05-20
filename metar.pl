#!/usr/bin/perl
use strict;
use Getopt::Long;
use LWP::Simple;
use File::Basename;

$main::VERSION=0.1;
$::appname=fileparse($0);;
exit(main());

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
	'i=s'=>\$city,
	'd'=>\$decode,
	'v'=>\$verbose,
	'h'=>\$help,
	'f'=>\$forecast,
	'version'=>\$version
	) or die "incorrect usage! try $::appname -h\n";
	
	if($version) { show_version();}
	if($help) { usage();}
	if(!$city) {die "incorect usage! try $::appname -h\n";}
	if($debug) {print "$city $decode $verbose $help $version\n";}
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
sub usage()
{
	print "$::appname -metar and taf viewer- v $::VERSION, 2012 by Fernando Iazeolla\n";
	print "this software is licensed under GPLv2\n";
	print "usage: $::appname <options>\n";
	print "optrions:\n";
	print "      -i <ICAO>     set iaco airport code\n";
	print "      -d            decode\n";
	print "      -h            show this help\n";
	print "      -v            verbose\n";
	print "      --version     show prog version\n";
	print "      -f            show taf forecast\n";
	print "Example: $::appname -i lirf -f\n";
	exit;
}
sub show_version()
{
	print "$::appname -metar and taf viewer-\nversion: $main::VERSION\n";
	exit;
}

