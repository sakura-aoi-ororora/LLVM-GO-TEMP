FROM ubuntu:23.10

RUN apt-get update && apt-get install -y wget gnupg && \
    echo 'deb http://apt.llvm.org/mantic/ llvm-toolchain-mantic-16 main' >> /etc/apt/sources.list && \
    echo 'deb-src http://apt.llvm.org/mantic/ llvm-toolchain-mantic-16 main' >> /etc/apt/sources.list && \
    wget -O - https://apt.llvm.org/llvm-snapshot.gpg.key | apt-key add - && \
    apt-get update && \
    apt-get install -y git clang-16 libllvm16 llvm-16 llvm-16-dev golang-go && \
    go install -v github.com/cweill/gotests/gotests@latest && \
    go install -v github.com/fatih/gomodifytags@latest && \
    go install -v github.com/josharian/impl@latest && \
    go install -v github.com/haya14busa/goplay/cmd/goplay@latest && \
    go install -v github.com/go-delve/delve/cmd/dlv@latest && \
    go install -v honnef.co/go/tools/cmd/staticcheck@latest && \
    go install -v golang.org/x/tools/gopls@latest