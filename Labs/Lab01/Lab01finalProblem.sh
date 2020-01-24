head PredPreyData.csv > PredPreyedited.csv
tail PredPreyData.csv >> PredPreyedited.csv
cut -f 2-4 -d , PredPreyData.csv  >> PredPreyedited.csv