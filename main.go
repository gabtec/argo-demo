package main

import "net/http"

func main() {
	http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
		w.Write([]byte("<h1>Hello Universe</h1><h4 style=\"color:green\">CI/CD Running</h4>"))
	})
	http.ListenAndServe(":8080", nil)
}