package main

import(
"fmt"
"net/http"
"runtime"
)

func indexHandler( w http.ResponseWriter, r *http.Request){
fmt.Fprintf(w, "Go Node 1. Hurray for... I'm running on %s with an %s CPU ", runtime.GOOS,runtime.GOARCH)

}

func main(){
http.HandleFunc("/", indexHandler)
http.ListenAndServe(":8071",nil)
}
