# 算盘前端托管项目
template for suanpan front panel

## 使用前提
本地开发环境需要有 docker
需要有镜像仓库 
可参考 阿里云镜像服务 https://help.aliyun.com/product/60716.html

下文中 
镜像仓库地址默认为 registry.cn-shanghai.aliyuncs.com/helloworld 
实际操作请替换为实际的地址
镜像名为test_image
实际操作请替换为需要的名字
版本号为0.1.0

# 如何使用

## 方法一 适合于 mac 或者 linux

参考sample 文件夹, 在项目文件内, 执行
```
git clone --depth 1 https://github.com/ryanaltair/suanpan_frontend_base_image_template.git docker && rm -rf docker/.git
```
修改docker文件夹内的 imagename 和 version,

imagename 为构建的镜像名字 
即 registry.cn-shanghai.aliyuncs.com/helloworld/test_image
⚠️ 需要包含镜像源的地址
version 为构建的镜像版本 即0.1.0 

在项目文件夹内执行以下命令

```
rm -r docker/dist  && cp -r dist docker/ && cd docker && bash build.sh
```
如果是npm项目, 可以在package.json文件中增加 npm run docker 命令为
`"rm -r docker/dist  && cp -r dist docker/ && cd docker && bash build.sh"`
注意 docker/build.sh 中包含docker push命令

## 方法二 make hands dirty

### 参考dockerfile
```
FROM registry.cn-shanghai.aliyuncs.com/shuzhi/base_express_server:0.1.0

WORKDIR /home/app/

COPY dist /home/app/dist

EXPOSE 7000

CMD tail -f /dev/null
```

基础镜像为 registry.cn-shanghai.aliyuncs.com/shuzhi/base_express_server:0.1.0 
可参考 https://github.com/ryanaltair/suanpan_frontend_base_image

dist 为包含前端发布用的文件夹

### 构建镜像
docker build -t registry.cn-shanghai.aliyuncs.com/helloworld/test_image:0.1.0 .

### Run a container and start node server
`docker run -d --name test_sp_frontend -p 7000:7000 registry.cn-shanghai.aliyuncs.com/helloworld/test_image:0.1.0 node server.js --stream-user-id test --stream-app-id 12345 --stream-node-id 3eb9eb4acdsaf234234234sdf --stream-host abc.abc.com`

### Test in your local
http://localhost:7000/index.html

### Push to registry
`docker push registry.cn-shanghai.aliyuncs.com/helloworld/test_image:0.1.0`

