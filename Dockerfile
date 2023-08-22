FROM ubuntu:latest

# Sửa chữa các gói bị hỏng và cập nhật danh sách gói
RUN apt-get update --fix-missing && \
    apt-get install -f && \
    dpkg --configure -a

# Cài đặt Node.js
RUN apt-get update && \
    apt-get install -y curl gnupg && \
    curl -sL https://deb.nodesource.com/setup_14.x | bash - && \
    apt-get install -y nodejs

# Thêm kho lưu trữ chính thức của MongoDB và cài đặt MongoDB
# RUN apt-get update && \
#     apt-get install -y gnupg2 && \
#     apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 656408E390CFB1F5
# RUN curl -fsSL https://www.mongodb.org/static/pgp/server-5.0.asc | apt-key add - && \
#     echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu focal/mongodb-org/5.0 multiverse" | tee /etc/apt/sources.list.d/mongodb-org-5.0.list && \
#     apt-get update && \
#     apt-get install -y mongodb-org

WORKDIR /app

COPY package.json /app

RUN npm install

COPY . /app

EXPOSE 3000

# Khởi chạy MongoDB và ứng dụng Express.js
CMD node dist/index.js