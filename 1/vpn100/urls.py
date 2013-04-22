from django.conf.urls.defaults import *
import os


from django.views.generic.simple import redirect_to, direct_to_template
from django.contrib import admin

# Uncomment the next two lines to enable the admin:
from django.contrib import admin
admin.autodiscover()

urlpatterns = patterns('',
    # Example:
    # (r'^vpn100/', include('vpn100.foo.urls')),

    # Uncomment the admin/doc line below to enable admin documentation:
    # (r'^admin/doc/', include('django.contrib.admindocs.urls')),

    # Uncomment the next line to enable the admin:
	(r'^$', 'vpn100.vpn.views.index'),
	(r'^accounts/profile/', 'vpn100.account.views.profile'),
	(r'^list/', 'vpn100.vpn.views.list'),
	(r'^buy/?', 'vpn100.vpn.views.buy'),
    (r'^03s5a9-n31dy09/', include(admin.site.urls)),
	(r'^logout/?$', 'vpn100.account.views.logout'),
	(r'^accounts/login/$', 'django.contrib.auth.views.login'),
	(r'^accounts/reg/$', 'vpn100.account.views.register'),
	(r'^accounts/changepw/$', 'vpn100.account.views.changepw'),
	(r'^accounts/me/$', 'vpn100.account.views.me'),
	(r'^admin/doc/', include('django.contrib.admindocs.urls')),
	
	(r'^accounts/yanzhengma/$', 'vpn100.account.views.get_check_code_image'),

	
	
)

SITEROOT = os.path.dirname(__file__)
urlpatterns += patterns('',
	url(r'^static/(?P<path>.*)$', 'django.views.static.serve', {'document_root': '/static', 'show_indexes':True}),
)
