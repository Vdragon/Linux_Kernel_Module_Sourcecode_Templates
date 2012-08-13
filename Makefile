ifneq (${KERNELRELEASE}, )
include Kbuild
else
module_name := ""
module_source_directory := "${PWD}"
kernel_version := "$(shell uname -r)"
kernel_header_directory := "/lib/modules/${kernel_version}/build"
option_make_change2kernel_directory := "--directory ${kernel_header_directory}"

all:
	make ${option_make_change2kernel_directory} M=${module_source_directory} modules
clean:
	make ${option_make_change2kernel_directory} M=${module_source_directory} clean
insertModule:
	insmod Source_code/${module_name}.ko
removeModule:
	rmmod ${module_name}
endif