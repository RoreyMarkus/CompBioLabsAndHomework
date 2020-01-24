head PredPreyData.csv > PredPreyedited.csv
tail PredPreyData.csv >> PredPreyedited.csv
cut -f 2-4 -d , PredPreyedited.csv  >> PredPreyedited.csv