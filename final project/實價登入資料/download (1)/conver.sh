find ./ -name \*.txt -type f | \
    (while read file; do
        iconv -f BIG-5 -t UTF-8 "$file" > "${file%.txt}-utf8.txt";
    done);