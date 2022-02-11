#!/bin/sh
cd ~/ZhangShuce/LCAnalyze/Nexus/result/all
sed -i "s/dOraiMNexus//g; s/.pdbqt//g; s/LIGAND //g" R_Nexus*
cd ~/ZhangShuce/LCAnalyze/Nexus/result
./analyzeLC_all_5.R
./analyzeLC_all_4.R
./analyzeLC_all_3.R
./analyzeLC_all_2.R

