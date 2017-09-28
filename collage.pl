#!/usr/bin/perl
use warnings;
use strict;
use Data::Dumper;
use feature 'say';


#----lock program instance
#prevent multiple starting of program

use Fcntl qw(:flock);
open our $file, '<', $0 or die "$!";
flock $file, LOCK_EX|LOCK_NB or die "\e[1;31mProgram is already started. Sorry\e[0m \nUnable to lock file $!";

# inspiration for me https://pinwallpaper.com
# ------------ user settings
my $dir_path ="/home/aleksey/Desktop/backgrounds/"; # path to directory with images
my $type_of_file = "jpg"; #type of images
my $time_to_sleep = +5; #time to change images



my $command = qq(gsettings set org.gnome.desktop.background picture-uri file://$dir_path);
my @list_of_files = (); #list of images;
my $image_num;

opendir (my $DH , $dir_path) or die "can't open $dir_path - $!";
while (readdir $DH)
	{
	push (@list_of_files, $_) unless ($_ =~ /^(\.|\.\.)$/ or $_ !~ /$type_of_file$/);
	}
closedir $DH;

while ()
	{
	#check all image and next if equal - change image to new
my $image_num_previous = $image_num;
$image_num = int(rand(scalar @list_of_files)) -1;

next unless (defined $image_num_previous); #do not check first time check because $image_num_previous not defined
if ($image_num_previous eq $image_num)
{ 
  if ($image_num eq scalar @list_of_files)
  {
  	$image_num --;
  }  
  elsif ($image_num eq 0)
  { 
  	$image_num ++;
  }
  else
  {
  	$image_num ++;
  }
}

`$command$list_of_files[$image_num]`;
	sleep $time_to_sleep;
}
