# Makefile for libopenstm32l0x2 gh-pages

# Copyright 2016 Toshiaki Yoshida <yoshida@mpc.net>

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

LIBDIR		?= ../../libopenstm32l0x2
EXAMPLES	= examples/stm32l052k8t/miniblink \
		  examples/stm32l052k8t/fancyblink \
		  examples/stm32l052k8t/button \
		  examples/stm32l052k8t/exti \
		  examples/stm32l052k8t/tim \
		  examples/stm32l052k8t/tim_delay \
		  examples/stm32l052k8t/tim_pwm \
		  examples/stm32l052k8t/tim_encoder \
		  examples/stm32l052k8t/ultrasonic_sensor \
		  examples/stm32l052k8t/lptim \
		  examples/stm32l052k8t/lptim_delay \
		  examples/stm32l052k8t/lptim_encoder \
		  examples/stm32l052k8t/usart \
		  examples/stm32l052k8t/usart_irq \
		  examples/stm32l052k8t/usart_printf \
		  examples/stm32l052k8t/usart_getchar \
		  examples/stm32l052k8t/potentiometer \
		  examples/stm32l052k8t/dac \
		  examples/stm32l052k8t/comp \
		  examples/stm32l052k8t/crc \
		  examples/stm32l052k8t/1wire_temp \
		  examples/stm32l052k8t/i2c_rom \
		  examples/stm32l052k8t/i2c_proximity \
		  examples/stm32l052k8t/spi_rom \
		  examples/stm32l052k8t/spi_barometer \
		  examples/stm32l052k8t/spi_dac \
		  examples/stm32l052k8t/spi_sd \
		  examples/stm32l052k8t/usb_custom \
		  examples/stm32l052k8t/usb_cdcacm \
		  examples/stm32l052k8t/usb_speaker \
		  examples/stm32l052k8t/usb_radio \
		  examples/stm32l052k8t/rtc_lcd \
		  examples/stm32l052k8t/touch \
		  examples/stm32l052k8t/iwdg \
		  examples/stm32l052k8t/wwdg \
		  examples/stm32l052k8t/fw \
		  examples/stm32l052k8t/oled_game \
		  examples/stm32l052k8t/kitchen_timer \
		  examples/stm32l052k8t/ethernet_camera \
		  examples/stm32l052k8t/monitor
PARTS		= parts/stm32l052k8t \
		  parts/sli-343x8 \
		  parts/skrg \
		  parts/encoder_rgb \
		  parts/hc-sr04 \
		  parts/osl40562-ir \
		  parts/nds332p \
		  parts/mcp1702 \
		  parts/ec12e2420801 \
		  parts/rk09l1140a66 \
		  parts/lm4861 \
		  parts/ds18b20 \
		  parts/24fc64 \
		  parts/vcnl4000 \
		  parts/25lc640a \
		  parts/mpl115a1 \
		  parts/mcp4922 \
		  parts/mcp4822 \
		  parts/ds1881 \
		  parts/lmv358 \
		  parts/lm4040 \
		  parts/si4737 \
		  parts/character_lcd \
		  parts/mcp4131 \
		  parts/nds331n \
		  parts/electrode \
		  parts/oled \
		  parts/aqm1248 \
		  parts/max1724 \
		  parts/pkm13epyh4000 \
		  parts/ptc08 \
		  parts/wiz820io \
		  parts/at24mac402

.PHONY: all clean $(EXAMPLES) $(PARTS)

all: $(EXAMPLES) $(PARTS) index.html

clean: $(EXAMPLES) $(PARTS)
	rm -f index.html

index.html: src.html
	echo "  $@"
	echo -e "<!DOCTYPE html>\n<html>\n<head>" > $@
	echo "<meta charset='utf-8'>" >> $@
	echo "<title>Libopenstm32l0x2</title>" >> $@
	awk -f description.awk $< >> $@

$(EXAMPLES) $(PARTS):
	@echo "-- $@ --"
	@$(MAKE) -C $@ -s $(MAKECMDGOALS)
