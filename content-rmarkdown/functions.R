#!/usr/bin/env Rscript
# -------------------------------
# Author: Qiangua
# Date: Thu Mar 19 21:03:36 2020
# -------------------------------
library(fs)
library(drake)
library(magrittr)
# create rmarkdown with template.Rmd
new_rmd_post <- function(post_name=NULL,
                         template_name="template.Rmd",
                         template_path=getwd(),
                         post_path="./rmarkdown/"){
    if(is.null(post_name)){
        stop("A post name must be given!")
    }

    input_file   <- paste(template_path,template_name, sep="/")
    current_time <- Sys.Date()
    out_file     <- paste0(template_path, "/rmarkdown/", Sys.Date(), "-", post_name, ".Rmd")
    fl_content   <- readLines(input_file)
    writeLines(fl_content, out_file)
    print("New Rmarkdown post creat successfully!")

}

fix_fig_format <- function(md_in){
    md_out <- gsub(".*static(.*?)\\)", "{{< figure src=\"\\1\" >}}", md_in, perl = T)
    return(md_out)
}


get_path_in_dir <- function(dir_in){
    files <- list.files(dir_in)
    dir_in_name <- basename(dir_in)
    fullpath_list <- file.path(normalizePath(dirname(files)),dir_in_name,files)
    return(fullpath_list)
}

# rmarkdown --> markdown
new_md_post <- function(rmd_dir_path="./rmarkdown", md_dir_path="./markdown/"){
    files <- get_path_in_dir(rmd_dir_path)
    rmd_full_path <- normalizePath(rmd_dir_path)
    for (index_file in files) {
        post_dir_fpath <- normalizePath(md_dir_path)
        post_name <- index_file %>% basename() %>% tools::file_path_sans_ext()
        out_file  <- paste0(post_dir_fpath, "/", post_name,"_fromRmd.md")
        knitr::knit(input = index_file, output = out_file)

        tem_md <- readLines(out_file) %>% fix_fig_format()
        write(tem_md, out_file)
        print("New markdown post creat successfully!")
    }
}
# mv markdown --> post
mv_md_to_post <- function(md_dir = "./markdown/",post_dir = "../content/post/"){
    files <- list.files(md_dir)
    for (file_index in files) {
        md_pre <- paste(md_dir, file_index, sep = "")
        file_move(md_pre,post_dir)
    }
}

plan <- drake::drake_plan(
    new_md_post(),
    mv_md_to_post()
)


