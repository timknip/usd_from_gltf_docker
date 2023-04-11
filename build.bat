
docker build usd -t timknip/usd

docker build usd-from-gltf -t timknip/usd-from-gltf

docker push timknip/usd:latest
docker push timknip/usd-from-gltf:latest
