#/usr/bin/awk -f
# Usage: awk -F, -f res.awk ref.csv data/$func.csv

BEGIN {
   autokcal=627.50947428
   reffile = "ref.csv"
   nref = 1
}
FILENAME == reffile {ref[$1] = $2; nref++}

NR == nref && FILENAME != reffile {printf "# %s\n", $2}
NR > nref && FILENAME != reffile {
   this_ref = ref[$1]
   sub(/-/, ",")
}
$1 ~ /[0-9]$/ && $2 ~ /^A$/ && FILENAME != reffile {a=$3}
$1 ~ /[0-9]$/ && $2 ~ /^B$/ && FILENAME != reffile {b=$3}
$1 ~ /[0-9]$/ && $2 ~ /^[^AB]/ && FILENAME != reffile {
   printf "$tmer %s %13.10f\n", $1"-{"$2",A,B}/$f", ($3 - (a + b)) * autokcal - this_ref
}
