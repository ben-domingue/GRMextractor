yank_edges<-function(ids,path.2.files,tmp.dir) {
  #ids needs to be a Nx2 matrix of pair ids that are of interest.
  if (length(list.dirs(tmp.dir))>0) system(paste("rm -r",tmp.dir))
  system(paste("mkdir",tmp.dir))
  paste("gunzip -c ",path.2.files,".gz > ",tmp.dir,"/tmp.grm",sep="")->cmd
  system(cmd)
  yank.fun<-function(y,id) {
    grep(paste("^",y[1],"$",sep=""),id[,2])->n1
    grep(paste("^",y[2],"$",sep=""),id[,2])->n2
    sort(c(n1,n2),decreasing=TRUE)->n
    n[1]->n1
    n[2]->n2
    paste("^",n1,"[[:space:]]",n2,"[[:space:]]",sep="")->str
    paste(n1,n2,sep="_")->fn
    paste("grep '",str,"' ",tmp.dir,"/tmp.grm > ",tmp.dir,"/",fn,sep="")->cmd
    system(cmd)
    TRUE
  }
  ## library(parallel)
  ## np<-20
  ## makeCluster(np)->cl
  read.table(paste(path.2.files,".id",sep=""))->gcta.id
  ## clusterApply(cl,tmp.ids,fun,id=id)
  ## stopCluster(cl)
  apply(ids,1,yank.fun,id=gcta.id)
  getwd()->save.dir
  setwd(tmp.dir)
  system("rm tmp.grm")
  system("cat * > sub.grm")
  read.table("sub.grm")->sub.grm
  setwd(save.dir)  
  system(paste("rm -r ",tmp.dir))
  gcta.id[,2][sub.grm[,1]]->sub.grm[,1]
  gcta.id[,2][sub.grm[,2]]->sub.grm[,2]
  sub.grm
}
