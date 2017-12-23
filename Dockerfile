FROM golang:latest 
RUN mkdir /app 
ADD . /app/ 
WORKDIR /app 
RUN go build -o humblebooks . 
CMD ["/app/humblebooks"]