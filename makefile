all:
	premake4 --file=premake/core.lua gmake
	make -C premake
