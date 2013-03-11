a package to extract portions of the genetic relatedness matrix produced by gcta.

#sample of how to use the package based on gcta sample files.
#bash
head -n 30 test.fam > keep.txt
gcta64 --bfile test --keep keep.txt --make-grm --out test

#R
library(GRMextractor)
path.2.files<-"~/wd/test.grm"
tmp.dir<-"/tmp/GRMextractor"
GRMextractor(c(11,21,51,61),path.2.files=path.2.files,tmp.dir=tmp.dir)
GRMextractor(matrix(c(11,21,51,61),2,2,byrow=TRUE),path.2.files=path.2.files,tmp.dir=tmp.dir)
GRMextractor(matrix(c(21,11,61,51),2,2,byrow=TRUE),path.2.files=path.2.files,tmp.dir=tmp.dir)


