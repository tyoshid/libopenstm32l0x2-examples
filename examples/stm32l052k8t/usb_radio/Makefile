# Makefile for usb_radio

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

NAME		= usb_radio
LIBDIR		?= ../../libopenstm32l0x2
TREETOP		= ../../..
RELPATH		= $(TREETOP)/$(LIBDIR)
SRCDIR		= $(RELPATH)/examples/stm32/l0/l0x2/stm32l052k8t/$(NAME)

.PHONY: all clean

all: description.html

description.html: src.html schematic.pdf schematic.jpg
	echo "  $@"
	echo -e "<!DOCTYPE html>\n<html>\n<head>" > $@
	echo "<meta charset='utf-8'>" >> $@
	echo "<title>$(NAME)</title>" >> $@
	awk -f $(TREETOP)/description.awk $< $(TREETOP) $(NAME) >> $@

schematic.pdf: $(SRCDIR)/hardware/$(NAME).pdf
	echo "  $@"
	if [ -h $< ] ; then \
	  target=`readlink $<`; \
	  td=$${target#*/}; \
	  td=$${td%hardware/*}; \
	  ln -s $${td}$@ $@; \
	else \
	  cp $< $@; \
	fi

schematic.jpg: schematic.pdf
	echo "  $@"
	if [ -h $< ] ; then \
	  target=`readlink $<`; \
	  ln -s $${target%/*}/$@ $@; \
	else \
	  convert -density 600 $< $@; \
	  convert $@ -scale 640 $@; \
	fi

clean:
	rm -f description.html schematic.pdf schematic.jpg
