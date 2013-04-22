# coding: utf-8
from django.http import HttpResponse,HttpResponseRedirect
from django.shortcuts import render_to_response
from django.template import RequestContext
import datetime


def index(request):
    return render_to_response('index.html', RequestContext(request, {}))
	
def list(request):
    return render_to_response('list.html', RequestContext(request, {}))
		
def buy(request):
    id = request.GET.get('id','0')
    if id == 0:
        return HttpResponseRedirect('/list/')
    if request.user.is_authenticated():
        from models import Oders,VPN
        vpn = VPN.objects.get(vpnid=id)
        post=Oders(vpn_id = id)
        post.user=request.user
        post.key=str(datetime.datetime.now())
        post.oder=0
        post.created_at=datetime.datetime.now()
        post.finadate=datetime.datetime.now()
        post.num=1
        post.save()
        return HttpResponse("加入购物车成功！请点击<a href='"+str(vpn.url)+"'>【付款链接】</a>进行付款和选择数量！<a href='http://vpn100.sinaapp.com/list/'>返回</a>|<a href='http://vpn100.sinaapp.com/accounts/me'>查看</a>")
    else:
        return HttpResponseRedirect('/accounts/login/?next=/list/')
