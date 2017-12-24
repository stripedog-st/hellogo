# FROM golang:latest 
# RUN mkdir /app 
# ADD . /app/ 
# WORKDIR /app 
# RUN go build -o humblebooks . 
# CMD ["/app/humblebooks"]

FROM golang

RUN mkdir /app 
ADD . /app/ 
WORKDIR /app 
RUN go build -o mw-go-1 . 

ENTRYPOINT /app/mw-go-1
 
EXPOSE 8080