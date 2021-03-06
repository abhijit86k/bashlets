EXIFSCRUB
=========
A quick script to scrub exif information from your photos, and optionally to add your own.

Installation:
-------------
1. Open the file exifscrub with a text editor and change the string in the copyright field as you would like it.
2. Copy the file exifscrub and exifscrub-clean to your ~/bin and ensure that execute permissions are enabled.
 

Usage:
------
```
$> exifscrub filename
```

Examples:
---------
Scrub a single file:
```
$> exifscrub dsc003263.jpg
```
Scrub all files in a directory:
```
$> for file in *.jpg; do exifscrub $file; done; mkdir originals; mv *.jpg_original ./originals/
```

NOTES:
------
exifscrub can currently handle only one file at a time. If you want to operate on multiple files you should be writing loops that call exifscrub per file. This is by design.

exifscrub will clean all EXIF information from your image file and add the hardcoded comment text into the EXIF comment field and today's date as the exif date.
exifscrub-clean will only clean all EXIF information from the image file.

Why is it important to scrub EXIF information from your photos?
See [this article](https://web.archive.org/web/20190924082202/https://www.consumerreports.org/privacy/what-can-you-tell-from-photo-exif-data/)
