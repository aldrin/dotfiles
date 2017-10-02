# A Linux workspace (primarily for Windows)
FROM alpine
ENV TERM xterm-color
ENV LANG en_US.UTF-8
ENV PROMPT '[linux] %d> '
RUN apk add --no-cache zsh
RUN apk add --no-cache make
RUN apk add --no-cache curl
RUN apk add --no-cache openssl
RUN apk add --no-cache emacs-nox
RUN apk add --no-cache openssh-client
ENTRYPOINT zsh
