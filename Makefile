PROJECT = emqx_lwm2m
PROJECT_DESCRIPTION = EMQ X LWM2M Gateway
PROJECT_VERSION = 0.1

DEPS = lager lwm2m_coap jsx clique
dep_lager      = git https://github.com/basho/lager
dep_lwm2m_coap = git https://github.com/emqx/lwm2m-coap v0.1.1
dep_jsx        = git https://github.com/talentdeficit/jsx
dep_clique     = git https://github.com/emqtt/clique

BUILD_DEPS = emqx cuttlefish
dep_emqx = git git@github.com:emqx/emqx-enterprise
dep_cuttlefish = git https://github.com/emqtt/cuttlefish

ERLC_OPTS += +debug_info
ERLC_OPTS += +'{parse_transform, lager_transform}'
TEST_ERLC_OPTS += +'{parse_transform, lager_transform}'

include $(if $(ERLANG_MK_FILENAME),$(ERLANG_MK_FILENAME),erlang.mk)

app.config::
	./deps/cuttlefish/cuttlefish -l info -e etc/ -c etc/emqx_lwm2m.conf -i priv/emqx_lwm2m.schema -d data
