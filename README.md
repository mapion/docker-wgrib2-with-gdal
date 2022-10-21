# docker-wgrib2-with-gdal

wgrib2とGDALを使えるようにしたDockerイメージです

# ビルド

```sh
docker build -t ochonjo/wgrib2-with-gdal:3.4.2 .
```

# テスト

```sh
docker run -i -t ochonjo/wgrib2-with-gdal:3.4.2 wgrib2 -version
docker run -i -t ochonjo/wgrib2-with-gdal:3.4.2 gdalinfo --version
```

# Docker Hubにアップロード

```sh
docker login -u ochonjo
docker push ochonjo/wgrib2-with-gdal:3.4.2
```