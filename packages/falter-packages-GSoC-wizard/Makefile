include $(TOPDIR)/rules.mk

PKG_NAME:=falter-packages-GSoC-wizard
PKG_VERSION:=1.0
PKG_RELEASE:=1

PKG_LICENSE:=GPL-3.0-or-later
PKG_LICENSE_FILES:=LICENSE

include $(INCLUDE_DIR)/package.mk

define Package/falter-packages-GSoC-wizard/default
	SECTION:=falter
	CATEGORY:=Falter
	URL:=https://github.com/freifunk-berlin/falter-packages-GSoC-wizard     
	PKGARCH:=all
	EXTRA_DEPENDS:=uci, uhttpd
endef

define Package/falter-packages-GSoC-wizard
	$(call Package/falter-packages-GSoC-wizard/default)
	TITLE:=Freifunk GSoC Wizard
endef

define Package/falter-packages-GSoC-wizard/description
	A wizard for simplifying initial router configuration in the Freifunk network.
endef

define Build/Prepare
	mkdir -p $(PKG_BUILD_DIR)
endef

define Build/Configure
endef

define Build/Compile
endef

define Package/falter-packages-GSoC-wizard/conffiles
/etc/config/config-uci.conf
endef

define Package/falter-gsoc-wizard/install
	$(INSTALL_DIR) $(1)/www/luci-static/resources
	$(INSTALL_DATA) ./files/htmlview.js $(1)/www/luci-static/resources/htmlview.js
	$(INSTALL_DATA) ./files/form.js $(1)/www/luci-static/resources/form.js
	$(INSTALL_DATA) ./files/styles.css $(1)/www/luci-static/resources/styles.css
	$(INSTALL_DIR) $(1)/etc/config
	$(INSTALL_CONF) ./files/config-uci.conf $(1)/etc/config/config-uci.conf
	$(INSTALL_DIR) $(1)/usr/bin
    $(INSTALL_BIN) ./files/rpcd.sh $(1)/usr/bin/rpcd.sh
endef

$(eval $(call BuildPackage,falter-packages-GSoC-wizard))