ifneq (${KERNELRELEASE}, )
	#如果Linux作業系統核心版本不支援Kbuild檔案的話就把Kbuild的內容引用到Makefile中
	include Kbuild
else
module_name := ""
module_sourcecode_directory := "${PWD}"
kernel_version := "$(shell uname -r)"
kernel_header_directory := "/lib/modules/${kernel_version}/build"
option_make_change2kernel_directory := "--directory ${kernel_header_directory}"

all:
	make ${option_make_change2kernel_directory} M=${module_sourcecode_directory} modules
clean:
	make ${option_make_change2kernel_directory} M=${module_sourcecode_directory} clean
insertModule:
	insmod Source_code/${module_name}.ko
removeModule:
	rmmod ${module_name}
endif