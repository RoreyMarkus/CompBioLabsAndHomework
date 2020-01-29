

cut -f 2-4 -d , PredPreydata.csv  | grep time PredPreydata.csv > PredPreyedited.csv
cut -f 2-4 -d , PredPreydata.csv  | tail PredPreydata.csv >> PredPreyedited.csv