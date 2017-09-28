This program purpose to do collage using backgroud image, just change backgraund imgage after time


1. Download  
2. Create dir and save image to this dir
3. Change my $dir_path ="" - to specify you path to dir where images has been saved
4. Change my $type_of_file="" - to specify you type of image (jpg,png,bmp)
5. Change $time_to_sleep= - to specify period of time when collage will be changed



How to start:

1. Start program as a daemon ( need to do always after reboot)
	nohup perl collage.pl &

2. you can add this to your cron (do once, program will start always after boot/reboot system)

	crontab -e
	@reboot /usr/bin/perl collage.pl

3. you can add to Startup Application (do once, program will start always after boot/reboot system)

WIn/Fun/Mac -> Startup Application -> add
Command will be /usr/bin/perl /path/to/collage.pl
