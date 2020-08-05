# General options
options(papersize="a4")
options(editor="vim")
# options(pager="internal")
options(tab.width = 2)
options(graphics.record=TRUE)

#Repository
#options(repos=structure(c(CRAN="http://mirrors.softliste.de/cran/")))

#Parallel compilation for Rcpp
Sys.setenv("PKG_CXXFLAGS"="-fopenmp -std=c++11")

if(interactive()){
    #everything in terminal, e.g. mirror and help page selection
    options(menu.graphics=FALSE)

    # R interactive prompt
    options(prompt="> ")
    options(continue=" ")

    # neat colored output for xterm
    library(colorout)
    options(colorout.verbose = 1)
    options(colorout.anyterm = TRUE)
    options(colorout.dumb = TRUE)
    options(colorout.noninteractive = TRUE)
    options(colorout.notatty = TRUE)    
    setOutputColors256(verbose=F)    
}


.First <- function(){
}

.Last <- function(){
 #cat("\nGoodbye at", date(), "\n")
}


###
# Useful R workspace associated functions
###
#show total memory usage
showMemoryUse <- function(sort="size", decreasing=T, limit) {
    objectList <- ls(parent.frame())
    oneKB <- 1024
    oneMB <- 1048576
    oneGB <- 1073741824
    memoryUse <- sapply(objectList, function(x) as.numeric(object.size(eval(parse(text=x)))))
    memListing <- sapply(memoryUse, function(size) {
                                             if (size >= oneGB) return(paste(round(size/oneGB,2), "GB"))
                                             else if (size >= oneMB) return(paste(round(size/oneMB,2), "MB"))
                                             else if (size >= oneKB) return(paste(round(size/oneKB,2), "kB"))
                                             else return(paste(size, "bytes"))
    })
    memListing <- data.frame(objectName=names(memListing),memorySize=memListing,row.names=NULL)

    if (sort=="alphabetical") memListing <- memListing[order(memListing$objectName,decreasing=decreasing),] 
    else memListing <- memListing[order(memoryUse,decreasing=decreasing),] #will run if sort not specified or "size"

    if(!missing(limit)) memListing <- memListing[1:limit,]

    print(memListing, row.names=FALSE)
    return(invisible(memListing))
}
#Show memory usage per object
.ls.objects <- function (pos = 1, pattern, order.by,
                                                 decreasing=FALSE, head=FALSE, n=5) {
    napply <- function(names, fn) sapply(names, function(x)
                                                                             fn(get(x, pos = pos)))
    names <- ls(pos = pos, pattern = pattern)
    obj.class <- napply(names, function(x) as.character(class(x))[1])
    obj.mode <- napply(names, mode)
    obj.type <- ifelse(is.na(obj.class), obj.mode, obj.class)
    obj.size <- napply(names, object.size)
    obj.dim <- t(napply(names, function(x)
                                            as.numeric(dim(x))[1:2]))
    vec <- is.na(obj.dim)[, 1] & (obj.type != "function")
    obj.dim[vec, 1] <- napply(names, length)[vec]
    out <- data.frame(obj.type, obj.size, obj.dim)
    names(out) <- c("Type", "Size", "Rows", "Columns")
    if (!missing(order.by))
        out <- out[order(out[[order.by]], decreasing=decreasing), ]
    if (head)
        out <- head(out, n)
    out
}
# shorthand
lsos <- function(..., n=10) {
    .ls.objects(..., order.by="Size", decreasing=TRUE, head=TRUE, n=n)
}
