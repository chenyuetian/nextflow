#!/bin/bash
for DATABASE in swissprot landmark
do
if [ ! -d $PWD/$DATABASE ]; then
        mkdir $DATABASE
        cd $DATABASE
        update_blastdb.pl --decompress --verbose $DATABASE
        cd ..
        echo "$DATABASE has been created"
fi
done
