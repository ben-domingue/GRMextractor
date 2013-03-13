GRMextractor<-function(ids,path.2.files,tmp.dir="/tmp/GRMextractor",np=1) {
  #ids is either a vector or a matrix with 2 columns.
  #if a vector, then a matrix of the genetic relatedness between those individuals is formed
  #if a matrix, then an edgelist of those id pairs is formed.
  as.matrix(ids)->ids
  if (ncol(ids)==1) {
    as.character(ids)->ids
    cbind(ids,ids)->ids
  }
  if (ncol(ids)==2) {
    yank_edges(ids,path.2.files,tmp.dir,np=np)->grm
    return(grm)
  }
  if (ncol(ids)!=2) stop("ids is not of right form")
}
