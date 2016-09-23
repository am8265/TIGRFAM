#!/usr/bin/env bash
wget ftp://ftp.tigr.org/pub/data/TIGRFAMs/14.0_Release/TIGRFAMs_14.0_HMM.tar.gz
pathTIGRFAM=$(pwd)/TIGRFAM
mkdir $pathTIGRFAM
path=$(find ./ -name "TIGRFAMs_*.gz")
mv $path ./TIGRFAM
echo "PATH TO TIGRFAM DATABASE IS:"
path=$(find ./ -name "TIGRFAMs_*.gz")
echo $path
echo "DECOMPRESSING THE FILES....."
tar -C $pathTIGRFAM -xvf $path
echo "REMOVING THE ORIGINAL TARRED TIGRFAM FILE....."
rm $path
echo "NOW PRESSING THE .hmm file......."                                       
hmmpress=$(find ./ -name hmmpress)
echo "PATH TO HMMPRESS:"$hmmpress
path=$(find ./ -name "TIGRFAM")
cat $path/TIGR*.HMM > $path/out.HMM
echo "REMOVING THE INDIVIDUAL TIGRFAM FILES......."
rm $path/TIGR*
echo "RENAMING OUT.HMM AS TIGRFAM.HMM"
mv $path/out.HMM $path/TIGRFAM.HMM
echo "Pressing files..."
$hmmpress $path/TIGRFAM.HMM

