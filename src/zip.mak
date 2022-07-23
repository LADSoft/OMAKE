# Software License Agreement
# 
#     Copyright(C) 1994-2022 David Lindauer, (LADSoft)
# 
#     This file is part of the Orange C Compiler package.
# 
#     The Orange C Compiler package is free software: you can redistribute it and/or modify
#     it under the terms of the GNU General Public License as published by
#     the Free Software Foundation, either version 3 of the License, or
#     (at your option) any later version.
# 
#     The Orange C Compiler package is distributed in the hope that it will be useful,
#     but WITHOUT ANY WARRANTY; without even the implied warranty of
#     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#     GNU General Public License for more details.
# 
#     You should have received a copy of the GNU General Public License
#     along with Orange C.  If not, see <http://www.gnu.org/licenses/>.
# 
#     contact information:
#         email: TouchStone222@runbox.com <David Lindauer>
# 

ifneq "$(COMPILER)" "gcc-linux"
SHELL=cmd.exe
endif

ZIP:="c:/program files/7-zip/7z" -tzip -bd

OCC_VERSION := $(word 3, $(shell cmd /C type \omake\src\version.h))
OCC_VERSION := $(subst ",,$(OCC_VERSION))
export OCC_VERSION
VERNAME := $(subst .,,$(OCC_VERSION))

DISTEXE=/omake/dist/ZippedBinaries$(VERNAME).zip
DISTSRC=/omake/dist/ZippedSources$(VERNAME).zip

DISTRIBUTE:
	-del $(subst /,\,$(DISTEXE))
	-del $(subst /,\,$(DISTSRC))
	$(ZIP) -r0 a $(DISTEXE) omake/omake.exe omake/doc/*
	$(ZIP) a $(DISTEXE) omake/LICENSE.txt omake/copying
	$(ZIP) -r0 -xr@omake/src/xclude.lst a $(DISTSRC) omake/src/*.adl omake/src/*.cpp omake/src/*.c omake/src/*.h omake/src/*.nas omake/src/*.ase omake/src/*.asi omake/src/*.inc omake/src/*.p omake/src/*.rc omake/src/*.spc omake/src/*.app omake/src/*.cfg omake/src/makefile* omake/src/*.mak omake/src/*.txt omake/src/copying omake/src/*.def omake/src/*.lst 
	$(ZIP) a $(DISTSRC) omake/doc/*
	$(ZIP) -r0 a $(DISTSRC) omake/src/*.vcxproj omake/src/*.vcxproj.filters omake/src/*.sln
	$(ZIP) a $(DISTSRC) omake/src/*.exe omake/src/config.bat
	$(ZIP) a $(DISTSRC) omake/src/LICENSE.TXT
	$(ZIP) a $(DISTSRC) omake/src/copying