To run the litecoine docker image
docker run -itd -v $(pwd):/home/litecoin/.litecoin litecoin:custom



To run anchore image test
curl -s https://ci-tools.anchore.io/inline_scan-v0.6.0 | bash -s -- -r litecoin:custo