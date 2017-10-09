# Makefile for max1724

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

DEVICE		= MAX1724
TREETOP		= ../..

.PHONY: all clean

all: description.html

description.html: src.html
	echo "  $@"
	echo -e "<!DOCTYPE html>\n<html>\n<head>" > $@
	echo "<meta charset='utf-8'>" >> $@
	echo "<title>$(DEVICE)</title>" >> $@
	awk -f $(TREETOP)/description.awk $< $(TREETOP) $(DEVICE) >> $@

clean:
	rm -f description.html
