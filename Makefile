TARGET      = devify

PREFIX     ?= /usr/local
INSTALL     = install -Dm755
RM         ?= rm -f

DESTINATIONUDEV = $(DESTDIR)/lib/udev/rules.d/
DESTINATIONBIN = $(DESTDIR)$(PREFIX)/bin/


all: $(TARGET)

install: $(TARGET)
	
	mkdir -p $(DESTDIR)$(PREFIX)/bin
	$(INSTALL) $(TARGET) $(DESTINATIONBIN)$(TARGET)
	install -Dm644 devify.rules $(DESTINATIONUDEV)99-devify.rules
	mkdir -p $(DESTDIR)$(PREFIX)/share/icons
	install -d $(DESTDIR)$(PREFIX)/share/icons/MonoDev
	install -Cm644 icons/* $(DESTDIR)$(PREFIX)/share/icons/MonoDev

uninstall: $(TARGET)

	rm $(DESTINATIONBIN)$(TARGET)
	rm -rf $(DESTDIR)$(PREFIX)/share/icons/MonoDev
	rm $(DESTINATIONUDEV)99-devify.rules

clean:
	$(RM) ./devify
