FROM ghcr.io/collectivexyz/foundry:latest

ARG PROJECT=test-devtools-evm-foundry
WORKDIR /workspaces/${PROJECT}
ENV USER=foundry
USER foundry
ENV PATH=${PATH}:~/.cargo/bin:/usr/local/go/bin

RUN chown -R foundry:foundry .

COPY --chown=foundry:foundry package.json .
COPY --chown=foundry:foundry package-lock.json .

RUN npm ci --frozen-lockfile

COPY --chown=foundry:foundry . .

RUN yamlfmt -lint .github/workflows/*.yml

RUN forge install
RUN forge fmt --check
RUN forge test -v
