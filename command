mkdir -p images
npx webpagedump -u 'https://app.programmingfonts.org/' -O 'pf.html'
cat pf.html | grep -Eo 'a href="#[a-z0-9-]+"' | cut -d'#' -f2 | sed 's/"$//'|
    while read font; do
        URL="https://app.programmingfonts.org/#$font"
        echo "$URL"
        npx webpageshot -u "$URL" -O "images/$font.png"
    done
