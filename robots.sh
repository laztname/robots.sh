#!/usr/bin/env bash
#Mass robots.txt scanner
#Coded by: @laztname <- find me on telegram :3
#Remove a credit doesn't make you look like coder --@ytyao xD

robots() { 
url=`curl -s $i/robots.txt --connect-timeout 3 -A "Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)"`
printf "[i] Get robots.txt for $i\n"
printf "result for $i\n" >> result.txt
 if [[ $url = *"404"* ]] || [[ $url = *"301"* ]] || [[ $url == *"500"* ]] || [[ $url == *"html"* ]]; then
    printf "No robots found\n\n" >> result.txt
 elif [[ $url == "" ]]; then
 	printf "Nothing we get, maybe host die\n\n" >> result.txt
 else
 	printf "$url\n\n" >> result.txt
 fi
}

if [[ -f $1 ]]; then
	echo "+-------------------------------+"
    echo "|   Simple robots.txt Scanner   |"
    echo "| created with love by laztname |"
    echo "+-------------------------------+"

    echo "[!] Total List : `wc -l $1`"

    for i in `cat $1`;
      do robots;
    done
    echo "[i] Done, check it at result.txt"
else
	printf "[!] Filemu mana mas?\n"
fi
