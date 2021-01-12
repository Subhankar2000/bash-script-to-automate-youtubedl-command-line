#!/bin/bash
#written by subhankar karmakar
#https://github.com/Subhankar2000
printf "\n----------youtube-dl DOWNLOAD MENU---------------"
printf "\n-------CHOOSE YOUR OPTIONS CAREFULLY !-----------"
printf "\n ---PRESS CTRL+C ANYWHERE TO EXIT THE PROCESS---"
printf "\n"
printf "\nWHAT DO YOU WANT TO DO ??"
printf "\n1. DOWNLOAD A SINGLE VIDEO"
printf "\n2. DOWNLOAD VIDEOS FROM A PLAYLIST"
printf "\n\nENTER CHOICE : "
read CHOICE

case $CHOICE in

  1)
    printf "\nPASTE THE LINK OF THE VIDEO FROM THE BROWSER URL PATH : "
    read VLINK
    printf "\nENTER A NEW FOLDER NAME UNDER WHICH VIDEO IS TO BE SAVED : "
    read VFOLDER
    printf "\nWHAT DO YOU WANT TO DO ??"
    printf "\n1. ONLY SEE WHAT ARE THE AVAILABLE FORMATS/SIZES TO DOWNLOAD & DON'T DOWNLOAD !"
    printf "\n2. DOWNLOAD THE VIDEO IN 360p"
    printf "\n3. DOWNLOAD THE VIDEO IN 720p"
    printf "\n\nENTER CHOICE : "
    read VCHOICE
    	
	case $VCHOICE in
	
		1)
		youtube-dl --newline --console-title -i -o "../YouTube-dl/$VFOLDER/%(title)s.%(ext)s" -F --ignore-config --hls-prefer-native --add-metadata "$VLINK"
		  ;;
                2)
		youtube-dl --newline --console-title -i -o "../YouTube-dl/$VFOLDER/%(title)s.%(ext)s" -f 18 --ignore-config --hls-prefer-native --add-metadata "$VLINK"
		  ;;
		3)
		youtube-dl --newline --console-title -i -o "../YouTube-dl/$VFOLDER/%(title)s.%(ext)s" -f 22 --ignore-config --hls-prefer-native --add-metadata "$VLINK"
		  ;;
		*)
		printf "\nUNKNOWN CHOICE ENTERED !"
		printf "\n"
		  ;;
	esac
    ;;

  2)
    printf "\nPASTE THE LINK OF THE PLAYLIST FROM THE BROWSER URL PATH\n(go to the playlist link, where you can see the video numbers\nand all the videos-COPY THAT AND PASTE HERE !) : "
    read PLINK
    printf "\nENTER A NEW FOLDER NAME UNDER WHICH VIDEO IS TO BE SAVED : "
    read PFOLDER
    printf "\nENTER THE STARTING NUMBER FROM WHICH YOU WANT TO DOWNLOAD : "
    read PSTART
    printf "\nENTER THE ENDING NUMBER UPTO WHICH YOU TO DOWNLOAD : "
    read PEND
    printf "\nWHAT DO YOU WANT TO DO ??"
    printf "\n1. ONLY SEE WHAT ARE THE AVAILABLE FORMATS/SIZES TO DOWNLOAD(per video) & DON'T DOWNLOAD !"
    printf "\n2. DOWNLOAD each video one by one IN 360p"
    printf "\n3. DOWNLOAD each video one by one IN 720p"
    printf "\n\nENTER CHOICE : "
    read PCHOICE
    	
	case $PCHOICE in
	
		1)
		youtube-dl --newline --playlist-start $PSTART --playlist-end $PEND --console-title -i -o "../YouTube-dl/$PFOLDER/%(playlist_index)2d - %(title)s.%(ext)s" -F --ignore-config --hls-prefer-native --add-metadata "$PLINK"
		  ;;
                2)
		youtube-dl --newline --playlist-start $PSTART --playlist-end $PEND --console-title -i -o "../YouTube-dl/$PFOLDER/%(playlist_index)2d - %(title)s.%(ext)s" -f 18 --ignore-config --hls-prefer-native --add-metadata "$PLINK"
		  ;;
		3)
		youtube-dl --newline --playlist-start $PSTART --playlist-end $PEND --console-title -i -o "../YouTube-dl/$PFOLDER/%(playlist_index)2d - %(title)s.%(ext)s" -f 22 --ignore-config --hls-prefer-native --add-metadata "$PLINK"
		  ;;
		*)
		printf "\nUNKNOWN CHOICE ENTERED !"
		printf ""
		  ;;
	esac
    ;;

  
  *)
    printf "\nUNKNOWN CHOICE ENTERED !"
    printf "\n"
    ;;
esac
