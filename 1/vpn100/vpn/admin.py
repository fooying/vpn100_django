# coding: utf-8

from django.contrib import admin
from vpn100.vpn.models import Oders,VPN

class vpna(admin.ModelAdmin):  
    list_display = ('vpnid', 'VpnName','url',)
    def has_add_permission(self, request):
        return True
    def has_change_permission(self, request, obj=None):
        return True
    def has_delete_permission(self, request, obj=None):
        return True
	
class odera(admin.ModelAdmin):  
    list_display = ('id','user', 'vpn', 'oder', 'created_at','finadate','num',)
    def has_add_permission(self, request):
        return True
    def has_change_permission(self, request, obj=None):
        return True
    def has_delete_permission(self, request, obj=None):
        return True
	
admin.site.register(Oders,odera)
admin.site.register(VPN,vpna)
