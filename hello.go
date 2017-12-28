package main

import(
"fmt"
"net/http"
"runtime"
)

func indexHandler( w http.ResponseWriter, r *http.Request){
fmt.Fprintf(w, "Go Node 1. This clearly won't go sideways. I'm running on %s with an %s CPU ", runtime.GOOS,runtime.GOARCH)

}

func main(){
http.HandleFunc("/", indexHandler)
http.ListenAndServe(":8071",nil)
}
