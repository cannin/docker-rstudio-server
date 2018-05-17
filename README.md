# Build
```
docker build -t cannin/rstudio-server .
docker build -t cannin/rstudio-server:r-3.4.1_rstudio-server-1.1.447 .
```

# Run
```
docker rm -f rstudio; docker run -d --name rstudio -p 8787:8787 -v /Users/user/default/workspace:/home/rstudio/workspace -v /Users/user/default/rlib:/home/rstudio/rlib -t cannin/rstudio-server

docker rm -f rstudio; docker run -d --name rstudio -p 8787:8787 -v /home/ubuntu:/home/rstudio/workspace -t cannin/rstudio-server

docker rm -f rstudio; docker run -d --name rstudio -p 8787:8787 -v /Users/user/default/workspace/ludwig_crispr:/home/rstudio/ludwig_cripsr -v /Users/user/default/workspace/network_analysis_tutorial:/home/rstudio/network_analysis_tutorial -v /Users/user/default/rlib_network_analysis_tutorial:/home/rstudio/rlib -t cannin/rstudio-server

docker exec -it rstudio bash
```

# Connect
```
http://127.0.0.1:8787
```

# Install packages to local directory
```
# From local directory
devtools::install(".", args = c('--library="/home/rstudio/rlib"'))

# From Bioconductor
source("https://bioconductor.org/biocLite.R")
biocLite("org.Hs.eg.db", lib="/home/rstudio/rlib")

# From CRAN
install.packages("httr", lib="/home/rstudio/rlib")

# From GitHub
devtools::install_github(".", args = c('--library="/home/rstudio/rlib"'))
```
