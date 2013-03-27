GRMextractor<-function(ids,path.2.files,tmp.dir="/tmp/GRMextractor",np=1,inbreed=FALSE) {
  #ids is either a vector or a matrix with 2 columns.
  #if a vector, then a matrix of the genetic relatedness between those individuals is formed
  #if a matrix, then an edgelist of those id pairs is formed.
  as.matrix(ids)->ids
  if (inbreed==FALSE & ncol(ids)==1) {
    as.character(ids)->ids
    tmp<-list()
    length(ids)->N
    for (i in 1:(N-1)) cbind(ids[i],ids[(i+1):N])->tmp[[i]]
    do.call("rbind",tmp)->tmp
    tmp->ids
  }
  if (inbreed==TRUE & ncol(ids==1)) {
    as.character(ids)->ids
    cbind(ids,ids)->ids
  }
  if (ncol(ids)==2) {
    yank_edges(ids,path.2.files,tmp.dir,np=np)->grm
    return(grm)
  }
  if (ncol(ids)!=2) stop("ids is not of right form")
}
