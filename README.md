# Build

```
docker build -t cannin/rstudio-server .
```

# Run

```
docker rm -f rstudio; docker run -d --name rstudio -p 8787:8787 -v /Users/user/default/workspace:/home/rstudio/workspace -v /Users/user/default/rlib:/home/rstudio/rlib -t cannin/rstudio-server:r-3.4.1_rstudio-server-1.0.153

docker rm -f rstudio; docker run -d --name rstudio -p 8787:8787 -v C:\default\workspace:/home/rstudio/workspace -v C:\default\rlib:/home/rstudio/rlib -t cannin/rstudio-server:r-3.4.1_rstudio-server-1.0.153

docker exec -it rstudio bash
```

# Connect
```
http://127.0.0.1:8787
```
