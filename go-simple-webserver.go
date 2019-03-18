package main

import (
	"net/http"
	"fmt"
)

func main(){
	http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request){
		fmt.Fprintf(w, "Hello There, How are you ?")
	})
	http.ListenAndServe(":80", nil)
}