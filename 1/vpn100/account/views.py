# coding: utf-8
from django.http import HttpResponse
from django.template import RequestContext
from django.contrib import auth
from django.contrib.auth.models import User  
from django.http import HttpResponseRedirect, HttpResponse, Http404
from django.shortcuts import render_to_response, get_object_or_404
import datetime

def get_check_code_image(request,image='media/images/checkcode.gif'):    
    import Image, ImageDraw, ImageFont, random    
    im = Image.open(image)    
    draw = ImageDraw.Draw(im)    
    mp = md5.new()    
    mp_src = mp.update(str(datetime.now()))    
    mp_src = mp.hexdigest()    
    rand_str = mp_src[0:4]       
    draw.text((10,10), rand_str[0], font=ImageFont.truetype("ARIAL.TTF", random.randrange(25,50)))    
    draw.text((48,10), rand_str[1], font=ImageFont.truetype("ARIAL.TTF", random.randrange(25,50)))    
    draw.text((85,10), rand_str[2], font=ImageFont.truetype("ARIAL.TTF", random.randrange(25,50)))    
    draw.text((120,10), rand_str[3], font=ImageFont.truetype("ARIAL.TTF", random.randrange(25,50)))    
    del draw    
    request.session['checkcode'] = rand_str    
    buf = cStringIO.StringIO()    
    im.save(buf, 'gif')    
    return HttpResponse(buf.getvalue(),'image/gif')
	
def logout(req):
    auth.logout(req)
    return HttpResponseRedirect("/")
	
def profile(request):
    return HttpResponseRedirect("/")
def changepw(request):
    if request.user.is_authenticated():
        if request.method == 'POST':
            password = request.POST['password']
            u = User.objects.get(username__exact=request.user)
            if u is not None:  
                u.set_password(password)
                u.save()
                auth.logout(request)
                return render_to_response("changesuccess.html", {'name':request.user.username},context_instance = RequestContext(request))
            else:
                return render_to_response("changepw.html", {'form':form},context_instance = RequestContext(request))
        else:
            return render_to_response("changepw.html",context_instance = RequestContext(request))
    else:
        return HttpResponseRedirect('/accounts/login/?next=/accounts/changepw/')
def register(request):
    if request.method == 'POST':
        username = request.POST['username']
        email = request.POST['email']
        password = request.POST['password']
        #m = User.objects.get(email__exact=email)
        #if m is not None:
		    #return render_to_response("reg.html",{'error':0},context_instance = RequestContext(request))
        try:
            new_user = User.objects.create_user(username,email,password)
            if new_user is not None:
                new_user.save()
                return render_to_response("regsucces.html", {'name':username},context_instance = RequestContext(request))
            else:
                return render_to_response("reg.html", {'form':form,'error':0},context_instance = RequestContext(request))
        except Exception,e:
            return render_to_response("reg.html", {'error':1},context_instance = RequestContext(request))
    else:
        return render_to_response("reg.html",{'error':0},context_instance = RequestContext(request))
def me(request):
    if request.user.is_authenticated():
        from vpn100.vpn.models import Oders,VPN
        vpns = Oders.objects.filter(user=request.user)
        vpns1 = []
        vpns2 = []
        now=datetime.datetime.now()
        for vpn in vpns:
            if vpn.oder == 	1:
                vpn.days=(vpn.finadate -now).days
                vpns2.append(vpn)
            else:
                v = VPN.objects.get(vpnid=vpn.vpn_id)
                vpn.url=v.url
                vpns1.append(vpn)
        leng=int(len(vpns2))
        return render_to_response("me.html", {'vpns1':vpns1,'vpns2':vpns2,'leng':leng,'now':now},context_instance = RequestContext(request))
    else:
        return HttpResponseRedirect('/accounts/login/?next=/list/')