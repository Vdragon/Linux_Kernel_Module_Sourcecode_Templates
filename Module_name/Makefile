##################################################################
# Linux作業系統核心外部模組用 Makefile
# Makefile for Linux Operating System Kernel Externel Modules
##################################################################
# 官方網站 | Official Site
# 　https://github.com/Vdragon/Linux_Kernel_Module_Sourcecode_Templates
# 版權聲明 | Copyright Notice
# 　版權持有者 2012 Ｖ字龍 | Copyright 2012 Vdragon (pika1021@gmail.com)
# 使用的授權條款 | License Applied
# 　本軟體使用 Lesser General Public License(LGPL) 版本3 or later授權條款授權您使用本軟體，如有額外的使用權利需求請來信洽談
##################################################################
# 作業系統核心模組名稱
module_name := ""

# 如果Linux作業系統核心版本不支援Kbuild檔案的話就把Kbuild的內容引用到Makefile中
ifneq (${KERNELRELEASE}, )
include Kbuild
else
# 作業系統核心模組原始程式碼目錄
module_sourcecode_directory := "${PWD}"
# 建構作業系統核心模組所對應的核心版本
# （若未指定則預設為系統當前運作的作業系統核心版本）
# （如果 kernel_header_directory變數 無使用此變數則不用設定）
kernel_version := ""
kernel_version ?= "$(shell uname -r)"
# 作業系統核心的標頭檔目錄
# （若未指定則為/lib/modules/「作業系統核心版本」/build）
kernel_header_directory := ""
kernel_header_directory ?= "/lib/modules/${kernel_version}/build"
option_make_changeToKernelDirectory := "--directory ${kernel_header_directory}"

# 顯示使用說明
.PHONY: default
default:
	@echo "命令列格式 | Command-line format"
	@echo "　make 「目標 | Target」"
	@echo "目標列表 | Target list"
	@echo "　buildModule"
	@echo "　　建構作業系統核心模組"
	@echo "　　Build the operating system kernel module"
	@echo "　cleanBuiltProducts"
	@echo "　　移除以前建構好的產物"
	@echo "　loadModule"
	@echo "　　載入作業系統核心模組"
	@echo "　　Load the operating system kernel module"
	@echo "　unloadModule"
	@echo "　　卸載作業系統核心模組"
	@echo "　　Unload the operating system kernel module"
	
# 建構核心模組
.PHONY: buildModule
buildModule:
	make ${option_make_changeToKernelDirectory} M=${module_sourcecode_directory} modules
	
# 清除建構產物
.PHONY: cleanBuiltProducts
cleanBuiltProducts:
	make ${option_make_changeToKernelDirectory} M=${module_sourcecode_directory} clean

# 載入核心模組
.PHONY: loadModule
loadModule:
	insmod Source_code/${module_name}.ko
	
# 卸載核心模組	
.PHONY: unloadModule
unloadModule:
	rmmod ${module_name}
endif