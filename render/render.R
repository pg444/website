library(tidyverse)

insert_html <- function(page, element) {
    insert <- read_file(paste("render/elements/", element, sep = ""))
    out <- str_replace(page, element, insert)
    return(out)
}

generate_page <- function(body_loc, out_loc) {
    page <- read_file(body_loc) %>%
            insert_html("head.html") %>%
            insert_html("header.html")
    write_file(page, out_loc)

}


generate_site <- function() {
    generate_page("render/content/home.html", "index.html")
    generate_page("render/content/extracts.html", "extracts/index.html")
    generate_page("render/content/blog.html", "blog/index.html")
    generate_page("render/content/reading_list.html",
                  "reading_list/index.html")
    generate_page("render/content/about.html", "about/index.html")
}

generate_site()
