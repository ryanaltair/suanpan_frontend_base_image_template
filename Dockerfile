FROM registry.cn-shanghai.aliyuncs.com/shuzhi/base_express_server:0.1.0
WORKDIR /home/app/
COPY dist /home/app/dist
CMD tail -f /dev/null
