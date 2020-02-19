extract_tables <- function(tbl_to_get){
    ## Extract the data, save to feather.
    ## Get it DONE!!!!
    Tmp <- dbReadTable(con, tbl_to_get)
    feather_path <- paste0("Chinook/",tbl_to_get,".feather")
    write_feather(x = Tmp, path = feather_path)

    ## Simple return stuffs.
    if (file.exists(feather_path)) {
        return(1)
    } else{
        return(0)
    }
}
