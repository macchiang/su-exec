
CFLAGS ?= -Wall -Werror -g
LDFLAGS ?=

PROG := su-exec
SRCS := $(PROG).c
BUILD_ESSENTIAL := apk add build-base

all: $(PROG)

$(PROG): $(SRCS)
	docker run --rm -it -v $$PWD:/app alpine sh -c "cd /app;$(BUILD_ESSENTIAL);$(CC) $(CFLAGS) -o $@ $^ $(LDFLAGS)"

$(PROG)-static: $(SRCS)
	docker run --rm -it -v $$PWD:/app alpine sh -c "cd /app;$(BUILD_ESSENTIAL);$(CC) $(CFLAGS) -o $@ $^ -static $(LDFLAGS)"

clean:
	rm -f $(PROG) $(PROG)-static
