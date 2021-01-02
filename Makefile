#
#   Copyright (C) 2019-2021 SCOD Organization <https://scod-lang.org>
#   All rights reserved.
#
#   Developed by: Philipp Paulweber
#                 Emmanuel Pescosta
#                 <https://github.com/scod-lang/scod-lang.logo>
#
#   This file is part of scod-lang.logo.
#
#   scod-lang.logo is free software: you can redistribute it and/or modify
#   it under the terms of the GNU General Public License as published by
#   the Free Software Foundation, either version 3 of the License, or
#   (at your option) any later version.
#
#   scod-lang.logo is distributed in the hope that it will be useful,
#   but WITHOUT ANY WARRANTY; without even the implied warranty of
#   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
#   GNU General Public License for more details.
#
#   You should have received a copy of the GNU General Public License
#   along with scod-lang.logo. If not, see <http://www.gnu.org/licenses/>.
#

OBJ = obj

KIND  = icon
KIND += logo
KIND += rect
KIND += badge
KIND += badge_bw
KIND += badge_wb
#KIND += banner
KIND += qrcode
#KIND += twitter_bg
#KIND += sticker
#KIND += slogan
#KIND += slogan_bw
#KIND += slogan_wb

SOURCES = $(KIND:%=src/%.svg)

SIZE  = 32
SIZE += 48
SIZE += 64
SIZE += 96
SIZE += 128
SIZE += 150
SIZE += 192
SIZE += 256
SIZE += 300
SIZE += 384
SIZE += 512
SIZE += 600
SIZE += 768
SIZE += 1024
SIZE += 1200
SIZE += 2048

EXPORT  = $(SIZE:%=$(OBJ)/icon/%.png)        $(OBJ)/icon.pdf
EXPORT += $(SIZE:%=$(OBJ)/logo/%.png)        $(OBJ)/logo.pdf
EXPORT += $(SIZE:%=$(OBJ)/rect/%.png)        $(OBJ)/rect.pdf
EXPORT += $(SIZE:%=$(OBJ)/badge/%.png)       $(OBJ)/badge.pdf
EXPORT += $(SIZE:%=$(OBJ)/badge_bw/%.png)    $(OBJ)/badge_bw.pdf
EXPORT += $(SIZE:%=$(OBJ)/badge_wb/%.png)    $(OBJ)/badge_wb.pdf
#EXPORT += $(SIZE:%=$(OBJ)/banner/%.png)      $(OBJ)/banner.pdf
EXPORT += $(SIZE:%=$(OBJ)/qrcode/%.png)      $(OBJ)/qrcode.pdf
#EXPORT += $(SIZE:%=$(OBJ)/twitter_bg/%.png)
#EXPORT += $(SIZE:%=$(OBJ)/sticker/%.png)     $(OBJ)/sticker.pdf
#EXPORT += $(SIZE:%=$(OBJ)/slogan/%.png)      $(OBJ)/slogan.pdf
#EXPORT += $(SIZE:%=$(OBJ)/slogan_bw/%.png)   $(OBJ)/slogan_bw.pdf
#EXPORT += $(SIZE:%=$(OBJ)/slogan_wb/%.png)   $(OBJ)/slogan_wb.pdf

EXPORT += etc/headline.png

default: $(EXPORT)

%.png: $(SOURCES)
	@mkdir -p `dirname $@`
	@echo
	@echo $@
	@inkscape -C -h `basename $@ .png` -e $@ src/`basename \`dirname $@\``.svg

%.pdf: $(SOURCES)
	@mkdir -p `dirname $@`
	@echo
	@echo $@
	@inkscape -A $@ src/`basename $@ .pdf`.svg

etc/headline.png: $(OBJ)/rect/64.png
	cp -f $< $@
