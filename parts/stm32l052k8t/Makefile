# Makefile for stm32l052k8t

# Copyright 2017 Toshiaki Yoshida <yoshida@mpc.net>

# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.

# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.

# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

NAME		= stm32l052k8t
DEVICE		= STM32L052K8T
LIBDIR		?= ../../libopenstm32l0x2
TREETOP		= ../..
RELPATH		= $(TREETOP)/$(LIBDIR)
SRCDIR		= $(RELPATH)/examples/stm32/l0/l0x2/stm32l052k8t

.PHONY: all clean

all: description.html

description.html: src.html schematic.pdf schematic.jpg
	echo "  $@"
	echo -e "<!DOCTYPE html>\n<html>\n<head>" > $@
	echo "<meta charset='utf-8'>" >> $@
	echo "<title>$(DEVICE)</title>" >> $@
	awk -f $(TREETOP)/description.awk $< $(TREETOP) $(DEVICE) >> $@

schematic.pdf: $(SRCDIR)/$(NAME)_dip.pdf
	echo "  $@"
	cp $< $@

schematic.jpg: schematic.pdf
	echo "  $@"
	convert -density 600 $< $@
	convert $@ -scale 640 $@

clean:
	rm -f description.html schematic.pdf schematic.jpg
