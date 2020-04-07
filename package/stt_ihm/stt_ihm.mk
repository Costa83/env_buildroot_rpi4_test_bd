STT_IHM_VERSION = HEAD
STT_IHM_SITE = git@git.projects.openwide.fr:open-source/stt-ihm-passerelle.git
STT_IHM_SITE_METHOD = git
STT_IHM_DEPENDENCIES = sqlite jansson
#STT_IHM_INSTALL_STAGING = YES

STT_IHM_CONF_OPTS = --prefix=/usr

define STT_IHM_CONFIGURE_CMDS
	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) defconfig
endef

define STT_IHM_BUILD_CMDS
	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)
endef

define STT_IHM_INSTALL_TARGET_CMDS
	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) DESTDIR=$(TARGET_DIR)  install
	$(INSTALL) -D -m 0755 $(STT_IHM_PKGDIR)/S50sttdaemon $(TARGET_DIR)/etc/init.d/
endef
$(eval $(generic-package))
