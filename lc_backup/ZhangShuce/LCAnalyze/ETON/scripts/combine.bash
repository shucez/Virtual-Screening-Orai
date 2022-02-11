#!/bin/bash
cd filter_2
echo 'current wkdir = filter_2'
for f in `cat ../list3ACE`
do
	echo "processing $f"
	awk '$6 = substr(FILENAME,12,3)' $f >> ../ACE_1e-2.tab
done
for f in `cat ../list4ACE`
do
	echo "processing $f"
	awk '$6 = substr(FILENAME,12,4)' $f >> ../ACE_1e-2.tab
done
for f in `cat ../list5ACE`
do
	echo "processing $f"
	awk '$6 = substr(FILENAME,12,5)' $f >> ../ACE_1e-2.tab
done
for f in `cat ../list6ACE`
do
	echo "processing $f"
	awk '$6 = substr(FILENAME,12,6)' $f >> ../ACE_1e-2.tab
done
for f in `cat ../list3BDF`
do
	echo "processing $f"
	awk '$6 = substr(FILENAME,12,3)' $f >> ../BDF_1e-2.tab
done
for f in `cat ../list4BDF`
do
	echo "processing $f"
	awk '$6 = substr(FILENAME,12,4)' $f >> ../BDF_1e-2.tab
done
for f in `cat ../list5BDF`
do
	echo "processing $f"
	awk '$6 = substr(FILENAME,12,5)' $f >> ../BDF_1e-2.tab
done
for f in `cat ../list6BDF`
do
	echo "processing $f"
	awk '$6 = substr(FILENAME,12,6)' $f >> ../BDF_1e-2.tab
done
cd ..

cd filter_3
echo 'current wkdir = filter_3'
for f in `cat ../list3ACE`
do
	echo "processing $f"
	awk '$6 = substr(FILENAME,12,3)' $f >> ../ACE_1e-3.tab
done
for f in `cat ../list4ACE`
do
	echo "processing $f"
	awk '$6 = substr(FILENAME,12,4)' $f >> ../ACE_1e-3.tab
done
for f in `cat ../list5ACE`
do
	echo "processing $f"
	awk '$6 = substr(FILENAME,12,5)' $f >> ../ACE_1e-3.tab
done
for f in `cat ../list6ACE`
do
	echo "processing $f"
	awk '$6 = substr(FILENAME,12,6)' $f >> ../ACE_1e-3.tab
done
for f in `cat ../list3BDF`
do
	echo "processing $f"
	awk '$6 = substr(FILENAME,12,3)' $f >> ../BDF_1e-3.tab
done
for f in `cat ../list4BDF`
do
	echo "processing $f"
	awk '$6 = substr(FILENAME,12,4)' $f >> ../BDF_1e-3.tab
done
for f in `cat ../list5BDF`
do
	echo "processing $f"
	awk '$6 = substr(FILENAME,12,5)' $f >> ../BDF_1e-3.tab
done
for f in `cat ../list6BDF`
do
	echo "processing $f"
	awk '$6 = substr(FILENAME,12,6)' $f >> ../BDF_1e-3.tab
done
cd ..

cd filter_4
echo 'current wkdir = filter_4'
for f in `cat ../list3ACE`
do
	echo "processing $f"
	awk '$6 = substr(FILENAME,12,3)' $f >> ../ACE_1e-4.tab
done
for f in `cat ../list4ACE`
do
	echo "processing $f"
	awk '$6 = substr(FILENAME,12,4)' $f >> ../ACE_1e-4.tab
done
for f in `cat ../list5ACE`
do
	echo "processing $f"
	awk '$6 = substr(FILENAME,12,5)' $f >> ../ACE_1e-4.tab
done
for f in `cat ../list6ACE`
do
	echo "processing $f"
	awk '$6 = substr(FILENAME,12,6)' $f >> ../ACE_1e-4.tab
done
for f in `cat ../list3BDF`
do
	echo "processing $f"
	awk '$6 = substr(FILENAME,12,3)' $f >> ../BDF_1e-4.tab
done
for f in `cat ../list4BDF`
do
	echo "processing $f"
	awk '$6 = substr(FILENAME,12,4)' $f >> ../BDF_1e-4.tab
done
for f in `cat ../list5BDF`
do
	echo "processing $f"
	awk '$6 = substr(FILENAME,12,5)' $f >> ../BDF_1e-4.tab
done
for f in `cat ../list6BDF`
do
	echo "processing $f"
	awk '$6 = substr(FILENAME,12,6)' $f >> ../BDF_1e-4.tab
done
cd ..

cd filter_5
echo 'current wkdir = filter_5'
for f in `cat ../list3ACE`
do
	echo "processing $f"
	awk '$6 = substr(FILENAME,12,3)' $f >> ../ACE_1e-5.tab
done
for f in `cat ../list4ACE`
do
	echo "processing $f"
	awk '$6 = substr(FILENAME,12,4)' $f >> ../ACE_1e-5.tab
done
for f in `cat ../list5ACE`
do
	echo "processing $f"
	awk '$6 = substr(FILENAME,12,5)' $f >> ../ACE_1e-5.tab
done
for f in `cat ../list6ACE`
do
	echo "processing $f"
	awk '$6 = substr(FILENAME,12,6)' $f >> ../ACE_1e-5.tab
done
for f in `cat ../list3BDF`
do
	echo "processing $f"
	awk '$6 = substr(FILENAME,12,3)' $f >> ../BDF_1e-5.tab
done
for f in `cat ../list4BDF`
do
	echo "processing $f"
	awk '$6 = substr(FILENAME,12,4)' $f >> ../BDF_1e-5.tab
done
for f in `cat ../list5BDF`
do
	echo "processing $f"
	awk '$6 = substr(FILENAME,12,5)' $f >> ../BDF_1e-5.tab
done
for f in `cat ../list6BDF`
do
	echo "processing $f"
	awk '$6 = substr(FILENAME,12,6)' $f >> ../BDF_1e-5.tab
done
cd ..

