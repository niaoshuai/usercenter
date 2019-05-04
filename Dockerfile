FROM library/golang

## RUN
## Godep for vendoring
#RUN go get -d -v -u github.com/golang/dep/cmd/dep
#
## Recompile the standard library without CGO
#RUN CGO_ENABLED=0 go install -v -a std
#
#ENV APP_DIR $GOPATH/src/usercenter
#RUN mkdir -p $APP_DIR
#
## Set the entrypoint
#ENTRYPOINT (cd $APP_DIR && ./usercenter)
#ADD . $APP_DIR
#
## Compile the binary and statically link
#RUN cd $APP_DIR && CGO_ENABLED=0 dep go build -ldflags '-d -w -s'
#
#EXPOSE 9000

WORKDIR /go/src/app
COPY . .

RUN go get -d -v ./...
RUN go install -v ./...

CMD ["usercenter"]