f1=`basename ${1-ce} .svg` 
wm=${2-25}

brd=/home/hernani/Documents/fruga-brand
b=$brd/base
i=$brd/svg
c=$brd/comp
t=$brd/tmp
o=png
j=jpg

#mercado.fruga e blog.fruga
z=/home/hernani/Documents/as3w/fruga/app/assets/images
x=/home/hernani/Documents/as3w/fruga1

while read f
do fex=`basename $f|cut -d"." -f2`
   fba=`basename $f|cut -d"." -f1`
   fdi=`dirname $f`
   #echo "File: $f $fba $fdi $fex"
   fwi=`identify -format "%w" $f`
   fhi=`identify -format "%h" $f`
   #fwi=`expr $fwi / 2`
   fhi=`expr $fhi / 3`
   rsvg-convert -h $fhi -a      -f png $c/$f1.svg -o $o/$f1-wm.png
   composite -dissolve $wm% -gravity south \
     $o/$f1-wm.png $f $j/$fba.jpg 
done
