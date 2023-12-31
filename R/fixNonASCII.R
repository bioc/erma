
fixNonASCII = function (df, tosub=" ") 
{
    hasNonASCII = function(x) {
        asc = iconv(x, "latin1", "ASCII")
        any(asc != x | is.na(asc))
    }
    havebad = sapply(df, function(x) hasNonASCII(x))
    if (!(any(havebad))) 
        return(df)
    message(paste0("NOTE: input data had non-ASCII characters replaced by '",
          tosub, "'."))
    badinds = which(havebad)
    for (i in 1:length(badinds)) df[, badinds[i]] = iconv(df[, 
        badinds[i]], to = "ASCII", sub = tosub)
    df
}

