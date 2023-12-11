#!/usr/bin/env bash

file_path=$0
cd $(dirname ${file_path})

cur_path=$(pwd)
pod_path=$(cd .. && pwd)

url_source="https://ai.baidu.com/download?sdkId=32"

zip_file=BDSASR_lib.zip
unzip_dir=bdsasr_cache
dest_dir_name="BDSASR_lib"

echo "cur_path: ${cur_path}"
echo "pod_path: ${pod_path}"

if [[ -f ${zip_file} ]]; then
	echo -e "\nWarning: ${zip_file} has existed, we remove it first\n"
	rm -rf -- "${zip_file}"
fi

wget ${url_source} -O "${zip_file}"

if [[ -d ${unzip_dir} ]]; then
	echo -e "\nWarning: ${unzip_dir} has existed, we remove it first\n"
	rm -rf -- "${unzip_dir}"
fi

unzip "${zip_file}" -d "${unzip_dir}"
cd "${unzip_dir}"

mac_osx_dir="__MACOSX"
sample_dir="BDSClientSample"
if [[ -d ${mac_osx_dir} ]]; then
	rm -rf -- "${mac_osx_dir}"
fi

sample_path=$(find . -type d -name "${sample_dir}" -print)
if [[ -n ${sample_path} ]]; then
	sample_path=$(
		cd $sample_path
		pwd
	)

	echo -e "sample_path found: ${sample_path}"

	rm -rf -- "${sample_path}"

	echo -e "sample_path deleted: ${sample_path}"

else
	echo -e "sample_path not found"
fi

cd ${cur_path}

dest_dir_path=$(
	cd ../
	pwd
)/${dest_dir_name}

if [[ -d ${dest_dir_path} ]]; then
	rm -rf -- "${dest_dir_path}"
fi

mv ${unzip_dir} ${dest_dir_path}
