$0 !~ /<!-- example .* -->/ {
    if (NF > 0 && tablecell > 0) {
	printf("</div>\n")
	tablecell = 0
    }
}
/<!-- header -->/ {
    if (ARGC > 2)
	printf("<link href=\"%s/stylesheets/stylesheet.css\" ", ARGV[2])
    else
	printf("<link href=\"stylesheets/stylesheet.css\" ")
    printf("rel=\"stylesheet\" type=\"text/css\" media=\"screen\">\n")
    if (ARGC > 2)
       file = ARGV[2] "/page_header"
    else
       file = "page_header"
    while ((getline x < file) > 0)
	print x
    close(file)
}
/<!-- layout -->/ {
    if (ARGC > 3) {
	jpg = "layout.jpg"
	cmdw = "identify -format \"%w\" " jpg
	cmdh = "identify -format \"%h\" " jpg
	if ((cmdw | getline width) > 0) {
	    if ((cmdh | getline height) > 0) {
		if (width != 305) {
		    height = height / (width / 305.0) + 0.5
		    width = 305.0
		    printf("<section class=\"layout\">\n")
		    printf("<p><a href=\"%s\" target=\"_blank\">\n", jpg)
		    printf("<img src=\"%s\" ", jpg)
		    printf("width=\"%d\" height=\"%d\" ", width, height)
		    printf("alt=\"%s layout\">\n</a></p>\n", ARGV[3])
		    jpg = "layout_b.jpg"
		    printf("<p><a href=\"%s\" target=\"_blank\">\n", jpg)
		    printf("<img src=\"%s\" ", jpg)
		    printf("width=\"%d\" height=\"%d\" ", width, height)
		    printf("alt=\"%s layout (hidden wires)\">\n", ARGV[3])
		    printf("</a></p>\n</section>\n")
		} else {
		    printf("<section class=\"layout\">\n")
		    printf("<p><img src=\"%s\" ", jpg)
		    printf("width=\"%d\" height=\"%d\" ", width, height)
		    printf("alt=\"%s layout\"></p>\n", ARGV[3])
		    jpg = "layout_b.jpg"
		    printf("<p><img src=\"%s\" ", jpg)
		    printf("width=\"%d\" height=\"%d\" ", width, height)
		    printf("alt=\"%s layout (back)\"></p>\n", ARGV[3])
		    printf("</section>\n")
		}
	    }
	    close(cmdh)
	}
	close(cmdw)
    }
}
/<!-- schematic -->/ {
    if (ARGC > 3) {
	pdf = "schematic.pdf"
	jpg = "schematic.jpg"
	cmdw = "identify -format \"%w\" " jpg
	cmdh = "identify -format \"%h\" " jpg
	if ((cmdw | getline width) > 0) {
	    if ((cmdh | getline height) > 0) {
		printf("<section>\n")
		printf("<p><a href=\"%s\" target=\"_blank\">\n", pdf)
		printf("<img src=\"%s\" width=\"%d\" ", jpg, width)
		printf("height=\"%d\" alt=\"%s schematic\">\n", height, ARGV[3])
		printf("</a></p>\n</section>\n")
	    }
	    close(cmdh)
	}
	close(cmdw)
    }
}
/<!-- example .* -->/ {
    if (tablecell == 0)
	printf("<div class=\"example\">\n")
    title = $0
    sub("<!-- example " $3, "", title)
    sub(/^[ \t]+/, "", title)
    sub("-->", "", title)
    sub(/[ \t]+$/, "", title)
    printf("<figure title=\"%s\">\n", title)
    printf("<a href=\"examples/stm32l052k8t/%s/description.html\" ", $3)
    printf("target=\"_blank\">\n")
    printf("<img src=\"examples/stm32l052k8t/%s/panorama.jpg\" ", $3)
    printf("width=\"140\" height=\"120\" alt=\"%s\">\n</a>\n", $3)
    printf("<figcaption>\n<h4>%s</h4>\n", $3)
    printf("</figcaption>\n")
    printf("</figure>\n")
    if (tablecell == 3) {
	printf("</div>\n")
	tablecell = 0
    } else {
	tablecell++
    }
}
/<!-- panorama -->/ {
    if (ARGC > 3) {
	printf("<h1>%s</h1>\n", ARGV[3])
	printf("<img src=\"panorama.jpg\" width=\"480\" height=\"400\" ")
	printf("alt=\"Panorama of %s\">\n", ARGV[3])
    }
}
/<!-- footer -->/ {
    if (ARGC > 2)
	file = ARGV[2] "/page_footer"
    else
	file = "page_footer"
    while ((getline x < file) > 0)
	print x
    close(file)
    if (ARGC > 2)
	ARGC = 2
}
	{ print }
