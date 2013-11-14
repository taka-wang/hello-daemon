include $(TOPDIR)/rules.mk

PKG_NAME:=hello-daemon
PKG_VERSION:=0.2
PKG_RELEASE:=2

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/cmake.mk

define Package/hello-daemon
	SECTION:=utils
	CATEGORY:=Utilities
	TITLE:=Hello Daemon Title
endef

define Package/hello-daemon/description
	Hello Daemon Description
endef

define Build/Prepare
	mkdir -p $(PKG_BUILD_DIR)
	$(CP) ./src/* $(PKG_BUILD_DIR)
endef

define Package/hello-daemon/install
	# Install binary
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/hello-daemon $(1)/usr/bin
    
	# Install init script
	$(INSTALL_DIR) $(1)/etc/init.d/
	$(INSTALL_BIN) conf/hello-daemon.init $(1)/etc/init.d/hello-daemon
    
	# Install config file
	$(INSTALL_DIR) $(1)/etc/config
	$(INSTALL_CONF) conf/hello-daemon.config $(1)/etc/config/hello-daemon
endef

$(eval $(call BuildPackage,hello-daemon))