a package to extract portions of the genetic relatedness matrix produced by gcta.

#sample of how to use the package based on gcta sample files.
#bash
head -n 30 test.fam > keep.txt
gcta64 --bfile test --keep keep.txt --make-grm --out test

#r
c(11,21,51,61)->ids
GRMextractor<-function(ids,path.2.files,tmp.dir="/tmp/GRMextractor") {

