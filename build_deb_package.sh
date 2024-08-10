#!/bin/bash

create_package_struct() {
    local name=$@
    echo "建立 ${name} 的 DEB 安装包结构"
    mkdir -p "./deb_package/${name}"
    mkdir -p "./deb_package/${name}/DEBIAN"
    mkdir -p "./deb_package/${name}/usr/share/icons/${name}"
}

add_debian_package_info() {
    local name=$@

    echo "添加 DEB 安装信息: ./deb_package/${name}/DEBIAN/control"

    cat<<EOF > "./deb_package/${name}/DEBIAN/control"
Package: ${name}
Version: 0.1
Maintainer: 3064404574@qq.com
Section: utils
Homepage: https://licyk.netlify.app
Architecture: all
Priority: optional
Description: ${name} for Linux
EOF

    chmod 644 "./deb_package/${name}/DEBIAN/control"
}

cp_src_to_debian_package_folder() {
    local name=$@
    echo "复制鼠标文件: ./cursor/${name} -> ./deb_package/${name}/usr/share/icons"
    cp -rf "./cursor/${name}" "./deb_package/${name}/usr/share/icons"
}

main() {
    local i
    local name
    local start_path=$(pwd)

    if [[ ! -d "cursor" ]]; then
        echo "未找到 cursor 文件夹"
        exit 1
    fi

    echo "开始构建 DEB 安装包"

    mkdir -p deb_package
    mkdir -p build
    mkdir -p archive

    for i in ./cursor/*; do
        name=$(basename "${i}")
        if [[ ! -d "deb_package/${name}" ]]; then
            create_package_struct ${name}
            add_debian_package_info ${name}
            cp_src_to_debian_package_folder ${name}
        else
            echo "deb_package 文件夹已存在 ${name}"
        fi
    done

    cd "${start_path}/cursor"
    for i in "${start_path}"/cursor/*; do
        name=$(basename "${i}")
        if [[ ! -f "${start_path}/archive/${name}.7z" ]]; then
            echo "为 ${name} 生成压缩文件中"
            # zip -9 -r "${start_path}/archive/${name}.zip" "${name}"
            7z a "${start_path}/archive/${name}.7z" -r "${name}"
        else
            echo "${name}.7z 已存在"
        fi
    done
    cd "${start_path}"

    for i in ./deb_package/*; do
        name=$(basename "${i}")
        if [[ ! -f "build/${name}.deb" ]]; then
            echo "构建 ${name} 安装包中"
            dpkg -b "./deb_package/${name}" "./build/${name}.deb"
        else
            echo "${name}.deb 已存在"
        fi
    done

    echo "清除 deb_package 文件夹"
    rm -rf ./deb_package
    echo "DEB 安装包构建结束"
}

main